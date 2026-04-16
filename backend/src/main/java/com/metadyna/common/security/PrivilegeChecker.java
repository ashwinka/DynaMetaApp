package com.metadyna.common.security;

import com.metadyna.auth.model.JwtClaims;
import com.metadyna.common.exception.AppException;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

/**
 * Reads the authenticated user's JwtClaims from the Spring Security context
 * and enforces module-level read/write privilege checks.
 *
 * Usage:
 *   privilegeChecker.requireRead(moduleId);   // throws 403 if no read access
 *   privilegeChecker.requireWrite(moduleId);  // throws 403 if no write access
 */
@Component
public class PrivilegeChecker {

    /**
     * Asserts the current user has READ access to the given moduleId.
     *
     * @throws AppException HTTP 403 if no read privilege exists for the module
     */
    public void requireRead(String moduleId) {
        JwtClaims claims = extractClaims();
        boolean hasRead = claims.getPrivileges().stream()
                .anyMatch(p -> ("*".equals(p.getModuleId()) || moduleId.equals(p.getModuleId())) && p.isRead());
        if (!hasRead) {
            throw new AppException("ACCESS_DENIED",
                    "Read access denied for module: " + moduleId,
                    HttpStatus.FORBIDDEN);
        }
    }

    /**
     * Asserts the current user has WRITE access to the given moduleId.
     *
     * @throws AppException HTTP 403 if no write privilege exists for the module
     */
    public void requireWrite(String moduleId) {
        JwtClaims claims = extractClaims();
        boolean hasWrite = claims.getPrivileges().stream()
                .anyMatch(p -> ("*".equals(p.getModuleId()) || moduleId.equals(p.getModuleId())) && p.isWrite());
        if (!hasWrite) {
            throw new AppException("ACCESS_DENIED",
                    "Write access denied for module: " + moduleId,
                    HttpStatus.FORBIDDEN);
        }
    }

    /**
     * Returns the JwtClaims for the current authenticated user.
     * Throws 401 if no authentication is present (should not happen behind the JWT filter).
     */
    public JwtClaims currentClaims() {
        return extractClaims();
    }

    // ── Internal ──────────────────────────────────────────────────────────────

    private JwtClaims extractClaims() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth == null || !(auth.getPrincipal() instanceof JwtClaims claims)) {
            throw new AppException("UNAUTHORIZED", "Authentication required", HttpStatus.UNAUTHORIZED);
        }
        return claims;
    }
}
