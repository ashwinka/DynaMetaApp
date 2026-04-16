-- ============================================================
-- MetaDyna API — Master Tenant Schema
-- Script  : 01_ddl_master_tenant.sql
-- Purpose : CREATE TABLE statements for the master tenant DB
-- Run on  : Fresh master tenant database setup only
-- ============================================================

-- Tenant registry — stores all child tenant connection details
CREATE TABLE IF NOT EXISTS TENANT_INFO (
    ID              VARCHAR(36)     NOT NULL PRIMARY KEY,
    TENANT_ID       VARCHAR(300)    NOT NULL UNIQUE,
    TENANT_NAME     VARCHAR(300)    NOT NULL,
    DB_URL          VARCHAR(300)    NOT NULL,
    DB_USERNAME     VARCHAR(300)    NOT NULL,
    DB_PASSWORD     VARCHAR(300)    NOT NULL,   -- stored encrypted
    IS_ACTIVE       CHAR(1)         NOT NULL DEFAULT 'Y' CHECK (IS_ACTIVE IN ('Y','N')),
    CREATED_AT      TIMESTAMP       NOT NULL DEFAULT NOW(),
    UPDATED_AT      TIMESTAMP       NOT NULL DEFAULT NOW()
);
