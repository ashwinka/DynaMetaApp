-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 02_DB_METADATA.sql
-- Module  : ACCOUNTS
-- Purpose : TABLE_METADATA and TABLE_COLUMN_METADATA
--           UI_METADATA JSON derived from listing/form metadata.
--           LABEL holds the i18n key; DESCRIPTION holds English text.
-- ============================================================

CREATE EXTENSION IF NOT EXISTS pgcrypto;

--   230  ACCOUNTS              root        MULTI_CONTEXT=N
--   231  ACCOUNT_REG_NUMBERS   parent=230  MULTI_CONTEXT=Y
--   232  ACCOUNT_CONTACTS      parent=230  MULTI_CONTEXT=Y
--   233  ACCOUNT_CONTRACTS     parent=230  MULTI_CONTEXT=Y

INSERT INTO TABLE_METADATA (
    ID, MODULE_ID, TABLE_ID, PARENT_TABLE_ID, DB_TABLE_NAME, CONTEXT_NAME, MULTI_CONTEXT, JOIN_COLUMN, REF_JOIN_COLUMN, CONTEXT_PATH)
VALUES
    (gen_random_uuid()::VARCHAR, 'ACCOUNTS', '230', NULL,  'ACCOUNTS',             '',              'N', NULL,            NULL, NULL),
    (gen_random_uuid()::VARCHAR, 'ACCOUNTS', '231', '230', 'ACCOUNT_REG_NUMBERS',  'regNumbers',    'Y', 'ACCOUNT_REC_ID','ID', 'regNumbers$'),
    (gen_random_uuid()::VARCHAR, 'ACCOUNTS', '232', '230', 'ACCOUNT_CONTACTS',     'contacts',      'Y', 'ACCOUNT_REC_ID','ID', 'contacts$'),
    (gen_random_uuid()::VARCHAR, 'ACCOUNTS', '233', '230', 'ACCOUNT_CONTRACTS',    'contracts',     'Y', 'ACCOUNT_REC_ID','ID', 'contracts$')
ON CONFLICT (MODULE_ID, TABLE_ID) DO NOTHING;

INSERT INTO TABLE_COLUMN_METADATA (
    ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION)
VALUES
-- ── 230 ACCOUNTS ─────────────────────────────────────────────
(gen_random_uuid()::VARCHAR, 'ACCOUNTS', '230', '230001', 'ACC_ID',           'accId',           'accId',           'TEXT',   100,  'Y', 'accId',
    'lbl.accId',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true,  "primaryKey":true}',
    'Unique identifier for the account'),

(gen_random_uuid()::VARCHAR, 'ACCOUNTS', '230', '230002', 'ACC_NAME',         'accName',         'accName',         'TEXT',   300,  'Y', 'accName',
    'lbl.accName',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"28ch", "allowSorting":true}',
    'Full name of the account / company unit'),

(gen_random_uuid()::VARCHAR, 'ACCOUNTS', '230', '230003', 'IS_ACTIVE',        'isActive',        'isActive',        'TEXT',   1,    'Y', 'isActive',
    'lbl.active',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"8ch",  "allowSorting":true,  "align":"center"}',
    'Indicates whether the account is active'),

(gen_random_uuid()::VARCHAR, 'ACCOUNTS', '230', '230004', 'ACCOUNT_TYPE',     'accountType',     'accountType',     'TEXT',   50,   'N', 'accountType',
    'lbl.accountType',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"22ch", "allowSorting":true,  "codelist":"ACCOUNT_TYPE"}',
    'Type / category of the account'),

(gen_random_uuid()::VARCHAR, 'ACCOUNTS', '230', '230005', 'HEALTH_AUTHORITY', 'healthAuthority', 'healthAuthority', 'TEXT',   50,   'N', 'healthAuthority',
    'lbl.healthAuthority',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true,  "codelist":"HEALTH_AUTHORITY"}',
    'Associated health authority for this account'),

(gen_random_uuid()::VARCHAR, 'ACCOUNTS', '230', '230006', 'SINGLE_REG_NUMBER','singleRegNumber', 'singleRegNumber', 'TEXT',   300,  'N', 'singleRegNumber',
    'lbl.singleRegNumber',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"20ch", "allowSorting":true}',
    'Single primary registration number for the account'),

(gen_random_uuid()::VARCHAR, 'ACCOUNTS', '230', '230007', 'DESCRIPTION',      'description',     'description',     'TEXT',   1000, 'N', 'description',
    'lbl.description',
    '{"renderAs":"textarea",    "fieldWidth":"3", "columnWidth":"30ch", "allowSorting":false}',
    'Free-text description of the account'),

(gen_random_uuid()::VARCHAR, 'ACCOUNTS', '230', '230008', 'ADDRESS',          'address',         'address',         'TEXT',   1000, 'N', 'address',
    'lbl.address',
    '{"renderAs":"textarea",    "fieldWidth":"3", "columnWidth":"30ch", "allowSorting":false}',
    'Street address of the account'),

