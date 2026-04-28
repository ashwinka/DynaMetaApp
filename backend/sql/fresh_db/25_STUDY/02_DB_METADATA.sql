-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 02_DB_METADATA.sql
-- Module  : STUDY
-- Purpose : TABLE_METADATA and TABLE_COLUMN_METADATA
--           UI_METADATA JSON derived from listing/form metadata.
--           LABEL holds the i18n key; DESCRIPTION holds English text.
-- ============================================================

--   260  STUDY                  root        MULTI_CONTEXT=N
--   261  STUDY_PRODUCTS         parent=260  MULTI_CONTEXT=Y
--   262  STUDY_REGISTRATIONS    parent=260  MULTI_CONTEXT=Y
--   263  STUDY_CROSS_REF_INDS   parent=260  MULTI_CONTEXT=Y

INSERT INTO TABLE_METADATA (
    ID, MODULE_ID, TABLE_ID, PARENT_TABLE_ID, DB_TABLE_NAME, CONTEXT_NAME, MULTI_CONTEXT, JOIN_COLUMN, REF_JOIN_COLUMN, CONTEXT_PATH)
VALUES
    (gen_random_uuid()::VARCHAR, 'STUDY', '260', NULL,  'STUDY',                  '',               'N', NULL,          NULL, NULL),
    (gen_random_uuid()::VARCHAR, 'STUDY', '261', '260', 'STUDY_PRODUCTS',         'studyProducts',  'Y', 'STUDY_REC_ID','ID', 'studyProducts$'),
    (gen_random_uuid()::VARCHAR, 'STUDY', '262', '260', 'STUDY_REGISTRATIONS',    'studyRegs',      'Y', 'STUDY_REC_ID','ID', 'studyRegs$'),
    (gen_random_uuid()::VARCHAR, 'STUDY', '263', '260', 'STUDY_CROSS_REF_INDS',   'crossRefInds',   'Y', 'STUDY_REC_ID','ID', 'crossRefInds$')
ON CONFLICT (MODULE_ID, TABLE_ID) DO NOTHING;

INSERT INTO TABLE_COLUMN_METADATA (
    ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION)
VALUES
-- ── 260 STUDY ────────────────────────────────────────────────
(gen_random_uuid()::VARCHAR, 'STUDY', '260', '260001', 'PROJECT_NO',               'projectNo',              'projectNo',              'TEXT',   300,  'Y', 'projectNo',
    'lbl.projectNo',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true,  "primaryKey":true}',
    'Unique project number for the study'),

(gen_random_uuid()::VARCHAR, 'STUDY', '260', '260002', 'SPONSOR_STUDY_NO',         'sponsorStudyNo',         'sponsorStudyNo',         'TEXT',   300,  'N', 'sponsorStudyNo',
    'lbl.sponsorStudyNo',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true}',
    'Sponsor-assigned study number'),

(gen_random_uuid()::VARCHAR, 'STUDY', '260', '260003', 'IS_ACTIVE',                'isActive',               'isActive',               'TEXT',   1,    'N', 'isActive',
    'lbl.active',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"8ch",  "allowSorting":true,  "align":"center"}',
    'Indicates whether the study is active'),

(gen_random_uuid()::VARCHAR, 'STUDY', '260', '260004', 'STUDY_TITLE',              'studyTitle',             'studyTitle',             'TEXT',   300,  'Y', 'studyTitle',
    'lbl.studyTitle',
    '{"renderAs":"text",        "fieldWidth":"3", "columnWidth":"36ch", "allowSorting":true}',
    'Full title of the study'),

(gen_random_uuid()::VARCHAR, 'STUDY', '260', '260005', 'STUDY_DETAILS',            'studyDetails',           'studyDetails',           'TEXT',   1000, 'N', 'studyDetails',
    'lbl.studyDetails',
    '{"renderAs":"textarea",    "fieldWidth":"3", "columnWidth":"30ch", "allowSorting":false}',
    'Detailed description of the study'),

(gen_random_uuid()::VARCHAR, 'STUDY', '260', '260006', 'STUDY_DESIGN',             'studyDesign',            'studyDesign',            'TEXT',   50,   'N', 'studyDesign',
    'lbl.studyDesign',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true,  "codelist":"STUDY_DESIGN"}',
    'Design type of the study'),

(gen_random_uuid()::VARCHAR, 'STUDY', '260', '260007', 'PRIMARY_SOURCE',           'primarySource',          'primarySource',          'TEXT',   50,   'N', 'primarySource',
    'lbl.primarySource',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"18ch", "allowSorting":true,  "codelist":"STUDY_PRIMARY_SOURCE"}',
    'Primary source category for the study'),

