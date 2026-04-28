-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 01_DDL_TABLES.sql
-- Module  : PRODUCTS (Drug Products Library)
-- Purpose : DDL for Drug Products Library tables
-- Run on  : Each child tenant schema on fresh provisioning
-- ============================================================

CREATE TABLE IF NOT EXISTS PRODUCTS (
    ID                          VARCHAR(36)     NOT NULL PRIMARY KEY,
    PRODUCT_ID                  VARCHAR(100)    NOT NULL UNIQUE,
    PREFERRED_DESCRIPTION       VARCHAR(300)    NOT NULL,
    IS_ACTIVE                   CHAR(1)         NOT NULL DEFAULT 'Y' CHECK (IS_ACTIVE IN ('Y','N')),
    PRODUCT_FLAG                VARCHAR(50),                                -- codelist: PRODUCT_FLAG
    PRODUCT_CLASS               VARCHAR(50),                                -- codelist: PRODUCT_CLASS
    ROUTE_OF_ADMIN              VARCHAR(50),                                -- codelist: ROUTE_OF_ADMIN
    ROUTE_OF_ADMIN_TERM_ID      VARCHAR(300),
    FORM_OF_ADMIN               VARCHAR(50),                                -- codelist: FORM_OF_ADMIN
    PHARMA_DOSE_FORM_TERM_ID    VARCHAR(300),
    DESCRIPTION                 VARCHAR(1000),
    MANUFACTURER_ACC_ID         VARCHAR(100),                               -- lookup: ACCOUNTS (stores accId)
    MANUFACTURER_NAME           VARCHAR(300),                               -- display value from lookup
    MANUFACTURER_CODE           VARCHAR(100),                               -- readonly, from lookup
    VIGILANCE_TYPE              VARCHAR(50),                                -- codelist: VIGILANCE_TYPE
    VACCINE_TYPE                VARCHAR(50),                                -- codelist: VACCINE_TYPE
    PRODUCT_KEYWORDS            VARCHAR(1000),
    PRODUCT_ACTIVE_INGREDIENT   VARCHAR(1000),
    WHO_DD_CODE                 VARCHAR(100),
    WHO_DD_DECODE               VARCHAR(300),
    INTERNAL_DRUG_CODE          VARCHAR(100),
    MADE_BY                     VARCHAR(50),                                -- codelist: MADE_BY
    COMPANY_PRODUCT             CHAR(1)         NOT NULL DEFAULT 'N' CHECK (COMPANY_PRODUCT IN ('Y','N')),
    SUBJECT_TO_RISK_MGMT        CHAR(1)         NOT NULL DEFAULT 'N' CHECK (SUBJECT_TO_RISK_MGMT IN ('Y','N')),
    -- Device Information
    BRAND_NAME                  VARCHAR(300),
    MODEL_NUMBER                VARCHAR(300),
    CATALOGUE_NUMBER            VARCHAR(300),
    DEVICE_COMPONENT_NAME       VARCHAR(300),
    DEVICE_COMPONENT_TERM_ID    VARCHAR(300),
    DEVICE_COMPONENT_TERM_ID_VER VARCHAR(300),
    MANUFACTURED_BY_ACC_ID      VARCHAR(100),                               -- lookup: ACCOUNTS
    MANUFACTURED_BY_NAME        VARCHAR(300),
    DEVICE_MFG_SITE_ACC_ID      VARCHAR(100),                               -- lookup: ACCOUNTS
    DEVICE_MFG_SITE_NAME        VARCHAR(300),
    CREATED_AT                  TIMESTAMP       NOT NULL DEFAULT NOW(),
    UPDATED_AT                  TIMESTAMP       NOT NULL DEFAULT NOW()
);

-- ── PRODUCT_SUBSTANCES — substance (multi-context) ────────────
CREATE TABLE IF NOT EXISTS PRODUCT_SUBSTANCES (
    ID                  VARCHAR(36)     NOT NULL PRIMARY KEY,
    PRODUCT_REC_ID      VARCHAR(36)     NOT NULL REFERENCES PRODUCTS(ID) ON DELETE CASCADE,
    SUBSTANCE_ID        VARCHAR(100),                                       -- readonly, from lookup
    SUBSTANCE_NAME      VARCHAR(300),                                       -- lookup: SUBSTANCE
    IS_ACTIVE           CHAR(1)         NOT NULL DEFAULT 'Y' CHECK (IS_ACTIVE IN ('Y','N')),
    CREATED_AT          TIMESTAMP       NOT NULL DEFAULT NOW(),
    UPDATED_AT          TIMESTAMP       NOT NULL DEFAULT NOW()
);

-- ── PRODUCT_LOCAL_TRADE_NAMES — localTradeNames (multi-context) ─
CREATE TABLE IF NOT EXISTS PRODUCT_LOCAL_TRADE_NAMES (
    ID                          VARCHAR(36)     NOT NULL PRIMARY KEY,
    PRODUCT_REC_ID              VARCHAR(36)     NOT NULL REFERENCES PRODUCTS(ID) ON DELETE CASCADE,
    LTN                         VARCHAR(300)    NOT NULL,
    NDC_CODE                    VARCHAR(100),
    ATC_CODE                    VARCHAR(100),
    AUTHORIZATION_NO            VARCHAR(200),
    APPROVAL_TYPE               VARCHAR(50),                                -- codelist: APPROVAL_TYPE
    MAH_ACC_ID                  VARCHAR(100),                               -- lookup: ACCOUNTS (stores accId)
    MAH_NAME                    VARCHAR(300),                               -- display value from lookup
    AUTHORIZATION_COUNTRY       VARCHAR(10),                                -- codelist: COUNTRY
    SUBMISSION_TYPE             VARCHAR(50),                                -- codelist: SUBMISSION_TYPE
    PRODUCT_FLAG                VARCHAR(50),                                -- codelist: PRODUCT_FLAG
    VACCINE_TYPE                VARCHAR(50),                                -- codelist: VACCINE_TYPE
    CREATED_AT                  TIMESTAMP       NOT NULL DEFAULT NOW(),
    UPDATED_AT                  TIMESTAMP       NOT NULL DEFAULT NOW()
);

-- ── PRODUCT_SYNONYMS — synonyms (multi-context) ──────────────
CREATE TABLE IF NOT EXISTS PRODUCT_SYNONYMS (
    ID              VARCHAR(36)     NOT NULL PRIMARY KEY,
    PRODUCT_REC_ID  VARCHAR(36)     NOT NULL REFERENCES PRODUCTS(ID) ON DELETE CASCADE,
    SYNONYM_NAME    VARCHAR(100)    NOT NULL,
    IS_ACTIVE       CHAR(1)         NOT NULL DEFAULT 'Y' CHECK (IS_ACTIVE IN ('Y','N')),
    CREATED_AT      TIMESTAMP       NOT NULL DEFAULT NOW(),
    UPDATED_AT      TIMESTAMP       NOT NULL DEFAULT NOW()
);
