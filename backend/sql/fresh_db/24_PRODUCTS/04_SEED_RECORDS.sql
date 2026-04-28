-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 04_SEED_RECORDS.sql
-- Module  : PRODUCTS
-- Purpose : Sample seed records for PRODUCTS module
-- ============================================================

INSERT INTO PRODUCTS (
    ID, PRODUCT_ID, PREFERRED_DESCRIPTION, IS_ACTIVE,
    PRODUCT_FLAG, PRODUCT_CLASS, ROUTE_OF_ADMIN, ROUTE_OF_ADMIN_TERM_ID,
    FORM_OF_ADMIN, PHARMA_DOSE_FORM_TERM_ID, DESCRIPTION,
    MANUFACTURER_ACC_ID, MANUFACTURER_NAME, MANUFACTURER_CODE,
    VIGILANCE_TYPE, VACCINE_TYPE, WHO_DD_CODE, WHO_DD_DECODE,
    INTERNAL_DRUG_CODE, MADE_BY, COMPANY_PRODUCT, SUBJECT_TO_RISK_MGMT
) VALUES
('1',  'PROD-001', 'Trastuzumab 150mg Powder for Concentrate', 'Y', 'DRUG',    'CLASS_3', 'IV',  'ROA-20045000', 'POWDER_CONC', 'PDF-50043000', 'Trastuzumab for injection — HER2-positive breast cancer',
    'ACC-001', 'PharmaGlobal Inc.', 'MFR-001', 'PHARMA', NULL, '00332101001', 'Trastuzumab', 'INT-001', 'COMPANY', 'Y', 'Y'),
('2',  'PROD-002', 'Clozapine 100mg Tablets',                  'Y', 'DRUG',    'CLASS_2', 'ORAL','ROA-20053000', 'TABLET',      'PDF-10219000', 'Clozapine oral tablets for treatment-resistant schizophrenia',
    'ACC-001', 'PharmaGlobal Inc.', 'MFR-001', 'PHARMA', NULL, '00332101004', 'Clozapine',   'INT-002', 'COMPANY', 'Y', 'Y'),
('3',  'PROD-003', 'Risperidone 2mg Tablets',                  'Y', 'DRUG',    'CLASS_2', 'ORAL','ROA-20053000', 'TABLET',      'PDF-10219000', 'Risperidone oral tablets for schizophrenia',
    'ACC-001', 'PharmaGlobal Inc.', 'MFR-001', 'PHARMA', NULL, '00332101005', 'Risperidone', 'INT-003', 'COMPANY', 'Y', 'N'),
('4',  'PROD-004', 'Paclitaxel 6mg/mL Concentrate',            'Y', 'DRUG',    'CLASS_3', 'IV',  'ROA-20045000', 'CONC_SOL',   'PDF-50043000', 'Paclitaxel concentrate for solution for infusion',
    'ACC-001', 'PharmaGlobal Inc.', 'MFR-001', 'PHARMA', NULL, '01256101001', 'Paclitaxel',  'INT-004', 'COMPANY', 'Y', 'Y'),
('5',  'PROD-005', 'Pertuzumab 420mg Concentrate',             'Y', 'DRUG',    'CLASS_3', 'IV',  'ROA-20045000', 'CONC_SOL',   'PDF-50043000', 'Pertuzumab concentrate for solution for infusion — HER2-positive breast cancer',
    'ACC-001', 'PharmaGlobal Inc.', 'MFR-001', 'PHARMA', NULL, '01256101003', 'Pertuzumab',  'INT-005', 'COMPANY', 'Y', 'Y'),
('6',  'PROD-006', 'Ibuprofen 400mg Tablets',                  'Y', 'DRUG',    'CLASS_1', 'ORAL','ROA-20053000', 'TABLET',      'PDF-10219000', 'Ibuprofen oral tablets — OTC analgesic and anti-inflammatory',
    'ACC-001', 'PharmaGlobal Inc.', 'MFR-001', 'PHARMA', NULL, '00100201001', 'Ibuprofen',   'INT-006', 'COMPANY', 'Y', 'N'),
('7',  'PROD-007', 'Atorvastatin 20mg Tablets',                'Y', 'DRUG',    'CLASS_2', 'ORAL','ROA-20053000', 'TABLET',      'PDF-10219000', 'Atorvastatin oral tablets for hypercholesterolaemia',
    'ACC-001', 'PharmaGlobal Inc.', 'MFR-001', 'PHARMA', NULL, '00100201004', 'Atorvastatin','INT-007', 'COMPANY', 'Y', 'N'),
('8',  'PROD-008', 'Metformin 500mg Tablets',                  'Y', 'DRUG',    'CLASS_2', 'ORAL','ROA-20053000', 'TABLET',      'PDF-10219000', 'Metformin oral tablets for type 2 diabetes mellitus',
    'ACC-001', 'PharmaGlobal Inc.', 'MFR-001', 'PHARMA', NULL, '00100201005', 'Metformin',   'INT-008', 'COMPANY', 'Y', 'N'),
('9',  'PROD-009', 'Influenza Vaccine Suspension',             'Y', 'VACCINE', 'CLASS_3', 'IM',  'ROA-20046000', 'SUSPENSION',  'PDF-11201000', 'Inactivated influenza vaccine — seasonal trivalent',
    'ACC-001', 'PharmaGlobal Inc.', 'MFR-001', 'PHARMA', 'INACTIVATED', NULL, NULL, NULL, 'INT-009', 'COMPANY', 'Y', 'N'),