(gen_random_uuid()::VARCHAR, 'STUDY', '260', '260008', 'STUDY_PHASE',              'studyPhase',             'studyPhase',             'TEXT',   50,   'N', 'studyPhase',
    'lbl.studyPhase',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true,  "codelist":"STUDY_PHASE"}',
    'Clinical development phase of the study'),

(gen_random_uuid()::VARCHAR, 'STUDY', '260', '260009', 'STUDY_TYPE',               'studyType',              'studyType',              'TEXT',   50,   'N', 'studyType',
    'lbl.studyType',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"18ch", "allowSorting":true,  "codelist":"STUDY_TYPE"}',
    'Type / category of the study'),

(gen_random_uuid()::VARCHAR, 'STUDY', '260', '260010', 'BLINDED_STUDY',            'blindedStudy',           'blindedStudy',           'TEXT',   1,    'N', 'blindedStudy',
    'lbl.blindedStudy',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":true}',
    'Indicates whether the study is blinded'),

(gen_random_uuid()::VARCHAR, 'STUDY', '260', '260011', 'BLINDING_TECHNIQUE',       'blindingTechnique',      'blindingTechnique',      'TEXT',   50,   'N', 'blindingTechnique',
    'lbl.blindingTechnique',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true,  "codelist":"BLINDING_TECHNIQUE"}',
    'Blinding technique used in the study'),

(gen_random_uuid()::VARCHAR, 'STUDY', '260', '260012', 'EUDRACT_NO',               'eudractNo',              'eudractNo',              'TEXT',   200,  'N', 'eudractNo',
    'lbl.eudractNo',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true}',
    'EudraCT registration number'),

(gen_random_uuid()::VARCHAR, 'STUDY', '260', '260013', 'CODE_STATUS',              'codeStatus',             'codeStatus',             'TEXT',   50,   'N', 'codeStatus',
    'lbl.codeStatus',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true,  "codelist":"CODE_STATUS"}',
    'Blinding code status of the study'),

(gen_random_uuid()::VARCHAR, 'STUDY', '260', '260014', 'PRIMARY_TEST_COMPOUND',    'primaryTestCompound',    'primaryTestCompound',    'TEXT',   300,  'N', 'primaryTestCompound',
    'lbl.primaryTestCompound',
    '{"renderAs":"text",        "fieldWidth":"2", "columnWidth":"20ch", "allowSorting":true}',
    'Primary test compound / investigational product'),

(gen_random_uuid()::VARCHAR, 'STUDY', '260', '260015', 'CODE_BROKEN_ON',           'codeBrokenOn',           'codeBrokenOn',           'DATE',   NULL, 'N', 'codeBrokenOn',
    'lbl.codeBrokenOn',
    '{"renderAs":"date",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'Date on which the blinding code was broken'),

(gen_random_uuid()::VARCHAR, 'STUDY', '260', '260016', 'CLINICALTRIALS_GOV_ID',    'clinicaltrialsGovId',    'clinicaltrialsGovId',    'TEXT',   200,  'N', 'clinicaltrialsGovId',
    'lbl.clinicaltrialsGovId',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true}',
    'ClinicalTrials.gov registration identifier'),

(gen_random_uuid()::VARCHAR, 'STUDY', '260', '260017', 'STUDY_DESIGN_DESCRIPTION', 'studyDesignDescription', 'studyDesignDescription', 'TEXT',   1000, 'N', 'studyDesignDescription',
    'lbl.studyDesignDescription',
    '{"renderAs":"textarea",    "fieldWidth":"3", "columnWidth":"30ch", "allowSorting":false}',
    'Detailed description of the study design'),

(gen_random_uuid()::VARCHAR, 'STUDY', '260', '260018', 'PRIMARY_IND',              'primaryInd',             'primaryInd',             'TEXT',   200,  'N', 'primaryInd',
    'lbl.primaryInd',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'Primary IND number'),

(gen_random_uuid()::VARCHAR, 'STUDY', '260', '260019', 'PANDA',                    'panda',                  'panda',                  'TEXT',   200,  'N', 'panda',
    'lbl.panda',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'PANDA reference number'),

(gen_random_uuid()::VARCHAR, 'STUDY', '260', '260020', 'PROTOCOL_DETAILS',         'protocolDetails',        'protocolDetails',        'TEXT',   1000, 'N', 'protocolDetails',
    'lbl.protocolDetails',
    '{"renderAs":"textarea",    "fieldWidth":"3", "columnWidth":"30ch", "allowSorting":false}',
    'Protocol details and amendments'),

