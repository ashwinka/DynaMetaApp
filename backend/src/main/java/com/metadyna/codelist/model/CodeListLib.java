package com.metadyna.codelist.model;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class CodeListLib {
    private String id;
    private String codeListId;
    private String description;
    private String isActive;
    private String createdAt;
    private String updatedAt;
}
