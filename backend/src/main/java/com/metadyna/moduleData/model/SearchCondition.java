package com.metadyna.moduleData.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * A single filter condition in a listing query.
 *
 * fieldId   — dot-notation FIELD_PATH e.g. "aerInfo.patient.patName"
 *             or multi-context path e.g. "aerInfo.reactions$.reportedTerm"
 * operator  — eq | neq | like | in | notin | gt | lt | gte | lte
 * value     — single value, or pipe-separated for "in" operator e.g. "Fever|Cough"
 */
@Getter
@Setter
@NoArgsConstructor
public class SearchCondition {
    private String fieldId;
    private String operator;
    private String value;
}
