package com.metadyna.metadata.service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.metadyna.codelist.model.CodeListValue;
import com.metadyna.codelist.repository.CodeListRepository;
import com.metadyna.common.exception.AppException;
import com.metadyna.common.exception.ResourceNotFoundException;
import com.metadyna.metadata.cache.MetadataCache;
import com.metadyna.metadata.model.*;
import com.metadyna.metadata.repository.MetadataRepository;
import com.metadyna.tenant.service.TenantDataSourceRegistry;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Slf4j
@Service
@RequiredArgsConstructor
public class MetadataService {

    private final MetadataRepository metadataRepository;
    private final MetadataCache metadataCache;
    private final TenantDataSourceRegistry tenantDataSourceRegistry;
    private final ObjectMapper objectMapper;
    private final CodeListRepository codeListRepository;

    // ── TABLE_METADATA ────────────────────────────────────────────────────────

    public TableMetadata saveTableMetadata(TableMetadataRequest request, String tenantId) {
        JdbcTemplate jdbc = tenantDataSourceRegistry.getJdbcTemplate(tenantId);

        // Validate parent exists if specified
        if (request.getParentTableId() != null && !request.getParentTableId().isBlank()) {
            metadataRepository.findTable(request.getModuleId(), request.getParentTableId(), jdbc)
                    .orElseThrow(() -> new ResourceNotFoundException(
                            "Parent table not found: " + request.getParentTableId()));
        }

        TableMetadata t = toTableMetadata(request);
        boolean exists = metadataRepository.findTable(request.getModuleId(), request.getTableId(), jdbc).isPresent();
        if (exists) {
            metadataRepository.updateTable(t, jdbc);
        } else {
            metadataRepository.insertTable(t, jdbc);
        }

        metadataCache.evictModuleMetadata(tenantId, request.getModuleId());
        return metadataRepository.findTable(request.getModuleId(), request.getTableId(), jdbc).orElseThrow();
    }

    public List<TableMetadata> getTableMetadata(String moduleId, String tenantId) {
        return metadataRepository.findTablesByModule(moduleId,
                tenantDataSourceRegistry.getJdbcTemplate(tenantId));
    }

    public void deleteTableMetadata(String moduleId, String tableId, String tenantId) {
        JdbcTemplate jdbc = tenantDataSourceRegistry.getJdbcTemplate(tenantId);
        metadataRepository.findTable(moduleId, tableId, jdbc)
                .orElseThrow(() -> new ResourceNotFoundException("Table metadata not found: " + tableId));
        metadataRepository.deleteTable(moduleId, tableId, jdbc);
        metadataCache.evictModuleMetadata(tenantId, moduleId);
    }

    // ── TABLE_COLUMN_METADATA ─────────────────────────────────────────────────

    public ColumnMetadata saveColumnMetadata(ColumnMetadataRequest request, String tenantId) {
        JdbcTemplate jdbc = tenantDataSourceRegistry.getJdbcTemplate(tenantId);

        // Validate parent table exists
        metadataRepository.findTable(request.getModuleId(), request.getTableId(), jdbc)
                .orElseThrow(() -> new ResourceNotFoundException(
                        "Table not found: " + request.getTableId() + " for module: " + request.getModuleId()));

        // Validate FIELD_PATH format if provided
        if (request.getFieldPath() != null) {
            validateFieldPath(request.getFieldPath());
        }

        ColumnMetadata c = toColumnMetadata(request);
        boolean exists = metadataRepository.findColumn(
                request.getModuleId(), request.getTableId(), request.getFieldId(), jdbc).isPresent();
        if (exists) {
            metadataRepository.updateColumn(c, jdbc);
        } else {
            metadataRepository.insertColumn(c, jdbc);
        }

        metadataCache.evictModuleMetadata(tenantId, request.getModuleId());
        return metadataRepository.findColumn(
                request.getModuleId(), request.getTableId(), request.getFieldId(), jdbc).orElseThrow();
    }

    public List<ColumnMetadata> getColumnMetadata(String moduleId, String tableId, String tenantId) {
        return metadataRepository.findColumnsByTable(moduleId, tableId,
                tenantDataSourceRegistry.getJdbcTemplate(tenantId));
    }

