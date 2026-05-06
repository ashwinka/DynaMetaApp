package com.metadyna.moduleData.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Getter
@Setter
@NoArgsConstructor
public class DataSaveResponse {
    private Map<String, Object> dataRecord;
    private Map<String, Object> editDataRecord;
    private List<DataSaveErrors> errors = new ArrayList<>();
}
