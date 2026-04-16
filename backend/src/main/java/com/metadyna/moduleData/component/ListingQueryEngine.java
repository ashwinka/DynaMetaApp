package com.metadyna.moduleData.component;

import com.metadyna.moduleData.model.SearchCondition;
import com.metadyna.moduleData.model.SearchCriteria;
import com.metadyna.metadata.model.ColumnMetadata;
import com.metadyna.metadata.model.ModuleMetadata;
import com.metadyna.metadata.model.TableMetadata;
import lombok.extern.slf4j.Slf4j;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import java.util.*;
import java.util.stream.Collectors;

/**
 * Builds and executes the dynamic listing SQL query for a module.
 *
 * Responsibilities:
 *  - Validate and resolve SearchCriteria against ModuleMetadata
 *  - Build FROM + WHERE core (shared between SELECT and COUNT)
 *  - Build SELECT listing query with pagination and sort
 *  - Build COUNT query
 *  - Handle multi-context IN subqueries grouped by root multi-context ancestor
 */
@Slf4j
@Component
public class ListingQueryEngine {

    // ── Public API ────────────────────────────────────────────────────────────

    public ListingResult execute(ModuleMetadata metadata, SearchCriteria criteria, JdbcTemplate jdbc) {
        ValidatedCriteria vc   = validate(criteria, metadata);
        QueryCore         core = buildQueryCore(vc, metadata);

        List<Map<String, Object>> rows  = buildListing(vc, core, jdbc);
        long                      total = buildCountQuery(core, jdbc);

        return new ListingResult(rows, total, vc.startIndex, vc.recordsPerPage);
    }

    // ── Core Builder ──────────────────────────────────────────────────────────

    private QueryCore buildQueryCore(ValidatedCriteria vc, ModuleMetadata metadata) {
        TableMetadata root      = metadata.getRootTable();
        String        rootAlias = tableAlias(root.getTableId());

        Set<String> requiredTableIds = resolveRequiredTables(
                vc.nonMultiContextColumns, vc.sortColumn, vc.nonMultiContextConditions,
                vc.multiContextConditionGroups, metadata);

        StringBuilder fromWhere = new StringBuilder();
        fromWhere.append("FROM ").append(root.getDbTableName()).append(" ").append(rootAlias);
        appendJoins(fromWhere, root, requiredTableIds, metadata);

        List<Object> params  = new ArrayList<>();
        List<String> clauses = new ArrayList<>();

        for (ConditionEntry ce : vc.nonMultiContextConditions) {
            String alias = tableAlias(ce.column.getTableId());
            clauses.add(buildPredicate(alias + "." + ce.column.getColumnName(), ce, params));
        }
        for (MultiContextConditionGroup group : vc.multiContextConditionGroups) {
            clauses.add(buildMultiContextSubquery(group, params, metadata));
        }
        if (!clauses.isEmpty()) {
            fromWhere.append(" WHERE ").append(String.join(" AND ", clauses));
        }

        return new QueryCore(fromWhere.toString(), params, rootAlias);
    }

    // ── Listing & Count ───────────────────────────────────────────────────────

    private List<Map<String, Object>> buildListing(ValidatedCriteria vc, QueryCore core, JdbcTemplate jdbc) {
        StringBuilder select = new StringBuilder("SELECT ")
                .append(core.rootAlias).append(".ID AS \"id\"");

        for (ColumnMetadata col : vc.nonMultiContextColumns) {
            String projection = StringUtils.hasText(col.getListingAlias())
                    ? col.getListingAlias() : col.getFieldName();
            select.append(", ")
                  .append(tableAlias(col.getTableId())).append(".").append(col.getColumnName())
                  .append(" AS \"").append(projection).append("\"");
        }

        String orderBy = (vc.sortColumn != null)
                ? " ORDER BY " + tableAlias(vc.sortColumn.getTableId())
                  + "." + vc.sortColumn.getColumnName()
                  + " " + ("DESC".equalsIgnoreCase(vc.sortDirection) ? "DESC" : "ASC")
                : " ORDER BY " + core.rootAlias + ".ID ASC";

        String sql = select + " " + core.fromWhere + orderBy
                + " LIMIT " + vc.recordsPerPage + " OFFSET " + vc.startIndex;

        log.debug("Listing SQL: {}\nParams: {}", sql, core.params);
        return jdbc.queryForList(sql, core.params.toArray());
    }

