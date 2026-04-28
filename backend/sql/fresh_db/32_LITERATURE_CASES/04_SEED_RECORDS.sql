-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 04_SEED_RECORDS.sql
-- Purpose : Sample data records for LITERATURE_CASES module
-- ============================================================

INSERT INTO LITERATURE_CASES (
    ID, CASE_ID, ARTICLE_TITLE, JOURNAL_NAME, AUTHORS, PUBLICATION_DATE, DOI,
    SOURCE_TYPE, STATUS, PRIORITY, IS_SAFETY_RELATED, PRODUCT_MENTIONED, AE_TERM,
    SERIOUS, CASE_REPORTABLE, CASE_CREATED, LINKED_CASE_ID, ASSIGNED_TO,
    ASSESSMENT_DATE, ASSESSMENT_NOTES, SEARCH_DATABASE, SEARCH_DATE, SEARCH_TERMS, SEARCHED_BY
) VALUES
(1, 'LC-2025-001',
 'Lactic acidosis associated with metformin use in patients with chronic kidney disease: a systematic review',
 'Drug Safety', 'Chen W, Patel R, Müller K', '2025-01-15',
 '10.1007/s40264-025-01234-5',
 'JOURNAL', 'CLOSED', 'HIGH', 'Y', 'Metformin', 'Lactic acidosis',
 'Y', 'Y', 'Y', 'RCT-2025-004', 'jdoe',
 '2025-02-01', 'Systematic review confirms lactic acidosis risk in CKD patients on Metformin. Case reportable — ICSR created.',
 'PubMed', '2025-01-20', 'metformin lactic acidosis renal impairment', 'asharma'),
(2, 'LC-2025-002',
 'Infliximab-induced hepatotoxicity: case series and literature review',
 'Journal of Hepatology', 'Nakamura Y, Rossi A, Dupont M', '2025-02-10',
 '10.1016/j.jhep.2025.02.015',
 'JOURNAL', 'IN_REVIEW', 'MEDIUM', 'Y', 'Infliximab', 'Hepatotoxicity',
 'Y', 'Y', 'N', NULL, 'jdoe',
 NULL, 'Under assessment. Three cases described — evaluating reportability.',
 'PubMed', '2025-02-15', 'infliximab hepatotoxicity liver injury', 'asharma'),
(3, 'LC-2025-003',
 'Aspirin and risk of intracranial haemorrhage in elderly patients: a population-based cohort study',
 'The Lancet Neurology', 'Williams R, Bauer K, Thompson S', '2025-03-01',
 '10.1016/S1474-4422(25)00089-3',
 'JOURNAL', 'CLOSED', 'LOW', 'Y', 'Aspirin', 'Intracranial haemorrhage',
 'Y', 'N', 'N', NULL, 'jdoe',
 '2025-03-10', 'Population-level study. No individual case identifiable. Not reportable as ICSR.',
 'EMBASE', '2025-03-05', 'aspirin intracranial haemorrhage elderly', 'asharma'),
(4, 'LC-2025-004',
 'Rituximab and progressive multifocal leukoencephalopathy: updated risk assessment',
 'Blood', 'Garcia P, Tanaka Y, Martin JL', '2025-03-20',
 '10.1182/blood.2025012345',
 'JOURNAL', 'PENDING', 'HIGH', 'Y', 'Rituximab', 'Progressive multifocal leukoencephalopathy',
 'Y', 'Y', 'N', NULL, 'jdoe',
 NULL, 'New case series identified. Pending triage and assessment.',
 'PubMed', '2025-03-22', 'rituximab PML progressive multifocal leukoencephalopathy', 'asharma')
ON CONFLICT (ID) DO NOTHING;
