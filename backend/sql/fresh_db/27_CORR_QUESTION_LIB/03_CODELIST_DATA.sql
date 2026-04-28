-- ============================================================
-- MetaDyna API — Child Tenant Schema
-- Script  : 03_CODELIST_DATA.sql
-- Purpose : Codelist data seed for CORR_QUESTION_LIB module
-- ============================================================
-- Enable pgcrypto for UUID generation in seed scripts


INSERT INTO CODE_LIST_LIB (ID, CODE_LIST_ID, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR, 'CQL_CATEGORY',      'Correspondence Question Category'),
(gen_random_uuid()::VARCHAR, 'CQL_RESPONSE_TYPE', 'Correspondence Question Response Type'),
(gen_random_uuid()::VARCHAR, 'CQL_APPLICABLE_TO', 'Correspondence Question Applicable To')
ON CONFLICT (CODE_LIST_ID) DO NOTHING;

-- ── CQL_CATEGORY ──────────────────────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR, 'CQL_CATEGORY', 'CLINICAL',    'Clinical',           '{"en":"Clinical"}',           1),
(gen_random_uuid()::VARCHAR, 'CQL_CATEGORY', 'REGULATORY',  'Regulatory',         '{"en":"Regulatory"}',         2),
(gen_random_uuid()::VARCHAR, 'CQL_CATEGORY', 'PRODUCT',     'Product',            '{"en":"Product"}',            3),
(gen_random_uuid()::VARCHAR, 'CQL_CATEGORY', 'PATIENT',     'Patient',            '{"en":"Patient"}',            4),
(gen_random_uuid()::VARCHAR, 'CQL_CATEGORY', 'REPORTER',    'Reporter',           '{"en":"Reporter"}',           5),
(gen_random_uuid()::VARCHAR, 'CQL_CATEGORY', 'OTHER',       'Other',              '{"en":"Other"}',              6)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── CQL_RESPONSE_TYPE ─────────────────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR, 'CQL_RESPONSE_TYPE', 'FREE_TEXT', 'Free Text', '{"en":"Free Text"}', 1),
(gen_random_uuid()::VARCHAR, 'CQL_RESPONSE_TYPE', 'DATE',      'Date',      '{"en":"Date"}',      2),
(gen_random_uuid()::VARCHAR, 'CQL_RESPONSE_TYPE', 'YES_NO',    'Yes / No',  '{"en":"Yes / No"}',  3),
(gen_random_uuid()::VARCHAR, 'CQL_RESPONSE_TYPE', 'CODELIST',  'Codelist',  '{"en":"Codelist"}',  4),
(gen_random_uuid()::VARCHAR, 'CQL_RESPONSE_TYPE', 'NUMBER',    'Number',    '{"en":"Number"}',    5)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── CQL_APPLICABLE_TO ─────────────────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR, 'CQL_APPLICABLE_TO', 'ICSR',        'ICSR Cases',        '{"en":"ICSR Cases"}',        1),
(gen_random_uuid()::VARCHAR, 'CQL_APPLICABLE_TO', 'LITERATURE',  'Literature Cases',  '{"en":"Literature Cases"}',  2),
(gen_random_uuid()::VARCHAR, 'CQL_APPLICABLE_TO', 'EMAIL',       'Email Cases',       '{"en":"Email Cases"}',       3),
(gen_random_uuid()::VARCHAR, 'CQL_APPLICABLE_TO', 'ALL',         'All',               '{"en":"All"}',               4)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;
