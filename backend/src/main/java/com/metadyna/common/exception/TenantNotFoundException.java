package com.metadyna.common.exception;

import org.springframework.http.HttpStatus;

/**
 * Thrown when the X-Tenant-ID header references an unknown or inactive tenant.
 * Maps to HTTP 403 Forbidden.
 */
public class TenantNotFoundException extends AppException {

    public TenantNotFoundException(String tenantId) {
        super("TENANT_NOT_FOUND", "Tenant not found or inactive: " + tenantId, HttpStatus.FORBIDDEN);
    }
}
