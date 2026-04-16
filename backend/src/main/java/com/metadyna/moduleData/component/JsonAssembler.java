package com.metadyna.moduleData.component;

import com.metadyna.metadata.model.ColumnMetadata;
import com.metadyna.metadata.model.ModuleMetadata;
import com.metadyna.metadata.model.TableMetadata;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.*;

/**
 * Assembles a hierarchical JSON structure (as a nested Map) from DB row data.
 *
 * Non-multi-context tables: read directly from the flat joined row using
 *   T{tableId}_{COLNAME} key pattern — no pre-splitting required.
 *
 * Multi-context tables (MULTI_CONTEXT=Y): read from multiContextRowsMap,
 *   which contains one list of rows per tableId from separate queries.
 */
@Slf4j
@Component
public class JsonAssembler {

    /**
     * Assembles the full hierarchical record.
     *
     * @param flatDbRow          flat joined row from fetchFlatRecord —
     *                           keys are T{tableId}_{COLNAME} for all non-multi-context tables
     * @param multiContextRowsMap tableId → list of rows for MULTI_CONTEXT=Y tables
     * @param metadata           full module metadata
     * @return nested Map representing the JSON structure
     */
    public Map<String, Object> assemble(
            Map<String, Object> flatDbRow,
            Map<String, List<Map<String, Object>>> multiContextRowsMap,
            String parentRecId,
            ModuleMetadata metadata) {

        TableMetadata root = metadata.getRootTable();

        // Root fields: read directly from flatDbRow using root's tableId prefix
        Map<String, Object> dbDataRecord = new LinkedHashMap<>(mapDbRowColToContextField(flatDbRow, root.getTableId(), metadata));

        // Recursively assemble children
        if(!dbDataRecord.isEmpty()) {
            assembleChildren(root, flatDbRow, multiContextRowsMap, parentRecId, metadata, dbDataRecord);
        }
        return dbDataRecord;
    }

    // ── Recursive assembly ────────────────────────────────────────────────────

    private void assembleChildren(
            TableMetadata parent,
            Map<String, Object> flatDbRow,
            Map<String, List<Map<String, Object>>> multiContextRowsMap,
            String parentRecId,
            ModuleMetadata metadata,
            Map<String, Object> target) {

        for (TableMetadata child : metadata.getChildren(parent.getTableId())) {
            String tableAlias = RecordFetchQueryEngine.tableAlias(child.getTableId());
            if ("Y".equals(child.getMultiContext())) {
                //Filter the multi-context table records by its parent record ID
                if(child.getRefJoinColumn() != null && !child.getRefJoinColumn().isBlank()) {

                    String recordIdColKey = tableAlias + "_ID";
                    String parentTableIdColKey = tableAlias + "_" + child.getJoinColumn().toUpperCase();

                    // Array node — rows come from the separate per-table query
                    List<Map<String, Object>> childRows =
                            multiContextRowsMap.getOrDefault(child.getTableId(), List.of());

                    List<Map<String, Object>> arrayNode = new ArrayList<>();
                    for (Map<String, Object> childRow : childRows) {
                        Map<String, Object> childMapped = mapDbRowColToContextField(childRow, child.getTableId(), metadata);
                        Object currMultiCtxRecId = childRow.get(recordIdColKey);
                        Object currRecRefCtxObjId = childRow.get(parentTableIdColKey);
                        if(currMultiCtxRecId == null || (parentRecId != null && !parentRecId.equals(String.valueOf(currRecRefCtxObjId)))) {
                            //If the recordId is null or its not matching with parent Object recordId
                            continue;
                        }
                        // Multi-context children of this row also come from multiContextRowsMap
                        assembleChildren(child, childRow, multiContextRowsMap, String.valueOf(currMultiCtxRecId), metadata, childMapped);
                        arrayNode.add(childMapped);
                    }
                    target.put(child.getContextName(), arrayNode);
                }

            } else {
                // Object node — read directly from flatDbRow using child's own tableId prefix
                Map<String, Object> childMapped = mapDbRowColToContextField(flatDbRow, child.getTableId(), metadata);
                if (childMapped.get("id") != null) {
                    target.put(child.getContextName(), childMapped);
                    assembleChildren(child, flatDbRow, multiContextRowsMap,
                            String.valueOf(childMapped.get("id")), metadata, childMapped);
                } else {
                    target.put(child.getContextName(), null);
                }
            }
        }
    }

    /**
     * Maps columns for a specific table from a DB row to their context names.
     *
     * Reads keys in the format T{tableId}_{COLNAME} from dbRow.
     * Since the flat joined row contains columns for ALL tables with their own
     * T{tableId}_ prefix, passing the full flat row here is safe — only keys
     * matching this table's alias are resolved; all others are ignored.
     */
    private Map<String, Object> mapDbRowColToContextField(
            Map<String, Object> dbRow,
            String tableId,
            ModuleMetadata metadata) {

        String alias = RecordFetchQueryEngine.tableAlias(tableId);
        List<ColumnMetadata> cols = metadata.getColumnIndex().getOrDefault(tableId, List.of());
        String recordIdColNameKey = alias + "_ID";
        Map<String, Object> mapped = new LinkedHashMap<>();
        if(dbRow.get(recordIdColNameKey) == null) {
            //If the id is null then the corresponding DB record will not be present.
            return mapped;
        }
        mapped.put("id", dbRow.get(recordIdColNameKey));
        for (ColumnMetadata col : cols) {
            String dbColNameKey = alias + "_" + col.getColumnName().toUpperCase();
            String ctxName = col.getFieldName();

            Object fieldDbVal = dbRow.get(dbColNameKey);
            if (fieldDbVal != null) {
                mapped.put(ctxName, fieldDbVal);
            }
        }
        return mapped;
    }
}
