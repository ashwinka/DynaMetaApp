package com.metadyna.common.exception;

import lombok.Getter;
import org.springframework.http.HttpStatus;

@Getter
public class ModuleDataException extends RuntimeException {
    private final String errorCode;
    private final HttpStatus httpStatus;

    public ModuleDataException(String errorCode, String message, HttpStatus httpStatus) {
        super(message);
        this.errorCode = errorCode;
        this.httpStatus = httpStatus;
    }
}
