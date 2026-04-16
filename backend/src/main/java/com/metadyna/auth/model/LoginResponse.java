package com.metadyna.auth.model;

import com.fasterxml.jackson.databind.JsonNode;
import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class LoginResponse {
    private String jwt;
    private String tokenType;
    private int expiresInMinutes;
    private JsonNode menuMetadata;
}
