package com.metadyna.tenant.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class TenantInfo {
    private String id;
    private String tenantId;
    private String tenantName;
    private String dbUrl;
    private String dbUsername;
    private String dbPassword;   // stored encrypted in DB; decrypted in memory only
    private String isActive;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}
