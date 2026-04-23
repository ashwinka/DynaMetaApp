-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 04_SEED_RECORDS.sql
-- Module  : DEPARTMENTS
-- Purpose : Sample seed records for DEPARTMENTS module
-- ============================================================

INSERT INTO DEPARTMENTS (
    ID, DEPARTMENT_CODE, DEPARTMENT_NAME, CONTACT_PERSON, EMAIL_ID,
    REPORT_NOTIFICATION, IS_ACTIVE,
    PHONE_COUNTRY_CODE, PHONE_AREA_CODE, PHONE_NUMBER,
    FAX_COUNTRY_CODE,   FAX_AREA_CODE,   FAX_NUMBER
) VALUES
('1',  'DRUG_SAFETY',    'Drug Safety',                    'Dr. Helen Brooks',   'drugsafety@pharmaco.com',        'Y', 'Y', '+1',  '617', '555-1001', '+1',  '617', '555-1002'),
('2',  'REG_AFFAIRS',    'Regulatory Affairs',             'James Carter',       'regaffairs@pharmaco.com',        'Y', 'Y', '+1',  '617', '555-2001', '+1',  '617', '555-2002'),
('3',  'MED_AFFAIRS',    'Medical Affairs',                'Sandra Mitchell',    'medaffairs@pharmaco.com',        'Y', 'Y', '+1',  '617', '555-3001', '+1',  '617', '555-3002'),
('4',  'CASE_PROC',      'Case Processing',                'Rachel Kim',         'caseprocessing@pharmaco.com',    'Y', 'Y', '+1',  '617', '555-4001', '+1',  '617', '555-4002'),
('5',  'SIG_MGMT',       'Signal Management',              'Mark Spencer',       'signalmgmt@pharmaco.com',        'Y', 'Y', '+1',  '617', '555-5001', '+1',  '617', '555-5002'),
('6',  'LIT_MONITOR',    'Literature Monitoring',          'David Okonkwo',      'litmonitoring@pharmaco.com',     'Y', 'Y', '+1',  '617', '555-6001', '+1',  '617', '555-6002'),
('7',  'SUBMISSIONS',    'Regulatory Submissions',         'Alice Johnson',      'submissions@pharmaco.com',       'Y', 'Y', '+1',  '617', '555-7001', '+1',  '617', '555-7002'),
('8',  'QUALITY',        'Quality Assurance',              'Tom Bradley',        'quality@pharmaco.com',           'N', 'Y', '+1',  '617', '555-8001', '+1',  '617', '555-8002'),
('9',  'IT_SYSTEMS',     'IT Systems',                     'Kevin Park',         'itsystems@pharmaco.com',         'N', 'Y', '+1',  '617', '555-9001', '+1',  '617', '555-9002'),
('10', 'LEGAL',          'Legal & Compliance',             'Nancy White',        'legal@pharmaco.com',             'N', 'Y', '+1',  '617', '555-0101', '+1',  '617', '555-0102'),
('11', 'EU_SAFETY',      'EU Drug Safety',                 'Dr. Rachel Green',   'eu.drugsafety@pharmaco.com',     'Y', 'Y', '+44', '20',  '555-1101', '+44', '20',  '555-1102'),
('12', 'EU_REG',         'EU Regulatory Affairs',          'Prof. David Hughes', 'eu.regaffairs@pharmaco.com',     'Y', 'Y', '+44', '20',  '555-1201', '+44', '20',  '555-1202'),
('13', 'DE_SAFETY',      'Germany Drug Safety',            'Dr. Petra Fischer',  'de.drugsafety@pharmaco.com',     'Y', 'Y', '+49', '69',  '555-1301', '+49', '69',  '555-1302'),
('14', 'FR_SAFETY',      'France Drug Safety',             'Dr. Marie Fontaine', 'fr.drugsafety@pharmaco.com',     'Y', 'Y', '+33', '1',   '555-1401', '+33', '1',   '555-1402'),
('15', 'JP_SAFETY',      'Japan Drug Safety',              'Dr. Hiroshi Nakamura','jp.drugsafety@pharmaco.com',    'Y', 'Y', '+81', '3',   '555-1501', '+81', '3',   '555-1502'),
('16', 'APAC_REG',       'APAC Regulatory Affairs',        'Dr. Raj Krishnan',   'apac.regaffairs@pharmaco.com',   'Y', 'Y', '+65', '6',   '555-1601', '+65', '6',   '555-1602'),
('17', 'CLINICAL_OPS',   'Clinical Operations',            'Dr. Lisa Nguyen',    'clinicalops@pharmaco.com',       'N', 'Y', '+1',  '617', '555-1701', '+1',  '617', '555-1702'),
('18', 'BIOSTATISTICS',  'Biostatistics',                  'Dr. Michael Chen',   'biostatistics@pharmaco.com',     'N', 'Y', '+1',  '650', '555-1801', '+1',  '650', '555-1802'),
('19', 'PHARMACOVIGILANCE','Pharmacovigilance',            'Dr. Nadia Petrov',   'pharmacovigilance@pharmaco.com', 'Y', 'Y', '+1',  '617', '555-1901', '+1',  '617', '555-1902'),
('20', 'ARCHIVE',        'Document Management & Archive',  NULL,                 'archive@pharmaco.com',           'N', 'N', NULL,  NULL,  NULL,       NULL,  NULL,  NULL)
ON CONFLICT (ID) DO NOTHING;
