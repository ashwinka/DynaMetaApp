package com.metadyna.auth.controller;

import com.metadyna.auth.model.LoginRequest;
import com.metadyna.auth.model.LoginResponse;
import com.metadyna.auth.service.AuthService;
import com.metadyna.common.exception.AuthException;
import com.metadyna.common.model.ApiResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

/**
 * Authentication endpoints — no JWT required.
 * X-Tenant-ID header is mandatory for all requests.
 */
@Slf4j
@RestController
@RequestMapping("/auth")
@RequiredArgsConstructor
@Tag(name = "Authentication", description = "Login and token management")
public class AuthController {

    private final AuthService authService;

    /**
     * POST /auth/login
     * Accepts Basic Auth credentials, returns JWT + menu metadata.
     */
    @PostMapping("/login")
    @Operation(summary = "Authenticate user and obtain JWT token")
    public ResponseEntity<ApiResponse<LoginResponse>> login(
            @RequestHeader("X-Tenant-ID") String tenantId,
            @Valid @RequestBody LoginRequest request) {

        if (tenantId == null || tenantId.isBlank()) {
            throw new AuthException("MISSING_TENANT", "X-Tenant-ID header is required");
        }

        LoginResponse response = authService.login(request, tenantId);
        return ResponseEntity.ok(ApiResponse.ok(response, null));
    }
}