(gen_random_uuid()::VARCHAR, 'ACCOUNTS', '230', '230009', 'COUNTRY',          'country',         'country',         'TEXT',   10,   'N', 'country',
    'lbl.country',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true,  "codelist":"COUNTRY"}',
    'Country of the account'),

(gen_random_uuid()::VARCHAR, 'ACCOUNTS', '230', '230010', 'CITY',             'city',            'city',            'TEXT',   150,  'N', 'city',
    'lbl.city',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'City of the account'),

(gen_random_uuid()::VARCHAR, 'ACCOUNTS', '230', '230011', 'STATE',            'state',           'state',           'TEXT',   150,  'N', 'state',
    'lbl.state',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'State or province of the account'),

(gen_random_uuid()::VARCHAR, 'ACCOUNTS', '230', '230012', 'POSTCODE',         'postcode',        'postcode',        'TEXT',   50,   'N', 'postcode',
    'lbl.postcode',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"10ch", "allowSorting":true}',
    'Postal / ZIP code of the account'),

(gen_random_uuid()::VARCHAR, 'ACCOUNTS', '230', '230013', 'PHONE_COUNTRY_CODE','phoneCountryCode','phoneCountryCode','TEXT',  10,   'N', 'phoneCountryCode',
    'lbl.phoneCountryCode',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"10ch", "allowSorting":false}',
    'Country dialling code for the account phone'),

(gen_random_uuid()::VARCHAR, 'ACCOUNTS', '230', '230014', 'PHONE_AREA_CODE',  'phoneAreaCode',   'phoneAreaCode',   'TEXT',   10,   'N', 'phoneAreaCode',
    'lbl.phoneAreaCode',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"10ch", "allowSorting":false}',
    'Area code for the account phone'),

(gen_random_uuid()::VARCHAR, 'ACCOUNTS', '230', '230015', 'PHONE_NUMBER',     'phoneNumber',     'phoneNumber',     'TEXT',   50,   'N', 'phoneNumber',
    'lbl.phoneNumber',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":false}',
    'Local phone number for the account'),

(gen_random_uuid()::VARCHAR, 'ACCOUNTS', '230', '230016', 'WEBSITE',          'website',         'website',         'TEXT',   500,  'N', 'website',
    'lbl.website',
    '{"renderAs":"text",        "fieldWidth":"2", "columnWidth":"24ch", "allowSorting":false}',
    'Website URL of the account'),

(gen_random_uuid()::VARCHAR, 'ACCOUNTS', '230', '230017', 'FAX_COUNTRY_CODE', 'faxCountryCode',  'faxCountryCode',  'TEXT',   10,   'N', 'faxCountryCode',
    'lbl.faxCountryCode',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"10ch", "allowSorting":false}',
    'Country dialling code for the account fax'),

(gen_random_uuid()::VARCHAR, 'ACCOUNTS', '230', '230018', 'FAX_AREA_CODE',    'faxAreaCode',     'faxAreaCode',     'TEXT',   10,   'N', 'faxAreaCode',
    'lbl.faxAreaCode',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"10ch", "allowSorting":false}',
    'Area code for the account fax'),

(gen_random_uuid()::VARCHAR, 'ACCOUNTS', '230', '230019', 'FAX_NUMBER',       'faxNumber',       'faxNumber',       'TEXT',   50,   'N', 'faxNumber',
    'lbl.faxNumber',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":false}',
    'Local fax number for the account'),

-- ── 231 ACCOUNT_REG_NUMBERS ───────────────────────────────────
(gen_random_uuid()::VARCHAR, 'ACCOUNTS', '231', '231001', 'AUTHORITY_NAME',   'authorityName',   'authorityName',   'TEXT',   50,   'N', 'regNumbers$.authorityName',
    'lbl.authorityName',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"18ch", "allowSorting":true,  "codelist":"REG_AUTHORITY"}',
    'Regulatory authority for this registration number'),

(gen_random_uuid()::VARCHAR, 'ACCOUNTS', '231', '231002', 'REGISTRATION_NUMBER','registrationNumber','registrationNumber','TEXT',300,'N','regNumbers$.registrationNumber',
    'lbl.registrationNumber',
    '{"renderAs":"text",        "fieldWidth":"2", "columnWidth":"24ch", "allowSorting":true}',
    'Registration number issued by the authority'),

-- ── 232 ACCOUNT_CONTACTS ──────────────────────────────────────
(gen_random_uuid()::VARCHAR, 'ACCOUNTS', '232', '232001', 'IS_PRIMARY',       'isPrimary',       'isPrimary',       'TEXT',   1,    'N', 'contacts$.isPrimary',
    'lbl.isPrimary',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"10ch", "allowSorting":true}',
    'Marks this as the primary contact for the account'),

