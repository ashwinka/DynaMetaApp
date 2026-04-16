-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 02_ddl_framework_tables.sql
-- Purpose : CREATE TABLE statements for all framework tables
--           Run once per tenant schema on fresh provisioning
-- ============================================================

-- ── Users ────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS APP_USERS (
    ID              VARCHAR(36)     NOT NULL PRIMARY KEY,
    USER_NAME       VARCHAR(300)    NOT NULL UNIQUE,
    FULL_NAME       VARCHAR(300)    NOT NULL,
    EMAIL_ID        VARCHAR(300)    NOT NULL UNIQUE,
    PASSWORD_HASH   VARCHAR(1000)   NOT NULL,
    ROLES           TEXT            NOT NULL DEFAULT '[]',  -- JSON array of ROLE_IDs
    LAST_LOGIN      TIMESTAMP,
    IS_ACTIVE       CHAR(1)         NOT NULL DEFAULT 'Y' CHECK (IS_ACTIVE IN ('Y','N')),
    CREATED_AT      TIMESTAMP       NOT NULL DEFAULT NOW(),
    UPDATED_AT      TIMESTAMP       NOT NULL DEFAULT NOW()
);

-- ── Roles & Privileges ───────────────────────────────────────
CREATE TABLE IF NOT EXISTS USER_ROLES (
    ID              VARCHAR(36)     NOT NULL PRIMARY KEY,
    ROLE_ID         VARCHAR(300)    NOT NULL UNIQUE,
    ROLE_NAME       VARCHAR(300)    NOT NULL,
    IS_ACTIVE       CHAR(1)         NOT NULL DEFAULT 'Y' CHECK (IS_ACTIVE IN ('Y','N')),
    CREATED_AT      TIMESTAMP       NOT NULL DEFAULT NOW(),
    UPDATED_AT      TIMESTAMP       NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS ROLE_PRIVILEGES (
    ID              VARCHAR(36)     NOT NULL PRIMARY KEY,
    ROLE_ID         VARCHAR(300)    NOT NULL REFERENCES USER_ROLES(ROLE_ID),
    MODULE_ID       VARCHAR(300)    NOT NULL,
    READ_ACCESS     CHAR(1)         NOT NULL DEFAULT 'N' CHECK (READ_ACCESS IN ('Y','N')),
    WRITE_ACCESS    CHAR(1)         NOT NULL DEFAULT 'N' CHECK (WRITE_ACCESS IN ('Y','N')),
    UNIQUE (ROLE_ID, MODULE_ID)
);

-- ── Code List Library ────────────────────────────────────────
CREATE TABLE IF NOT EXISTS CODE_LIST_LIB (
    ID              VARCHAR(36)     NOT NULL PRIMARY KEY,
    CODE_LIST_ID    VARCHAR(300)    NOT NULL UNIQUE,
    DESCRIPTION     VARCHAR(300)    NOT NULL,
    IS_ACTIVE       CHAR(1)         NOT NULL DEFAULT 'Y' CHECK (IS_ACTIVE IN ('Y','N')),
    CREATED_AT      TIMESTAMP       NOT NULL DEFAULT NOW(),
    UPDATED_AT      TIMESTAMP       NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS CODE_LIST_VALUES (
    ID              VARCHAR(36)     NOT NULL PRIMARY KEY,
    CODE_LIST_ID    VARCHAR(300)    NOT NULL REFERENCES CODE_LIST_LIB(CODE_LIST_ID),
    CODE            VARCHAR(100)    NOT NULL,
    DECODE          VARCHAR(300)    NOT NULL,
    TRANSLATIONS    TEXT,           -- JSON object: { "en": "Active", "fr": "Actif", "de": "Aktiv" }
    SEQUENCE        INT             NOT NULL DEFAULT 0,
    IS_ACTIVE       CHAR(1)         NOT NULL DEFAULT 'Y' CHECK (IS_ACTIVE IN ('Y','N')),
    UNIQUE (CODE_LIST_ID, CODE)
);

-- ── Menu Groups ──────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS MENU_GROUPS (
    ID              VARCHAR(36)     NOT NULL PRIMARY KEY,
    MENU_ID         VARCHAR(300)    NOT NULL UNIQUE,
    LABEL           VARCHAR(300)    NOT NULL,
    TRANSLATIONS    TEXT,
    ICON            TEXT,
    SEQUENCE        INT             NOT NULL DEFAULT 0,
    IS_ACTIVE       CHAR(1)         NOT NULL DEFAULT 'Y' CHECK (IS_ACTIVE IN ('Y','N'))
);

-- ── Module Registry ──────────────────────────────────────────
CREATE TABLE IF NOT EXISTS MODULE (
    ID              VARCHAR(36)     NOT NULL PRIMARY KEY,
    MODULE_ID       VARCHAR(300)    NOT NULL UNIQUE,
    ITEM_ID         VARCHAR(300)    NOT NULL UNIQUE,
    LABEL           VARCHAR(300)    NOT NULL,
    TRANSLATIONS    TEXT,
    DESCRIPTION     VARCHAR(1000),
    MENU_GROUP_ID   VARCHAR(300)    NOT NULL REFERENCES MENU_GROUPS(MENU_ID),
    ICON            TEXT,
    VIEW            VARCHAR(100)    NOT NULL DEFAULT 'listing',
    DB_ROOT_TABLE   VARCHAR(300),
    BADGE           VARCHAR(100),
    BADGE_COLOR     VARCHAR(50),
    IS_DISABLED     CHAR(1)         NOT NULL DEFAULT 'N' CHECK (IS_DISABLED IN ('Y','N')),
    IS_ACTIVE       CHAR(1)         NOT NULL DEFAULT 'Y' CHECK (IS_ACTIVE IN ('Y','N')),
    SEQUENCE        INT             NOT NULL DEFAULT 0
);

-- ── Table Structure Metadata ─────────────────────────────────
CREATE TABLE IF NOT EXISTS TABLE_METADATA (
    ID                  VARCHAR(36)     NOT NULL PRIMARY KEY,
    MODULE_ID           VARCHAR(300)    NOT NULL REFERENCES MODULE(MODULE_ID),
    TABLE_ID            VARCHAR(100)    NOT NULL,
    PARENT_TABLE_ID     VARCHAR(100),
    DB_TABLE_NAME       VARCHAR(100)    NOT NULL,
    CONTEXT_NAME        VARCHAR(100)    NOT NULL,
    MULTI_CONTEXT       CHAR(1)         NOT NULL DEFAULT 'N' CHECK (MULTI_CONTEXT IN ('Y','N')),
    JOIN_COLUMN         VARCHAR(100),
    REF_JOIN_COLUMN     VARCHAR(100),
    CONTEXT_PATH        VARCHAR(1000),
	LABEL				VARCHAR(300),
	DESCRIPTION			VARCHAR(4000),
	UI_METADATA			TEXT DEFAULT '{}',
    UNIQUE (MODULE_ID, TABLE_ID)
);

-- ── Column Metadata ──────────────────────────────────────────
CREATE TABLE IF NOT EXISTS TABLE_COLUMN_METADATA (
    ID              VARCHAR(36)     NOT NULL PRIMARY KEY,
    MODULE_ID       VARCHAR(300)    NOT NULL REFERENCES MODULE(MODULE_ID),
    TABLE_ID        VARCHAR(300)    NOT NULL,
    FIELD_ID        VARCHAR(300)    NOT NULL,
    COLUMN_NAME     VARCHAR(300)    NOT NULL,
    FIELD_NAME    VARCHAR(300)    NOT NULL,
    LISTING_ALIAS   VARCHAR(300),
    DATA_TYPE       VARCHAR(50)     NOT NULL CHECK (DATA_TYPE IN ('TEXT','NUMBER','DATE','DATETIME', 'JSON', 'FILE')),
    MAX_LENGTH      INT,
    REQUIRED_FIELD  CHAR(1)         NOT NULL DEFAULT 'N' CHECK (REQUIRED_FIELD IN ('Y','N')),
    FIELD_PATH      VARCHAR(1000),
	LABEL			VARCHAR(300),
	LABEL_INFO		VARCHAR(300),
	DESCRIPTION		VARCHAR(4000),
	UI_METADATA		TEXT DEFAULT '{}',
    UNIQUE (MODULE_ID, TABLE_ID, FIELD_ID)
);

-- ── UI Metadata ──────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS UI_METADATA (
    ID              VARCHAR(36)     NOT NULL PRIMARY KEY,
    MODULE_ID       VARCHAR(300)    NOT NULL REFERENCES MODULE(MODULE_ID),
    NAME            VARCHAR(300)    NOT NULL UNIQUE,
    VERSION         INT             NOT NULL DEFAULT 0,
    TYPE            VARCHAR(50)     NOT NULL CHECK (TYPE IN ('LISTING','FORM','LOOKUP','I18N')),
    METADATA_JSON   TEXT,
    S3_PATH         VARCHAR(1000),
    CREATED_AT      TIMESTAMP       NOT NULL DEFAULT NOW(),
    UPDATED_AT      TIMESTAMP       NOT NULL DEFAULT NOW()
);
