-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 02_DB_METADATA.sql
-- Module  : APP_USERS
-- Purpose : TABLE_METADATA and TABLE_COLUMN_METADATA
--           UI_METADATA JSON is derived from listing/form metadata.
--           LABEL holds the i18n key; DESCRIPTION holds English text.
-- ============================================================

--   130  APP_USERS  root  MULTI_CONTEXT=N

INSERT INTO TABLE_METADATA (
    ID, MODULE_ID, TABLE_ID, PARENT_TABLE_ID, DB_TABLE_NAME, CONTEXT_NAME, MULTI_CONTEXT, JOIN_COLUMN, REF_JOIN_COLUMN, CONTEXT_PATH)
VALUES
    (gen_random_uuid()::VARCHAR, 'APP_USERS', '130', NULL, 'APP_USERS', '', 'N', NULL, NULL, NULL)
ON CONFLICT (MODULE_ID, TABLE_ID) DO NOTHING;

INSERT INTO TABLE_COLUMN_METADATA (
    ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION)
VALUES
-- ── 130 APP_USERS ────────────────────────────────────────────
(gen_random_uuid()::VARCHAR, 'APP_USERS', '130', '130001', 'USER_NAME',     'userName',     'userName',     'TEXT',     300,  'Y', 'userName',
    'lbl.userName',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true,  "primaryKey":true}',
    'Unique login username for the user'),

(gen_random_uuid()::VARCHAR, 'APP_USERS', '130', '130002', 'FULL_NAME',     'fullName',     'fullName',     'TEXT',     300,  'Y', 'fullName',
    'lbl.fullName',
    '{"renderAs":"text",        "fieldWidth":"2", "columnWidth":"24ch", "allowSorting":true}',
    'Full display name of the user'),

(gen_random_uuid()::VARCHAR, 'APP_USERS', '130', '130003', 'EMAIL_ID',      'emailId',      'emailId',      'TEXT',     300,  'Y', 'emailId',
    'lbl.emailId',
    '{"renderAs":"text",        "fieldWidth":"2", "columnWidth":"28ch", "allowSorting":true}',
    'Email address used for login and notifications'),

(gen_random_uuid()::VARCHAR, 'APP_USERS', '130', '130004', 'PASSWORD_HASH', 'passwordHash', 'passwordHash', 'TEXT',     1000, 'N', 'passwordHash',
    'lbl.passwordHash',
    '{"renderAs":"password",    "fieldWidth":"2", "columnWidth":"0",    "allowSorting":false, "hidden":true}',
    'BCrypt hashed password — never displayed in UI'),

(gen_random_uuid()::VARCHAR, 'APP_USERS', '130', '130005', 'ROLES',         'roles',        'roles',        'TEXT',     NULL, 'N', 'roles',
    'lbl.roles',
    '{"renderAs":"ms-lookup","fieldWidth":"3", "columnWidth":"20ch", "allowSorting":false, "lookupModule":"APP_ROLES", "storeFormat":"JSON", "lkpStoreValField":"roleId"}',
    'JSON array of ROLE_IDs assigned to this user'),

(gen_random_uuid()::VARCHAR, 'APP_USERS', '130', '130006', 'LAST_LOGIN',    'lastLogin',    'lastLogin',    'DATETIME', NULL, 'N', 'lastLogin',
    'lbl.lastLogin',
    '{"renderAs":"datetime",    "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true,  "readOnly":true}',
    'Timestamp of the user''s most recent successful login'),

(gen_random_uuid()::VARCHAR, 'APP_USERS', '130', '130007', 'IS_ACTIVE',     'isActive',     'isActive',     'TEXT',     1,    'N', 'isActive',
    'lbl.active',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"8ch",  "allowSorting":true,  "align":"center"}',
    'Indicates whether the user account is active')

ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;
