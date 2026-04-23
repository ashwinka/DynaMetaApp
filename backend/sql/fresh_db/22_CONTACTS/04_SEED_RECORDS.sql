-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 04_SEED_RECORDS.sql
-- Module  : CONTACTS
-- Purpose : Sample seed records for CONTACTS module
-- ============================================================

INSERT INTO CONTACTS (
    ID, CONTACT_ID, IS_ACTIVE, TITLE, FIRST_NAME, MIDDLE_NAME, LAST_NAME,
    CONTACT_MEDIUM, DO_NOT_CONTACT, EMAIL_ID, GENDER, DEPARTMENT_ID,
    QUALIFICATION, SPECIALIZATION, CONTACT_CATEGORY,
    PHONE_COUNTRY_CODE, PHONE_AREA_CODE, PHONE_NUMBER,
    FAX_COUNTRY_CODE,   FAX_AREA_CODE,   FAX_NUMBER
) VALUES
('1',  'CON-001', 'Y', 'DR',   'Robert',    NULL,      'Williams',    'EMAIL', 'N', 'r.williams@citygeneral.com',        'M', '1',  'MD',   'INTERNAL_MED',  'EXT_HCP',     '+1',  '617', '555-0201', '+1',  '617', '555-0202'),
('2',  'CON-002', 'Y', 'MS',   'Sarah',     NULL,      'Thompson',    'EMAIL', 'N', 's.thompson@rie.scot.nhs.uk',        'F', '11', 'PHARM','PHARMACY',       'EXT_HCP',     '+44', '131', '555-0202', '+44', '131', '555-0203'),
('3',  'CON-003', 'Y', 'DR',   'Klaus',     NULL,      'Bauer',       'EMAIL', 'N', 'k.bauer@charite.de',                'M', '13', 'MD',   'CARDIOLOGY',    'EXT_HCP',     '+49', '30',  '555-0203', '+49', '30',  '555-0204'),
('4',  'CON-004', 'Y', 'PROF', 'Jean-Luc',  NULL,      'Martin',      'EMAIL', 'N', 'jl.martin@chu-paris.fr',            'M', '14', 'MD',   'ENDOCRINOLOGY', 'EXT_HCP',     '+33', '1',   '555-0204', '+33', '1',   '555-0205'),
('5',  'CON-005', 'Y', NULL,   'Alice',     NULL,      'Johnson',     'EMAIL', 'N', 'a.johnson@pharmaco.com',            'F', '1',  NULL,   NULL,            'INT_NON_HCP', '+1',  '617', '555-0205', NULL,  NULL,  NULL),
('6',  'CON-006', 'Y', 'DR',   'Yuki',      NULL,      'Tanaka',      'EMAIL', 'N', 'y.tanaka@tmu.ac.jp',                'F', '15', 'MD',   'CLIN_PHARM',    'EXT_HCP',     '+81', '3',   '555-0206', '+81', '3',   '555-0207'),
('7',  'CON-007', 'Y', 'DR',   'Priya',     NULL,      'Sharma',      'EMAIL', 'N', 'p.sharma@aiims.edu',                'F', '4',  'MD',   'INTERNAL_MED',  'EXT_HCP',     '+91', '11',  '555-0207', '+91', '11',  '555-0208'),
('8',  'CON-008', 'Y', 'DR',   'Michael',   NULL,      'Chen',        'EMAIL', 'N', 'm.chen@stanford.edu',               'M', '3',  'MD',   'ONCOLOGY',      'EXT_HCP',     '+1',  '650', '555-0208', '+1',  '650', '555-0209'),
('9',  'CON-009', 'Y', 'DR',   'Patricia',  NULL,      'Moore',       'EMAIL', 'N', 'p.moore@mayo.edu',                  'F', '4',  'MD',   'NEUROLOGY',     'EXT_HCP',     '+1',  '507', '555-0209', '+1',  '507', '555-0210'),
('10', 'CON-010', 'Y', NULL,   'James',     NULL,      'Carter',      'EMAIL', 'N', 'j.carter@pharmaco.com',             'M', '2',  NULL,   NULL,            'INT_NON_HCP', '+1',  '617', '555-0210', NULL,  NULL,  NULL),
('11', 'CON-011', 'Y', 'DR',   'Helen',     NULL,      'Brooks',      'EMAIL', 'N', 'h.brooks@pharmaco.com',             'F', '1',  'MD',   'PHARMACOVIG',   'INT_HCP',     '+1',  '617', '555-0211', '+1',  '617', '555-0212'),
('12', 'CON-012', 'Y', NULL,   'Mark',      NULL,      'Spencer',     'EMAIL', 'N', 'm.spencer@pharmaco.com',            'M', '5',  NULL,   NULL,            'INT_NON_HCP', '+1',  '617', '555-0212', NULL,  NULL,  NULL),
('13', 'CON-013', 'Y', 'DR',   'Nadia',     NULL,      'Petrov',      'EMAIL', 'N', 'n.petrov@iconplc.com',              'F', '3',  'MD',   'MED_WRITING',   'EXT_HCP',     '+353','1',   '555-0213', '+353','1',   '555-0214'),
('14', 'CON-014', 'Y', 'DR',   'Rachel',    NULL,      'Green',       'EMAIL', 'N', 'r.green@mhra.gov.uk',               'F', '15', 'MD',   'PHARMACOVIG',   'EXT_HCP',     '+44', '20',  '555-0214', '+44', '20',  '555-0215'),
('15', 'CON-015', 'Y', 'DR',   'Hiroshi',   NULL,      'Nakamura',    'EMAIL', 'N', 'h.nakamura@pmda.go.jp',             'M', '15', 'MD',   'PHARMACOVIG',   'EXT_HCP',     '+81', '3',   '555-0215', '+81', '3',   '555-0216'),
('16', 'CON-016', 'Y', 'DR',   'Anita',     NULL,      'Patel',       'EMAIL', 'N', 'a.patel@narayanahealth.org',        'F', '4',  'MD',   'CARDIOLOGY',    'EXT_HCP',     '+91', '80',  '555-0216', '+91', '80',  '555-0217'),
('17', 'CON-017', 'Y', 'DR',   'Andrew',    NULL,      'Wilson',      'EMAIL', 'N', 'a.wilson@mh.org.au',                'M', '4',  'MD',   'RESPIRATORY',   'EXT_HCP',     '+61', '3',   '555-0217', '+61', '3',   '555-0218'),
('18', 'CON-018', 'Y', 'DR',   'Marie',     NULL,      'Tremblay',    'EMAIL', 'N', 'm.tremblay@muhc.mcgill.ca',         'F', '4',  'MD',   'ENDOCRINOLOGY', 'EXT_HCP',     '+1',  '514', '555-0218', '+1',  '514', '555-0219'),
('19', 'CON-019', 'Y', NULL,   'Rachel',    NULL,      'Kim',         'EMAIL', 'N', 'r.kim@pharmaco.com',                'F', '4',  NULL,   NULL,            'INT_NON_HCP', '+1',  '617', '555-0219', NULL,  NULL,  NULL),
('20', 'CON-020', 'Y', 'DR',   'Florian',   NULL,      'Meier',       'EMAIL', 'N', 'f.meier@covance.com',               'M', '13', 'MD',   'CLIN_PHARM',    'EXT_HCP',     '+49', '69',  '555-0220', '+49', '69',  '555-0221')
ON CONFLICT (ID) DO NOTHING;

