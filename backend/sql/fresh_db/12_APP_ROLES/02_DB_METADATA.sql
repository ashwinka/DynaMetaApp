-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 02_DB_METADATA.sql
-- Module  : APP_ROLES
-- Purpose : TABLE_METADATA and TABLE_COLUMN_METADATA
--           UI_METADATA JSON is derived from listing/form metadata.
--           LABEL holds the i18n key; DESCRIPTION holds English text.
-- ============================================================

--   140  USER_ROLES        root        MULTI_CONTEXT=N
--   145  ROLE_PRIVILEGES   parent=140  MULTI_CONTEXT=Y

INSERT INTO TABLE_METADATA (
    ID, MODULE_ID, TABLE_ID, PARENT_TABLE_ID, DB_TABLE_NAME, CONTEXT_NAME, MULTI_CONTEXT, JOIN_COLUMN, REF_JOIN_COLUMN, CONTEXT_PATH)
VALUES
    (gen_random_uuid()::VARCHAR, 'APP_ROLES', '140', NULL,  'USER_ROLES',      '',           'N', NULL,      NULL,      NULL),
    (gen_random_uuid()::VARCHAR, 'APP_ROLES', '145', '140', 'ROLE_PRIVILEGES', 'privileges', 'Y', 'ROLE_ID', 'ROLE_ID', 'privileges$')
ON CONFLICT (MODULE_ID, TABLE_ID) DO NOTHING;

INSERT INTO TABLE_COLUMN_METADATA (
    ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION)
VALUES
-- ── 140 USER_ROLES ───────────────────────────────────────────
(gen_random_uuid()::VARCHAR, 'APP_ROLES', '140', '140001', 'ROLE_ID',   'roleId',   'roleId',   'TEXT', 300, 'Y', 'roleId',
    'lbl.roleId',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true,  "primaryKey":true}',
    'Unique identifier for the role (e.g. ADMIN, CASE_MGR)'),

(gen_random_uuid()::VARCHAR, 'APP_ROLES', '140', '140002', 'ROLE_NAME', 'roleName', 'roleName', 'TEXT', 300, 'Y', 'roleName',
    'lbl.roleName',
    '{"renderAs":"text",        "fieldWidth":"2", "columnWidth":"28ch", "allowSorting":true}',
    'Display name of the role'),

(gen_random_uuid()::VARCHAR, 'APP_ROLES', '140', '140003', 'IS_ACTIVE', 'isActive', 'isActive', 'TEXT', 1,   'N', 'isActive',
    'lbl.active',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"8ch",  "allowSorting":true,  "align":"center"}',
    'Indicates whether the role is active'),

-- ── 145 ROLE_PRIVILEGES ──────────────────────────────────────
(gen_random_uuid()::VARCHAR, 'APP_ROLES', '145', '145001', 'ROLE_ID',      'roleId',      'roleId',      'TEXT', 300, 'Y', 'privileges$.roleId',
    'lbl.roleId',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true,  "hidden":true}',
    'Role this privilege row belongs to'),

(gen_random_uuid()::VARCHAR, 'APP_ROLES', '145', '145002', 'MODULE_ID',    'moduleId',    'moduleId',    'TEXT', 300, 'Y', 'privileges$.moduleId',
    'lbl.moduleId',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"24ch", "allowSorting":true}',
    'Module ID the privilege applies to (* = all modules)'),

(gen_random_uuid()::VARCHAR, 'APP_ROLES', '145', '145003', 'READ_ACCESS',  'readAccess',  'readAccess',  'TEXT', 1,   'N', 'privileges$.readAccess',
    'lbl.readAccess',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":false}',
    'Grants read access to the module'),

(gen_random_uuid()::VARCHAR, 'APP_ROLES', '145', '145004', 'WRITE_ACCESS', 'writeAccess', 'writeAccess', 'TEXT', 1,   'N', 'privileges$.writeAccess',
    'lbl.writeAccess',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":false}',
    'Grants write access to the module')

ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;
