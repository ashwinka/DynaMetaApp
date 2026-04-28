-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 01_SSL_TABLES.sql
-- Purpose : DDL for the module specific tables
--           
-- Run on  : Each child tenant schema on fresh provisioning
-- ============================================================
CREATE TABLE IF NOT EXISTS LITERATURE_CASES (
    ID              		VARCHAR(36)     NOT NULL PRIMARY KEY,
    CASE_ID                 VARCHAR(100)    NOT NULL UNIQUE,
    ARTICLE_TITLE           VARCHAR(1000),
    JOURNAL_NAME            VARCHAR(300),
    AUTHORS                 VARCHAR(500),
    PUBLICATION_DATE        DATE,
    VOLUME                  VARCHAR(20),
    ISSUE                   VARCHAR(20),
    PAGES                   VARCHAR(50),
    DOI                     VARCHAR(300),
    SOURCE_TYPE             VARCHAR(50),    -- PUBMED | EMBASE | MANUAL | OTHER
    LANGUAGE                VARCHAR(10),
    COUNTRY_OF_PUBLICATION  VARCHAR(10),
    STATUS                  VARCHAR(50),    -- NEW | IN_REVIEW | ASSESSED | CLOSED
    PRIORITY                VARCHAR(20),
    IS_SAFETY_RELATED       CHAR(1)         DEFAULT 'N',
    PRODUCT_MENTIONED       VARCHAR(300),
    AE_TERM                 VARCHAR(500),
    SERIOUS                 CHAR(1)         DEFAULT 'N',
    CASE_REPORTABLE         CHAR(1)         DEFAULT 'N',
    CASE_CREATED            CHAR(1)         DEFAULT 'N',
    LINKED_CASE_ID          VARCHAR(100),
    ASSIGNED_TO             VARCHAR(100),
    ASSESSMENT_DATE         DATE,
    ASSESSMENT_NOTES        TEXT,
    ABSTRACT                TEXT,
    RELEVANT_EXCERPT        TEXT,
    SEARCH_STRATEGY         VARCHAR(50),    -- WEEKLY | MONTHLY | ADHOC
    SEARCH_DATABASE         VARCHAR(100),
    SEARCH_DATE             DATE,
    SEARCH_TERMS            VARCHAR(500),
    SEARCHED_BY             VARCHAR(100),
    CREATED_AT              TIMESTAMP       NOT NULL DEFAULT NOW(),
    UPDATED_AT              TIMESTAMP       NOT NULL DEFAULT NOW()
);
