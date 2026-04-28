-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 04_SEED_RECORDS.sql
-- Purpose : Sample data records for EMAIL_CASES module
-- ============================================================

INSERT INTO EMAIL_CASES (
    ID, CASE_ID, EMAIL_SUBJECT, SENDER_NAME, SENDER_EMAIL, SENDER_COUNTRY,
    RECEIVED_DATE, STATUS, PRIORITY, ASSIGNED_TO, DUE_DATE,
    CASE_CREATED, LINKED_CASE_ID, IS_SAFETY_RELATED, REPORTER_TYPE,
    PRODUCT_MENTIONED, EVENT_MENTIONED, SERIOUS, TRIAGE_DECISION, TRIAGE_DATE, TRIAGE_BY,
    EMAIL_BODY, PROCESSING_NOTES
) VALUES
(1, 'EC-2025-001',
 'Adverse reaction to Crocin — patient report',
 'Jane Patient', 'jane.patient@email.com', 'US',
 '2025-01-10', 'CLOSED', 'HIGH', 'jdoe', '2025-01-12',
 'Y', 'RCT-2025-001', 'Y', 'CONSUMER',
 'Crocin 500mg', 'Fever, Headache', 'N', 'CREATE_ICSR', '2025-01-11', 'jdoe',
 'Hello, I took Crocin 500mg yesterday and developed a high fever and severe headache about 2 hours later. I stopped taking it and the symptoms went away the next day. Is this a known side effect?',
 'Triaged as possible ADR. ICSR created: RCT-2025-001. Case closed.'),
(2, 'EC-2025-002',
 'Serious adverse event in clinical study — IBU-PHASE2-2024',
 'Ms. Sarah Thompson', 's.thompson@rie.scot.nhs.uk', 'GB',
 '2025-02-09', 'CLOSED', 'URGENT', 'jdoe', '2025-02-10',
 'Y', 'RCT-2025-002', 'Y', 'HCP',
 'Ibuprofen 400mg', 'Nausea, Hospitalisation', 'Y', 'CREATE_ICSR', '2025-02-10', 'jdoe',
 'Dear Safety Team, I am reporting a serious adverse event in study IBU-PHASE2-2024. Patient developed severe nausea on Day 3 requiring hospitalisation for IV fluid support. Please advise on next steps.',
 'Serious case — hospitalisation. ICSR created: RCT-2025-002. Expedited report required.'),
(3, 'EC-2025-003',
 'Question about Metformin and kidney function',
 'Dr. Pierre Dubois', 'p.dubois@hopital-paris.fr', 'FR',
 '2025-03-18', 'IN_PROGRESS', 'HIGH', 'jdoe', '2025-03-20',
 'N', NULL, 'Y', 'HCP',
 'Metformin 1000mg', 'Lactic Acidosis', 'Y', 'CREATE_ICSR', '2025-03-19', 'jdoe',
 'Bonjour, I have a 70-year-old patient with CKD (eGFR 28) who has been on Metformin 1000mg BID for 3 years. She was admitted yesterday with lactic acidosis (lactate 8.2). I believe this is related to Metformin. Please advise.',
 'Serious case — lactic acidosis in renal impairment. ICSR creation in progress.'),
(4, 'EC-2025-004',
 'General inquiry — product information request',
 'John Smith', 'j.smith@email.com', 'US',
 '2025-03-22', 'CLOSED', 'LOW', 'jdoe', '2025-03-25',
 'N', NULL, 'N', 'CONSUMER',
 NULL, NULL, 'N', 'NO_ACTION', '2025-03-22', 'jdoe',
 'Hi, I would like to know more about the ingredients in Crocin 500mg tablets. Are they gluten-free?',
 'Non-safety inquiry. Forwarded to medical information team. No ICSR required.')
ON CONFLICT (ID) DO NOTHING;
