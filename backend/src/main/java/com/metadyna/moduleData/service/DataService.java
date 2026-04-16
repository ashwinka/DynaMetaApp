package com.metadyna.moduleData.service;

import com.metadyna.common.exception.ModuleDataException;
import com.metadyna.common.exception.ResourceNotFoundException;
import com.metadyna.common.model.PageResponse;
import com.metadyna.moduleData.component.DynamicQueryEngine;
import com.metadyna.moduleData.component.DynamicSaveEngine;
import com.metadyna.moduleData.component.JsonAssembler;
import com.metadyna.moduleData.component.JsonDisassembler;
import com.metadyna.moduleData.component.ListingQueryEngine;
import com.metadyna.moduleData.component.RecordFetchQueryEngine;
import com.metadyna.moduleData.model.SearchCriteria;
import com.metadyna.moduleData.model.TableOperation;
import com.metadyna.metadata.model.ModuleMetadata;
import com.metadyna.metadata.model.TableMetadata;
import com.metadyna.metadata.service.MetadataService;
import com.metadyna.tenant.service.TenantDataSourceRegistry;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * Central orchestrator for all dynamic data operations.
 *
 * Delegates to:
 * - MetadataService  — load module metadata (cached)
 * - DynamicQueryEngine — build and execute SELECT queries
 * - JsonAssembler    — DB rows → nested JSON
 * - JsonDisassembler — nested JSON → TableOperations
 * - DynamicSaveEngine — execute INSERT/UPDATE/DELETE in a transaction
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class DataService {

    private final MetadataService metadataService;
    private final TenantDataSourceRegistry tenantDataSourceRegistry;
    private final DynamicQueryEngine queryEngine;
    private final JsonAssembler jsonAssembler;
    private final JsonDisassembler jsonDisassembler;
    private final DynamicSaveEngine saveEngine;

    // ── Listing ───────────────────────────────────────────────────────────────

    public PageResponse<Map<String, Object>> getModuleDataRecordsForListing(
            String moduleId,
            SearchCriteria criteria,
            String tenantId) {

        JdbcTemplate jdbc = tenantDataSourceRegistry.getJdbcTemplate(tenantId);
        ModuleMetadata metadata = metadataService.loadModuleMetadata(moduleId, tenantId);

        ListingQueryEngine.ListingResult result = queryEngine.moduleDataListing(metadata, criteria, jdbc);

        int page = result.recordsPerPage > 0 ? result.startIndex / result.recordsPerPage : 0;
        return PageResponse.of(result.rows, page, result.recordsPerPage, result.total);
    }

    // ── Single Record Fetch ───────────────────────────────────────────────────

    public Map<String, Object> getModuleDataRecordById(String moduleId, String id, String tenantId) {
        JdbcTemplate jdbc = tenantDataSourceRegistry.getJdbcTemplate(tenantId);
        ModuleMetadata metadata = metadataService.loadModuleMetadata(moduleId, tenantId);

        Map<String, Object> flatDbRow = queryEngine.fetchFlatRecord(metadata, id, jdbc)
                .orElseThrow(() -> new ResourceNotFoundException(
                        "Record not found: moduleId=" + moduleId + ", id=" + id));

        TableMetadata root = metadata.getRootTable();
        String rootTableAlias = RecordFetchQueryEngine.tableAlias(root.getTableId());
        Map<String, List<Map<String, Object>>> multiContextRowsMap = new LinkedHashMap<>();
        String fromClause = " FROM " + root.getDbTableName() + " " + rootTableAlias;
        String whereClause = " WHERE " + rootTableAlias + ".ID = ?";
        List<String> joinClause = new ArrayList<>();
        fetchAllMultiContextRows(root, id, fromClause, whereClause, joinClause, metadata, jdbc, multiContextRowsMap);

        return jsonAssembler.assemble(flatDbRow, multiContextRowsMap, null, metadata);
    }

    // ── Save (POST) ───────────────────────────────────────────────────────────

    public Map<String, Object> createModuleDataRecord(
            String moduleId,
            Map<String, Object> payload,
            String tenantId) {

        JdbcTemplate jdbc = tenantDataSourceRegistry.getJdbcTemplate(tenantId);
        ModuleMetadata metadata = metadataService.loadModuleMetadata(moduleId, tenantId);
        TableMetadata root = metadata.getRootTable();

        //Validate the DataRecord ID exists in DB
        String id = String.valueOf(payload.get("id").toString());
        if("null".equalsIgnoreCase(id) || "".equals(id)) {
            throw new ModuleDataException("ID_NULL", "Data Record ID is empty", HttpStatus.BAD_REQUEST);
        }
        queryEngine.fetchBaseDataRecord(id, root, metadata, jdbc).ifPresent(rec-> {throw new ModuleDataException("ERROR","ID already exists",HttpStatus.BAD_REQUEST);});

        List<TableOperation> ops = jsonDisassembler.disassembleFull(payload, null, "SAVE", metadata);
        saveEngine.executeOperations(ops, jdbc);

        return getModuleDataRecordById(moduleId, id, tenantId);
    }

    // ── Full Update (PUT) ─────────────────────────────────────────────────────

    public Map<String, Object> saveModuleDataRecord(
            String moduleId,
            String id,
            Map<String, Object> payload,
            String tenantId) {

        JdbcTemplate jdbc = tenantDataSourceRegistry.getJdbcTemplate(tenantId);
        ModuleMetadata metadata = metadataService.loadModuleMetadata(moduleId, tenantId);
        TableMetadata root = metadata.getRootTable();

        if("null".equalsIgnoreCase(id) || "".equals(id)) {
            throw new ModuleDataException("ID_NULL", "Data Record ID is empty", HttpStatus.BAD_REQUEST);
        }
        Map<String, Object> dbJsonObj = getModuleDataRecordById(moduleId, id, tenantId);
        String saveType = "UPDATE";

        List<TableOperation> ops = jsonDisassembler.disassembleFull(payload, dbJsonObj, saveType, metadata);
        saveEngine.executeOperations(ops, jdbc);

        return getModuleDataRecordById(moduleId, id, tenantId);
    }

    // ── Delta Update (PATCH) ──────────────────────────────────────────────────

    public Map<String, Object> patchModuleDataRecord(
            String moduleId,
            String id,
            Map<String, Object> updatedJson,
            Map<String, Object> deletedRec,
            String tenantId) {

        JdbcTemplate jdbc = tenantDataSourceRegistry.getJdbcTemplate(tenantId);
        ModuleMetadata metadata = metadataService.loadModuleMetadata(moduleId, tenantId);
        TableMetadata root = metadata.getRootTable();

        if("null".equalsIgnoreCase(id) || "".equals(id)) {
            throw new ModuleDataException("ID_NULL", "Data Record ID is empty", HttpStatus.BAD_REQUEST);
        }
        Map<String, Object> dbJsonObj = getModuleDataRecordById(moduleId, id, tenantId);
        if(dbJsonObj == null){
            throw new ModuleDataException("REC_NULL", "Data Record not found", HttpStatus.BAD_REQUEST);
        }
        String saveType = "PATCH";
        List<TableOperation> ops = jsonDisassembler.disassembleFull(updatedJson, dbJsonObj, saveType, metadata);
        jsonDisassembler.collectDeleteOps(deletedRec, dbJsonObj, root, metadata, ops);
        saveEngine.executeOperations(ops, jdbc);

        return getModuleDataRecordById(moduleId, id, tenantId);
    }

    // ── Delete ────────────────────────────────────────────────────────────────

    public void deleteModuleDataRecord(String moduleId, String id, String tenantId) {
        JdbcTemplate jdbc = tenantDataSourceRegistry.getJdbcTemplate(tenantId);
        ModuleMetadata metadata = metadataService.loadModuleMetadata(moduleId, tenantId);
        TableMetadata root = metadata.getRootTable();

        // Verify record exists
        queryEngine.fetchBaseDataRecord(id, root, metadata, jdbc)
                .orElseThrow(() -> new ResourceNotFoundException(
                        "Record not found: moduleId=" + moduleId + ", id=" + id));

        // Cascade delete: children first (reverse BFS), then root
        List<TableOperation> deleteOps = buildCascadeDeleteOps(root, id, metadata, jdbc);
        saveEngine.executeOperations(deleteOps, jdbc);
    }

    // ── Helpers ───────────────────────────────────────────────────────────────

    /**
     * Issues one query per multi-context (MULTI_CONTEXT=Y) table reachable from
     * the given parent. Multi-context rows are keyed by tableId in the returned map.
     */
    private void fetchAllMultiContextRows(
            TableMetadata parent,
            String parentId,
            String fromClause,
            String whereClause,
            List<String> joinClause,
            ModuleMetadata metadata,
            JdbcTemplate jdbc,
            Map<String, List<Map<String, Object>>> childRowsMap) {

        String parentAlias = RecordFetchQueryEngine.tableAlias(parent.getTableId());
        for (TableMetadata child : metadata.getChildren(parent.getTableId())) {
            List<String> currTableJoins = new ArrayList<>(joinClause);
            String childAlias = RecordFetchQueryEngine.tableAlias(child.getTableId());
            String parentJoinCol = child.getRefJoinColumn();
            String currTableJoin = " LEFT JOIN " +
                    child.getDbTableName() + " " + childAlias +
                    " ON " + childAlias + "." + child.getJoinColumn() +
                    " = " + parentAlias + "." + parentJoinCol;
            currTableJoins.add(currTableJoin);

            if ("Y".equals(child.getMultiContext())) {
                List<Map<String, Object>> rows = queryEngine.fetchMultiContextRows(
                    child, fromClause, whereClause, currTableJoins, metadata, parentId, jdbc);
                childRowsMap.put(child.getTableId(), rows);
            }
            fetchAllMultiContextRows(child, parentId, fromClause, whereClause, currTableJoins, metadata, jdbc, childRowsMap);
        }
    }

    /**
     * Builds DELETE operations in reverse BFS order (deepest children first, root last).
     */
    private List<TableOperation> buildCascadeDeleteOps(
            TableMetadata root,
            String rootId,
            ModuleMetadata metadata,
            JdbcTemplate jdbc) {

        List<TableOperation> ops = new ArrayList<>();
        collectDeleteOpsBfs(root, rootId, metadata, jdbc, ops);
        Collections.reverse(ops);
        return ops;
    }

    private void collectDeleteOpsBfs(
            TableMetadata table,
            String id,
            ModuleMetadata metadata,
            JdbcTemplate jdbc,
            List<TableOperation> ops) {

        ops.add(TableOperation.builder()
                .dbTableName(table.getDbTableName())
                .tableId(table.getTableId())
                .operationType(TableOperation.OperationType.DELETE)
                .id(id)
                .columnValues(Map.of())
                .build());

        for (TableMetadata child : metadata.getChildren(table.getTableId())) {
            List<Map<String, Object>> childRows = queryEngine.fetchChildRows(child, metadata, id, jdbc);
            for (Map<String, Object> row : childRows) {
                Object recId = row.getOrDefault(
                        RecordFetchQueryEngine.rowKey(child.getTableId(), "ID"),
                        row.getOrDefault("ID", row.get("id")));
                if (recId != null) {
                    String childId = recId.toString();
                    if (!childId.isBlank()) {
                        collectDeleteOpsBfs(child, childId, metadata, jdbc, ops);
                    }
                }
            }
        }
    }

    @SuppressWarnings("unchecked")
    private void injectId(Map<String, Object> payload, String rootContextName, String id) {
        Map<String, Object> rootNode = payload;
        if (payload.containsKey(rootContextName) && payload.get(rootContextName) instanceof Map<?, ?> inner) {
            rootNode = (Map<String, Object>) inner;
        }
        rootNode.put("id", id);
    }
}
