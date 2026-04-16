package com.metadyna.auth.model;

import lombok.Builder;
import lombok.Getter;

import java.util.List;

@Getter
@Builder
public class AppUser {
    private String id;
    private String userName;
    private String fullName;
    private String emailId;
    private String passwordHash;
    private List<String> roles;   // parsed from ROLES JSON array column
    private String isActive;
}
