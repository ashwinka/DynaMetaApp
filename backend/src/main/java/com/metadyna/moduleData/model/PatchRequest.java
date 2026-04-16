package com.metadyna.moduleData.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Map;

/**
 * Request body for PATCH (delta update).
 * - updatedJson: nodes to INSERT or UPDATE
 * - deletedRec:  nodes to DELETE (each leaf with an "id" is deleted)
 */
@Getter
@Setter
@NoArgsConstructor
public class PatchRequest {
    private Map<String, Object> updatedJson;
    private Map<String, Object> deletedRec;
}
