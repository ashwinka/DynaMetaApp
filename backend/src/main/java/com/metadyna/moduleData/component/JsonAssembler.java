package com.metadyna.moduleData.component;

import com.metadyna.moduleData.model.DataSaveErrors;
import com.metadyna.moduleData.model.TableOperation;
import com.metadyna.metadata.model.ColumnMetadata;
import com.metadyna.metadata.model.ModuleMetadata;
import com.metadyna.metadata.model.TableMetadata;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;
import static com.metadyna.AppConstants.*;

/**
 * Disassembles a nested JSON payload (as a Map) into an ordered list of TableOperations.
 *
 * Two strategies:
 * - disassembleFull:  POST (INSERT all) / PUT (INSERT or UPDATE based on recordId presence)
 * - disassembleDelta: PATCH — updatedJson → INSERT/UPDATE, deletedRec → DELETE
 *
 * Operations are ordered root-first so FK resolution works correctly in DynamicSaveEngine.
 */
@Slf4j
@Component
public class JsonDisassembler {

    /**
     * Full disassembly for POST (new record) and PUT (full update).
     * If a node contains "id", it becomes an UPDATE; otherwise INSERT.
     *
     * @param jsonPayload the full nested JSON as a Map
     * @param metadata    module metadata
     * @return ordered list of TableOperations
     */
    public List<TableOperation> disassembleFull(
        Map<String, Object> jsonPayload, Map<String, Object> dbJsonObj, String saveType, ModuleMetadata metadata, Map<String, String> ctxIds, List<DataSaveErrors> errors) {
        List<TableOperation> operations = new ArrayList<>();
        TableMetadata root = metadata.getRootTable();

        // The payload may be wrapped in the root fieldName or be the root object directly
        Map<String, Object> jsonObject = unwrapRoot(jsonPayload, root.getContextName());
        traverseNode(jsonObject, dbJsonObj, root, null, saveType, metadata, operations, ctxIds, errors);
        return operations;
    }

    // ── Traversal ─────────────────────────────────────────────────────────────

