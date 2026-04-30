-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 04_SEED_RECORDS.sql
-- Module  : ICSR
-- Purpose : Sample seed records covering:
--           Case 1 — Spontaneous, serious (death), adult female
--           Case 2 — Study report, non-serious, adult male
--           Case 3 — Literature case, pregnancy exposure
--           Case 4 — Spontaneous, device-related
--           Case 5 — Spontaneous, paediatric, vaccine
-- ============================================================

-- ============================================================
-- ICSR_CASES
-- ============================================================
INSERT INTO ICSR_CASES (
    ID, SAFETY_REPORT_ID, SAFETY_REPORT_VERSION, AUTHORITY_NUMB,
    INITIAL_SENDER, PRIMARY_SRC_COUNTRY, RECEIVE_DATE, RECEIPT_DATE,
    REPORT_TYPE, SERIOUSNESS_AS_PER_COMPANY, DEATH, LIFE_THREATENING,
    HOSPITALIZATION, DISABLING, CONGENITAL_ANOMALY, OTHER_SERIOUS,
    COMPANY_INITIAL_RECEIVED_DATE, 
    REPORT_CLASSIFICATION, 
    PRIORITY, CREATED_AT
) VALUES
('CASE-001', 'PG-2024-001', '1', NULL,
 '01', 'US', '2024-01-15', '2024-01-15',
 '1', 'Y', 'Y', 'N', 'Y', 'N', 'N', 'N',
  NULL,
 'Pregnancy-Mother', 
 'High', NOW()),

('CASE-002', 'PG-2024-002', '1', 'IND-2024-001',
 '01', 'GB', '2024-02-10', '2024-02-10',
 '2', 'N', 'N', 'N', 'N', 'N', 'N', 'N',
  NULL,
 NULL, 
 'Medium', NOW()),

('CASE-003', 'PG-2024-003', '1', NULL,
 '01', 'FR', '2024-03-05', '2024-03-05',
 '3', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N',
  NULL,
 'Pregnancy-Child', 
 'High', NOW()),

('CASE-004', 'PG-2024-004', '1', NULL,
 '01', 'DE', '2024-04-20', '2024-04-20',
 '1', 'Y', 'N', 'N', 'Y', 'N', 'N', 'N',
 NULL,
 NULL, 
 'Medium', NOW()),

('CASE-005', 'PG-2024-005', '1', NULL,
 '01', 'JP', '2024-05-08', '2024-05-08',
 '1', 'Y', 'N', 'N', 'Y', 'N', 'N', 'N',
 NULL,
 NULL,
 'High', NOW())
ON CONFLICT (ID) DO NOTHING;

-- ============================================================
-- ICSR_REPORTER_INFORMATIONS
-- ============================================================
INSERT INTO ICSR_REPORTER_INFORMATIONS (
    ID, CASE_ID, REPORTER_TYPE, REPORTER_TITLE, REPORTER_GIVEN_NAME,
    REPORTER_FAMILY_NAME, REPORTER_ORGANIZATION, REPORTER_DEPARTMENT,
    REPORTER_STREET, REPORTER_CITY, REPORTER_STATE, REPORTER_POSTCODE,
    REPORTER_COUNTRY, PHONE, EMAIL,
    OCCUPATION, PRIMARY_REPORTER
) VALUES
('REP-001', 'CASE-001', '1', 'DR', 'Helen',   'Brooks',   'PharmaGlobal Inc.',     'Pharmacovigilance', '100 Pharma Way',     'Boston', 'MA',  '02101',    'US', '+16175550211', 'h.brooks@pharmaco.com',     'MD', 'Y'),
('REP-002', 'CASE-002', '3', 'DR', 'Robert',  'Williams', 'City General Hospital', 'Internal Medicine', '100 Hospital Drive', 'Boston', 'MA',  '02101',    'US', '+16175550201', 'r.williams@citygeneral.com','MD', 'Y'),
('REP-003', 'CASE-003', '5', NULL, NULL,       NULL,       'Journal of Pharmacology',NULL,              NULL,                 'Paris',  NULL,  NULL,       'FR', NULL,           NULL,                        NULL, 'N'),
('REP-004', 'CASE-004', '1', 'DR', 'Klaus',   'Bauer',    'Charité Berlin',        'Cardiology',        '1 Charitéplatz',     'Berlin', NULL,  '10117',    'DE', '+493055550203','k.bauer@charite.de',        'MD', 'Y'),
('REP-005', 'CASE-005', '1', 'DR', 'Hiroshi', 'Nakamura', 'PMDA',                  'Pharmacovigilance', '3-3-2 Kasumigaseki', 'Tokyo',  NULL,  '100-0013', 'JP', '+81355550215', 'h.nakamura@pmda.go.jp',     'MD', 'Y')
ON CONFLICT (ID) DO NOTHING;

