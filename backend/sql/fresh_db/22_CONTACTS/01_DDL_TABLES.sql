-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 01_DDL_TABLES.sql
-- Module  : CONTACTS
-- Purpose : DDL for Contacts module tables
-- Run on  : Each child tenant schema on fresh provisioning
-- ============================================================

CREATE TABLE IF NOT EXISTS CONTACTS (
    ID                  VARCHAR(36)     NOT NULL PRIMARY KEY,
    CONTACT_ID          VARCHAR(100)    NOT NULL UNIQUE,
    IS_ACTIVE           CHAR(1)         NOT NULL DEFAULT 'Y' CHECK (IS_ACTIVE IN ('Y','N')),
    TITLE               VARCHAR(50),                                        -- codelist: CONTACT_TITLE
    FIRST_NAME          VARCHAR(100)    NOT NULL,
    MIDDLE_NAME         VARCHAR(100),
    LAST_NAME           VARCHAR(100),
    CONTACT_MEDIUM      VARCHAR(50),                                        -- codelist: CONTACT_MEDIUM
    DO_NOT_CONTACT      CHAR(1)         NOT NULL DEFAULT 'N' CHECK (DO_NOT_CONTACT IN ('Y','N')),
    EMAIL_ID            VARCHAR(300),
    GENDER              VARCHAR(20),                                        -- codelist: GENDER
    DEPARTMENT_ID       VARCHAR(36),                                        -- lookup: DEPARTMENTS
    QUALIFICATION       VARCHAR(100),                                       -- codelist: CONTACT_QUALIFICATION
    SPECIALIZATION      VARCHAR(100),                                       -- codelist: CONTACT_SPECIALIZATION
    CONTACT_CATEGORY    VARCHAR(50),                                        -- codelist: CONTACT_CATEGORY
    -- Contact Phone
    PHONE_COUNTRY_CODE  VARCHAR(10),
    PHONE_AREA_CODE     VARCHAR(10),
    PHONE_NUMBER        VARCHAR(50),
    -- Fax
    FAX_COUNTRY_CODE    VARCHAR(10),
    FAX_AREA_CODE       VARCHAR(10),
    FAX_NUMBER          VARCHAR(50),
    CREATED_AT          TIMESTAMP       NOT NULL DEFAULT NOW(),
    UPDATED_AT          TIMESTAMP       NOT NULL DEFAULT NOW()
);

-- ── CONTACT_ADDRESSES — address (multi-context) ──────────────
CREATE TABLE IF NOT EXISTS CONTACT_ADDRESSES (
    ID                  VARCHAR(36)     NOT NULL PRIMARY KEY,
    CONTACT_REC_ID      VARCHAR(36)     NOT NULL REFERENCES CONTACTS(ID) ON DELETE CASCADE,
    IS_PRIMARY          CHAR(1)         NOT NULL DEFAULT 'N' CHECK (IS_PRIMARY IN ('Y','N')),
    HOUSE_APT_NUMBER    VARCHAR(100),
    ADDRESS             VARCHAR(1000),
    COUNTRY             VARCHAR(10),                                        -- codelist: COUNTRY
    CITY                VARCHAR(150),
    STATE               VARCHAR(150),
    ADDRESS_TYPE        VARCHAR(50),                                        -- codelist: ADDRESS_TYPE
    CREATED_AT          TIMESTAMP       NOT NULL DEFAULT NOW(),
    UPDATED_AT          TIMESTAMP       NOT NULL DEFAULT NOW()
);
