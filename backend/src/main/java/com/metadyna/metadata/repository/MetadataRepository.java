package com.metadyna.metadata.repository;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.metadyna.metadata.model.ColumnMetadata;
import com.metadyna.metadata.model.TableMetadata;
import com.metadyna.metadata.model.UiMetadata;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
public class MetadataRepository {

    // ── TABLE_METADATA ────────────────────────────────────────────────────────

    public List<TableMetadata> findTablesByModule(String moduleId, JdbcTemplate jdbc) {
        return jdbc.query("""
                SELECT ID, MODULE_ID, TABLE_ID, PARENT_TABLE_ID, DB_TABLE_NAME,
                       CONTEXT_NAME, JOIN_COLUMN, REF_JOIN_COLUMN, MULTI_CONTEXT, CONTEXT_PATH
                  FROM TABLE_METADATA WHERE MODULE_ID = ?
                 ORDER BY ID
                """, (rs, n) -> TableMetadata.builder()
                .id(rs.getString("ID"))
                .moduleId(rs.getString("MODULE_ID"))
                .tableId(rs.getString("TABLE_ID"))
                .parentTableId(rs.getString("PARENT_TABLE_ID"))
                .dbTableName(rs.getString("DB_TABLE_NAME"))
                .contextName(rs.getString("CONTEXT_NAME"))
                .joinColumn(rs.getString("JOIN_COLUMN"))
                .refJoinColumn(rs.getString("REF_JOIN_COLUMN"))
                .multiContext(rs.getString("MULTI_CONTEXT"))
                .contextPath(rs.getString("CONTEXT_PATH"))
                .build(), moduleId);
    }

    public Optional<TableMetadata> findTable(String moduleId, String tableId, JdbcTemplate jdbc) {
        List<TableMetadata> rows = jdbc.query("""
                SELECT ID, MODULE_ID, TABLE_ID, PARENT_TABLE_ID, DB_TABLE_NAME,
                       CONTEXT_NAME, JOIN_COLUMN, REF_JOIN_COLUMN, MULTI_CONTEXT, CONTEXT_PATH
                  FROM TABLE_METADATA WHERE MODULE_ID = ? AND TABLE_ID = ?
                """, (rs, n) -> TableMetadata.builder()
                .id(rs.getString("ID"))
                .moduleId(rs.getString("MODULE_ID"))
                .tableId(rs.getString("TABLE_ID"))
                .parentTableId(rs.getString("PARENT_TABLE_ID"))
                .dbTableName(rs.getString("DB_TABLE_NAME"))
                .contextName(rs.getString("CONTEXT_NAME"))
                .joinColumn(rs.getString("JOIN_COLUMN"))
                .refJoinColumn(rs.getString("REF_JOIN_COLUMN"))
                .multiContext(rs.getString("MULTI_CONTEXT"))
                .contextPath(rs.getString("CONTEXT_PATH"))
                .build(), moduleId, tableId);
        return rows.isEmpty() ? Optional.empty() : Optional.of(rows.get(0));
    }

    public String insertTable(TableMetadata t, JdbcTemplate jdbc) {
        String newId = UUID.randomUUID().toString();
        jdbc.update("""
                INSERT INTO TABLE_METADATA
                       (ID, MODULE_ID, TABLE_ID, PARENT_TABLE_ID, DB_TABLE_NAME, CONTEXT_NAME,
                        JOIN_COLUMN, REF_JOIN_COLUMN, MULTI_CONTEXT, CONTEXT_PATH)
                VALUES (?,?,?,?,?,?,?,?,?,?)
                """,
                newId, t.getModuleId(), t.getTableId(), t.getParentTableId(),
                t.getDbTableName(), t.getContextName(), t.getJoinColumn(), t.getRefJoinColumn(),
                t.getMultiContext() != null ? t.getMultiContext() : "N", t.getContextPath());
        return newId;
    }

    public void updateTable(TableMetadata t, JdbcTemplate jdbc) {
        jdbc.update("""
                UPDATE TABLE_METADATA SET PARENT_TABLE_ID=?, DB_TABLE_NAME=?, CONTEXT_NAME=?,
                       JOIN_COLUMN=?, REF_JOIN_COLUMN=?, MULTI_CONTEXT=?, CONTEXT_PATH=?
                 WHERE MODULE_ID=? AND TABLE_ID=?
                """,
                t.getParentTableId(), t.getDbTableName(), t.getContextName(),
                t.getJoinColumn(), t.getRefJoinColumn(),
                t.getMultiContext() != null ? t.getMultiContext() : "N",
                t.getContextPath(), t.getModuleId(), t.getTableId());
    }