(gen_random_uuid()::VARCHAR, 'STUDY', '260', '260021', 'STUDY_ACRONYM',            'studyAcronym',           'studyAcronym',           'TEXT',   100,  'N', 'studyAcronym',
    'lbl.studyAcronym',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":true}',
    'Short acronym or code name for the study'),

(gen_random_uuid()::VARCHAR, 'STUDY', '260', '260022', 'EU_CT_REGULATION_2019',    'euCtRegulation2019',     'euCtRegulation2019',     'TEXT',   1,    'N', 'euCtRegulation2019',
    'lbl.euCtRegulation2019',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true}',
    'Indicates whether the study falls under EU CT Regulation 2019/536'),

(gen_random_uuid()::VARCHAR, 'STUDY', '260', '260023', 'CTD_TO_CTR_TRANSITION_DATE','ctdToCtrTransitionDate', 'ctdToCtrTransitionDate', 'DATE',   NULL, 'N', 'ctdToCtrTransitionDate',
    'lbl.ctdToCtrTransitionDate',
    '{"renderAs":"date",        "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true}',
    'Date of transition from CTD to CTR framework'),

(gen_random_uuid()::VARCHAR, 'STUDY', '260', '260024', 'SPONSOR_CODE',             'sponsorCode',            'sponsorCode',            'TEXT',   100,  'N', 'sponsorCode',
    'lbl.sponsorCode',
    '{"renderAs":"lookup",      "fieldWidth":"1", "columnWidth":"24ch", "allowSorting":true,  "lookupModule":"ACCOUNTS", "dispValField":"sponsorName", "lkpStoreValField":"accId", "lkpDispValField":"accName"}',
    'Sponsor account code — auto-populated from lookup'),

(gen_random_uuid()::VARCHAR, 'STUDY', '260', '260025', 'SPONSOR_NAME',             'sponsorName',            'sponsorName',            'TEXT',   300,  'N', 'sponsorName',
    'lbl.sponsorName',
    '{"renderAs":"text",        "fieldWidth":"2", "columnWidth":"14ch", "allowSorting":true}',
    'Sponsor name — selected via lookup from ACCOUNTS module'),

(gen_random_uuid()::VARCHAR, 'STUDY', '260', '260026', 'SPONSOR_TYPE',             'sponsorType',            'sponsorType',            'TEXT',   50,   'N', 'sponsorType',
    'lbl.sponsorType',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"18ch", "allowSorting":true,  "codelist":"SPONSOR_TYPE"}',
    'Type of sponsorship for the study'),

(gen_random_uuid()::VARCHAR, 'STUDY', '260', '260027', 'STUDY_START_DATE',         'studyStartDate',         'studyStartDate',         'DATE',   NULL, 'N', 'studyStartDate',
    'lbl.studyStartDate',
    '{"renderAs":"date",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'Planned or actual start date of the study'),

(gen_random_uuid()::VARCHAR, 'STUDY', '260', '260028', 'STUDY_END_DATE',           'studyEndDate',           'studyEndDate',           'DATE',   NULL, 'N', 'studyEndDate',
    'lbl.studyEndDate',
    '{"renderAs":"date",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'Planned or actual end date of the study'),

(gen_random_uuid()::VARCHAR, 'STUDY', '260', '260029', 'GLOBAL_ENROLLMENT_COUNT',  'globalEnrollmentCount',  'globalEnrollmentCount',  'TEXT',   50,   'N', 'globalEnrollmentCount',
    'lbl.globalEnrollmentCount',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'Total global patient enrollment count'),

-- ── 261 STUDY_PRODUCTS ───────────────────────────────────────
(gen_random_uuid()::VARCHAR, 'STUDY', '261', '261001', 'PRODUCT_CODE',             'productCode',            'productCode',            'TEXT',   100,  'N', 'studyProducts$.productCode',
    'lbl.productCode',
    '{"renderAs":"lookup",      "fieldWidth":"1", "columnWidth":"24ch", "allowSorting":true,  "lookupModule":"PRODUCTS", "dispValField":"productName", "lkpStoreValField":"productCode", "lkpDispValField":"productName"}',
    'Product code — auto-populated from lookup'),

(gen_random_uuid()::VARCHAR, 'STUDY', '261', '261002', 'PRODUCT_NAME',             'productName',            'productName',            'TEXT',   300,  'N', 'studyProducts$.productName',
    'lbl.productName',
    '{"renderAs":"text",        "fieldWidth":"2", "columnWidth":"14ch", "allowSorting":true}',
    'Product name — selected via lookup from PRODUCTS module'),

(gen_random_uuid()::VARCHAR, 'STUDY', '261', '261003', 'STUDY_PRODUCT_TYPE',       'studyProductType',       'studyProductType',       'TEXT',   50,   'N', 'studyProducts$.studyProductType',
    'lbl.studyProductType',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"20ch", "allowSorting":true,  "codelist":"STUDY_PRODUCT_TYPE"}',
    'Role of the product in the study'),

-- ── 262 STUDY_REGISTRATIONS ──────────────────────────────────
(gen_random_uuid()::VARCHAR, 'STUDY', '262', '262001', 'REGISTRATION_NUMBER',      'registrationNumber',     'registrationNumber',     'TEXT',   100,  'Y', 'studyRegs$.registrationNumber',
    'lbl.registrationNumber',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true}',
    'Official registration number for the study'),