    private long buildCountQuery(QueryCore core, JdbcTemplate jdbc) {
        String sql = "SELECT COUNT(*) " + core.fromWhere;
        log.debug("Count SQL: {}\nParams: {}", sql, core.params);
        Long count = jdbc.queryForObject(sql, Long.class, core.params.toArray());
        return count != null ? count : 0L;
    }

    // ── FROM / JOIN construction ──────────────────────────────────────────────

    private void appendJoins(StringBuilder sql, TableMetadata parent,
                              Set<String> requiredTableIds, ModuleMetadata metadata) {
        for (TableMetadata child : metadata.getChildren(parent.getTableId())) {
            if ("Y".equals(child.getMultiContext())) continue;
            if (!requiredTableIds.contains(child.getTableId())) continue;

            String childAlias  = tableAlias(child.getTableId());
            String parentAlias = tableAlias(parent.getTableId());
            sql.append(" LEFT JOIN ").append(child.getDbTableName()).append(" ").append(childAlias)
               .append(" ON ").append(childAlias).append(".").append(child.getJoinColumn())
               .append(" = ").append(parentAlias).append(".").append(child.getRefJoinColumn());

            appendJoins(sql, child, requiredTableIds, metadata);
        }
    }

    // ── WHERE predicate builders ──────────────────────────────────────────────

    String buildPredicate(String colRef, ConditionEntry ce, List<Object> params) {
        return switch (ce.operator.toLowerCase()) {
            case "eq"           -> { params.add(ce.value);             yield colRef + " = ?"; }
            case "neq"          -> { params.add(ce.value);             yield colRef + " != ?"; }
            case "like"         -> { params.add("%" + ce.value + "%"); yield colRef + " ILIKE ?"; }
            case "gt"           -> { params.add(ce.value);             yield colRef + " > ?"; }
            case "lt"           -> { params.add(ce.value);             yield colRef + " < ?"; }
            case "gte"          -> { params.add(ce.value);             yield colRef + " >= ?"; }
            case "lte"          -> { params.add(ce.value);             yield colRef + " <= ?"; }
            case "in", "notin"  -> {
                String[] vals = ce.value.split("\\|");
                for (String v : vals) params.add(v.trim());
                String placeholders = Arrays.stream(vals).map(v -> "?").collect(Collectors.joining(", "));
                yield colRef + ("notin".equals(ce.operator.toLowerCase()) ? " NOT IN (" : " IN (") + placeholders + ")";
            }
            default -> { params.add(ce.value); yield colRef + " = ?"; }
        };
    }

    /**
     * Builds a single IN subquery for a multi-context condition group.
     * The anchor's direct parent is guaranteed to be in the main FROM by resolveRequiredTables.
     */
    private String buildMultiContextSubquery(
            MultiContextConditionGroup group, List<Object> params, ModuleMetadata metadata) {

        TableMetadata anchorTable = metadata.getTableIndex().get(group.anchorTableId);
        if (anchorTable == null) return "1=1";

        String parentId = anchorTable.getParentTableId();
        if (parentId == null) {
            log.warn("anchorTable '{}' has no parent — skipping multi-context subquery", group.anchorTableId);
            return "1=1";
        }
        TableMetadata attachParent = metadata.getTableIndex().get(parentId);
        if (attachParent == null) {
            log.warn("anchorTable parent '{}' not found in metadata — skipping multi-context subquery", parentId);
            return "1=1";
        }

        String attachAlias = tableAlias(attachParent.getTableId());
        String anchorAlias = tableAlias(anchorTable.getTableId());

        // Collect anchor + deeper multi-context descendants that have conditions
        Set<String> subTableIds = new LinkedHashSet<>();
        subTableIds.add(anchorTable.getTableId());
        for (ConditionEntry ce : group.conditions) {
            String tid = ce.column.getTableId();
            while (tid != null && !tid.equals(anchorTable.getTableId())) {
                subTableIds.add(tid);
                TableMetadata t = metadata.getTableIndex().get(tid);
                tid = (t != null) ? t.getParentTableId() : null;
            }
        }

        StringBuilder sub = new StringBuilder("SELECT ")
                .append(anchorAlias).append(".").append(anchorTable.getJoinColumn())
                .append(" FROM ").append(anchorTable.getDbTableName()).append(" ").append(anchorAlias);

        appendSubqueryJoins(sub, anchorTable, subTableIds, metadata);

        List<String> subClauses = new ArrayList<>();
        for (ConditionEntry ce : group.conditions) {
            String ceAlias = tableAlias(ce.column.getTableId());
            subClauses.add(buildPredicate(ceAlias + "." + ce.column.getColumnName(), ce, params));
        }
        if (!subClauses.isEmpty()) {
            sub.append(" WHERE ").append(String.join(" AND ", subClauses));
        }

        return attachAlias + "." + anchorTable.getRefJoinColumn() + " IN (" + sub + ")";
    }

