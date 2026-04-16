package com.metadyna.auth.service;

import com.metadyna.auth.jwt.JwtTokenProvider;
import com.metadyna.auth.model.AppUser;
import com.metadyna.auth.model.JwtClaims;
import com.metadyna.auth.model.LoginRequest;
import com.metadyna.auth.model.LoginResponse;
import com.metadyna.auth.repository.AuthRepository;
import com.metadyna.common.exception.AuthException;
import com.metadyna.module.MenuBuilder;
import com.metadyna.tenant.service.TenantDataSourceRegistry;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Orchestrates the login flow:
 * 1. Resolve tenant JdbcTemplate
 * 2. Authenticate user credentials
 * 3. Load and aggregate role privileges
 * 4. Generate JWT
 * 5. Build menu metadata
 * 6. Return LoginResponse
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class AuthService {

    private final AuthRepository authRepository;
    private final JwtTokenProvider jwtTokenProvider;
    private final PasswordEncoder passwordEncoder;
    private final MenuBuilder menuBuilder;
    private final TenantDataSourceRegistry tenantDataSourceRegistry;

    public LoginResponse login(LoginRequest request, String tenantId) {
        // Get tenant-scoped JdbcTemplate
        JdbcTemplate jdbc = tenantDataSourceRegistry.getJdbcTemplate(tenantId);

        // 1. Find user
        AppUser user = authRepository.findUserByUsername(request.getUsername(), jdbc)
                .orElseThrow(() -> new AuthException("Invalid username or password"));

        // 2. Check active status
        if (!"Y".equals(user.getIsActive())) {
            throw new AuthException("USER_INACTIVE", "User account is inactive");
        }

        // 3. Verify password
        /*if (!passwordEncoder.matches(request.getPassword(), user.getPasswordHash())) {
            throw new AuthException("Invalid username or password");
        }*/
        if (!user.getPasswordHash().equals(request.getPassword())) {
            throw new AuthException("Invalid username or password");
        }
        // 4. Load privileges from all assigned roles
        List<JwtClaims.Privilege> privileges = authRepository.loadRolePrivileges(user.getRoles(), jdbc);

        // 5. Build JWT claims
        JwtClaims claims = JwtClaims.builder()
                .username(user.getUserName())
                .tenantId(tenantId)
                .roles(user.getRoles())
                .privileges(privileges)
                .build();

        // 6. Generate token
        String token = jwtTokenProvider.generateToken(claims);

        // 7. Build menu metadata filtered by user privileges
        var menuMetadata = menuBuilder.buildMenu(privileges, jdbc, tenantId);

        log.info("User '{}' logged in successfully for tenant '{}'", user.getUserName(), tenantId);

        return LoginResponse.builder()
                .jwt(token)
                .tokenType("Bearer")
                .expiresInMinutes(60)
                .menuMetadata(menuMetadata)
                .build();
    }
}
