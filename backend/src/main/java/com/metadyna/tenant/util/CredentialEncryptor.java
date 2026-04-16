package com.metadyna.tenant.util;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import java.util.Base64;

/**
 * AES-128 symmetric encryption for tenant DB credentials stored in TENANT_INFO.
 * Key must be exactly 16 characters, set via CREDENTIAL_ENCRYPTION_KEY env var.
 */
@Component
public class CredentialEncryptor {

    private static final String ALGORITHM = "AES";

    private final SecretKeySpec secretKey;

    public CredentialEncryptor(
            @Value("${app.credential-encryption-key:changeme1234abcd}") String key) {
        // AES-128 requires exactly 16 bytes — pad with zeros if shorter, truncate if longer
        if (key.length() < 16) {
            key = String.format("%-16s", key).replace(' ', '0');
        }
        byte[] keyBytes = key.substring(0, 16).getBytes();
        this.secretKey = new SecretKeySpec(keyBytes, ALGORITHM);
    }

    public String encrypt(String plainText) {
        try {
            Cipher cipher = Cipher.getInstance(ALGORITHM);
            cipher.init(Cipher.ENCRYPT_MODE, secretKey);
            return Base64.getEncoder().encodeToString(cipher.doFinal(plainText.getBytes()));
        } catch (Exception e) {
            throw new IllegalStateException("Failed to encrypt credential", e);
        }
    }

    public String decrypt(String encryptedText) {
        try {
            Cipher cipher = Cipher.getInstance(ALGORITHM);
            cipher.init(Cipher.DECRYPT_MODE, secretKey);
            return new String(cipher.doFinal(Base64.getDecoder().decode(encryptedText)));
        } catch (Exception e) {
            throw new IllegalStateException("Failed to decrypt credential", e);
        }
    }
}