    @SuppressWarnings("unchecked")
    private void traverseNode(
        Map<String, Object> editJsonObj, Map<String, Object> dbObject,
        TableMetadata table, Map<String, Object> parentCtxObj,
        String saveType, ModuleMetadata metadata,
        List<TableOperation> ops, Map<String, String> ctxIds, List<DataSaveErrors> errors) {

        if (editJsonObj == null) return;

        Map<String, Object> columnValues = extractColumnValues(editJsonObj, dbObject, table.getTableId(), saveType, metadata, ctxIds, errors);
        String id = dbObject != null ? extractId(dbObject) : extractId(editJsonObj);

        TableOperation.OperationType opType = (dbObject != null)
                ? TableOperation.OperationType.UPDATE : TableOperation.OperationType.INSERT;

        if(id == null){
            id = UUID.randomUUID().toString();
            editJsonObj.put("id", id);
        }
        if(!columnValues.isEmpty()){
            Object parentObjIdFlData = getParentCtxObjFlDataByDbColName(table.getRefJoinColumn(), parentCtxObj, table.getParentTableId(), metadata);
            ops.add(TableOperation.builder()
                .dbTableName(table.getDbTableName())
                .tableId(table.getTableId())
                .parentCtxObjId(String.valueOf(parentObjIdFlData))
                .joinColumn(table.getJoinColumn())
                .operationType(opType)
                .columnValues(columnValues)
                .id(id)
                .build());
        }

        // Recurse into children sections
        List<TableMetadata> childTables = metadata.getChildren(table.getTableId());
        Map<String, TableMetadata> childTableMap = childTables.stream()
                .collect(Collectors.toMap(TableMetadata::getContextName, Function.identity()));
        Set<String> ctxNames = new HashSet<>(editJsonObj.keySet());
        for(String ctxName : ctxNames){
            TableMetadata childTabMd = childTableMap.get(ctxName);
            if(childTabMd == null) {
                continue;
            }

            Object dbCtxObj = dbObject.get(ctxName);
            Object editCtxObj = editJsonObj.get(ctxName);

            if ("Y".equals(childTabMd.getMultiContext())) {
                if(!(editCtxObj instanceof List<?>)){
                    continue;
                }
                List<Map<String, Object>> childCtxObjArr = (List<Map<String, Object>>) editCtxObj;
                List<Map<String, Object>> childDbCtxObjArr = dbCtxObj != null ? (List<Map<String, Object>>) dbCtxObj : new ArrayList<>();
                List<Map<String, Object>> unsavedMultiCtxRecs = new ArrayList<>();
                Map<String, Map<String, Object>> dbChildCtxObjMap = new HashMap<>();
                Set<String> matchedRecs = new HashSet<>();
                for(Map<String, Object> childNodeRec : childDbCtxObjArr){
                    String childRecId = extractId(childNodeRec);
                    dbChildCtxObjMap.put(childRecId, childNodeRec);
                }

                int recInd = 0;
                for (Map<String, Object> childCtxRec  : childCtxObjArr) {
                    Map<String, Object> dbChildCtxObj = null;
                    String childRecId = extractId(childCtxRec);
                    if(childRecId == null){
                        //Generate the new ID
                        childRecId = UUID.randomUUID().toString();
                        childCtxRec.put("id", childRecId);
                    }

                    ctxIds.put(childTabMd.getContextName()+"$", childRecId);
                    ctxIds.put(childTabMd.getContextName() + "#index", String.valueOf(recInd));
                    recInd++;

                    if(dbChildCtxObjMap.get(childRecId) != null){
                        //Not a new record
                        dbChildCtxObj = dbChildCtxObjMap.get(childRecId);
                        matchedRecs.add(childRecId);
                    } else {
                        //TO-DO validate all the mandatory fields data type and max-length for the new records
                        if(!validateMultiCtxNewRec(childCtxRec, childTabMd, errors, metadata, ctxIds, recInd)){
                            unsavedMultiCtxRecs.add(childCtxRec);
                            continue;
                        }
                    }

                    traverseNode(childCtxRec, dbChildCtxObj, childTabMd, dbObject, saveType, metadata, ops, ctxIds, errors);

                    if(childCtxRec.size() > 1){
                        //If there are any unsaved data in the hierarchy
                        unsavedMultiCtxRecs.add(childCtxRec);
                    }
                }

                if(!"PATCH".equalsIgnoreCase(saveType)){
                    for(Map.Entry<String, Map<String, Object>> dbRec : dbChildCtxObjMap.entrySet()){
                        if(matchedRecs.contains(dbRec.getKey())){
                            continue;
                        }
                        //Delete the DB multi-context recs which are not part of editJsonObj
                        ops.add(TableOperation.builder()
                            .dbTableName(childTabMd.getDbTableName())
                            .tableId(childTabMd.getTableId())
                            .operationType(TableOperation.OperationType.DELETE)
                            .id(id)
                            .build()
                        );
                    }
                }
                ctxIds.remove(childTabMd.getContextName());

                if(unsavedMultiCtxRecs.isEmpty()){
                    editJsonObj.remove(childTabMd.getContextName());
                } else {
                    editJsonObj.put(childTabMd.getContextName(), unsavedMultiCtxRecs);
                }
            } else {
                Map<String, Object> dbChildObj = dbCtxObj != null ? (Map<String, Object>) dbCtxObj : null;
                Map<String, Object> editChildObj = (Map<String, Object>) editCtxObj;

                traverseNode(editChildObj, dbChildObj, childTabMd, dbObject, saveType, metadata, ops, ctxIds, errors);

                if(editChildObj.isEmpty() || editChildObj.size() == 1){
                    //remove the child after processing
                    editJsonObj.remove(childTabMd.getContextName());
                }
            }
        }
    }

    private boolean validateMultiCtxNewRec(Map<String, Object> ctxRec, TableMetadata ctxTabMd, List<DataSaveErrors> errors, ModuleMetadata metadata, Map<String, String> ctxIds, int recInd) {
        boolean isValid = true;

        List<ColumnMetadata> cols = metadata.getColumnIndex().getOrDefault(ctxTabMd.getTableId(), List.of());
        List<ColumnMetadata> reqFields = cols.stream().filter(c -> "Y".equals(c.getRequiredField())).toList();
        for(ColumnMetadata reqField : reqFields){
            String fieldName = reqField.getFieldName();
            Object flData = ctxRec.get(fieldName);

            if(validateRequiredField(flData, reqField, ctxIds, errors)){
                isValid = false;
            }
            if(validateFieldDataType(flData, reqField, ctxIds, errors)){
                isValid = false;
            }
        }
        return isValid;
    }

