-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 02_DB_METADATA.sql
-- Purpose : DB information about the module specific tables in to TABLE_METADATA and TABLE_COLUMN_METADATA
-- ============================================================

--   360  LITERATURE_CASES   root   MULTI_CONTEXT=N

INSERT INTO TABLE_METADATA (
ID,                        	MODULE_ID,           TABLE_ID,  PARENT_TABLE_ID,  DB_TABLE_NAME,      CONTEXT_NAME,  MULTI_CONTEXT,  JOIN_COLUMN,  REF_JOIN_COLUMN,  CONTEXT_PATH) VALUES
(gen_random_uuid()::VARCHAR,'LITERATURE_CASES', '360',     NULL,             'LITERATURE_CASES', '',            'N',            NULL,         NULL,             NULL)
ON CONFLICT (MODULE_ID, TABLE_ID) DO NOTHING;

INSERT INTO TABLE_COLUMN_METADATA (
ID,                        	MODULE_ID,            TABLE_ID,  FIELD_ID,   COLUMN_NAME,           FIELD_NAME,       LISTING_ALIAS,      DATA_TYPE,  MAX_LENGTH,  REQUIRED_FIELD,  FIELD_PATH) VALUES
(gen_random_uuid()::VARCHAR,'LITERATURE_CASES',  '360',     '360001',   'CASE_ID',             'caseId',           'caseId',           'TEXT',     100,         'Y',             'caseId'),
(gen_random_uuid()::VARCHAR,'LITERATURE_CASES',  '360',     '360002',   'ARTICLE_TITLE',       'articleTitle',     'articleTitle',     'TEXT',     1000,        'N',             'articleTitle'),
(gen_random_uuid()::VARCHAR,'LITERATURE_CASES',  '360',     '360003',   'JOURNAL_NAME',        'journalName',      'journalName',      'TEXT',     300,         'N',             'journalName'),
(gen_random_uuid()::VARCHAR,'LITERATURE_CASES',  '360',     '360004',   'AUTHORS',             'authors',          'authors',          'TEXT',     500,         'N',             'authors'),
(gen_random_uuid()::VARCHAR,'LITERATURE_CASES',  '360',     '360005',   'PUBLICATION_DATE',    'publicationDate',  'publicationDate',  'DATE',     NULL,        'N',             'publicationDate'),
(gen_random_uuid()::VARCHAR,'LITERATURE_CASES',  '360',     '360006',   'DOI',                 'doi',              'doi',              'TEXT',     300,         'N',             'doi'),
(gen_random_uuid()::VARCHAR,'LITERATURE_CASES',  '360',     '360007',   'SOURCE_TYPE',         'sourceType',       'sourceType',       'TEXT',     50,          'N',             'sourceType'),
(gen_random_uuid()::VARCHAR,'LITERATURE_CASES',  '360',     '360008',   'STATUS',              'status',           'status',           'TEXT',     50,          'N',             'status'),
(gen_random_uuid()::VARCHAR,'LITERATURE_CASES',  '360',     '360009',   'PRIORITY',            'priority',         'priority',         'TEXT',     20,          'N',             'priority'),
(gen_random_uuid()::VARCHAR,'LITERATURE_CASES',  '360',     '360010',   'IS_SAFETY_RELATED',   'isSafetyRelated',  'isSafetyRelated',  'TEXT',     1,           'N',             'isSafetyRelated'),
(gen_random_uuid()::VARCHAR,'LITERATURE_CASES',  '360',     '360011',   'PRODUCT_MENTIONED',   'productMentioned', 'productMentioned', 'TEXT',     300,         'N',             'productMentioned'),
(gen_random_uuid()::VARCHAR,'LITERATURE_CASES',  '360',     '360012',   'AE_TERM',             'aeTerm',           'aeTerm',           'TEXT',     500,         'N',             'aeTerm'),
(gen_random_uuid()::VARCHAR,'LITERATURE_CASES',  '360',     '360013',   'SERIOUS',             'serious',          'serious',          'TEXT',     1,           'N',             'serious'),
(gen_random_uuid()::VARCHAR,'LITERATURE_CASES',  '360',     '360014',   'CASE_REPORTABLE',     'caseReportable',   'caseReportable',   'TEXT',     1,           'N',             'caseReportable'),
(gen_random_uuid()::VARCHAR,'LITERATURE_CASES',  '360',     '360015',   'CASE_CREATED',        'caseCreated',      'caseCreated',      'TEXT',     1,           'N',             'caseCreated'),
(gen_random_uuid()::VARCHAR,'LITERATURE_CASES',  '360',     '360016',   'LINKED_CASE_ID',      'linkedCaseId',     'linkedCaseId',     'TEXT',     100,         'N',             'linkedCaseId'),
(gen_random_uuid()::VARCHAR,'LITERATURE_CASES',  '360',     '360017',   'ASSIGNED_TO',         'assignedTo',       'assignedTo',       'TEXT',     100,         'N',             'assignedTo'),
(gen_random_uuid()::VARCHAR,'LITERATURE_CASES',  '360',     '360018',   'ASSESSMENT_DATE',     'assessmentDate',   'assessmentDate',   'DATE',     NULL,        'N',             'assessmentDate'),
(gen_random_uuid()::VARCHAR,'LITERATURE_CASES',  '360',     '360019',   'ASSESSMENT_NOTES',    'assessmentNotes',  'assessmentNotes',  'TEXT',     NULL,        'N',             'assessmentNotes'),
(gen_random_uuid()::VARCHAR,'LITERATURE_CASES',  '360',     '360020',   'SEARCH_DATABASE',     'searchDatabase',   'searchDatabase',   'TEXT',     100,         'N',             'searchDatabase'),
(gen_random_uuid()::VARCHAR,'LITERATURE_CASES',  '360',     '360021',   'SEARCH_DATE',         'searchDate',       'searchDate',       'DATE',     NULL,        'N',             'searchDate'),
(gen_random_uuid()::VARCHAR,'LITERATURE_CASES',  '360',     '360022',   'SEARCH_TERMS',        'searchTerms',      'searchTerms',      'TEXT',     500,         'N',             'searchTerms'),
(gen_random_uuid()::VARCHAR,'LITERATURE_CASES',  '360',     '360023',   'SEARCHED_BY',         'searchedBy',       'searchedBy',       'TEXT',     100,         'N',             'searchedBy')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;