    private void appendSubqueryJoins(StringBuilder sql, TableMetadata parent,
                                      Set<String> subRequiredTableIds, ModuleMetadata metadata) {
        for (TableMetadata child : metadata.getChildren(parent.getTableId())) {
            if (!subRequiredTableIds.contains(child.getTableId())) continue;

            String childAlias  = tableAlias(child.getTableId());
            String parentAlias = tableAlias(parent.getTableId());
            sql.append(" LEFT JOIN ").append(child.getDbTableName()).append(" ").append(childAlias)
               .append(" ON ").append(childAlias).append(".").append(child.getJoinColumn())
               .append(" = ").append(parentAlias).append(".").append(child.getRefJoinColumn());

            appendSubqueryJoins(sql, child, subRequiredTableIds, metadata);
        }
    }

    // ── Validation & Resolution ───────────────────────────────────────────────

    private ValidatedCriteria validate(SearchCriteria criteria, ModuleMetadata metadata) {
        ValidatedCriteria vc = new ValidatedCriteria();
        vc.recordsPerPage = (criteria.getRecordsPerPage() <= 0) ? 25 : criteria.getRecordsPerPage();
        vc.startIndex     = Math.max(criteria.getStartIndex(), 0);
        vc.sortDirection  = StringUtils.hasText(criteria.getSortDirection())
                ? criteria.getSortDirection() : "ASC";

        Map<String, ColumnMetadata> fieldIdIndex = buildFieldIdIndex(metadata);

        // Resolve listing columns — deduplicate by alias
        Set<String> seenAliases = new LinkedHashSet<>();
        if (criteria.getListingColumns() != null) {
            for (String fieldId : criteria.getListingColumns()) {
                ColumnMetadata col = fieldIdIndex.get(fieldId);
                if (col == null) { log.warn("listingColumn fieldId not found: {}", fieldId); continue; }
                String alias = StringUtils.hasText(col.getListingAlias())
                        ? col.getListingAlias() : col.getFieldName();
                if (!seenAliases.add(alias)) { log.warn("Duplicate alias '{}' for '{}' — skipped", alias, fieldId); continue; }
                if (isMultiContextPath(col.getFieldPath())) {
                    vc.multiContextColumns.add(col);
                } else {
                    vc.nonMultiContextColumns.add(col);
                }
            }
        }
        if (vc.nonMultiContextColumns.isEmpty()) {
            TableMetadata root = metadata.getRootTable();
            metadata.getColumnIndex().getOrDefault(root.getTableId(), List.of()).stream()
                    .filter(c -> StringUtils.hasText(c.getListingAlias()))
                    .forEach(vc.nonMultiContextColumns::add);
        }

        // Sort column
        if (StringUtils.hasText(criteria.getSortFieldId())) {
            ColumnMetadata sortCol = fieldIdIndex.get(criteria.getSortFieldId());
            if (sortCol == null) {
                log.warn("sortFieldId '{}' not found — defaulting to ID", criteria.getSortFieldId());
            } else if (isMultiContextPath(criteria.getSortFieldId())) {
                log.warn("sortFieldId '{}' is multi-context — defaulting to ID", criteria.getSortFieldId());
            } else {
                vc.sortColumn = sortCol;
            }
        }

        // Conditions — group multi-context by root multi-context ancestor
        if (criteria.getConditions() != null) {
            Map<String, MultiContextConditionGroup> multiGroups = new LinkedHashMap<>();
            for (SearchCondition cond : criteria.getConditions()) {
                ColumnMetadata col = fieldIdIndex.get(cond.getFieldId());
                if (col == null) { log.warn("condition fieldId '{}' not found — skipped", cond.getFieldId()); continue; }
                if (isMultiContextPath(cond.getFieldId())) {
                    String anchorId = findRootMultiContextAncestor(col.getTableId(), metadata);
                    multiGroups.computeIfAbsent(anchorId, MultiContextConditionGroup::new)
                               .conditions.add(new ConditionEntry(col, cond));
                } else {
                    vc.nonMultiContextConditions.add(new ConditionEntry(col, cond));
                }
            }
            vc.multiContextConditionGroups.addAll(multiGroups.values());
        }

        return vc;
    }