-- ============================================================
-- ICSR_SOURCE_INFORMATIONS
-- ============================================================
INSERT INTO ICSR_SOURCE_INFORMATIONS (
    ID, CASE_ID, SOURCE, SENDER_ORGANISATION_TYPE, DESCRIPTION,
    ORIGINATING_ACCOUNT, FOLLOW_UP
) VALUES
('SRC-001', 'CASE-001', '01', 'PHARMA_CO', 'Global Pharmacovigilance — PharmaGlobal Inc.', NULL, 'N'),
('SRC-002', 'CASE-002', '01', 'PHARMA_CO', 'Global Pharmacovigilance — PharmaGlobal Inc.', NULL, 'N'),
('SRC-003', 'CASE-003', '01', 'PHARMA_CO', 'Global Pharmacovigilance — PharmaGlobal Inc.', NULL, 'N'),
('SRC-004', 'CASE-004', '01', 'PHARMA_CO', 'Global Pharmacovigilance — PharmaGlobal Inc.', NULL, 'N'),
('SRC-005', 'CASE-005', '01', 'PHARMA_CO', 'Global Pharmacovigilance — PharmaGlobal Inc.', NULL, 'N')
ON CONFLICT (ID) DO NOTHING;

-- ============================================================
-- ICSR_PATIENT
-- ============================================================
INSERT INTO ICSR_PATIENT (
    ID, CASE_ID,
    PATIENT_INITIAL, PAT_SEX, PAT_DOB, PAT_ONSET_AGE, PAT_ONSET_AGE_UNIT,
    PAT_AGE_GROUP, PAT_WEIGHT, PAT_WEIGHT_UNIT, PAT_HEIGHT, PAT_HEIGHT_UNIT,
    PAT_DEATH_DATE, PAT_AUTOPSY_YES_NO, PAT_PREGNANT, DO_NOT_REPORT_NAME
) VALUES
('PAT-001', 'CASE-001', 'H.B.', '2', '1979-03-12', '45', '801', '5', '68', '1', '165', '1', '2024-01-10', '1', NULL, 'N'),
('PAT-002', 'CASE-002', 'J.D.', '1', '1972-07-22', '52', '801', '5', '82', '1', '178', '1', NULL,         'N', NULL, 'N'),
('PAT-003', 'CASE-003', 'M.L.', '2', '1996-05-14', '28', '801', '5', '62', '1', '162', '1', NULL,         'N', '1',  'N'),
('PAT-004', 'CASE-004', 'K.S.', '1', '1963-11-30', '61', '801', '5', '88', '1', '175', '1', NULL,         'N', NULL, 'N'),
('PAT-005', 'CASE-005', 'A.T.', '2', '2022-02-01', '2',  '801', '2', '12', '1', '88',  '1', NULL,         'N', NULL, 'N')
ON CONFLICT (ID) DO NOTHING;