(gen_random_uuid()::VARCHAR, 'STUDY', '262', '262002', 'AUTHORITY',                'authority',              'authority',              'TEXT',   50,   'N', 'studyRegs$.authority',
    'lbl.authority',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true,  "codelist":"REG_AUTHORITY"}',
    'Regulatory authority that issued the registration'),

(gen_random_uuid()::VARCHAR, 'STUDY', '262', '262003', 'REGISTRATION_COUNTRY',     'registrationCountry',    'registrationCountry',    'TEXT',   10,   'N', 'studyRegs$.registrationCountry',
    'lbl.registrationCountry',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true,  "codelist":"COUNTRY"}',
    'Country in which the study is registered'),

(gen_random_uuid()::VARCHAR, 'STUDY', '262', '262004', 'TRIAL_STATUS',             'trialStatus',            'trialStatus',            'TEXT',   50,   'N', 'studyRegs$.trialStatus',
    'lbl.trialStatus',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":true,  "codelist":"TRIAL_STATUS"}',
    'Current status of the trial registration'),

(gen_random_uuid()::VARCHAR, 'STUDY', '262', '262005', 'RESPONSIBLE_OPU_NAME',     'responsibleOpuName',     'responsibleOpuName',     'TEXT',   300,  'N', 'studyRegs$.responsibleOpuName',
    'lbl.responsibleOpu',
    '{"renderAs":"lookup",      "fieldWidth":"2", "columnWidth":"22ch", "allowSorting":true,  "lookupModule":"ACCOUNTS", "lkpStoreValField":"accId"}',
    'Responsible Operating Unit — selected via lookup from ACCOUNTS'),

(gen_random_uuid()::VARCHAR, 'STUDY', '262', '262006', 'LOCAL_APPROVAL_NUMBER',    'localApprovalNumber',    'localApprovalNumber',    'TEXT',   200,  'N', 'studyRegs$.localApprovalNumber',
    'lbl.localApprovalNumber',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true}',
    'Local ethics committee or authority approval number'),

(gen_random_uuid()::VARCHAR, 'STUDY', '262', '262007', 'EC_REPORTING_FLAG',        'ecReportingFlag',        'ecReportingFlag',        'TEXT',   1,    'N', 'studyRegs$.ecReportingFlag',
    'lbl.ecReportingFlag',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":true}',
    'Flag indicating EC reporting obligation for this registration'),

(gen_random_uuid()::VARCHAR, 'STUDY', '262', '262008', 'STUDY_REGISTRATION_DATE',  'studyRegistrationDate',  'studyRegistrationDate',  'DATE',   NULL, 'N', 'studyRegs$.studyRegistrationDate',
    'lbl.studyRegistrationDate',
    '{"renderAs":"date",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'Date the study was registered with the authority'),

-- ── 263 STUDY_CROSS_REF_INDS ─────────────────────────────────
(gen_random_uuid()::VARCHAR, 'STUDY', '263', '263001', 'CROSS_REF_IND',            'crossRefInd',            'crossRefInd',            'TEXT',   100,  'Y', 'crossRefInds$.crossRefInd',
    'lbl.crossRefInd',
    '{"renderAs":"text",        "fieldWidth":"2", "columnWidth":"20ch", "allowSorting":true}',
    'Cross-referenced IND number'),

(gen_random_uuid()::VARCHAR, 'STUDY', '263', '263002', 'STUDY_TYPE',               'studyType',              'studyType',              'TEXT',   50,   'N', 'crossRefInds$.studyType',
    'lbl.studyType',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"18ch", "allowSorting":true,  "codelist":"STUDY_TYPE"}',
    'Study type associated with this cross-referenced IND')

ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;