    public void deleteTable(String moduleId, String tableId, JdbcTemplate jdbc) {
        jdbc.update("DELETE FROM TABLE_METADATA WHERE MODULE_ID=? AND TABLE_ID=?", moduleId, tableId);
    }

    // ── TABLE_COLUMN_METADATA ─────────────────────────────────────────────────

    public List<ColumnMetadata> findColumnsByModule(String moduleId, JdbcTemplate jdbc) {
        return jdbc.query("""
                SELECT ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME,
                    FIELD_PATH, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, LISTING_ALIAS,
                    LABEL, LABEL_INFO, DESCRIPTION, UI_METADATA
                  FROM TABLE_COLUMN_METADATA WHERE MODULE_ID = ?
                 ORDER BY TABLE_ID, ID
                """, (rs, n) -> mapColumn(rs), moduleId);
    }

    public List<ColumnMetadata> findColumnsByTable(String moduleId, String tableId, JdbcTemplate jdbc) {
        return jdbc.query("""
                SELECT ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME,
                    FIELD_PATH, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, LISTING_ALIAS,
                    LABEL, LABEL_INFO, DESCRIPTION, UI_METADATA
                  FROM TABLE_COLUMN_METADATA WHERE MODULE_ID = ? AND TABLE_ID = ?
                 ORDER BY ID
                """, (rs, n) -> mapColumn(rs), moduleId, tableId);
    }

    public Optional<ColumnMetadata> findColumn(String moduleId, String tableId, String fieldId, JdbcTemplate jdbc) {
        List<ColumnMetadata> rows = jdbc.query("""
                SELECT ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME,
                    FIELD_PATH, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, LISTING_ALIAS,
                    LABEL, LABEL_INFO, DESCRIPTION, UI_METADATA
                  FROM TABLE_COLUMN_METADATA WHERE MODULE_ID=? AND TABLE_ID=? AND FIELD_ID=?
                """, (rs, n) -> mapColumn(rs), moduleId, tableId, fieldId);
        return rows.isEmpty() ? Optional.empty() : Optional.of(rows.get(0));
    }

    public String insertColumn(ColumnMetadata c, JdbcTemplate jdbc) {
        String newId = UUID.randomUUID().toString();
        jdbc.update("""
                INSERT INTO TABLE_COLUMN_METADATA
                       (ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME,
                        FIELD_PATH, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, LISTING_ALIAS)
                VALUES (?,?,?,?,?,?,?,?,?,?,?)
                """,
                newId, c.getModuleId(), c.getTableId(), c.getFieldId(),
                c.getColumnName(), c.getFieldName(), c.getFieldPath(), c.getDataType(),
                c.getMaxLength(), c.getRequiredField() != null ? c.getRequiredField() : "N",
                c.getListingAlias());
        return newId;
    }

    public void updateColumn(ColumnMetadata c, JdbcTemplate jdbc) {
        jdbc.update("""
                UPDATE TABLE_COLUMN_METADATA
                   SET COLUMN_NAME=?, FIELD_NAME=?, FIELD_PATH=?, DATA_TYPE=?,
                       MAX_LENGTH=?, REQUIRED_FIELD=?, LISTING_ALIAS=?
                 WHERE MODULE_ID=? AND TABLE_ID=? AND FIELD_ID=?
                """,
                c.getColumnName(), c.getFieldName(), c.getFieldPath(), c.getDataType(),
                c.getMaxLength(), c.getRequiredField() != null ? c.getRequiredField() : "N",
                c.getListingAlias(), c.getModuleId(), c.getTableId(), c.getFieldId());
    }

    public void deleteColumn(String moduleId, String tableId, String fieldId, JdbcTemplate jdbc) {
        jdbc.update("DELETE FROM TABLE_COLUMN_METADATA WHERE MODULE_ID=? AND TABLE_ID=? AND FIELD_ID=?",
                moduleId, tableId, fieldId);
    }

    // ── UI_METADATA ───────────────────────────────────────────────────────────

    public Optional<UiMetadata> findUiMetadata(String moduleId, String type, JdbcTemplate jdbc) {
        List<UiMetadata> rows = jdbc.query("""
                SELECT ID, MODULE_ID, NAME, TYPE, METADATA_JSON, S3_PATH,
                       TO_CHAR(CREATED_AT,'YYYY-MM-DD"T"HH24:MI:SS"Z"') AS CREATED_AT,
                       TO_CHAR(UPDATED_AT,'YYYY-MM-DD"T"HH24:MI:SS"Z"') AS UPDATED_AT
                  FROM UI_METADATA WHERE MODULE_ID=? AND TYPE=?
                """, (rs, n) -> mapUi(rs), moduleId, type);
        return rows.isEmpty() ? Optional.empty() : Optional.of(rows.get(0));
    }