INSERT INTO CONTACT_ADDRESSES (
    ID, CONTACT_REC_ID, IS_PRIMARY, HOUSE_APT_NUMBER, ADDRESS, COUNTRY, CITY, STATE, ADDRESS_TYPE
) VALUES
('A001', '1',  'Y', '100', 'Hospital Drive',                    'US', 'Boston',      'MA',  'OFFICE'),
('A002', '2',  'Y', '51',  'Little France Crescent',            'GB', 'Edinburgh',   NULL,  'OFFICE'),
('A003', '3',  'Y', '1',   'Charitéplatz',                      'DE', 'Berlin',      NULL,  'OFFICE'),
('A004', '4',  'Y', '149', 'Rue de Sèvres',                     'FR', 'Paris',       NULL,  'OFFICE'),
('A005', '5',  'Y', '100', 'Pharma Way',                        'US', 'Boston',      'MA',  'OFFICE'),
('A006', '6',  'Y', '6-1-1','Shinjuku',                         'JP', 'Tokyo',       NULL,  'OFFICE'),
('A007', '7',  'Y', NULL,  'Sri Aurobindo Marg',                 'IN', 'New Delhi',   NULL,  'OFFICE'),
('A008', '8',  'Y', '300', 'Pasteur Drive',                     'US', 'Palo Alto',   'CA',  'OFFICE'),
('A009', '9',  'Y', '200', 'First Street SW',                   'US', 'Rochester',   'MN',  'OFFICE'),
('A010', '10', 'Y', '1',   'Main Street',                       'US', 'Cambridge',   'MA',  'OFFICE'),
('A011', '11', 'Y', '100', 'Pharma Way',                        'US', 'Boston',      'MA',  'OFFICE'),
('A012', '12', 'Y', '100', 'Pharma Way',                        'US', 'Boston',      'MA',  'OFFICE'),
('A013', '13', 'Y', NULL,  'South County Business Park',        'IE', 'Dublin',      NULL,  'OFFICE'),
('A014', '14', 'Y', '10',  'South Colonnade',                   'GB', 'London',      NULL,  'OFFICE'),
('A015', '15', 'Y', '3-3-2','Kasumigaseki, Chiyoda',            'JP', 'Tokyo',       NULL,  'OFFICE'),
('A016', '16', 'Y', NULL,  'Bommasandra Industrial Area',       'IN', 'Bangalore',   NULL,  'OFFICE'),
('A017', '17', 'Y', '300', 'Grattan Street',                    'AU', 'Melbourne',   'VIC', 'OFFICE'),
('A018', '18', 'Y', '1001','Decarie Boulevard',                 'CA', 'Montreal',    'QC',  'OFFICE'),
('A019', '19', 'Y', '100', 'Pharma Way',                        'US', 'Boston',      'MA',  'OFFICE'),
('A020', '20', 'Y', '22',  'Rüsselsheimer Straße',              'DE', 'Frankfurt',   NULL,  'OFFICE')
ON CONFLICT (ID) DO NOTHING;