('10', 'PROD-010', 'Amoxicillin 500mg Capsules',               'Y', 'DRUG',    'CLASS_1', 'ORAL','ROA-20053000', 'CAPSULE',     'PDF-10101000', 'Amoxicillin oral capsules — broad-spectrum antibiotic',
    'ACC-001', 'PharmaGlobal Inc.', 'MFR-001', 'PHARMA', NULL, '00100201003', 'Amoxicillin', 'INT-010', 'COMPANY', 'Y', 'N')
ON CONFLICT (ID) DO NOTHING;

-- ── PRODUCT_SUBSTANCES ────────────────────────────────────────
INSERT INTO PRODUCT_SUBSTANCES (ID, PRODUCT_REC_ID, SUBSTANCE_ID, SUBSTANCE_NAME, IS_ACTIVE) VALUES
('PS-001', '1',  'SUB-001', 'Trastuzumab',  'Y'),
('PS-002', '2',  'SUB-002', 'Clozapine',    'Y'),
('PS-003', '3',  'SUB-003', 'Risperidone',  'Y'),
('PS-004', '4',  'SUB-004', 'Paclitaxel',   'Y'),
('PS-005', '5',  'SUB-006', 'Pertuzumab',   'Y'),
('PS-006', '6',  'SUB-011', 'Ibuprofen',    'Y'),
('PS-007', '7',  'SUB-014', 'Atorvastatin', 'Y'),
('PS-008', '8',  'SUB-015', 'Metformin',    'Y'),
('PS-009', '10', 'SUB-013', 'Amoxicillin',  'Y')
ON CONFLICT (ID) DO NOTHING;

-- ── PRODUCT_LOCAL_TRADE_NAMES ─────────────────────────────────
INSERT INTO PRODUCT_LOCAL_TRADE_NAMES (
    ID, PRODUCT_REC_ID, LTN, NDC_CODE, ATC_CODE, AUTHORIZATION_NO,
    APPROVAL_TYPE, MAH_ACC_ID, MAH_NAME, AUTHORIZATION_COUNTRY, SUBMISSION_TYPE, PRODUCT_FLAG
) VALUES
('LTN-001', '1',  'Herceptin',    NULL,         'L01FD01', 'EU/1/00/145',  'CENTRALIZED',  'ACC-001', 'PharmaGlobal Inc.', 'EU', 'CENTRALIZED',  'DRUG'),
('LTN-002', '1',  'Herzuma',      NULL,         'L01FD01', 'EU/1/17/1237', 'CENTRALIZED',  'ACC-001', 'PharmaGlobal Inc.', 'EU', 'CENTRALIZED',  'DRUG'),
('LTN-003', '2',  'Clozaril',     '00078-0126', 'N05AH02', 'NDA-019758',   'NDA',          'ACC-001', 'PharmaGlobal Inc.', 'US', 'NATIONAL',     'DRUG'),
('LTN-004', '2',  'Leponex',      NULL,         'N05AH02', 'EU/1/72/001',  'NATIONAL',     'ACC-001', 'PharmaGlobal Inc.', 'DE', 'NATIONAL',     'DRUG'),
('LTN-005', '3',  'Risperdal',    '50458-0300', 'N05AX08', 'NDA-020272',   'NDA',          'ACC-001', 'PharmaGlobal Inc.', 'US', 'NATIONAL',     'DRUG'),
('LTN-006', '4',  'Taxol',        '00015-3475', 'L01CD01', 'NDA-020262',   'NDA',          'ACC-001', 'PharmaGlobal Inc.', 'US', 'NATIONAL',     'DRUG'),
('LTN-007', '5',  'Perjeta',      NULL,         'L01FD03', 'EU/1/13/838',  'CENTRALIZED',  'ACC-001', 'PharmaGlobal Inc.', 'EU', 'CENTRALIZED',  'DRUG'),
('LTN-008', '6',  'Nurofen',      NULL,         'M01AE01', 'PL-00057-0522','NATIONAL',     'ACC-001', 'PharmaGlobal Inc.', 'GB', 'NATIONAL',     'DRUG'),
('LTN-009', '7',  'Lipitor',      '00071-0155', 'C10AA05', 'NDA-020702',   'NDA',          'ACC-001', 'PharmaGlobal Inc.', 'US', 'NATIONAL',     'DRUG'),
('LTN-010', '8',  'Glucophage',   '00087-6060', 'A10BA02', 'NDA-020357',   'NDA',          'ACC-001', 'PharmaGlobal Inc.', 'US', 'NATIONAL',     'DRUG')
ON CONFLICT (ID) DO NOTHING;

-- ── PRODUCT_SYNONYMS ─────────────────────────────────────────
INSERT INTO PRODUCT_SYNONYMS (ID, PRODUCT_REC_ID, SYNONYM_NAME, IS_ACTIVE) VALUES
('PSYN-001', '1',  'Trastuzumab IV',       'Y'),
('PSYN-002', '2',  'Clozapine Tablets',    'Y'),
('PSYN-003', '3',  'Risperidone Oral',     'Y'),
('PSYN-004', '4',  'Paclitaxel Infusion',  'Y'),
('PSYN-005', '5',  'Pertuzumab IV',        'Y'),
('PSYN-006', '6',  'Ibuprofen OTC',        'Y'),
('PSYN-007', '9',  'Flu Vaccine',          'Y'),
('PSYN-008', '10', 'Amoxil Capsules',      'Y')
ON CONFLICT (ID) DO NOTHING;
