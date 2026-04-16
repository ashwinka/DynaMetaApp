package com.metadyna.metadata.model;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UiMetadataRequest {

    @NotBlank @Size(max = 300)
    private String moduleId;

    @NotBlank @Size(max = 300)
    private String name;

    @NotBlank
    @Pattern(regexp = "LISTING|FORM|LOOKUP|I18N")
    private String type;

    /** Full JSON string (CLOB). Either metadataJson or s3Path must be provided. */
    private String metadataJson;

    @Size(max = 1000)
    private String s3Path;
}
