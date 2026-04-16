package com.metadyna.auth.model;

import lombok.Builder;
import lombok.Getter;

import java.util.List;

@Getter
@Builder
public class JwtClaims {
    private String username;
    private String tenantId;
    private List<String> roles;
    private List<Privilege> privileges;

    @Getter
    @Builder
    public static class Privilege {
        private String moduleId;
        private boolean read;
        private boolean write;
    }
}