    public void deleteColumnMetadata(String moduleId, String tableId, String fieldId, String tenantId) {
        JdbcTemplate jdbc = tenantDataSourceRegistry.getJdbcTemplate(tenantId);
        metadataRepository.findColumn(moduleId, tableId, fieldId, jdbc)
                .orElseThrow(() -> new ResourceNotFoundException("Column metadata not found: " + fieldId));
        metadataRepository.deleteColumn(moduleId, tableId, fieldId, jdbc);
        metadataCache.evictModuleMetadata(tenantId, moduleId);
    }

    // ── UI_METADATA ───────────────────────────────────────────────────────────

    public UiMetadata saveUiMetadata(UiMetadataRequest request, String tenantId) {
        JdbcTemplate jdbc = tenantDataSourceRegistry.getJdbcTemplate(tenantId);
        if (request.getMetadataJson() == null && request.getS3Path() == null) {
            throw new AppException("METADATA_REQUIRED",
                    "Either metadataJson or s3Path must be provided", HttpStatus.BAD_REQUEST);
        }
        UiMetadata ui = UiMetadata.builder()
                .moduleId(request.getModuleId())
                .name(request.getName())
                .type(request.getType())
                .metadataJson(request.getMetadataJson())
                .s3Path(request.getS3Path())
                .build();
        metadataRepository.upsertUiMetadata(ui, jdbc);
        return metadataRepository.findUiMetadata(request.getModuleId(), request.getType(), jdbc).orElseThrow();
    }

    public UiMetadata getUiMetadata(String moduleId, String type, String tenantId) {
        return metadataRepository.findUiMetadata(moduleId, type,
                        tenantDataSourceRegistry.getJdbcTemplate(tenantId))
                .orElseThrow(() -> new ResourceNotFoundException(
                        "UI metadata not found for module=" + moduleId + ", type=" + type));
    }

    public List<UiMetadata> getAllUiMetadata(String moduleId, String tenantId) {
        return metadataRepository.findAllUiMetadata(moduleId,
                tenantDataSourceRegistry.getJdbcTemplate(tenantId));
    }

    /**
     * Returns a structured bundle of all UI metadata for a module:
     * {
     *   "formMetadata": { "module": "<moduleId>", "FORMS": { "<name>": <json>, ... } },
     *   "listingMetadata": <json>,
     *   "lookupMetadata": <json>,
     *   "i18nTrans": <json>
     * }
     */
    public UiMetadataBundle getUiMetadataBundle(String moduleId, String tenantId) {

        return metadataCache.getUiMetadataBundle(tenantId, moduleId).orElseGet(() -> {

            List<UiMetadata> all = metadataRepository.findAllUiMetadata(moduleId,
                    tenantDataSourceRegistry.getJdbcTemplate(tenantId));

            // FORM — multiple entries keyed by NAME
            Map<String, Object> formsMap = new LinkedHashMap<>();
            for (UiMetadata ui : all) {
                if ("FORM".equals(ui.getType())) {
                    formsMap.put(ui.getName(), parseJson(ui.getMetadataJson(), moduleId, "FORM"));
                }
            }
            Map<String, Object> formMetadata = new LinkedHashMap<>();
            formMetadata.put("module", moduleId);
            formMetadata.put("FORMS", formsMap);

            // LISTING, LOOKUP, I18N — single entries
            JsonNode listingMd = all.stream()
                    .filter(u -> "LISTING".equals(u.getType())).findFirst()
                    .map(u -> parseJson(u.getMetadataJson(), moduleId, "LISTING"))
                    .orElse(null);

            JsonNode lkpMd = all.stream()
                    .filter(u -> "LOOKUP".equals(u.getType())).findFirst()
                    .map(u -> parseJson(u.getMetadataJson(), moduleId, "LOOKUP"))
                    .orElse(null);

            JsonNode i18nTrans = all.stream()
                    .filter(u -> "I18N".equals(u.getType())).findFirst()
                    .map(u -> parseJson(u.getMetadataJson(), moduleId, "I18N"))
                    .orElse(null);

            ModuleMetadata metadata = loadModuleMetadata(moduleId, tenantId);

            return UiMetadataBundle.builder()
                    .formMetadata(formMetadata)
                    .listingMetadata(listingMd)
                    .lookupMetadata(lkpMd)
                    .i18nTrans(i18nTrans)
                    .fields(metadata.getColumns()).build();
        });

    }