(gen_random_uuid()::VARCHAR, 'ACCOUNTS', '232', '232002', 'CONTACT_ID',       'contactId',       'contactId',       'TEXT',   100,  'N', 'contacts$.contactId',
    'lbl.contactId',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true,  "readOnly":true}',
    'Contact ID — display value field, auto-populated from lookup'),

(gen_random_uuid()::VARCHAR, 'ACCOUNTS', '232', '232003', 'CONTACT_NAME',     'contactName',     'contactName',     'TEXT',   300,  'N', 'contacts$.contactName',
    'lbl.contactName',
    '{"renderAs":"lookup",      "fieldWidth":"2", "columnWidth":"24ch", "allowSorting":true,  "lookupModule":"CONTACTS", "dispValField":"contactId", "lkpStoreValField":"contactId", "lkpDispValField":"firstName"}',
    'Contact name — store value field, selected via lookup from CONTACTS module'),

(gen_random_uuid()::VARCHAR, 'ACCOUNTS', '232', '232004', 'INTERCHANGE_ID',   'interchangeId',   'interchangeId',   'TEXT',   200,  'N', 'contacts$.interchangeId',
    'lbl.interchangeId',
    '{"renderAs":"text",        "fieldWidth":"2", "columnWidth":"16ch", "allowSorting":true, "renderCondition":"ACC_E2B_CNT_Y"}',
    'EDI interchange ID for this contact'),

(gen_random_uuid()::VARCHAR, 'ACCOUNTS', '232', '232005', 'E2B_CONTACT',      'e2bContact',      'e2bContact',      'TEXT',   1,    'N', 'contacts$.e2bContact',
    'lbl.e2bContact',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"10ch", "allowSorting":true}',
    'Indicates this contact receives E2B transmissions'),

(gen_random_uuid()::VARCHAR, 'ACCOUNTS', '232', '232006', 'CASE_DISTRIBUTION','caseDistribution', 'caseDistribution','TEXT',  1,    'N', 'contacts$.caseDistribution',
    'lbl.caseDistribution',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'Indicates this contact is included in case distribution'),

-- ── 233 ACCOUNT_CONTRACTS ─────────────────────────────────────
(gen_random_uuid()::VARCHAR, 'ACCOUNTS', '233', '233001', 'CONTRACT_NAME',    'contractName',    'contractName',    'TEXT',   300,  'Y', 'contracts$.contractName',
    'lbl.contractName',
    '{"renderAs":"text",        "fieldWidth":"2", "columnWidth":"24ch", "allowSorting":true}',
    'Name of the contract'),

(gen_random_uuid()::VARCHAR, 'ACCOUNTS', '233', '233002', 'FILE_NAME',        'fileName',        'fileName',        'TEXT',   300,  'N', 'contracts$.fileName',
    'lbl.fileName',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"18ch", "allowSorting":false}',
    'File name of the contract document'),

(gen_random_uuid()::VARCHAR, 'ACCOUNTS', '233', '233003', 'DOCUMENT_ID',      'documentId',      'documentId',      'TEXT',   200,  'N', 'contracts$.documentId',
    'lbl.documentId',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'Document management system ID for the contract'),

(gen_random_uuid()::VARCHAR, 'ACCOUNTS', '233', '233004', 'CONTRACT_NUMBER',  'contractNumber',  'contractNumber',  'TEXT',   200,  'N', 'contracts$.contractNumber',
    'lbl.contractNumber',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true}',
    'Official contract reference number'),

(gen_random_uuid()::VARCHAR, 'ACCOUNTS', '233', '233005', 'IS_ACTIVE',        'isActive',        'isActive',        'TEXT',   1,    'N', 'contracts$.isActive',
    'lbl.active',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"8ch",  "allowSorting":true}',
    'Indicates whether the contract is currently active'),

(gen_random_uuid()::VARCHAR, 'ACCOUNTS', '233', '233006', 'EFFECTIVE_START_DATE','effectiveStartDate','effectiveStartDate','DATE',NULL,'N','contracts$.effectiveStartDate',
    'lbl.effectiveStartDate',
    '{"renderAs":"date",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'Date from which the contract is effective'),

(gen_random_uuid()::VARCHAR, 'ACCOUNTS', '233', '233007', 'EXPIRY_DATE',      'expiryDate',      'expiryDate',      'DATE',   NULL, 'N', 'contracts$.expiryDate',
    'lbl.expiryDate',
    '{"renderAs":"date",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'Date on which the contract expires'),

(gen_random_uuid()::VARCHAR, 'ACCOUNTS', '233', '233008', 'DESCRIPTION',      'description',     'description',     'TEXT',   1000, 'N', 'contracts$.description',
    'lbl.description',
    '{"renderAs":"textarea",    "fieldWidth":"3", "columnWidth":"30ch", "allowSorting":false}',
    'Free-text description of the contract')

ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;

