package com.metadyna.moduleData.component;

import com.metadyna.moduleData.model.TableOperation;
import com.metadyna.metadata.model.ColumnMetadata;
import com.metadyna.metadata.model.ModuleMetadata;
import com.metadyna.metadata.model.TableMetadata;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

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
        Map<String, Object> jsonPayload, Map<String, Object> dbJsonObj, String saveType, ModuleMetadata metadata) {
        List<TableOperation> operations = new ArrayList<>();
        TableMetadata root = metadata.getRootTable();

        // The payload may be wrapped in the root fieldName or be the root object directly
        Map<String, Object> jsonObject = unwrapRoot(jsonPayload, root.getContextName());
        traverseNode(jsonObject, dbJsonObj, root, null, saveType, metadata, operations);
        return operations;
    }

    // ── Traversal ─────────────────────────────────────────────────────────────

    @SuppressWarnings("unchecked")
    private void traverseNode(
            Map<String, Object> jsonObj,
            Map<String, Object> dbObject,
            TableMetadata table,
            Map<String, Object> parentCtxObj,
            String saveType,
            ModuleMetadata metadata,
            List<TableOperation> ops) {

        if (jsonObj == null) return;

        Map<String, Object> columnValues = extractColumnValues(jsonObj, dbObject, table.getTableId(), saveType, metadata);
        String id = dbObject != null ? extractId(dbObject) : extractId(jsonObj);

        TableOperation.OperationType opType = (dbObject != null)
                ? TableOperation.OperationType.UPDATE : TableOperation.OperationType.INSERT;

        if(id == null){
            id = UUID.randomUUID().toString();
            jsonObj.put("id", id);
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

        // Recurse into children
        for (TableMetadata child : metadata.getChildren(table.getTableId())) {
            Object childNode = jsonObj.get(child.getContextName());
            Object dbChildNode = dbObject.get(child.getContextName());
            if (childNode == null && "PATCH".equalsIgnoreCase(saveType)) continue;

            if ("Y".equals(child.getMultiContext())) {
                List<Map<String, Object>> dbChildNodeRecs = dbObject != null ? (List<Map<String, Object>>) dbObject.get(child.getContextName()) : List.of();
                Map<String, Map<String, Object>> dbChildNodeRecMap = new HashMap<>();
                Set<String> matchedRecs = new HashSet<>();
                for(Map<String, Object> childNodeRec : dbChildNodeRecs){
                    String childRecId = extractId(childNodeRec);
                    dbChildNodeRecMap.put(childRecId, childNodeRec);
                }
                if(childNode instanceof List<?> list){
                    for (Object item : list) {
                        if (item instanceof Map<?, ?> childJsonObj) {
                            Map<String, Object> childObj = (Map<String, Object>) childJsonObj;
                            Map<String, Object> dbChildObj = null;
                            String childRecId = extractId(childObj);
                            if(childRecId == null){
                                //Generate the new ID
                                childRecId = UUID.randomUUID().toString();
                                childObj.put("id", childRecId);
                            }
                            if(dbChildNodeRecMap.get(childRecId) != null){
                                dbChildObj = dbChildNodeRecMap.get(childRecId);
                                matchedRecs.add(childRecId);
                            }
                            traverseNode((Map<String, Object>) childJsonObj, dbChildObj, child, dbObject, saveType, metadata, ops);
                        }
                    }
                    if(!"PATCH".equalsIgnoreCase(saveType)){
                        for(Map.Entry<String, Map<String, Object>> dbRec : dbChildNodeRecMap.entrySet()){
                            if(matchedRecs.contains(dbRec.getKey())){
                                continue;
                            }
                            //Delete the DB multi-context recs which are not part of jsonObj
                            ops.add(TableOperation.builder()
                                .dbTableName(child.getDbTableName())
                                .tableId(child.getTableId())
                                .operationType(TableOperation.OperationType.DELETE)
                                .id(id)
                                .build()
                            );
                        }
                    }
                }

            } else if (childNode instanceof Map<?, ?> childMap) {
                Map<String, Object> dbChildObj = dbChildNode != null ? (Map<String, Object>) dbChildNode : null;
                traverseNode((Map<String, Object>) childMap, dbChildObj, child, dbObject, saveType, metadata, ops);
            }
        }
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
            String tableId, String saveType, ModuleMetadata metadata) {

        List<ColumnMetadata> cols = metadata.getColumnIndex().getOrDefault(tableId, List.of());
        Map<String, ColumnMetadata> fieldMap = cols.stream()
                .collect(Collectors.toMap(ColumnMetadata::getFieldName, Function.identity()));

        Map<String, Object> values = new LinkedHashMap<>();
        for(Map.Entry<String, Object> entry : jsonObj.entrySet()){
            String fieldName = entry.getKey();
            ColumnMetadata flMd = fieldMap.get(fieldName);
            if(flMd == null || entry.getValue() instanceof List<?> list){
                //Invalid data for field
                //TO-DO for multi-select combo we need to store as JSON Array
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
            if("PATCH".equalsIgnoreCase(saveType) && !jsonObj.containsKey(ctxName)){
                //For Patch operation and if the field is not present then ignore
                continue;
            }
            if(dbFlData == null || !dbFlData.equals(flData)) {
                // If DB data is empty or both data are different
                //TO-DO type cast to respective DB column type for flData
                values.put(colName, flData);
            }
        }
        return values;
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