    /**
     * Returns the full UI metadata bundle for a module combined with the complete
     * codelist registry in a single response — avoids two round-trips from the client.
     *
     * Response shape:
     * {
     *   "formMetadata":    { "module": "<moduleId>", "FORMS": { ... } },
     *   "listingMetadata": { ... },
     *   "lookupMetadata":  { ... },
     *   "i18nTrans":       { ... },
     *   "codelists": {
     *     "ICSR_SEX":       [ { "code": "male", "decode": "Male", "translations": {...} }, ... ],
     *     "ICSR_DOSE_UNIT": [ ... ],
     *     ...
     *   }
     * }
     */
    public UiMetadataBundle getUiMetadataWithCodelists(String moduleId, String tenantId) {
        UiMetadataBundle bundle = getUiMetadataBundle(moduleId, tenantId);
        bundle.setCodelists(getCodelistRegistry(tenantId));
        return bundle;
    }

    /**
     * Returns all active codelists grouped by CODE_LIST_ID in the UI registry format:
     * {
     *   "ICSR_SEX": [ { "code": "male", "decode": "Male", "translations": {...} }, ... ],
     *   "ICSR_DOSE_UNIT": [ ... ],
     *   ...
     * }
     */
    public Map<String, List<Map<String, Object>>> getCodelistRegistry(String tenantId) {
        JdbcTemplate jdbc = tenantDataSourceRegistry.getJdbcTemplate(tenantId);
        List<CodeListValue> all = codeListRepository.findAllActiveValues(jdbc);

        Map<String, List<Map<String, Object>>> registry = new java.util.LinkedHashMap<>();
        for (CodeListValue v : all) {
            registry.computeIfAbsent(v.getCodeListId(), k -> new java.util.ArrayList<>())
                    .add(Map.of(
                            "code",         v.getCode(),
                            "decode",       v.getDecode(),
                            "translations", v.getTranslations() != null ? v.getTranslations() : Map.of()
                    ));
        }
        return registry;
    }
    private JsonNode parseJson(String json, String moduleId, String type) {
        if (json == null || json.isBlank()) return null;
        try {
            return objectMapper.readTree(json);
        } catch (Exception e) {
            log.warn("Failed to parse UI metadata JSON for module={}, type={}", moduleId, type, e);
            return null;
        }
    }

    public void deleteUiMetadata(String moduleId, String type, String tenantId) {
        JdbcTemplate jdbc = tenantDataSourceRegistry.getJdbcTemplate(tenantId);
        metadataRepository.findUiMetadata(moduleId, type, jdbc)
                .orElseThrow(() -> new ResourceNotFoundException(
                        "UI metadata not found for module=" + moduleId + ", type=" + type));
        metadataRepository.deleteUiMetadata(moduleId, type, jdbc);
    }

    /**
     * Returns a flat key→value map for the requested locale from an I18N type UI_METADATA entry.
     * The METADATA_JSON structure is: { "en": { "key": "value", ... }, "fr": { ... } }
     */
    public Map<String, String> getI18n(String moduleId, String locale, String tenantId) {
        UiMetadata ui = getUiMetadata(moduleId, "I18N", tenantId);
        if (ui.getMetadataJson() == null || ui.getMetadataJson().isBlank()) {
            return Map.of();
        }
        try {
            Map<String, Map<String, String>> allLocales = objectMapper.readValue(
                    ui.getMetadataJson(), new TypeReference<>() {});
            Map<String, String> localeMap = allLocales.get(locale);
            if (localeMap == null) {
                // Fall back to "en" if requested locale not found
                localeMap = allLocales.get("en");
            }
            return localeMap != null ? localeMap : Map.of();
        } catch (Exception e) {
            log.warn("Failed to parse I18N metadata JSON for module={}, locale={}", moduleId, locale, e);
            return Map.of();
        }
    }

