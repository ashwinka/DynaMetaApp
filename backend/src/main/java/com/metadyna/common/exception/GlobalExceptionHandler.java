package com.metadyna.common.exception;

import com.metadyna.common.model.ApiResponse;
import com.metadyna.common.model.ErrorDetail;
import com.metadyna.common.util.CorrelationIdHolder;
import com.metadyna.common.exception.AuthException;
import com.metadyna.common.exception.TenantNotFoundException;
import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.List;

@Slf4j
@RestControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<ApiResponse<List<ErrorDetail>>> handleValidation(
            MethodArgumentNotValidException ex, HttpServletRequest request) {

        List<ErrorDetail> errors = ex.getBindingResult().getFieldErrors().stream()
                .map(FieldError::getField)
                .map(f -> {
                    FieldError fe = ex.getBindingResult().getFieldError(f);
                    return new ErrorDetail(f, fe != null ? fe.getDefaultMessage() : "Invalid value");
                })
                .toList();

        return ResponseEntity.badRequest()
                .body(ApiResponse.error("VALIDATION_ERROR",
                        "Request validation failed",
                        request.getRequestURI(),
                        CorrelationIdHolder.get()));
    }

    @ExceptionHandler(AuthException.class)
    public ResponseEntity<ApiResponse<Void>> handleAuthException(
            AuthException ex, HttpServletRequest request) {
        log.warn("Auth failure [{}]: {}", ex.getErrorCode(), ex.getMessage());
        return ResponseEntity.status(ex.getHttpStatus())
                .body(ApiResponse.error(ex.getErrorCode(),
                        ex.getMessage(),
                        request.getRequestURI(),
                        CorrelationIdHolder.get()));
    }

    @ExceptionHandler(TenantNotFoundException.class)
    public ResponseEntity<ApiResponse<Void>> handleTenantNotFound(
            TenantNotFoundException ex, HttpServletRequest request) {
        log.warn("Tenant resolution failure [{}]: {}", ex.getErrorCode(), ex.getMessage());
        return ResponseEntity.status(ex.getHttpStatus())
                .body(ApiResponse.error(ex.getErrorCode(),
                        ex.getMessage(),
                        request.getRequestURI(),
                        CorrelationIdHolder.get()));
    }

    @ExceptionHandler(AppException.class)
    public ResponseEntity<ApiResponse<Void>> handleAppException(
            AppException ex, HttpServletRequest request) {

        if (ex.getHttpStatus().is5xxServerError()) {
            log.error("Application error [{}]: {}", ex.getErrorCode(), ex.getMessage(), ex);
        }

        return ResponseEntity.status(ex.getHttpStatus())
                .body(ApiResponse.error(ex.getErrorCode(),
                        ex.getMessage(),
                        request.getRequestURI(),
                        CorrelationIdHolder.get()));
    }

    @ExceptionHandler(Exception.class)
    public ResponseEntity<ApiResponse<Void>> handleGeneric(
            Exception ex, HttpServletRequest request) {

        log.error("Unhandled exception at [{}]: {}", request.getRequestURI(), ex.getMessage(), ex);

        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                .body(ApiResponse.error("INTERNAL_ERROR",
                        "An unexpected error occurred",
                        request.getRequestURI(),
                        CorrelationIdHolder.get()));
    }
}