    private String findRootMultiContextAncestor(String tableId, ModuleMetadata metadata) {
        String rootMultiContextId = tableId;
        String current = tableId;
        while (current != null) {
            TableMetadata t = metadata.getTableIndex().get(current);
            if (t == null) break;
            if ("Y".equals(t.getMultiContext())) rootMultiContextId = current;
            current = t.getParentTableId();
        }
        return rootMultiContextId;
    }

    private Set<String> resolveRequiredTables(
            List<ColumnMetadata> columns, ColumnMetadata sortColumn,
            List<ConditionEntry> conditions, List<MultiContextConditionGroup> multiContextGroups,
            ModuleMetadata metadata) {

        Set<String> required = new LinkedHashSet<>();
        for (ColumnMetadata col : columns)      addTableAncestors(col.getTableId(), required, metadata);
        if (sortColumn != null)                 addTableAncestors(sortColumn.getTableId(), required, metadata);
        for (ConditionEntry ce : conditions)    addTableAncestors(ce.column.getTableId(), required, metadata);
        for (MultiContextConditionGroup group : multiContextGroups)
            addNonMultiContextAncestors(group.anchorTableId, required, metadata);
        return required;
    }

    private void addTableAncestors(String tableId, Set<String> required, ModuleMetadata metadata) {
        while (tableId != null) {
            required.add(tableId);
            TableMetadata t = metadata.getTableIndex().get(tableId);
            tableId = (t != null) ? t.getParentTableId() : null;
        }
    }

    private void addNonMultiContextAncestors(String tableId, Set<String> required, ModuleMetadata metadata) {
        String current = metadata.getTableIndex().containsKey(tableId)
                ? metadata.getTableIndex().get(tableId).getParentTableId() : null;
        while (current != null) {
            TableMetadata t = metadata.getTableIndex().get(current);
            if (t == null) break;
            if (!"Y".equals(t.getMultiContext())) required.add(current);
            current = t.getParentTableId();
        }
    }

    private Map<String, ColumnMetadata> buildFieldIdIndex(ModuleMetadata metadata) {
        Map<String, ColumnMetadata> index = new HashMap<>();
        for (ColumnMetadata col : metadata.getColumns()) {
            if (StringUtils.hasText(col.getFieldId())) index.put(col.getFieldId(), col);
        }
        return index;
    }

    boolean isMultiContextPath(String fieldPath) {
        return fieldPath != null && fieldPath.indexOf('$') > 0;
    }

    String tableAlias(String tableId) {
        return "T" + tableId;
    }

    // ── Internal DTOs ─────────────────────────────────────────────────────────

    static class QueryCore {
        final String fromWhere;
        final List<Object> params;
        final String rootAlias;

        QueryCore(String fromWhere, List<Object> params, String rootAlias) {
            this.fromWhere = fromWhere;
            this.params    = params;
            this.rootAlias = rootAlias;
        }
    }

    static class ValidatedCriteria {
        int startIndex;
        int recordsPerPage;
        String sortDirection;
        ColumnMetadata sortColumn;
        final List<ColumnMetadata> nonMultiContextColumns                  = new ArrayList<>();
        final List<ColumnMetadata> multiContextColumns                     = new ArrayList<>();
        final List<ConditionEntry> nonMultiContextConditions               = new ArrayList<>();
        final List<MultiContextConditionGroup> multiContextConditionGroups = new ArrayList<>();
    }

    static class ConditionEntry {
        final ColumnMetadata column;
        final String operator;
        final String value;

        ConditionEntry(ColumnMetadata column, SearchCondition cond) {
            this.column   = column;
            this.operator = cond.getOperator() != null ? cond.getOperator() : "eq";
            this.value    = cond.getValue();
        }
    }

    static class MultiContextConditionGroup {
        final String anchorTableId;
        final List<ConditionEntry> conditions = new ArrayList<>();

        MultiContextConditionGroup(String anchorTableId) {
            this.anchorTableId = anchorTableId;
        }
    }

    // ── Result DTO ────────────────────────────────────────────────────────────

    public static class ListingResult {
        public final List<Map<String, Object>> rows;
        public final long total;
        public final int startIndex;
        public final int recordsPerPage;

        ListingResult(List<Map<String, Object>> rows, long total, int startIndex, int recordsPerPage) {
            this.rows           = rows;
            this.total          = total;
            this.startIndex     = startIndex;
            this.recordsPerPage = recordsPerPage;
        }
    }
}
