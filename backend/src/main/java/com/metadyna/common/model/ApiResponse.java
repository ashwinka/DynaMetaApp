package com.metadyna.common.model;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Getter;

import java.time.Instant;

@Getter
@JsonInclude(JsonInclude.Include.NON_NULL)
public class ApiResponse<T> {

    private final boolean success;
    private final T data;
    private final String errorCode;
    private final String message;
    private final String timestamp;
    private final String path;
    private final String correlationId;

    private ApiResponse(boolean success, T data, String errorCode,
                        String message, String path, String correlationId) {
        this.success = success;
        this.data = data;
        this.errorCode = errorCode;
        this.message = message;
        this.timestamp = Instant.now().toString();
        this.path = path;
        this.correlationId = correlationId;
    }

    public static <T> ApiResponse<T> ok(T data, String correlationId) {
        return new ApiResponse<>(true, data, null, null, null, correlationId);
    }

    public static <T> ApiResponse<T> error(String errorCode, String message,
                                            String path, String correlationId) {
        return new ApiResponse<>(false, null, errorCode, message, path, correlationId);
    }
}
