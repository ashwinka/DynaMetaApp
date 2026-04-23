-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 02_DB_METADATA.sql
-- Module  : DEPARTMENTS
-- Purpose : TABLE_METADATA and TABLE_COLUMN_METADATA
--           UI_METADATA JSON derived from listing/form metadata.
--           LABEL holds the i18n key; DESCRIPTION holds English text.
-- ============================================================
--   240  DEPARTMENTS  root  MULTI_CONTEXT=N

INSERT INTO TABLE_METADATA (
    ID, MODULE_ID, TABLE_ID, PARENT_TABLE_ID, DB_TABLE_NAME, CONTEXT_NAME, MULTI_CONTEXT, JOIN_COLUMN, REF_JOIN_COLUMN, CONTEXT_PATH)
VALUES
    (gen_random_uuid()::VARCHAR, 'DEPARTMENTS', '240', NULL, 'DEPARTMENTS', '', 'N', NULL, NULL, NULL)
ON CONFLICT (MODULE_ID, TABLE_ID) DO NOTHING;

INSERT INTO TABLE_COLUMN_METADATA (
    ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION)
VALUES
-- ── 240 DEPARTMENTS ──────────────────────────────────────────
(gen_random_uuid()::VARCHAR, 'DEPARTMENTS', '240', '240001', 'DEPARTMENT_CODE',     'departmentCode',     'departmentCode',     'TEXT',   100,  'Y', 'departmentCode',
    'lbl.departmentCode',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true,  "primaryKey":true}',
    'Unique identifier code for the department'),

(gen_random_uuid()::VARCHAR, 'DEPARTMENTS', '240', '240002', 'DEPARTMENT_NAME',     'departmentName',     'departmentName',     'TEXT',   300,  'Y', 'departmentName',
    'lbl.departmentName',
    '{"renderAs":"text",        "fieldWidth":"2", "columnWidth":"28ch", "allowSorting":true}',
    'Full name of the department'),

(gen_random_uuid()::VARCHAR, 'DEPARTMENTS', '240', '240003', 'CONTACT_PERSON',      'contactPerson',      'contactPerson',      'TEXT',   300,  'N', 'contactPerson',
    'lbl.contactPerson',
    '{"renderAs":"text",        "fieldWidth":"2", "columnWidth":"22ch", "allowSorting":true}',
    'Primary contact person for this department'),

(gen_random_uuid()::VARCHAR, 'DEPARTMENTS', '240', '240004', 'EMAIL_ID',            'emailId',            'emailId',            'TEXT',   300,  'N', 'emailId',
    'lbl.emailId',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"26ch", "allowSorting":true}',
    'Email address of the department contact'),

(gen_random_uuid()::VARCHAR, 'DEPARTMENTS', '240', '240005', 'REPORT_NOTIFICATION', 'reportNotification', 'reportNotification', 'TEXT',   1,    'N', 'reportNotification',
    'lbl.reportNotification',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"10ch", "allowSorting":true}',
    'Whether this department receives report notifications'),

(gen_random_uuid()::VARCHAR, 'DEPARTMENTS', '240', '240006', 'IS_ACTIVE',           'isActive',           'isActive',           'TEXT',   1,    'N', 'isActive',
    'lbl.active',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"8ch",  "allowSorting":true,  "align":"center"}',
    'Indicates whether the department is active'),

(gen_random_uuid()::VARCHAR, 'DEPARTMENTS', '240', '240007', 'PHONE_COUNTRY_CODE',  'phoneCountryCode',   'phoneCountryCode',   'TEXT',   10,   'N', 'phoneCountryCode',
    'lbl.phoneCountryCode',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"10ch", "allowSorting":false}',
    'Country dialling code for the department phone'),

(gen_random_uuid()::VARCHAR, 'DEPARTMENTS', '240', '240008', 'PHONE_AREA_CODE',     'phoneAreaCode',      'phoneAreaCode',      'TEXT',   10,   'N', 'phoneAreaCode',
    'lbl.phoneAreaCode',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"10ch", "allowSorting":false}',
    'Area code for the department phone'),

(gen_random_uuid()::VARCHAR, 'DEPARTMENTS', '240', '240009', 'PHONE_NUMBER',        'phoneNumber',        'phoneNumber',        'TEXT',   50,   'N', 'phoneNumber',
    'lbl.phoneNumber',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":false}',
    'Local phone number for the department'),

(gen_random_uuid()::VARCHAR, 'DEPARTMENTS', '240', '240010', 'FAX_COUNTRY_CODE',    'faxCountryCode',     'faxCountryCode',     'TEXT',   10,   'N', 'faxCountryCode',
    'lbl.faxCountryCode',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"10ch", "allowSorting":false}',
    'Country dialling code for the department fax'),

(gen_random_uuid()::VARCHAR, 'DEPARTMENTS', '240', '240011', 'FAX_AREA_CODE',       'faxAreaCode',        'faxAreaCode',        'TEXT',   10,   'N', 'faxAreaCode',
    'lbl.faxAreaCode',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"10ch", "allowSorting":false}',
    'Area code for the department fax'),

(gen_random_uuid()::VARCHAR, 'DEPARTMENTS', '240', '240012', 'FAX_NUMBER',          'faxNumber',          'faxNumber',          'TEXT',   50,   'N', 'faxNumber',
    'lbl.faxNumber',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":false}',
    'Local fax number for the department')

ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;