    public List<UiMetadata> findAllUiMetadata(String moduleId, JdbcTemplate jdbc) {
        return jdbc.query("""
                SELECT ID, MODULE_ID, NAME, TYPE, METADATA_JSON, S3_PATH,
                       TO_CHAR(CREATED_AT,'YYYY-MM-DD"T"HH24:MI:SS"Z"') AS CREATED_AT,
                       TO_CHAR(UPDATED_AT,'YYYY-MM-DD"T"HH24:MI:SS"Z"') AS UPDATED_AT
                  FROM UI_METADATA WHERE MODULE_ID=? ORDER BY TYPE
                """, (rs, n) -> mapUi(rs), moduleId);
    }

    public void upsertUiMetadata(UiMetadata ui, JdbcTemplate jdbc) {
        if ("FORM".equals(ui.getType())) {
            int updated = jdbc.update("""
                    UPDATE UI_METADATA SET METADATA_JSON=?, S3_PATH=?, UPDATED_AT=NOW()
                     WHERE MODULE_ID=? AND TYPE=? AND NAME=?
                    """, ui.getMetadataJson(), ui.getS3Path(),
                    ui.getModuleId(), ui.getType(), ui.getName());
            if (updated == 0) {
                jdbc.update("""
                        INSERT INTO UI_METADATA (ID, MODULE_ID, NAME, TYPE, METADATA_JSON, S3_PATH)
                        VALUES (?,?,?,?,?,?)
                        """, UUID.randomUUID().toString(), ui.getModuleId(), ui.getName(),
                        ui.getType(), ui.getMetadataJson(), ui.getS3Path());
            }
        } else {
            int updated = jdbc.update("""
                    UPDATE UI_METADATA SET NAME=?, METADATA_JSON=?, S3_PATH=?, UPDATED_AT=NOW()
                     WHERE MODULE_ID=? AND TYPE=?
                    """, ui.getName(), ui.getMetadataJson(), ui.getS3Path(),
                    ui.getModuleId(), ui.getType());
            if (updated == 0) {
                jdbc.update("""
                        INSERT INTO UI_METADATA (ID, MODULE_ID, NAME, TYPE, METADATA_JSON, S3_PATH)
                        VALUES (?,?,?,?,?,?)
                        """, UUID.randomUUID().toString(), ui.getModuleId(), ui.getName(),
                        ui.getType(), ui.getMetadataJson(), ui.getS3Path());
            }
        }
    }

    public void deleteUiMetadata(String moduleId, String type, JdbcTemplate jdbc) {
        jdbc.update("DELETE FROM UI_METADATA WHERE MODULE_ID=? AND TYPE=?", moduleId, type);
    }

    // ── Helpers ───────────────────────────────────────────────────────────────

    private ColumnMetadata mapColumn(java.sql.ResultSet rs) throws java.sql.SQLException {
        int maxLen = rs.getInt("MAX_LENGTH");
        return ColumnMetadata.builder()
                .id(rs.getString("ID"))
                .moduleId(rs.getString("MODULE_ID"))
                .tableId(rs.getString("TABLE_ID"))
                .fieldId(rs.getString("FIELD_ID"))
                .columnName(rs.getString("COLUMN_NAME"))
                .fieldName(rs.getString("FIELD_NAME"))
                .fieldPath(rs.getString("FIELD_PATH"))
                .dataType(rs.getString("DATA_TYPE"))
                .maxLength(rs.wasNull() ? null : maxLen)
                .requiredField(rs.getString("REQUIRED_FIELD"))
                .listingAlias(rs.getString("LISTING_ALIAS"))
                .label(rs.getString("LABEL"))
                .labelInfo(rs.getString("LABEL_INFO"))
                .description(rs.getString("DESCRIPTION"))
                .uiMetadata(rs.getString("UI_METADATA"))
                .build();
    }

    private UiMetadata mapUi(java.sql.ResultSet rs) throws java.sql.SQLException {
        return UiMetadata.builder()
                .id(rs.getString("ID"))
                .moduleId(rs.getString("MODULE_ID"))
                .name(rs.getString("NAME"))
                .type(rs.getString("TYPE"))
                .metadataJson(rs.getString("METADATA_JSON"))
                .s3Path(rs.getString("S3_PATH"))
                .createdAt(rs.getString("CREATED_AT"))
                .updatedAt(rs.getString("UPDATED_AT"))
                .build();
    }

    private static ObjectMapper objectMapper;
    private JsonNode parseJson(String json) {
        if (json == null || json.isBlank()) return null;
        try {
            return objectMapper.readTree(json);
        } catch (Exception e) {
            return null;
        }
    }
}