    @SuppressWarnings("unchecked")
    public void collectDeleteOps(
            Map<String, Object> jsonObj,
            Map<String, Object> dbJson,
            TableMetadata table,
            ModuleMetadata metadata,
            List<TableOperation> ops) {

        if (jsonObj == null || dbJson == null) return;

        String id = extractId(dbJson);
        if (id == null) {
            //If the ID is null then ignore the record
            return;
        }

        for (TableMetadata child : metadata.getChildren(table.getTableId())) {
            Object childNode = jsonObj.get(child.getContextName());
            Object childDbObj = dbJson.get(child.getContextName());
            if (childNode == null || childDbObj == null) continue;

            if ("Y".equals(child.getMultiContext()) && childNode instanceof List<?> list && childDbObj instanceof List<?> dbList) {
                Map<String, Map<String, Object>> dbObjMap = new HashMap<>();
                for (Object item : dbList) {
                    Map<String, Object> dbObj = (Map<String, Object>) item;
                    dbObjMap.put(extractId(dbObj), dbObj);
                }
                for (Object item : list) {
                    if (item instanceof Map<?, ?> childObj) {
                        Map<String, Object> childRecJson = (Map<String, Object>) childObj;
                        String childRecId = extractId(childRecJson);
                        Map<String, Object> dbObj = dbObjMap.get(childRecId);
                        if(childRecId == null || dbObj == null){
                            continue;
                        }

                        if(childObj.size() == 1){
                            ops.add(TableOperation.builder().dbTableName(child.getDbTableName())
                                    .tableId(child.getTableId())
                                    .operationType(TableOperation.OperationType.DELETE)
                                    .id(childRecId)
                                    .columnValues(Map.of())
                                    .build());
                        } else {
                            collectDeleteOps(childRecJson, dbObj, child, metadata, ops);
                        }
                    }
                }
            } else if (childNode instanceof Map<?, ?> childMap) {
                collectDeleteOps((Map<String, Object>) childMap, (Map<String, Object>) childDbObj, child, metadata, ops);
            }
        }
    }

    // ── Helpers ───────────────────────────────────────────────────────────────

    private Object getParentCtxObjFlDataByDbColName(String colName, Map<String, Object> jsonObj, String tableId, ModuleMetadata metadata){
        Object flData = null;
        if(jsonObj == null || colName == null || tableId == null){
            return null;
        }
        if("ID".equalsIgnoreCase(colName)){
            return extractId(jsonObj);
        }
        ColumnMetadata colMd = metadata.getColumnIndex().get(tableId).stream().filter(c->c.getColumnName().equalsIgnoreCase(colName)).findFirst().orElse(null);
        if(colMd != null){
            flData = jsonObj.get(colMd.getFieldName());
        }
        return flData;
    }
    /**
     * Extracts column values from a JSON jsonObj using CONTEXT_NAME → COLUMN_NAME mapping.
     */
    private Map<String, Object> extractColumnValues(
        Map<String, Object> jsonObj, Map<String, Object> dbObj,
        String tableId, String saveType, ModuleMetadata metadata, Map<String, String> ctxIds, List<DataSaveErrors> errors) {

        List<ColumnMetadata> cols = metadata.getColumnIndex().getOrDefault(tableId, List.of());
        Map<String, ColumnMetadata> fieldMap = cols.stream()
                .collect(Collectors.toMap(ColumnMetadata::getFieldName, Function.identity()));

        Map<String, Object> values = new LinkedHashMap<>();
        Set<String> jsonKeys = new HashSet<>(jsonObj.keySet());
        for(String fieldName : jsonKeys){
            Object flValObj = jsonObj.get(fieldName);
            ColumnMetadata flMd = fieldMap.get(fieldName);
            if(flMd == null){
                //Invalid data for field
                //TO-DO for multi-select combo we need to store as JSON Array
                continue;
            }
            if(flValObj instanceof List<?>){
                String error = "Invalid Data, it must be " + flMd.getDataType();
                DataSaveErrors e = getDataSaveErrors(ctxIds, flMd, error, SAVE_ISSUE_DB_RULE, SAVE_ISSUE_SEV_ERR);
                errors.add(e);
                continue;
            }

            String ctxName = flMd.getFieldName();
            String colName = flMd.getColumnName();
            Object dbFlData = getNonEmptyData(dbObj, ctxName);
            Object flData = getNonEmptyData(jsonObj, ctxName);
            if(dbFlData == null && flData == null) {
                //If both DB data and json field data is null
                continue;
            }

            if(!validateRequiredField(flData, flMd, ctxIds, errors)){
                continue;
            }

            if(dbFlData == null || !dbFlData.equals(flData)) {
                // If DB data is empty or both data are different
                //TO-DO type cast to respective DB column type for flData
                //Perform data validations on data type/max-length/required

                if(!validateFieldDataType(flData, flMd, ctxIds, errors)){
                    continue;
                }
                if(DATA_TYPE_NUM.equals(flMd.getDataType())){
                    try{
                        flData = Integer.parseInt(String.valueOf(flData));
                    } catch (Exception e){
                        continue;
                    }
                } else if (DATA_TYPE_DATE.equals(flMd.getDataType())) {
                    try{
                        SimpleDateFormat sdf = new SimpleDateFormat("dd/MMM/yyyy");
                        flData = sdf.parse(String.valueOf(flData));
                    } catch (Exception e){
                        continue;
                    }
                } else if(DATA_TYPE_TXT.equals(flMd.getDataType())){
                    flData = String.valueOf(flData).trim();
                }
                values.put(colName, flData);
            }
            //Remove the processed field value
            jsonObj.remove(fieldName);
        }
        return values;
    }

