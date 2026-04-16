package com.metadyna.moduleData.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

/**
 * Listing screen search criteria — sent as request body to the listing endpoint.
 *
 * listingColumns — array of FIELD_PATH values (dot-notation) to project.
 *                  Only non-multi-context paths are used in Phase 1 query.
 *                  e.g. ["aerInfo.caseID", "aerInfo.patient.patName", "aerInfo.reactions$.reportedTerm"]
 *
 * conditions     — filter conditions; multi-context conditions generate IN subqueries.
 *
 * sortFieldId    — FIELD_PATH of the column to sort by (must be non-multi-context).
 * sortDirection  — ASC | DESC (default ASC)
 * startIndex     — zero-based row offset (default 0)
 * recordsPerPage — page size (default 25)
 */
@Getter
@Setter
@NoArgsConstructor
public class SearchCriteria {

    private List<String> listingColumns;
    private List<SearchCondition> conditions;
    private String sortFieldId;
    private String sortDirection = "ASC";
    private int startIndex = 0;
    private int recordsPerPage = 25;
}
