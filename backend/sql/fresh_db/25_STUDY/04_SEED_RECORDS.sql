-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 04_SEED_RECORDS.sql
-- Module  : STUDY
-- Purpose : Sample seed records for STUDY module
-- ============================================================

INSERT INTO STUDY (
    ID, PROJECT_NO, SPONSOR_STUDY_NO, IS_ACTIVE, STUDY_DETAILS, STUDY_TITLE,
    STUDY_DESIGN, PRIMARY_SOURCE, STUDY_PHASE, STUDY_TYPE,
    BLINDED_STUDY, BLINDING_TECHNIQUE, EUDRACT_NO, CODE_STATUS,
    PRIMARY_TEST_COMPOUND, CLINICALTRIALS_GOV_ID, PRIMARY_IND,
    STUDY_ACRONYM, EU_CT_REGULATION_2019, SPONSOR_CODE, SPONSOR_NAME,
    SPONSOR_ACCOUNT_ID, SPONSOR_TYPE, STUDY_START_DATE, STUDY_END_DATE,
    GLOBAL_ENROLLMENT_COUNT
) VALUES
('1',  'PROJ-2021-001', 'PG-TRAS-2021-001', 'Y',
    'Phase III randomised double-blind study of Trastuzumab in metastatic breast cancer',
    'A Phase III Study of Trastuzumab in Metastatic Breast Cancer',
    'INTERVENTIONAL', 'CLINICAL_TRIAL', 'PHASE_III', 'CLINICAL_TRIAL',
    'Y', 'DOUBLE_BLIND', '2021-001234-11', 'CODE_NOT_BROKEN',
    'Trastuzumab', 'NCT04123456', 'IND-2021-001',
    'TRAS-MBC-III', 'N', 'ACC-001', 'PharmaGlobal Inc.',
    '1', 'COMPANY_SPONSORED', '2021-03-01', '2024-02-28', '450'),

('2',  'PROJ-2020-002', 'PG-CLOZ-2020-002', 'Y',
    'Observational post-marketing study of Clozapine in treatment-resistant schizophrenia',
    'Post-Marketing Surveillance Study of Clozapine in Treatment-Resistant Schizophrenia',
    'OBSERVATIONAL', 'DRUG_MONITORING', 'PHASE_IV', 'POST_MARKETING',
    'N', NULL, NULL, 'NOT_APPLICABLE',
    'Clozapine', 'NCT03987654', NULL,
    'CLOZ-TRS-PMS', 'N', 'ACC-001', 'PharmaGlobal Inc.',
    '1', 'COMPANY_SPONSORED', '2020-06-01', '2023-05-31', '1200'),

('3',  'PROJ-2022-003', 'PG-ARIB-2022-003', 'Y',
    'Phase II open-label study of Aripiprazole in adolescent bipolar disorder',
    'A Phase II Open-Label Study of Aripiprazole in Adolescent Bipolar Disorder',
    'INTERVENTIONAL', 'CLINICAL_TRIAL', 'PHASE_II', 'CLINICAL_TRIAL',
    'N', 'OPEN_LABEL', '2022-005678-22', 'NOT_APPLICABLE',
    'Aripiprazole', 'NCT05234567', 'IND-2022-003',
    'ARIB-ABD-II', 'Y', 'ACC-001', 'PharmaGlobal Inc.',
    '1', 'COMPANY_SPONSORED', '2022-09-01', '2025-08-31', '180'),

('4',  'PROJ-2019-004', 'PG-IMAT-2019-004', 'Y',
    'Phase I dose-escalation study of investigational compound PG-101 in solid tumours',
    'A Phase I Dose-Escalation Study of PG-101 in Patients with Advanced Solid Tumours',
    'INTERVENTIONAL', 'CLINICAL_TRIAL', 'PHASE_I', 'CLINICAL_TRIAL',
    'N', 'OPEN_LABEL', '2019-009012-33', 'NOT_APPLICABLE',
    'PG-101', 'NCT04567890', 'IND-2019-004',
    'PG101-AST-I', 'N', 'ACC-001', 'PharmaGlobal Inc.',
    '1', 'COMPANY_SPONSORED', '2019-11-01', '2022-10-31', '60'),

