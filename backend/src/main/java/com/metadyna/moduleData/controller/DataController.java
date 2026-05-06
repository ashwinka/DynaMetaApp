package com.metadyna.moduleData.controller;

import com.metadyna.common.model.ApiResponse;
import com.metadyna.common.model.PageResponse;
import com.metadyna.common.security.PrivilegeChecker;
import com.metadyna.moduleData.model.DataSaveResponse;
import com.metadyna.moduleData.model.PatchRequest;
import com.metadyna.moduleData.model.SearchCriteria;
import org.springframework.web.bind.annotation.RequestBody;
import com.metadyna.moduleData.service.DataService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api/modules/{moduleId}/records")
@RequiredArgsConstructor
@Tag(name = "Dynamic Data Engine", description = "Metadata-driven CRUD for all module data")
public class DataController {

    private final DataService dataService;
    private final PrivilegeChecker privilegeChecker;

    // ── Listing ───────────────────────────────────────────────────────────────

    @PostMapping("/listing")
    @Operation(summary = "List records with listingColumns, conditions, sort, and pagination")
    public ResponseEntity<ApiResponse<PageResponse<Map<String, Object>>>> getModuleListingScreenRecords(
            @RequestHeader("X-Tenant-ID") String tenantId,
            @PathVariable String moduleId,
            @RequestBody(required = false) SearchCriteria criteria) {

        privilegeChecker.requireRead(moduleId);
        if (criteria == null) criteria = new SearchCriteria();
        return ResponseEntity.ok(ApiResponse.ok(dataService.getModuleDataRecordsForListing(moduleId, criteria, tenantId), null));
    }

    // ── Single Record Fetch ───────────────────────────────────────────────────

    @GetMapping("/edit/{id}")
    @Operation(summary = "Fetch a single record as full hierarchical JSON")
    public ResponseEntity<ApiResponse<Map<String, Object>>> getModuleEditScreenDataRecord(
            @RequestHeader("X-Tenant-ID") String tenantId,
            @PathVariable String moduleId,
            @PathVariable String id) {

        privilegeChecker.requireRead(moduleId);
        return ResponseEntity.ok(ApiResponse.ok(dataService.getModuleDataRecordById(moduleId, id, tenantId), null));
    }

    // ── Save (POST) ───────────────────────────────────────────────────────────

    @PostMapping("/create")
    @Operation(summary = "Save a new record (full JSON payload)")
    public ResponseEntity<ApiResponse<DataSaveResponse>> saveRecord(
            @RequestHeader("X-Tenant-ID") String tenantId,
            @PathVariable String moduleId,
            @RequestBody Map<String, Object> payload) {

        privilegeChecker.requireWrite(moduleId);
        return ResponseEntity.ok(ApiResponse.ok(dataService.createModuleDataRecord(moduleId, payload, tenantId), null));
    }

    // ── Full Update (PUT) ─────────────────────────────────────────────────────

    @PutMapping("/save/{id}")
    @Operation(summary = "Full update of an existing record (saveObject strategy)")
    public ResponseEntity<ApiResponse<DataSaveResponse>> updateRecord(
            @RequestHeader("X-Tenant-ID") String tenantId,
            @PathVariable String moduleId,
            @PathVariable String id,
            @RequestBody Map<String, Object> payload) {

        privilegeChecker.requireWrite(moduleId);
        return ResponseEntity.ok(ApiResponse.ok(dataService.saveModuleDataRecord(moduleId, id, payload, tenantId), null));
    }

    // ── Delta Update (PATCH) ──────────────────────────────────────────────────

    @PatchMapping("/patch/{id}")
    @Operation(summary = "Delta update — updatedJson for changes, deletedRec for removals")
    public ResponseEntity<ApiResponse<DataSaveResponse>> patchRecord(
            @RequestHeader("X-Tenant-ID") String tenantId,
            @PathVariable String moduleId,
            @PathVariable String id,
            @RequestBody PatchRequest request) {

        privilegeChecker.requireWrite(moduleId);
        return ResponseEntity.ok(ApiResponse.ok(
                dataService.patchModuleDataRecord(moduleId, id, request.getUpdatedJson(), request.getDeletedRec(), tenantId),
                null));
    }

    // ── Delete ────────────────────────────────────────────────────────────────

    @DeleteMapping("/{id}")
    @Operation(summary = "Delete a record and all its child records (cascade)")
    public ResponseEntity<ApiResponse<Void>> deleteRecord(
            @RequestHeader("X-Tenant-ID") String tenantId,
            @PathVariable String moduleId,
            @PathVariable String id) {

        privilegeChecker.requireWrite(moduleId);
        dataService.deleteModuleDataRecord(moduleId, id, tenantId);
        return ResponseEntity.ok(ApiResponse.ok(null, null));
    }
}