    private boolean validateFieldDataType(Object flData, ColumnMetadata flMd, Map<String, String> ctxIds, List<DataSaveErrors> errors) {
        boolean isValid = true;
        if(DATA_TYPE_NUM.equals(flMd.getDataType())){
            if(!String.valueOf(flData).matches("-?\\d+")){
                String error = "Invalid Data, it must be " + flMd.getDataType();
                DataSaveErrors e = getDataSaveErrors(ctxIds, flMd, error, SAVE_ISSUE_DB_RULE, SAVE_ISSUE_SEV_ERR);
                errors.add(e);
                isValid = false;
            }
        } else if (DATA_TYPE_DATE.equals(flMd.getDataType())) {
            if(!String.valueOf(flData).matches("^(0[1-9]|[12][0-9]|3[01])/(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)/\\d{4}$")){
                //^(0[1-9]|[12][0-9]|3[01])/(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)/\d{4}$
                String error = "Invalid Data, Date must be in dd/mmm/yyyy";
                DataSaveErrors e = getDataSaveErrors(ctxIds, flMd, error, SAVE_ISSUE_DB_RULE, SAVE_ISSUE_SEV_ERR);
                errors.add(e);
                isValid = false;
            }
            try{
                SimpleDateFormat sdf = new SimpleDateFormat("dd/MMM/yyyy");
                sdf.parse(String.valueOf(flData));
            }catch (Exception e){
                isValid = false;
            }
        } else if(DATA_TYPE_TXT.equals(flMd.getDataType())){
            //Validate the max-length
            if(flMd.getMaxLength() != null && flMd.getMaxLength() > 0){
                if(String.valueOf(flData).length() > flMd.getMaxLength()){
                    String error = "Invalid Data, data max-length must be "+ flMd.getMaxLength();
                    DataSaveErrors e = getDataSaveErrors(ctxIds, flMd, error, SAVE_ISSUE_DB_RULE, SAVE_ISSUE_SEV_ERR);
                    errors.add(e);
                    isValid = false;
                }
            }
        }

        return isValid;
    }

    private boolean validateRequiredField(Object flData, ColumnMetadata flMd, Map<String, String> ctxIds, List<DataSaveErrors> errors) {
        boolean isValid = true;

        if("Y".equals(flMd.getRequiredField()) && (flData == null || String.valueOf(flData).trim().isEmpty())){
            // If the field data is null for required field then capture as error

            String error = "Data cannot be empty for required field";
            DataSaveErrors e = getDataSaveErrors(ctxIds, flMd, error, SAVE_ISSUE_DB_RULE, SAVE_ISSUE_SEV_ERR);
            errors.add(e);
            isValid = false;
        }
        return  isValid;
    }

    private static DataSaveErrors getDataSaveErrors(Map<String, String> ctxIds, ColumnMetadata flMd, String error, String ruleId, String severity) {
        DataSaveErrors e = new DataSaveErrors();
        e.setFieldId(flMd.getFieldId());
        e.setMessage(error);
        e.setRuleId(ruleId);
        e.setSeverity(severity);
        e.setCtxIds(new HashMap<>(ctxIds));
        return e;
    }

    private Object getNonEmptyData(Map<String, Object> jsonObj, String ctxName){
        Object flData = null;
        String strData = jsonObj != null ? String.valueOf(jsonObj.get(ctxName)).trim() : "";
        if(strData.isEmpty() || "null".equals(strData)){
            return null;
        }

        return jsonObj.get(ctxName);
    }
    private String extractId(Map<String, Object> node) {
        Object val = node.get("id");
        if (val == null) return null;
        String s = val.toString().trim();
        return s.isEmpty() ? null : s;
    }

    @SuppressWarnings("unchecked")
    private Map<String, Object> unwrapRoot(Map<String, Object> payload, String rootContextName) {
        if (payload.containsKey(rootContextName) && payload.get(rootContextName) instanceof Map<?, ?> inner) {
            return (Map<String, Object>) inner;
        }
        return payload;
    }
}
