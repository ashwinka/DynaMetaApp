package com.metadyna.moduleData.component;

import com.metadyna.moduleData.model.TableOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

/**
 * Executes an ordered list of TableOperations in a single transaction.
 *
 * FK resolution: after each INSERT, the generated ID string is stored in a map
 * keyed by tableId. Child operations use this map to populate their JOIN_COLUMN.
 *
 * Returns the String ID of the root table INSERT/UPDATE.
 */
@Slf4j
@Component
public class DynamicSaveEngine {

    @Transactional
    public void executeOperations(List<TableOperation> operations, JdbcTemplate jdbc) {
        // tableId → generated ID string (for FK resolution)
        Map<String, String> generatedIds = new HashMap<>();

        for (TableOperation op : operations) {
            switch (op.getOperationType()) {
                case INSERT -> {
                    String newId = executeInsert(op, generatedIds, jdbc);
                    generatedIds.put(op.getTableId(), newId);
                    log.debug("INSERT {} → ID={}", op.getDbTableName(), newId);
                }
                case UPDATE -> {
                    executeUpdate(op, generatedIds, jdbc);
                    generatedIds.put(op.getTableId(), op.getId());
                    log.debug("UPDATE {} ID={}", op.getDbTableName(), op.getId());
                }
                case DELETE -> {
                    executeDelete(op, jdbc);
                    log.debug("DELETE {} ID={}", op.getDbTableName(), op.getId());
                }
            }
        }
    }

    // ── DML Execution ─────────────────────────────────────────────────────────

    private String executeInsert(
            TableOperation op,
            Map<String, String> generatedIds,
            JdbcTemplate jdbc) {
        if(op.getId() == null || op.getId().isEmpty() || "null".equals(op.getId())) {
            return null;
        }

        Map<String, Object> values = new LinkedHashMap<>(op.getColumnValues());
        if (values.isEmpty()) {
            throw new IllegalArgumentException("INSERT on " + op.getDbTableName() + " has no column values");
        }
        values.put("ID", op.getId());
        // Inject FK from parent if applicable
        if (op.getJoinColumn() != null && op.getParentCtxObjId() != null) {
            String parentId = op.getParentCtxObjId();
            values.put(op.getJoinColumn(), parentId);
        }

        String cols = String.join(", ", values.keySet());
        String placeholders = String.join(", ", Collections.nCopies(values.size(), "?"));
        String sql = "INSERT INTO " + op.getDbTableName() + " (" + cols + ") VALUES (" + placeholders + ")";

        jdbc.update(sql, values.values().toArray());
        return op.getId();
    }

    private void executeUpdate(
            TableOperation op,
            Map<String, String> generatedIds,
            JdbcTemplate jdbc) {

        Map<String, Object> values = op.getColumnValues();
        if (values.isEmpty()) return;

        String setClauses = String.join(", ", values.keySet().stream()
                .map(k -> k + " = ?").toList());
        String sql = "UPDATE " + op.getDbTableName() + " SET " + setClauses + " WHERE ID = ?";

        List<Object> params = new ArrayList<>(values.values());
        params.add(op.getId());

        jdbc.update(sql, params.toArray());
    }

    private void executeDelete(TableOperation op, JdbcTemplate jdbc) {
        jdbc.update("DELETE FROM " + op.getDbTableName() + " WHERE ID = ?", op.getId());
    }
}