    // ── Module Metadata Aggregate (used by Dynamic Engine) ───────────────────

    /**
     * Loads full module metadata (tables + columns) from cache or DB.
     * Builds indexes for fast lookup by the engine.
     */
    public ModuleMetadata loadModuleMetadata(String moduleId, String tenantId) {
        return metadataCache.getModuleMetadata(tenantId, moduleId).orElseGet(() -> {
            JdbcTemplate jdbc = tenantDataSourceRegistry.getJdbcTemplate(tenantId);

            List<TableMetadata> tables = metadataRepository.findTablesByModule(moduleId, jdbc);
            List<ColumnMetadata> columns = metadataRepository.findColumnsByModule(moduleId, jdbc);

            if (tables.isEmpty()) {
                throw new ResourceNotFoundException("No table metadata found for module: " + moduleId);
            }

            Map<String, TableMetadata> tableIndex = tables.stream()
                    .collect(Collectors.toMap(TableMetadata::getTableId, t -> t));

            Map<String, List<ColumnMetadata>> columnIndex = columns.stream()
                    .collect(Collectors.groupingBy(ColumnMetadata::getTableId));

            Map<String, List<TableMetadata>> tableIndexByParent = tables.stream()
                    .filter(t -> t.getParentTableId() != null && !t.getParentTableId().isBlank())
                    .collect(Collectors.groupingBy(TableMetadata::getParentTableId));

            ModuleMetadata metadata = ModuleMetadata.builder()
                    .moduleId(moduleId)
                    .tables(tables)
                    .columns(columns)
                    .tableIndex(tableIndex)
                    .columnIndex(columnIndex)
                    .tableIndexByParent(tableIndexByParent)
                    .build();

            metadataCache.putModuleMetadata(tenantId, moduleId, metadata);
            log.debug("Loaded and cached module metadata: tenant={}, module={}", tenantId, moduleId);
            return metadata;
        });
    }

    // ── Validation ────────────────────────────────────────────────────────────

    /**
     * Validates FIELD_PATH format:
     * - Segments separated by dots
     * - $ suffix only on intermediate or leaf segments (not the first)
     * - No empty segments
     * Examples: "aerInfo.patient.patName", "aerInfo.reactions$.reportedTerm"
     */
    private void validateFieldPath(String fieldPath) {
        if (fieldPath == null || fieldPath.isBlank()) return;
        String[] segments = fieldPath.split("\\.");
        for (String segment : segments) {
            String name = segment.endsWith("$") ? segment.substring(0, segment.length() - 1) : segment;
            if (name.isBlank()) {
                throw new AppException("INVALID_FIELD_PATH",
                        "FIELD_PATH contains empty segment: " + fieldPath, HttpStatus.BAD_REQUEST);
            }
        }
    }

    // ── Mappers ───────────────────────────────────────────────────────────────

    private TableMetadata toTableMetadata(TableMetadataRequest r) {
        return TableMetadata.builder()
                .moduleId(r.getModuleId()).tableId(r.getTableId())
                .parentTableId(r.getParentTableId()).dbTableName(r.getDbTableName())
                .contextName(r.getContextName()).joinColumn(r.getJoinColumn())
                .refJoinColumn(r.getRefJoinColumn())
                .multiContext(r.getMultiContext() != null ? r.getMultiContext() : "N")
                .contextPath(r.getContextPath())
                .build();
    }

    private ColumnMetadata toColumnMetadata(ColumnMetadataRequest r) {
        return ColumnMetadata.builder()
                .moduleId(r.getModuleId()).tableId(r.getTableId()).fieldId(r.getFieldId())
                .columnName(r.getColumnName()).fieldName(r.getContextName())
                .fieldPath(r.getFieldPath()).dataType(r.getDataType())
                .maxLength(r.getMaxLength())
                .requiredField(r.getRequiredField() != null ? r.getRequiredField() : "N")
                .listingAlias(r.getListingAlias())
                .build();
    }
}
