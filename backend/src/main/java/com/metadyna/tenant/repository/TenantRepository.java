package com.metadyna.tenant.repository;

import com.metadyna.tenant.model.TenantInfo;
import lombok.RequiredArgsConstructor;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
@RequiredArgsConstructor
public class TenantRepository {

    // Master tenant JdbcTemplate — injected from primary DataSource (application.yml)
    private final JdbcTemplate jdbcTemplate;

    /**
     * Exposes the primary (master) JdbcTemplate for use by TenantDataSourceRegistry
     * when routing MASTER tenant requests.
     */
    public JdbcTemplate getMasterJdbcTemplate() {
        return jdbcTemplate;
    }

    private static final RowMapper<TenantInfo> ROW_MAPPER = (rs, rowNum) -> TenantInfo.builder()
            .id(rs.getString("ID"))
            .tenantId(rs.getString("TENANT_ID"))
            .tenantName(rs.getString("TENANT_NAME"))
            .dbUrl(rs.getString("DB_URL"))
            .dbUsername(rs.getString("DB_USERNAME"))
            .dbPassword(rs.getString("DB_PASSWORD"))
            .isActive(rs.getString("IS_ACTIVE"))
            .createdAt(rs.getTimestamp("CREATED_AT") != null
                    ? rs.getTimestamp("CREATED_AT").toLocalDateTime() : null)
            .updatedAt(rs.getTimestamp("UPDATED_AT") != null
                    ? rs.getTimestamp("UPDATED_AT").toLocalDateTime() : null)
            .build();

    public Optional<TenantInfo> findByTenantId(String tenantId) {
        List<TenantInfo> results = jdbcTemplate.query(
                "SELECT * FROM TENANT_INFO WHERE TENANT_ID = ?",
                ROW_MAPPER, tenantId);
        return results.stream().findFirst();
    }
}
