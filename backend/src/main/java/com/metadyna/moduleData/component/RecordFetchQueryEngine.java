package com.metadyna.moduleData.component;

import com.metadyna.metadata.model.ColumnMetadata;
import com.metadyna.metadata.model.ModuleMetadata;
import com.metadyna.metadata.model.TableMetadata;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import java.util.*;

/**
 * Metadata-driven query engine for single-record fetches.
 *
 * Two query strategies:
 *
 * 1. fetchFlatRecord — ONE query for the root table + all non-multi-context
 *    descendants, joined recursively with LEFT JOINs.
 *    Returns a single flat row keyed as T{tableId}_{COLNAME}.
 *
 * 2. fetchMultiContextRows — one query per multi-context (array) table,
 *    fetching all rows for a given parent FK value.
 *    Returns rows keyed as T{tableId}_{COLNAME}.
 *
 * Column alias format:  T{tableId}_{COLUMN_NAME}
 *   e.g.  T01.CASE_NUMBER AS "T01_CASE_NUMBER"
 */
@Component
public class RecordFetchQueryEngine {

    // ── Strategy 1: single JOIN query for root + non-multi-context spine ──────

    /**
     * Builds and executes one SELECT with LEFT JOINs covering the root table
     * and every non-multi-context descendant reachable from it.
     *
     * Multi-context (MULTI_CONTEXT=Y) tables are NOT included — they are
     * fetched separately via fetchMultiContextRows.
     *
     * @return Optional of the single flat row, empty if root record not found.
     */
    public Optional<Map<String, Object>> fetchFlatRecord(
            ModuleMetadata metadata,
            String id,
            JdbcTemplate jdbc) {

        TableMetadata root = metadata.getRootTable();
        StringJoiner selectCols = new StringJoiner(", ");
        StringBuilder joins = new StringBuilder();

        // Root table columns
        addSelectCols(root, metadata, selectCols);

        // Recursively add LEFT JOINs for non-multi-context children
        buildJoins(root, metadata, joins, selectCols);

        String sql = "SELECT " + selectCols
                + " FROM " + root.getDbTableName() + " " + tableAlias(root.getTableId())
                + joins
                + " WHERE " + tableAlias(root.getTableId()) + ".ID = ?";

        List<Map<String, Object>> rows = jdbc.queryForList(sql, id);
        return rows.isEmpty() ? Optional.empty() : Optional.of(rows.get(0));
    }

    /**
     * Recursively appends LEFT JOIN clauses for all non-multi-context children.
     * Stops at any MULTI_CONTEXT=Y boundary (those are fetched separately).
     */
    private void buildJoins(
            TableMetadata parent,
            ModuleMetadata metadata,
            StringBuilder joins,
            StringJoiner selectCols) {

        for (TableMetadata child : metadata.getChildren(parent.getTableId())) {
            if ("Y".equals(child.getMultiContext())) continue; // skip — fetched separately

            String childAlias  = tableAlias(child.getTableId());
            String parentAlias = tableAlias(parent.getTableId());

            // JOIN condition: child.JOIN_COLUMN = parent.REF_JOIN_COLUMN (or ID)
            String parentJoinCol = (child.getRefJoinColumn() != null && !child.getRefJoinColumn().isBlank())
                    ? child.getRefJoinColumn()
                    : "ID";

            joins.append(" LEFT JOIN ")
                 .append(child.getDbTableName()).append(" ").append(childAlias)
                 .append(" ON ").append(childAlias).append(".").append(child.getJoinColumn())
                 .append(" = ").append(parentAlias).append(".").append(parentJoinCol);

            addSelectCols(child, metadata, selectCols);

            // Recurse into non-multi-context grandchildren
            buildJoins(child, metadata, joins, selectCols);
        }
    }

    // ── Strategy 2: per-multi-context-table query ─────────────────────────────

