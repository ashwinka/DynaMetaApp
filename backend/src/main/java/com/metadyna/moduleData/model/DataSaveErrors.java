package com.metadyna.moduleData.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Map;

@Getter
@Setter
@NoArgsConstructor
public class DataSaveErrors {
    String fieldId;
    String message;
    String severity;
    String ruleId;
    Map<String, String> ctxIds;

}
