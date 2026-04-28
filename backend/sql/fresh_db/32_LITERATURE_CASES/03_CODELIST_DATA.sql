-- ============================================================
-- MetaDyna API — Child Tenant Schema
-- Script  : 03_CODELIST_DATA.sql
-- Purpose : Codelist data seed for LITERATURE_CASES module
-- ============================================================
-- Enable pgcrypto for UUID generation in seed scripts


INSERT INTO CODE_LIST_LIB (ID, CODE_LIST_ID, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR,'LIT_STATUS',          'Literature Case Status'),
(gen_random_uuid()::VARCHAR,'LIT_SOURCE_TYPE',     'Literature Source Type'),
(gen_random_uuid()::VARCHAR,'LIT_LANGUAGE',        'Literature Language'),
(gen_random_uuid()::VARCHAR, 'LIT_SEARCH_STRATEGY', 'Literature Search Strategy')
ON CONFLICT (CODE_LIST_ID) DO NOTHING;

-- ── LIT_STATUS ────────────────────────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR, 'LIT_STATUS', 'NEW',       'New',       '{"en":"New"}',       1),
(gen_random_uuid()::VARCHAR, 'LIT_STATUS', 'IN_REVIEW', 'In Review', '{"en":"In Review"}', 2),
(gen_random_uuid()::VARCHAR, 'LIT_STATUS', 'ASSESSED',  'Assessed',  '{"en":"Assessed"}',  3),
(gen_random_uuid()::VARCHAR, 'LIT_STATUS', 'CLOSED',    'Closed',    '{"en":"Closed"}',    4)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── LIT_SOURCE_TYPE ───────────────────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR, 'LIT_SOURCE_TYPE', 'PUBMED', 'PubMed', '{"en":"PubMed"}', 1),
(gen_random_uuid()::VARCHAR, 'LIT_SOURCE_TYPE', 'EMBASE', 'Embase', '{"en":"Embase"}', 2),
(gen_random_uuid()::VARCHAR, 'LIT_SOURCE_TYPE', 'MANUAL', 'Manual', '{"en":"Manual"}', 3),
(gen_random_uuid()::VARCHAR, 'LIT_SOURCE_TYPE', 'OTHER',  'Other',  '{"en":"Other"}',  4)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── LIT_LANGUAGE ──────────────────────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR, 'LIT_LANGUAGE', 'EN', 'English',  '{"en":"English"}',  1),
(gen_random_uuid()::VARCHAR, 'LIT_LANGUAGE', 'FR', 'French',   '{"en":"French"}',   2),
(gen_random_uuid()::VARCHAR, 'LIT_LANGUAGE', 'DE', 'German',   '{"en":"German"}',   3),
(gen_random_uuid()::VARCHAR, 'LIT_LANGUAGE', 'ES', 'Spanish',  '{"en":"Spanish"}',  4),
(gen_random_uuid()::VARCHAR, 'LIT_LANGUAGE', 'JA', 'Japanese', '{"en":"Japanese"}', 5),
(gen_random_uuid()::VARCHAR, 'LIT_LANGUAGE', 'ZH', 'Chinese',  '{"en":"Chinese"}',  6),
(gen_random_uuid()::VARCHAR, 'LIT_LANGUAGE', 'OT', 'Other',    '{"en":"Other"}',    7)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── LIT_SEARCH_STRATEGY ───────────────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR, 'LIT_SEARCH_STRATEGY', 'WEEKLY',  'Weekly',  '{"en":"Weekly"}',  1),
(gen_random_uuid()::VARCHAR, 'LIT_SEARCH_STRATEGY', 'MONTHLY', 'Monthly', '{"en":"Monthly"}', 2),
(gen_random_uuid()::VARCHAR, 'LIT_SEARCH_STRATEGY', 'ADHOC',   'Ad Hoc',  '{"en":"Ad Hoc"}',  3)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;