('5',  'PROJ-2023-005', NULL, 'Y',
    'Non-interventional study to assess real-world use of PharmaGlobal oncology products',
    'Real-World Evidence Study of PharmaGlobal Oncology Portfolio',
    'OBSERVATIONAL', 'OBSERVATIONAL_STUDY', NULL, 'POST_MARKETING',
    'N', NULL, NULL, 'NOT_APPLICABLE',
    NULL, NULL, NULL,
    'RWE-ONCO-2023', 'N', 'ACC-001', 'PharmaGlobal Inc.',
    '1', 'COMPANY_SPONSORED', '2023-01-01', '2025-12-31', '5000')
ON CONFLICT (ID) DO NOTHING;

-- ── STUDY_PRODUCTS ────────────────────────────────────────────
INSERT INTO STUDY_PRODUCTS (ID, STUDY_REC_ID, PRODUCT_CODE, PRODUCT_NAME, STUDY_PRODUCT_TYPE) VALUES
('SP001', '1', 'PROD-001', 'Trastuzumab 150mg Injection', 'STUDY_PRODUCT'),
('SP002', '1', 'PROD-002', 'Placebo Injection',           'PLACEBO'),
('SP003', '2', 'PROD-003', 'Clozapine 100mg Tablet',      'STUDY_PRODUCT'),
('SP004', '3', 'PROD-004', 'Aripiprazole 10mg Tablet',    'STUDY_PRODUCT'),
('SP005', '4', 'PROD-005', 'PG-101 Injection',            'STUDY_PRODUCT')
ON CONFLICT (ID) DO NOTHING;

-- ── STUDY_REGISTRATIONS ───────────────────────────────────────
INSERT INTO STUDY_REGISTRATIONS (
    ID, STUDY_REC_ID, REGISTRATION_NUMBER, AUTHORITY, REGISTRATION_COUNTRY,
    TRIAL_STATUS, RESPONSIBLE_OPU_NAME, RESPONSIBLE_OPU_ID,
    LOCAL_APPROVAL_NUMBER, EC_REPORTING_FLAG, STUDY_REGISTRATION_DATE
) VALUES
('SR001', '1', 'NCT04123456',    'FDA',       'US', 'ONGOING',   'PharmaGlobal Inc.', '1', 'FDA-IND-2021-001', 'N', '2021-02-15'),
('SR002', '1', '2021-001234-11', 'EMA',       'EU', 'ONGOING',   'PharmaGlobal Inc.', '1', 'EMA-CTA-2021-001', 'Y', '2021-02-20'),
('SR003', '1', 'PMDA-2021-001',  'PMDA',      'JP', 'ONGOING',   'PharmaGlobal Inc.', '1', 'PMDA-CTN-2021-001','N', '2021-03-10'),
('SR004', '2', 'NCT03987654',    'FDA',       'US', 'ONGOING',   'PharmaGlobal Inc.', '1', NULL,               'N', '2020-05-20'),
('SR005', '3', 'NCT05234567',    'FDA',       'US', 'ONGOING',   'PharmaGlobal Inc.', '1', 'FDA-IND-2022-003', 'N', '2022-08-01'),
('SR006', '3', '2022-005678-22', 'EMA',       'EU', 'ONGOING',   'PharmaGlobal Inc.', '1', 'EMA-CTA-2022-003', 'Y', '2022-08-15'),
('SR007', '4', 'NCT04567890',    'FDA',       'US', 'FINALIZED', 'PharmaGlobal Inc.', '1', 'FDA-IND-2019-004', 'N', '2019-10-01')
ON CONFLICT (ID) DO NOTHING;

-- ── STUDY_CROSS_REF_INDS ──────────────────────────────────────
INSERT INTO STUDY_CROSS_REF_INDS (ID, STUDY_REC_ID, CROSS_REF_IND, STUDY_TYPE) VALUES
('CI001', '1', 'IND-2021-001', 'CLINICAL_TRIAL'),
('CI002', '1', 'IND-2018-099', 'CLINICAL_TRIAL'),
('CI003', '3', 'IND-2022-003', 'CLINICAL_TRIAL'),
('CI004', '4', 'IND-2019-004', 'CLINICAL_TRIAL')
ON CONFLICT (ID) DO NOTHING;