-- ============================================================
-- ICSR_EVENT_REACTIONS
-- ============================================================
INSERT INTO ICSR_EVENT_REACTIONS (
    ID, CASE_ID,
    REACTION_TERM, REACT_MEDDRA_LLT_CODE, REACT_MEDDRA_PT_CODE,
    TERM_HIGHLIGHTED, REACT_START_DATE, REACT_OUTCOME, SERIOUSNESS,
    DEATH, LIFE_THREATENING, HOSPITALIZATION, DISABILITY,
    CONGENITAL_ANOMALY, NON_SERIOUS, SEVERITY, CODING_TYPE, RANK_ORDER
) VALUES
('EVT-001', 'CASE-001', 'Acute hepatic failure',             '10019663', '10019663', '1', '2024-01-05', '5', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'N', '3', 'A', '1'),
('EVT-002', 'CASE-001', 'Jaundice',                          '10023126', '10023126', '1', '2023-12-20', '4', 'Y', 'N', 'N', 'Y', 'N', 'N', 'N', '2', 'A', '2'),
('EVT-003', 'CASE-002', 'Alanine aminotransferase increased','10001551', '10001551', '1', '2024-01-28', '1', 'N', 'N', 'N', 'N', 'N', 'N', 'Y', '1', 'A', '1'),
('EVT-004', 'CASE-003', 'Ventricular septal defect',         '10047115', '10047115', '1', '2024-02-15', '3', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', '3', 'A', '1'),
('EVT-005', 'CASE-004', 'Device malfunction',                '10051592', '10051592', '1', '2024-04-18', '3', 'Y', 'N', 'N', 'Y', 'N', 'N', 'N', '2', 'A', '1'),
('EVT-006', 'CASE-005', 'Febrile convulsion',                '10016284', '10016284', '1', '2024-05-06', '1', 'Y', 'N', 'N', 'Y', 'N', 'N', 'N', '2', 'A', '1')
ON CONFLICT (ID) DO NOTHING;

-- ============================================================
-- ICSR_DRUG_PRODUCTS
-- ============================================================
INSERT INTO ICSR_DRUG_PRODUCTS (
    ID, CASE_ID, REPORTED_MEDICINAL_PRODUCT, DRUG_CHARACTERIZATION,
    PRODUCT_TYPE, MANUFACTURER_NAME, ACTION_DRUG, DECHALLENGE
) VALUES
('DRG-001', 'CASE-001', 'HEPATOVIR 400mg',    '1', 'DRUG',    'PharmaGlobal Inc.', '1', '1'),
('DRG-002', 'CASE-001', 'Paracetamol 500mg',  '2', 'DRUG',    'Generic Pharma',    '4', NULL),
('DRG-003', 'CASE-002', 'PG-TRIAL-001 50mg',  '1', 'DRUG',    'PharmaGlobal Inc.', '4', '1'),
('DRG-004', 'CASE-003', 'TERATOVIR 200mg',    '1', 'DRUG',    'PharmaGlobal Inc.', '1', NULL),
('DRG-005', 'CASE-004', 'CardioMonitor Pro X', '1', 'DEVICE',  'MedDevice GmbH',    '6', NULL),
('DRG-006', 'CASE-005', 'MMR-VAX II',          '1', 'VACCINE', 'VaccineCo Ltd.',    '4', NULL)
ON CONFLICT (ID) DO NOTHING;

-- ============================================================
-- ICSR_DRUG_THERAPIES
-- ============================================================
INSERT INTO ICSR_DRUG_THERAPIES (
    ID, DRUG_ID, DRUG_START_DATE, DRUG_END_DATE, THERAPY_ONGOING,
    DRUG_ADMIN_ROUTE, DRUG_UNIT_DOSE_NUMB, DRUG_UNIT_DOSE_UNIT,
    DRUG_FREQUENCY_NUMB, DRUG_FREQ_TIME_UNIT
) VALUES
('THR-001', 'DRG-001', '2023-10-01', '2024-01-05', 'N', 'ORAL', '400', 'mg', '1', '804'),
('THR-002', 'DRG-002', '2023-11-01', '2024-01-05', 'N', 'ORAL', '500', 'mg', '3', '804'),
('THR-003', 'DRG-003', '2024-01-10', NULL,          'Y', 'ORAL', '50',  'mg', '1', '804'),
('THR-004', 'DRG-004', '2023-08-01', '2023-11-30', 'N', 'ORAL', '200', 'mg', '2', '804'),
('THR-005', 'DRG-006', '2024-05-05', '2024-05-05', 'N', 'IM',   '0.5', 'mL', '1', '804')
ON CONFLICT (ID) DO NOTHING;

-- ============================================================
-- ICSR_DRUG_INDICATIONS
-- ============================================================
INSERT INTO ICSR_DRUG_INDICATIONS (
    ID, DRUG_ID, DRUG_INDICATION, DRUG_INDICATION_LLT_CODE
) VALUES
('IND-001', 'DRG-001', 'Hepatitis C',         '10019617'),
('IND-002', 'DRG-002', 'Pain management',      '10033371'),
('IND-003', 'DRG-003', 'Type 2 Diabetes',      '10067585'),
('IND-004', 'DRG-004', 'Rheumatoid Arthritis', '10039073'),
('IND-005', 'DRG-006', 'Immunisation',         '10021281')
ON CONFLICT (ID) DO NOTHING;

-- ============================================================
-- ICSR_DRUG_REACTION_RELATEDNESS
-- ============================================================
INSERT INTO ICSR_DRUG_REACTION_RELATEDNESS (
    ID, DRUG_ID, REACTION_NAME, FK_AR_REC_ID,
    ACTION_DRUG, DECHALLENGE, COMPANY_CAUSALITY, REPORTER_CAUSALITY
) VALUES
('REL-001', 'DRG-001', 'Acute hepatic failure',              'EVT-001', '1', '1', '2', '2'),
('REL-002', 'DRG-001', 'Jaundice',                           'EVT-002', '1', '1', '2', '2'),
('REL-003', 'DRG-003', 'Alanine aminotransferase increased', 'EVT-003', '4', '1', '3', '3'),
('REL-004', 'DRG-004', 'Ventricular septal defect',          'EVT-004', '1', NULL,'2', '2'),
('REL-005', 'DRG-006', 'Febrile convulsion',                 'EVT-006', '4', '1', '3', '3')
ON CONFLICT (ID) DO NOTHING;

-- ============================================================
-- ICSR_DRUG_REACTION_LABELLINGS
-- ============================================================
INSERT INTO ICSR_DRUG_REACTION_LABELLINGS (
    ID, RELATEDNESS_ID, COUNTRY, LABELLING_STATUS, LABELLING_VERSION, SUSAR
) VALUES
('LBL-001', 'REL-001', 'US', '2', '2024-Q1', 'Y'),
('LBL-002', 'REL-001', 'GB', '2', '2024-Q1', 'Y'),
('LBL-003', 'REL-002', 'US', '1', '2024-Q1', 'N'),
('LBL-004', 'REL-003', 'US', '1', '2024-Q1', 'N'),
('LBL-005', 'REL-004', 'FR', '2', '2024-Q1', 'Y')
ON CONFLICT (ID) DO NOTHING;

-- ============================================================
-- ICSR_DRUG_APPROVALS
-- ============================================================
INSERT INTO ICSR_DRUG_APPROVALS (
    ID, DRUG_ID, AUTHORIZATION_NUMBER, AUTHORIZATION_TYPE,
    AUTHORIZATION_COUNTRY, TRADE_NAME
) VALUES
('APR-001', 'DRG-001', 'NDA-21-4001',  '1', 'US', 'HEPATOVIR'),
('APR-002', 'DRG-001', 'EU/1/21/4001', '1', 'GB', 'HEPATOVIR'),
('APR-003', 'DRG-003', 'IND-2024-001', '3', 'US', 'PG-TRIAL-001'),
('APR-004', 'DRG-004', 'NDA-21-4002',  '1', 'US', 'TERATOVIR'),
('APR-005', 'DRG-004', 'EU/1/21/4002', '1', 'FR', 'TERATOVIR')
ON CONFLICT (ID) DO NOTHING;

-- ============================================================
-- ICSR_PATIENT_MEDICAL_HISTORIES
-- ============================================================
INSERT INTO ICSR_PATIENT_MEDICAL_HISTORIES (
    ID, CASE_ID, MEDICAL_EPISODE_NAME, MEDICAL_START_DATE,
    MEDICAL_CONTINUE, DISEASE_TYPE
) VALUES
('MH-001', 'CASE-001', 'Hepatitis C',           '2020-06-01', 'N', '5001'),
('MH-002', 'CASE-001', 'Hypertension',           '2018-01-01', 'Y', '5001'),
('MH-003', 'CASE-002', 'Type 2 Diabetes',        '2019-03-15', 'Y', '5001'),
('MH-004', 'CASE-002', 'Hyperlipidaemia',         '2020-07-01', 'Y', '5001'),
('MH-005', 'CASE-003', 'Rheumatoid Arthritis',   '2022-01-10', 'Y', '5001'),
('MH-006', 'CASE-004', 'Coronary artery disease','2015-05-20', 'Y', '5001'),
('MH-007', 'CASE-005', 'No significant history', NULL,         'N', '5002')
ON CONFLICT (ID) DO NOTHING;

-- ============================================================
-- ICSR_LAB_TESTS
-- ============================================================
INSERT INTO ICSR_LAB_TESTS (
    ID, CASE_ID, TEST_NAME, MEDICAL_EPISODE_LLT_CODE, TEST_DATE,
    TEST_RESULT_VALUE, TEST_UNIT, TEST_RESULT_CODE, LOW_TEST_RANGE, HIGH_TEST_RANGE
) VALUES
('LAB-001', 'CASE-001', 'ALT',           '10001551', '2024-01-03', '1250', 'IU/L',  '1', '7',   '56'),
('LAB-002', 'CASE-001', 'AST',           '10003481', '2024-01-03', '980',  'IU/L',  '1', '10',  '40'),
('LAB-003', 'CASE-001', 'Total Bilirubin','10005364', '2024-01-03', '8.2',  'mg/dL', '1', '0.2', '1.2'),
('LAB-004', 'CASE-001', 'INR',           '10022402', '2024-01-05', '4.8',  NULL,    '1', '0.8', '1.2'),
('LAB-005', 'CASE-002', 'ALT',           '10001551', '2024-01-25', '95',   'IU/L',  '1', '7',   '56'),
('LAB-006', 'CASE-002', 'AST',           '10003481', '2024-01-25', '72',   'IU/L',  '1', '10',  '40'),
('LAB-007', 'CASE-005', 'Temperature',   '10043982', '2024-05-06', '39.8', NULL,    '1', NULL,  '37.5')
ON CONFLICT (ID) DO NOTHING;

-- ============================================================
-- ICSR_LITERATURE (Case 3 — literature source)
-- ============================================================
INSERT INTO ICSR_LITERATURE (
    ID, CASE_ID, LITERATURE_REFERENCE, ARTICLE_TITLE, JOURNAL_TITLE,
    PUBLICATION_DATE, RETAIN_LITERATURE_REF
) VALUES
('LIT-001', 'CASE-003',
 'Martin JL et al. J Pharmacol 2024;45(2):112-118',
 'Congenital cardiac defects following first-trimester exposure to TERATOVIR: a case series',
 'Journal of Pharmacology and Toxicology',
 '2024-02-01', 'Y')
ON CONFLICT (ID) DO NOTHING;

-- ============================================================
-- ICSR_STUDY (Case 2 — study report)
-- ============================================================
INSERT INTO ICSR_STUDY (
    ID, CASE_ID, PROTOCOL_NO, STUDY_TITLE, STUDY_TYPE, STUDY_PHASE,
    SUBJECT_ID, RANDOMIZATION_NUMBER, ENROLMENT_DATE, ENROLMENT_STATUS,
    SITE_NUMBER, INVESTIGATOR_NO
) VALUES
('STD-001', 'CASE-002',
 'PG-T2D-2024-001',
 'A Phase III Randomised Controlled Trial of PG-TRIAL-001 in Type 2 Diabetes',
 'CLINICAL_TRIAL', 'PHASE_III',
 'PG-T2D-0042', 'R-0042', '2024-01-10', '1',
 'SITE-007', 'INV-023')
ON CONFLICT (ID) DO NOTHING;

-- ============================================================
-- ICSR_PREGNANCY (Case 3 — pregnancy exposure)
-- ============================================================
INSERT INTO ICSR_PREGNANCY (
    ID, CASE_ID, EXPOSURE_STATUS, TRIMESTER_OF_EXPOSURE,
    GRAVIDITY, PARA, PLANNED_PREGNANCY, FOLLOW_UP
) VALUES
('PRG-001', 'CASE-003', '01', '01', '2', '1', '1', 'Y')
ON CONFLICT (ID) DO NOTHING;

-- ============================================================
-- ICSR_PREGNANCY_OUTCOMES (Case 3)
-- ============================================================
INSERT INTO ICSR_PREGNANCY_OUTCOMES (
    ID, CASE_ID, PREGNANCY_CLINICAL_STATUS, PREGNANCY_OUTCOME_DATE
) VALUES
('PO-001', 'CASE-003', '11', '2024-02-15')
ON CONFLICT (ID) DO NOTHING;

-- ============================================================
-- ICSR_PRODUCT_DEVICES (Case 4 — device)
-- ============================================================
INSERT INTO ICSR_PRODUCT_DEVICES (
    ID, DRUG_ID, BRAND_NAME, COMMON_DEVICE_NAME, MODEL_NUMBER,
    SERIAL_NUMBER, LOT_NUMBER, DEVICE_MANUFACTURE_DATE,
    MAL_FUNCTION, CURRENT_DEV_LOCATION, DEVICE_EVALUATED_BY_MFR
) VALUES
('DEV-001', 'DRG-005',
 'CardioMonitor Pro X', 'Cardiac Monitoring System',
 'CMX-3000', 'SN-2023-44821', 'LOT-2023-Q3',
 '2023-07-15', '1', '1', '1')
ON CONFLICT (ID) DO NOTHING;
