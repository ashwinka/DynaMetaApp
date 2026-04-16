package com.metadyna.tenant.service;

import com.metadyna.common.exception.AppException;
import com.metadyna.tenant.model.TenantInfo;
import com.metadyna.tenant.repository.TenantRepository;
import com.metadyna.tenant.util.CredentialEncryptor;
import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import java.util.concurrent.ConcurrentHashMap;

/**
 * Manages a per-tenant HikariCP DataSource pool.
 * DataSources are lazily created on first request and cached for reuse.
 *
 * Special case: tenantId "MASTER" routes to the primary datasource
 * (the master tenant DB itself), bypassing TENANT_INFO lookup.
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class TenantDataSourceRegistry {

    public static final String MASTER_TENANT_ID = "MASTER";

    private final TenantRepository tenantRepository;
    private final CredentialEncryptor credentialEncryptor;

    private final ConcurrentHashMap<String, HikariDataSource> dataSourceMap = new ConcurrentHashMap<>();

    public JdbcTemplate getJdbcTemplate(String tenantId) {
        // Master tenant uses the primary datasource directly
        if (MASTER_TENANT_ID.equalsIgnoreCase(tenantId)) {
            return tenantRepository.getMasterJdbcTemplate();
        }
        HikariDataSource ds = dataSourceMap.computeIfAbsent(tenantId, this::createDataSource);
        return new JdbcTemplate(ds);
    }

    public void evict(String tenantId) {
        HikariDataSource ds = dataSourceMap.remove(tenantId);
        if (ds != null && !ds.isClosed()) {
            ds.close();
            log.info("Evicted DataSource for tenant: {}", tenantId);
        }
    }

    private HikariDataSource createDataSource(String tenantId) {
        TenantInfo tenant = tenantRepository.findByTenantId(tenantId)
                .orElseThrow(() -> new AppException(
                        "TENANT_NOT_FOUND",
                        "Tenant not found: " + tenantId,
                        HttpStatus.FORBIDDEN));

        if (!"Y".equals(tenant.getIsActive())) {
            throw new AppException(
                    "TENANT_INACTIVE",
                    "Tenant is inactive: " + tenantId,
                    HttpStatus.FORBIDDEN);
        }

        HikariConfig config = new HikariConfig();
        config.setPoolName("tenant-pool-" + tenantId);
        config.setJdbcUrl(tenant.getDbUrl());
        config.setUsername(tenant.getDbUsername());
        //config.setPassword(credentialEncryptor.decrypt(tenant.getDbPassword()));
        config.setPassword(tenant.getDbPassword());
        config.setDriverClassName("org.postgresql.Driver");
        config.setMaximumPoolSize(10);
        config.setMinimumIdle(2);
        config.setConnectionTimeout(30_000);
        config.setIdleTimeout(600_000);
        config.setMaxLifetime(1_800_000);

        log.info("Created DataSource for tenant: {}", tenantId);
        return new HikariDataSource(config);
    }
}