    /**
     * Fetches all rows for a multi-context (array) table.
     *
     * Uses the root-anchored FROM + WHERE clause so all rows for this record
     * are returned in one query. Non-multi-context children of this table are
     * included via LEFT JOINs built by buildJoins.
     */
    public List<Map<String, Object>> fetchMultiContextRows(
            TableMetadata table, String fromClause, String whereClause, List<String> joinClause,
            ModuleMetadata metadata,
            String parentId,
            JdbcTemplate jdbc) {

        String alias = tableAlias(table.getTableId());
        StringJoiner selectCols = new StringJoiner(", ");
        addSelectCols(table, metadata, selectCols);

        // Include the FK join column so JsonAssembler can match rows to their parent
        if (table.getRefJoinColumn() != null && !table.getRefJoinColumn().isBlank()) {
            String refCol = table.getRefJoinColumn().toUpperCase();
            selectCols.add(alias + "." + refCol + " AS \"" + alias + "_" + refCol + "\"");
        }
        if (!"ID".equalsIgnoreCase(table.getJoinColumn())) {
            String joinCol = table.getJoinColumn().toUpperCase();
            selectCols.add(alias + "." + joinCol + " AS \"" + alias + "_" + joinCol + "\"");
        }

        // Build JOIN string: parent-chain joins + non-multi-context child joins
        StringBuilder allJoins = new StringBuilder();
        joinClause.forEach(j -> allJoins.append(" ").append(j));
        buildJoins(table, metadata, allJoins, selectCols); // adds non-multi-context children of this table

        String sql = "SELECT " + selectCols
                + fromClause
                + allJoins
                + whereClause
                + " ORDER BY " + alias + ".ID ASC";

        return jdbc.queryForList(sql, parentId);
    }

    // ── Legacy single-table fetches (used by delete cascade) ─────────────────

    /**
     * Fetch the root row by ID (single table, no joins).
     * Used for existence checks and delete cascade.
     */
    public Optional<Map<String, Object>> fetchRootRow(
            TableMetadata table,
            ModuleMetadata metadata,
            String id,
            JdbcTemplate jdbc) {

        String alias = tableAlias(table.getTableId());
        StringJoiner selectCols = new StringJoiner(", ");
        addSelectCols(table, metadata, selectCols);

        String sql = "SELECT " + selectCols
                + " FROM " + table.getDbTableName() + " " + alias
                + " WHERE " + alias + ".ID = ?";

        List<Map<String, Object>> rows = jdbc.queryForList(sql, id);
        return rows.isEmpty() ? Optional.empty() : Optional.of(rows.get(0));
    }

    /**
     * Fetch child rows by FK join column (single table, no joins).
     * Used by delete cascade BFS.
     */
    public List<Map<String, Object>> fetchChildRows(
            TableMetadata table,
            ModuleMetadata metadata,
            String parentId,
            JdbcTemplate jdbc) {

        String alias = tableAlias(table.getTableId());
        StringJoiner selectCols = new StringJoiner(", ");
        addSelectCols(table, metadata, selectCols);

        String sql = "SELECT " + selectCols
                + " FROM " + table.getDbTableName() + " " + alias
                + " WHERE " + alias + "." + table.getJoinColumn() + " = ?";

        return jdbc.queryForList(sql, parentId);
    }

    // ── SELECT clause builder ─────────────────────────────────────────────────

    /**
     * Appends aliased column expressions for a table into the SELECT joiner:
     *   T01.ID AS "T01_ID", T01.COL1 AS "T01_COL1", ...
     */
    private void addSelectCols(TableMetadata table, ModuleMetadata metadata, StringJoiner cols) {
        String alias = tableAlias(table.getTableId());

        // ID always first
        cols.add(alias + ".ID AS \"" + alias + "_ID\"");

        for (ColumnMetadata col : metadata.getColumnIndex().getOrDefault(table.getTableId(), List.of())) {
            String colName = col.getColumnName().toUpperCase();
            cols.add(alias + "." + colName + " AS \"" + alias + "_" + colName + "\"");
        }
    }

    // ── Static helpers ────────────────────────────────────────────────────────

    /** Table alias: T + tableId  (e.g. "01" → "T01") */
    public static String tableAlias(String tableId) {
        return "T" + tableId;
    }

    /** Result-set key for a given tableId + column name */
    public static String rowKey(String tableId, String columnName) {
        return tableAlias(tableId) + "_" + columnName.toUpperCase();
    }
}
