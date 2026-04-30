-- ============================================================
-- MetaDyna API — ICSR Module
-- Script  : 02_DB_METADATA_ALL.sql
-- Purpose : Merged TABLE_METADATA + TABLE_COLUMN_METADATA for
--           all ICSR tables (500–645), ordered by table ID.
-- ============================================================

-- ── 02_DB_METADATA_500.sql ──
-- ============================================================
-- MetaDyna API â€” Common Tenant Schema
-- Script  : 02_DB_METADATA_500.sql
-- Module  : ICSR â€” Table 500 (ICSR_CASES case header)
-- Purpose : TABLE_METADATA + TABLE_COLUMN_METADATA
--           Fields ordered by ICH E2B weight (R2/R3)
--           Tier 1 fieldIds: 500001-500020  (Core E2B)
--           Tier 2 fieldIds: 500021-500030  (Seriousness)
--           Tier 3 fieldIds: 500031-500060  (Case mgmt)
--           Tier 4 fieldIds: 500061-500075  (Organisation)
--           Tier 5 fieldIds: 500076-500082  (Coding flags)
--           Tier 6 fieldIds: 500083-500108  (Admin/non-E2B)
-- ============================================================
delete from TABLE_COLUMN_METADATA where MODULE_ID = 'ICSR';
delete from TABLE_METADATA where MODULE_ID = 'ICSR';
INSERT INTO TABLE_METADATA (
    ID, MODULE_ID, TABLE_ID, PARENT_TABLE_ID, DB_TABLE_NAME,
    CONTEXT_NAME, MULTI_CONTEXT, JOIN_COLUMN, REF_JOIN_COLUMN, CONTEXT_PATH)
VALUES
    (gen_random_uuid()::VARCHAR, 'ICSR', '500', NULL, 'ICSR_CASES', '', 'N', NULL, NULL, NULL)
ON CONFLICT (MODULE_ID, TABLE_ID) DO NOTHING;

INSERT INTO TABLE_COLUMN_METADATA (
    ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS,
    DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION)
VALUES
(gen_random_uuid()::VARCHAR,'ICSR','500','500001','SAFETY_REPORT_ID',       'safetyReportId',       'safetyReportId',       'TEXT',  50,   'Y', 'safetyReportId',
    'lbl.safetyReportId',
    '{"renderAs":"text",        "fieldWidth":"2", "columnWidth":"22ch", "allowSorting":true,  "primaryKey":true}',
    'R2:A.1.0.1 / R3:C.1.1 â€” Worldwide unique case identification number'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500002','SAFETY_REPORT_VERSION',  'safetyReportVersion',  'safetyReportVersion',  'TEXT',  10,   'N', 'safetyReportVersion',
    'lbl.safetyReportVersion',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"8ch",  "allowSorting":true}',
    'R2:A.1.0.2 / R3:C.1.2 â€” Version number of the safety report'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500003','AUTHORITY_NUMB',         'authorityNumb',        'authorityNumb',        'TEXT',  50,   'N', 'authorityNumb',
    'lbl.authorityNumb',
    '{"renderAs":"text",        "fieldWidth":"2", "columnWidth":"20ch", "allowSorting":true}',
    'R2:A.1.1 / R3:C.1.3 â€” Authority/company case number'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500004','INITIAL_SENDER',         'initialSender',        'initialSender',        'TEXT',  50,   'N', 'initialSender',
    'lbl.initialSender',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true,  "codelist":"ICSR_INITIAL_SENDER"}',
    'R2:A.1.2 / R3:C.1.4 â€” Type of initial sender'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500005','PRIMARY_SRC_COUNTRY',    'primarySrcCountry',    'primarySrcCountry',    'TEXT',  50,   'N', 'primarySrcCountry',
    'lbl.primarySrcCountry',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true,  "codelist":"COUNTRY"}',
    'R2:A.1.3 / R3:C.1.5 â€” Primary source country of the report'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500006','OCCUR_COUNTRY',          'occurCountry',         'occurCountry',         'TEXT',  50,   'N', 'occurCountry',
    'lbl.occurCountry',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true,  "codelist":"COUNTRY"}',
    'R2:A.1.4 / R3:C.1.6 â€” Country where the event occurred'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500007','RECEIVE_DATE',           'receiveDate',          'receiveDate',          'DATE',  NULL, 'Y', 'receiveDate',
    'lbl.receiveDate',
    '{"renderAs":"date",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'R2:A.1.5 / R3:C.1.7 â€” Date first received from primary source'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500008','RECEIPT_DATE',           'receiptDate',          'receiptDate',          'DATE',  NULL, 'N', 'receiptDate',
    'lbl.receiptDate',
    '{"renderAs":"date",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'R2:A.1.6 / R3:C.1.8 â€” Date of most recent information'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500009','REGULATORY_START_DATE',  'regulatoryStartDate',  'regulatoryStartDate',  'DATE',  NULL, 'N', 'regulatoryStartDate',
    'lbl.regulatoryStartDate',
    '{"renderAs":"date",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'R3:C.1.8.1 â€” Regulatory clock start date'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500010','REGULATORY_CLOCK_COMMENT','regClockStartDateComment','regClockStartDateComment','TEXT',300,'N','regClockStartDateComment',
    'lbl.regClockStartDateComment',
    '{"renderAs":"text",        "fieldWidth":"3", "columnWidth":"28ch", "allowSorting":false, "renderCondition":"RULE_ICSR_REG_CLOCK_COMMENT"}',
    'R3:C.1.8.1 comment â€” Explanation for regulatory clock start date'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500011','REPORT_TYPE',            'reportType',           'reportType',           'TEXT',  50,   'Y', 'reportType',
    'lbl.reportType',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true,  "codelist":"ICSR_REPORT_TYPE"}',
    'R2:A.1.7 / R3:C.1.3 â€” Type of report (spontaneous, study, other)'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500012','FULFILL_EXPEDITE_CRITERIA','fulfillExpediteCriteria','fulfillExpediteCriteria','TEXT',1,'N','fulfillExpediteCriteria',
    'lbl.fulfillExpediteCriteria',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'R2:A.1.8 / R3:C.1.9 â€” Does the case fulfil local expedited criteria'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500013','MEDICALLY_CONFIRMED',      'medicallyConfirm',     'medicallyConfirm',     'TEXT',  1,    'N', 'medicallyConfirm',
    'lbl.medicallyConfirm',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true}',
    'R2:A.1.9 / R3:C.1.10 â€” Medically confirmed by healthcare professional'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500014','ADDITIONAL_DOC',         'additionalDoc',        'additionalDoc',        'TEXT',  1,    'N', 'additionalDoc',
    'lbl.additionalDoc',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true}',
    'R2:A.1.10 / R3:C.1.11 â€” Additional documents available'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500015','CASE_NULLIFICATION',     'caseNullification',    'caseNullification',    'TEXT',  50,   'N', 'caseNullification',
    'lbl.caseNullification',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true,  "codelist":"ICSR_NULLIFICATION"}',
    'R2:A.1.11 / R3:C.1.12 â€” Nullification or amendment flag'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500016','NULLIFICATION_REASON',   'nullificationReason',  'nullificationReason',  'TEXT',  50,   'N', 'nullificationReason',
    'lbl.nullificationReason',
    '{"renderAs":"text",        "fieldWidth":"2", "columnWidth":"24ch", "allowSorting":false, "renderCondition":"RULE_ICSR_NULLIFICATION_REASON"}',
    'R2:A.1.11.1 / R3:C.1.12.1 â€” Reason for nullification or amendment'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500017','OTHER_SAFETY_REF',       'otherSafetyRef',       'otherSafetyRef',       'TEXT',  300,  'N', 'otherSafetyRef',
    'lbl.otherSafetyRef',
    '{"renderAs":"text",        "fieldWidth":"2", "columnWidth":"20ch", "allowSorting":true}',
    'R3:C.1.13 â€” Other safety report reference number'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500018','OTHER_SAFETY_REF_VER',   'otherSafetyRefVer',    'otherSafetyRefVer',    'TEXT',  300,  'N', 'otherSafetyRefVer',
    'lbl.otherSafetyRefVer',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"10ch", "allowSorting":true}',
    'R3:C.1.13 â€” Version of other safety report reference')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;

-- â”€â”€ Tier 2: Seriousness Criteria â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO TABLE_COLUMN_METADATA (
    ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS,
    DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION)
VALUES
(gen_random_uuid()::VARCHAR,'ICSR','500','500021','SERIOUSNESS_AS_PER_COMPANY','seriousnessAsPerCompany','seriousnessAsPerCompany','TEXT',1,'N','seriousnessAsPerCompany',
    'lbl.seriousness',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":true}',
    'R2:A.1.12 / R3:E.i.3 â€” Overall seriousness as per company assessment'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500022','DEATH',                  'death',                'death',                'TEXT',  1,    'N', 'death',
    'lbl.death',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"8ch",  "allowSorting":true,  "renderCondition":"RULE_ICSR_SERIOUSNESS_FLAGS"}',
    'R2:A.1.12a / R3:E.i.3.1a â€” Resulted in death'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500023','LIFE_THREATENING',        'lifethreatening',      'lifethreatening',      'TEXT',  1,    'N', 'lifethreatening',
    'lbl.lifethreatening',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true,  "renderCondition":"RULE_ICSR_SERIOUSNESS_FLAGS"}',
    'R2:A.1.12b / R3:E.i.3.1b â€” Life threatening'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500024','HOSPITALIZATION',        'hospitalization',      'hospitalization',      'TEXT',  1,    'N', 'hospitalization',
    'lbl.hospitalization',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true,  "renderCondition":"RULE_ICSR_SERIOUSNESS_FLAGS"}',
    'R2:A.1.12c / R3:E.i.3.1c â€” Caused/prolonged hospitalisation'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500025','DISABLING',              'disabling',            'disabling',            'TEXT',  1,    'N', 'disabling',
    'lbl.disabling',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true,  "renderCondition":"RULE_ICSR_SERIOUSNESS_FLAGS"}',
    'R2:A.1.12d / R3:E.i.3.1d â€” Disabling/incapacitating'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500026','CONGENITAL_ANOMALY',     'congenitAlanomali',    'congenitAlanomali',    'TEXT',  1,    'N', 'congenitAlanomali',
    'lbl.congenitalAnomaly',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true,  "renderCondition":"RULE_ICSR_SERIOUSNESS_FLAGS"}',
    'R2:A.1.12e / R3:E.i.3.1e â€” Congenital anomaly/birth defect'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500027','OTHER_SERIOUS',          'other',                'other',                'TEXT',  1,    'N', 'other',
    'lbl.otherSerious',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true,  "renderCondition":"RULE_ICSR_SERIOUSNESS_FLAGS"}',
    'R2:A.1.12f / R3:E.i.3.1f â€” Other medically important condition'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500028','REQUIRED_INTERVENTION',  'requiredIntervenation','requiredIntervenation', 'TEXT',  1,    'N', 'requiredIntervenation',
    'lbl.requiredIntervention',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true,  "renderCondition":"RULE_ICSR_SERIOUSNESS_FLAGS"}',
    'R3:E.i.3.1g â€” Required intervention to prevent permanent impairment')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;

-- â”€â”€ Tier 3: Case Management / Workflow â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO TABLE_COLUMN_METADATA (
    ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS,
    DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION)
VALUES
(gen_random_uuid()::VARCHAR,'ICSR','500','500031','AER_NO',                 'aerNo',                'aerNo',                'TEXT',  300,  'N', 'aerNo',
    'lbl.aerNo',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true}',
    'Internal AER case number'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500032','AER_VERSION_NO',         'aerVersionNo',         'aerVersionNo',         'TEXT',  300,  'N', 'aerVersionNo',
    'lbl.aerVersionNo',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"10ch", "allowSorting":true}',
    'Internal AER version number'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500033','RECEIPT_NO',             'receiptNo',            'receiptNo',            'TEXT',  300,  'N', 'receiptNo',
    'lbl.receiptNo',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'Receipt number assigned on intake'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500034','CASE_PRIORITY',          'casepriority',         'casepriority',         'TEXT',  50,   'N', 'casepriority',
    'lbl.casePriority',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true,  "codelist":"ICSR_LOCAL_CRITERIA"}',
    'Local criteria report type / expedited classification'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500035','PRIORITY',               'priority',             'priority',             'TEXT',  50,   'N', 'priority',
    'lbl.priority',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"10ch", "allowSorting":true,  "codelist":"PRIORITY"}',
    'Report processing priority'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500036','REPORT_CLASSIFICATION',  'reportClassification', 'reportClassification', 'TEXT',  50,   'N', 'reportClassification',
    'lbl.reportClassification',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true,  "codelist":"ICSR_REPORT_CATEGORY"}',
    'Report category (AE, product problem, etc.)'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500037','REPORT_CLASSIFICATION_CATEGORY','reportClassificationCategory','reportClassificationCategory','TEXT',50,'N','reportClassificationCategory',
    'lbl.reportClassificationCategory',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"18ch", "allowSorting":true,  "codelist":"ICSR_REPORT_CLASSIFICATION"}',
    'Detailed report classification (SUSAR, literature, etc.)'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500038','SAFETY_REPORT_TYPE',     'safetyReportType',     'safetyReportType',     'TEXT',  50,   'N', 'safetyReportType',
    'lbl.safetyReportType',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true,  "codelist":"ICSR_SAFETY_REPORT_TYPE", "renderCondition":"RULE_ICSR_SAFETY_REPORT_TYPE"}',
    'Safety report type (IND, BA/BE, etc.)'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500039','SAFETY_CLASSIFICATION',  'safetyClassification', 'safetyClassification', 'TEXT',  50,   'N', 'safetyClassification',
    'lbl.safetyClassification',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true,  "codelist":"ICSR_SAFETY_CLASSIFICATION"}',
    'Safety or efficacy classification'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500040','CASE_TYPE',              'caseType',             'caseType',             'TEXT',  50,   'N', 'caseType',
    'lbl.caseType',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":true,  "codelist":"ICSR_CASE_TYPE"}',
    'Pre-market or post-market case type'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500041','INITIAL_OR_FOLLOWUP',    'intialOrFallowUpBasic','intialOrFallowUpBasic', 'TEXT',  50,   'N', 'intialOrFallowUpBasic',
    'lbl.initialOrFollowup',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":true,  "codelist":"ICSR_INITIAL_FOLLOWUP"}',
    'Indicates if this is an initial or follow-up report'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500042','ICSR_FLAG',              'icsrFlag',             'icsrFlag',             'TEXT',  50,   'N', 'icsrFlag',
    'lbl.icsrFlag',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":true,  "codelist":"ICSR_FLAG"}',
    'ICSR relevance flag (relevant / non-relevant)'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500043','SUSAR',                  'susar',                'susar',                'TEXT',  1,    'N', 'susar',
    'lbl.susar',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"8ch",  "allowSorting":true,  "renderCondition":"RULE_ICSR_SUSAR_FIELD"}',
    'Suspected Unexpected Serious Adverse Reaction flag'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500044','IS_CASE_AESI',           'isCaseAesi',           'isCaseAesi',           'TEXT',  1,    'N', 'isCaseAesi',
    'lbl.isCaseAesi',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"8ch",  "allowSorting":true,  "renderCondition":"RULE_ICSR_AESI_FIELD"}',
    'Adverse Event of Special Interest flag'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500045','BATCH_UNBLINDING',       'batchUnblinding',      'batchUnblinding',      'TEXT',  1,    'N', 'batchUnblinding',
    'lbl.batchUnblinding',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true,  "renderCondition":"RULE_ICSR_BATCH_UNBLINDING"}',
    'Batch unblinding flag for clinical trial cases'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500046','CASE_VERSION_SIGNIFICANCE','caseVersionSignificance','caseVersionSignificance','TEXT',50,'N','caseVersionSignificance',
    'lbl.caseVersionSignificance',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"18ch", "allowSorting":true,  "codelist":"ICSR_CASE_SIGNIFICANCE"}',
    'Significance of this case version for reporting'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500047','AER_APPROVAL_STATUS',    'aerApprovalStatus',    'aerApprovalStatus',    'TEXT',  50,   'N', 'aerApprovalStatus',
    'lbl.aerApprovalStatus',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true,  "readOnly":true}',
    'Current approval status of the case'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500048','AER_APPROVAL_DATE',      'aerApprovalDate',      'aerApprovalDate',      'DATE',  NULL, 'N', 'aerApprovalDate',
    'lbl.aerApprovalDate',
    '{"renderAs":"date",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true,  "readOnly":true}',
    'Date the case was approved'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500049','INITIAL_CASE_APPROVAL_DATE','initialCaseApprovalDate','initialCaseApprovalDate','DATE',NULL,'N','initialCaseApprovalDate',
    'lbl.initialCaseApprovalDate',
    '{"renderAs":"date",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true,  "readOnly":true}',
    'Date the initial version of the case was approved'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500050','CASE_DUE_DATE',          'caseDuedate',          'caseDuedate',          'DATE',  NULL, 'N', 'caseDuedate',
    'lbl.caseDueDate',
    '{"renderAs":"date",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'Regulatory due date for case submission'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500051','SUBMISSION_DUE_DATE',    'submissionDuedate',    'submissionDuedate',    'TEXT',  50,   'N', 'submissionDuedate',
    'lbl.submissionDueDate',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true,  "readOnly":true}',
    'Calculated submission due date'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500052','COMPANY_INITIAL_RECEIVED_DATE','companyInitalReceivedDate','companyInitalReceivedDate','DATE',NULL,'N','companyInitalReceivedDate',
    'lbl.companyInitialReceivedDate',
    '{"renderAs":"date",        "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true}',
    'Date the company first received the case'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500053','COMPANY_RECEIVED_DATE',  'ctuTriageDate',        'ctuTriageDate',        'DATE',  NULL, 'N', 'ctuTriageDate',
    'lbl.companyReceivedDate',
    '{"renderAs":"date",        "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true}',
    'Date/time the case was received at company triage'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500054','FOLLOW_UP',              'followUp',             'followUp',             'TEXT',  1,    'N', 'followUp',
    'lbl.followUp',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"10ch", "allowSorting":true}',
    'Indicates a follow-up is pending or received'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500055','FOLLOW_UP_REF',          'dataForFollowUpInBasic','dataForFollowUpInBasic','TEXT', 300,  'N', 'dataForFollowUpInBasic',
    'lbl.followUpRef',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true,  "renderCondition":"RULE_ICSR_FOLLOWUP_FIELDS"}',
    'Follow-up reference number'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500056','FOLLOW_UP_STATEMENT',    'followUpStatement',    'followUpStatement',    'TEXT',  300,  'N', 'followUpStatement',
    'lbl.followUpStatement',
    '{"renderAs":"text",        "fieldWidth":"3", "columnWidth":"28ch", "allowSorting":false, "renderCondition":"RULE_ICSR_FOLLOWUP_FIELDS"}',
    'Auto-generated follow-up statement'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500057','FOLLOW_UP_STATEMENT_WITH_DATA','followUpStatementWithData','followUpStatementWithData','TEXT',1000,'N','followUpStatementWithData',
    'lbl.followUpStatementWithData',
    '{"renderAs":"textarea",    "fieldWidth":"3", "columnWidth":"30ch", "allowSorting":false, "renderCondition":"RULE_ICSR_FOLLOWUP_FIELDS"}',
    'Follow-up statement with populated data'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500058','FOLLOW_UP_NOTIFICATION_STATUS','followUpNotificationStatus','followUpNotificationStatus','TEXT',1,'N','followUpNotificationStatus',
    'lbl.followUpNotified',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true,  "readOnly":true, "renderCondition":"RULE_ICSR_FOLLOWUP_FIELDS"}',
    'Indicates follow-up notification has been sent'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500059','FOLLOW_UP_NOTIFY_FLAG',  'followUpNotifyFlag',   'followUpNotifyFlag',   'TEXT',  1,    'N', 'followUpNotifyFlag',
    'lbl.followUpReceived',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true,  "readOnly":true, "renderCondition":"RULE_ICSR_FOLLOWUP_FIELDS"}',
    'Indicates follow-up has been received')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;

-- â”€â”€ Tier 4: Organisation / Assignment â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO TABLE_COLUMN_METADATA (
    ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS,
    DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION)
VALUES
(gen_random_uuid()::VARCHAR,'ICSR','500','500061','REPORTED_SENDER',        'reportedSender',       'reportedSender',       'TEXT',  300,  'N', 'reportedSender',
    'lbl.reportedSender',
    '{"renderAs":"text",        "fieldWidth":"2", "columnWidth":"22ch", "allowSorting":true}',
    'Sender organisation name as reported'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500062','ACCOUNT_NAME',           'accountName',          'accountName',          'TEXT',  300,  'N', 'accountName',
    'lbl.accountName',
    '{"renderAs":"lookup",      "fieldWidth":"2", "columnWidth":"22ch", "allowSorting":true,  "lookupModule":"ACCOUNTS", "lkpStoreValField":"accId"}',
    'Sender organisation as coded â€” lookup from ACCOUNTS'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500063','COMPANY_UNIT',           'companyUnit',          'companyUnit',          'TEXT',  300,  'N', 'companyUnit',
    'lbl.companyUnit',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true}',
    'Company unit responsible for the case'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500064','PROCESSING_UNIT',        'processingUnit',       'processingUnit',       'TEXT',  300,  'N', 'processingUnit',
    'lbl.processingUnit',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true}',
    'Processing unit handling the case'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500065','ASSIGNED_TO_NAME',       'assignToName',         'assignToName',         'TEXT',  300,  'N', 'assignToName',
    'lbl.assignedTo',
    '{"renderAs":"lookup",      "fieldWidth":"2", "columnWidth":"18ch", "allowSorting":true,  "lookupModule":"APP_USERS", "lkpStoreValField":"userName"}',
    'User assigned to process this case'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500066','CASE_OWNER_NAME',        'caseOwnerName',        'caseOwnerName',        'TEXT',  300,  'N', 'caseOwnerName',
    'lbl.caseOwner',
    '{"renderAs":"lookup",      "fieldWidth":"2", "columnWidth":"18ch", "allowSorting":true,  "lookupModule":"APP_USERS", "lkpStoreValField":"userName"}',
    'Case owner responsible for the case'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500067','ASSESSOR',               'assessor',             'assessor',             'TEXT',  300,  'N', 'assessor',
    'lbl.assessor',
    '{"renderAs":"lookup",      "fieldWidth":"2", "columnWidth":"18ch", "allowSorting":true,  "lookupModule":"APP_USERS", "lkpStoreValField":"userName"}',
    'Medical assessor for the case'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500068','SAFETY_MANAGER',         'mrFormSafetyManager',  'mrFormSafetyManager',  'TEXT',  300,  'N', 'mrFormSafetyManager',
    'lbl.safetyManager',
    '{"renderAs":"lookup",      "fieldWidth":"2", "columnWidth":"18ch", "allowSorting":true,  "lookupModule":"CONTACTS", "lkpStoreValField":"contactId"}',
    'Safety manager for the case'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500069','SAFETY_MANAGER_APPROVAL_DATE','safetyManagerApprovalCompletionDate','safetyManagerApprovalCompletionDate','DATE',NULL,'N','safetyManagerApprovalCompletionDate',
    'lbl.safetyManagerApprovalDate',
    '{"renderAs":"date",        "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true,  "readOnly":true, "renderCondition":"RULE_ICSR_SAFETY_MGR_DATE"}',
    'Date safety manager completed approval'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500070','MEDIUM_CODE',            'mediumCode',           'mediumCode',           'TEXT',  50,   'N', 'mediumCode',
    'lbl.mediumCode',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true,  "codelist":"ICSR_RECEIVE_MEDIUM"}',
    'Medium through which the report was received'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500071','SOURCE_AE_FORM_TYPE',    'sourceAeFormType',     'sourceAeFormType',     'TEXT',  50,   'N', 'sourceAeFormType',
    'lbl.sourceAeFormType',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true,  "codelist":"ICSR_RECEIVE_FORMAT"}',
    'Format in which the report was received'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500072','LRN',                    'lrn',                  'lrn',                  'TEXT',  300,  'N', 'lrn',
    'lbl.lrn',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'Local reference number'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500073','MAPPED_AER_NO',          'mappedAerNo',          'mappedAerNo',          'TEXT',  300,  'N', 'mappedAerNo',
    'lbl.mappedAerNo',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'Mapped AER number from source system'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500074','MAH_IDENTIFICATION',     'mahIdentificationCn',  'mahIdentificationCn',  'TEXT',  300,  'N', 'mahIdentificationCn',
    'lbl.mahIdentification',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true}',
    'MAH identification code'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500075','LINKED_REASON',          'linkedReason',         'linkedReason',         'TEXT',  50,   'N', 'linkedAdverseEventCollection$.linkedReason',
    'lbl.linkedReason',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true,  "codelist":"ICSR_LINKED_REASON"}',
    'Reason for linking this case to another case')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;

-- â”€â”€ Tier 5: Coding Flags (system) â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO TABLE_COLUMN_METADATA (
    ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS,
    DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION)
VALUES
(gen_random_uuid()::VARCHAR,'ICSR','500','500076','DRUG_CODED_FLAG',        'drugCodedFlag',        'drugCodedFlag',        'TEXT',  1,    'N', 'drugCodedFlag',
    'lbl.drugCoded',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"10ch", "allowSorting":true,  "readOnly":true}',
    'System flag â€” all drug products have been coded'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500077','EVENT_CODED_FLAG',       'eventCodedFlag',       'eventCodedFlag',       'TEXT',  1,    'N', 'eventCodedFlag',
    'lbl.eventCoded',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"10ch", "allowSorting":true,  "readOnly":true}',
    'System flag â€” all events have been MedDRA coded'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500078','DRUG_INDICATION_CODED',  'drugIndicationCoded',  'drugIndicationCoded',  'TEXT',  1,    'N', 'drugIndicationCoded',
    'lbl.drugIndicationCoded',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true,  "readOnly":true}',
    'System flag â€” drug indications have been coded'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500079','PARTIAL_CODED_FLAG',     'partialCodedFlag',     'partialCodedFlag',     'TEXT',  1,    'N', 'partialCodedFlag',
    'lbl.partiallyCoded',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":true,  "readOnly":true}',
    'System flag â€” case is partially coded'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500080','COMPLETION_FLAG',        'completionFlag',       'completionFlag',       'TEXT',  1,    'N', 'completionFlag',
    'lbl.completionFlag',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":true,  "readOnly":true}',
    'System flag â€” case data entry is complete'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500081','LATEST_AER',             'latestAer',            'latestAer',            'TEXT',  1,    'N', 'latestAer',
    'lbl.latestAer',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"10ch", "allowSorting":true,  "readOnly":true}',
    'System flag â€” this is the latest AER version'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500082','LATEST_APPROVED',        'latestApproved',       'latestApproved',       'TEXT',  1,    'N', 'latestApproved',
    'lbl.latestApproved',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":true,  "readOnly":true}',
    'System flag â€” this is the latest approved version')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;

-- â”€â”€ Tier 6: Admin / Non-E2B â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO TABLE_COLUMN_METADATA (
    ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS,
    DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION)
VALUES
(gen_random_uuid()::VARCHAR,'ICSR','500','500083','NON_CASE_REASON',        'nonCaseReason',        'nonCaseReason',        'TEXT',  50,   'N', 'nonCaseReason',
    'lbl.nonCaseReason',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"18ch", "allowSorting":true,  "codelist":"ICSR_NON_CASE_REASON"}',
    'Reason the case was assessed as non-case'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500084','NON_CASE_REASON_COMMENTS','nonCaseReasonComments','nonCaseReasonComments','TEXT',  50,   'N', 'nonCaseReasonComments',
    'lbl.nonCaseComments',
    '{"renderAs":"text",        "fieldWidth":"2", "columnWidth":"22ch", "allowSorting":false}',
    'Free-text comments for non-case assessment'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500085','PUBLISH_REPORT_REASON',  'publishReportReason',  'publishReportReason',  'TEXT',  300,  'N', 'publishReportReason',
    'lbl.publishReportReason',
    '{"renderAs":"text",        "fieldWidth":"2", "columnWidth":"22ch", "allowSorting":false}',
    'Reason for publishing the report assessment'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500086','REMOVE_REASON_CODE',     'removeReasonCode',     'removeReasonCode',     'TEXT',  50,   'N', 'removeReasonCode',
    'lbl.removeReasonCode',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true,  "codelist":"ICSR_REMOVE_REASON"}',
    'Reason code for removing the case from workflow'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500087','REMOVE_REASON_COMMENT',  'removeReasonComment',  'removeReasonComment',  'TEXT',  300,  'N', 'removeReasonComment',
    'lbl.removeReasonComment',
    '{"renderAs":"text",        "fieldWidth":"2", "columnWidth":"22ch", "allowSorting":false}',
    'Free-text comment for case removal'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500088','CLASSIFICATION_TYPE_CODE','classificationTypeCode','classificationTypeCode','TEXT', 50,  'N', 'classificationTypeCode',
    'lbl.classificationType',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true,  "codelist":"ICSR_CLASSIFICATION_TYPE"}',
    'Classification type (new, follow-up, duplicate, error)'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500089','OVERALL_LATENESS_REASON','overallLatenessReason', 'overallLatenessReason','TEXT',  50,   'N', 'overallLatenessReason',
    'lbl.overallLatenessReason',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true,  "codelist":"ICSR_LATENESS_REASON"}',
    'Overall reason for case processing delay'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500090','LATENESS_COMMENTS',      'latenessComments',     'latenessComments',     'TEXT',  300,  'N', 'latenessComments',
    'lbl.latenessComments',
    '{"renderAs":"text",        "fieldWidth":"2", "columnWidth":"22ch", "allowSorting":false}',
    'Inbound lateness comments'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500091','INBOUND_LATENESS_REASON','inboundLatenessReason', 'inboundLatenessReason','TEXT',  50,   'N', 'inboundLatenessReason',
    'lbl.inboundLatenessReason',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true,  "codelist":"ICSR_INBOUND_LATENESS"}',
    'Reason for inbound lateness'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500092','CORRECTIVE_ACTION_CATEGORY','correctiveActionCategorynew','correctiveActionCategorynew','TEXT',50,'N','correctiveActionCategorynew',
    'lbl.correctiveActionCategory',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"18ch", "allowSorting":true,  "codelist":"ICSR_CORRECTIVE_ACTION"}',
    'Corrective action category for device cases'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500093','DEVICE_PROBLEM_LABELING','deviceProblemLabeling', 'deviceProblemLabeling','TEXT',  50,   'N', 'deviceProblemLabeling',
    'lbl.deviceProblemLabeling',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true,  "codelist":"ICSR_DEVICE_LABELING"}',
    'Device problem labeling status (labeled/unlabeled)'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500094','DEVICE_PROBLEM_REPORT_OUTCOME','deviceProblemReportOutcome','deviceProblemReportOutcome','TEXT',50,'N','deviceProblemReportOutcome',
    'lbl.deviceProblemReportOutcome',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"18ch", "allowSorting":true,  "codelist":"ICSR_DEVICE_OUTCOME"}',
    'Outcome of the device problem report'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500095','COMBINATION_PRODUCT_REPORT','combinationProductReport','combinationProductReport','TEXT',1,'N','combinationProductReport',
    'lbl.combinationProductReport',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"18ch", "allowSorting":true}',
    'Indicates this is a combination product report'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500096','COMPOUND_OUTSOURCING_503B','compoundOutsourcing503b','compoundOutsourcing503b','TEXT',50,'N','compoundOutsourcing503b',
    'lbl.compoundOutsourcing503b',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true}',
    'Compounding outsourcing facility 503B indicator'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500097','EXEMPTION_NUMBER',       'exemptionNumber',      'exemptionNumber',      'TEXT',  300,  'N', 'exemptionNumber',
    'lbl.exemptionNumber',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'Exemption number for the case'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500098','FORM_CODE',              'formCode',             'formCode',             'TEXT',  300,  'N', 'formCode',
    'lbl.formCode',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":true}',
    'Custom form code used for data entry'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500099','CASE_QUALITY_SCORE',     'navaCaseScore',        'navaCaseScore',        'TEXT',  300,  'N', 'navaCaseScore',
    'lbl.caseQualityScore',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true,  "readOnly":true}',
    'Automated case quality score'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500100','ARCHIVED_DATE',          'archivedDate',         'archivedDate',         'DATE',  NULL, 'N', 'archivedDate',
    'lbl.archivedDate',
    '{"renderAs":"date",        "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":true,  "readOnly":true}',
    'Date the case was archived'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500101','CASE_MIGRATED_FROM',     'caseMigratedFrom',     'caseMigratedFrom',     'TEXT',  300,  'N', 'caseMigratedFrom',
    'lbl.caseMigratedFrom',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true,  "readOnly":true}',
    'Source system from which the case was migrated'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500102','AER_CLOSE_DATE',         'aerCloseDate',         'aerCloseDate',         'DATE',  NULL, 'N', 'aerCloseDate',
    'lbl.aerCloseDate',
    '{"renderAs":"date",        "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":true,  "readOnly":true}',
    'Date the AER case was closed'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500103','NO_PRODUCT',             'dmidrug',              'dmidrug',              'TEXT',  1,    'N', 'dmidrug',
    'lbl.noProduct',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"10ch", "allowSorting":true}',
    'Flag indicating no product is associated with this case'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500104','NO_SUSPECT_PRODUCT',     'dmiDrugCharacterization','dmiDrugCharacterization','TEXT',1,  'N', 'dmiDrugCharacterization',
    'lbl.noSuspectProduct',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'Flag indicating no suspect product is identified'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500105','FOLLOW_UP_STATEMENT_CHANGE_NARRATIVE','followUpStatementChangeToInitialNarrative','followUpStatementChangeToInitialNarrative','TEXT',1000,'N','followUpStatementChangeToInitialNarrative',
    'lbl.followUpStatementChangeNarrative',
    '{"renderAs":"textarea",    "fieldWidth":"3", "columnWidth":"30ch", "allowSorting":false}',
    'Follow-up statement describing changes to initial narrative'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500106','STOPPED_OUT_WF',         'sampledOutOfWf',       'sampledOutOfWf',       'TEXT',  50,   'N', 'sampledOutOfWf',
    'lbl.stoppedOutWf',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":true,  "readOnly":true}',
    'Indicates case was stopped out of workflow'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500107','STOPPED_WF_TASKS',       'stoppedWfTasksIds',    'stoppedWfTasksIds',    'TEXT',  50,   'N', 'stoppedWfTasksIds',
    'lbl.stoppedWfTasks',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true,  "readOnly":true}',
    'IDs of workflow tasks that were stopped'),

(gen_random_uuid()::VARCHAR,'ICSR','500','500108','CUSTOM_FORM_NAME',       'customFormName',       'customFormName',       'TEXT',  300,  'N', 'customFormName',
    'lbl.customFormName',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true,  "readOnly":true}',
    'Name of the custom form used for data entry')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;


-- ── 02_DB_METADATA_510.sql ──
-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 02_DB_METADATA_510.sql
-- Module  : ICSR — Table 510 (ICSR_CASE_DOCUMENTS)
-- Purpose : TABLE_METADATA + TABLE_COLUMN_METADATA
--           caseDocuments$ — multi-context attachments
--           R2: A.1.10 / R3: C.1.11 (additional documents)
--           fieldIds re-sequenced: 510001-510003
-- ============================================================



INSERT INTO TABLE_METADATA (
    ID, MODULE_ID, TABLE_ID, PARENT_TABLE_ID, DB_TABLE_NAME,
    CONTEXT_NAME, MULTI_CONTEXT, JOIN_COLUMN, REF_JOIN_COLUMN, CONTEXT_PATH)
VALUES
    (gen_random_uuid()::VARCHAR, 'ICSR', '510', '500', 'ICSR_CASE_DOCUMENTS',
     'caseDocuments', 'Y', 'CASE_ID', 'ID', 'caseDocuments$')
ON CONFLICT (MODULE_ID, TABLE_ID) DO NOTHING;

INSERT INTO TABLE_COLUMN_METADATA (
    ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS,
    DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION)
VALUES
(gen_random_uuid()::VARCHAR,'ICSR','510','510001','FILE_NAME',           'fileName',           'fileName',           'TEXT',  300, 'Y', 'caseDocuments$.fileName',
    'lbl.fileName',
    '{"renderAs":"text",        "fieldWidth":"2", "columnWidth":"28ch", "allowSorting":true}',
    'R3:C.1.11.1 — Name of the attached document file'),

(gen_random_uuid()::VARCHAR,'ICSR','510','510002','IS_DOCUMENT_INCLUDED','isDocumentIncluded', 'isDocumentIncluded', 'TEXT',  50,  'N', 'caseDocuments$.isDocumentIncluded',
    'lbl.isDocumentIncluded',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true,  "codelist":"ICSR_DOC_INCLUDED"}',
    'R3:C.1.11.2 — Indicates whether the document is included with the transmission'),

(gen_random_uuid()::VARCHAR,'ICSR','510','510003','FILE_S3_PATH',        'fileS3Path',         'fileS3Path',         'TEXT',  300, 'N', 'caseDocuments$.fileS3Path',
    'lbl.fileS3Path',
    '{"renderAs":"text",        "fieldWidth":"3", "columnWidth":"36ch", "allowSorting":false, "readOnly":true}',
    'Internal S3 storage path of the uploaded document')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;


-- ── 02_DB_METADATA_515.sql ──
-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 02_DB_METADATA_515.sql
-- Module  : ICSR — Table 515 (ICSR_REPORTER_INFORMATIONS)
-- Purpose : TABLE_METADATA + TABLE_COLUMN_METADATA
--           reporterInformations$ — first-level multi-context
--           R2: A.2 / R3: C.2.r — Primary source information
--           FK: CASE_ID → ICSR_CASES(ID)
--           fieldIds ordered by E2B weight:
--           515001-515005  Tier 1: Core R2/R3 mandatory
--           515006-515012  Tier 2: Reporter identity
--           515013-515020  Tier 3: Professional details
--           515021-515032  Tier 4: Contact / address
-- ============================================================



INSERT INTO TABLE_METADATA (
    ID, MODULE_ID, TABLE_ID, PARENT_TABLE_ID, DB_TABLE_NAME,
    CONTEXT_NAME, MULTI_CONTEXT, JOIN_COLUMN, REF_JOIN_COLUMN, CONTEXT_PATH)
VALUES
    (gen_random_uuid()::VARCHAR, 'ICSR', '515', '500', 'ICSR_REPORTER_INFORMATIONS',
     'reporterInformations', 'Y', 'CASE_ID', 'ID', 'reporterInformations$')
ON CONFLICT (MODULE_ID, TABLE_ID) DO NOTHING;

INSERT INTO TABLE_COLUMN_METADATA (
    ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS,
    DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION)
VALUES

-- ── Tier 1: Core E2B R2(A.2) / R3(C.2.r) ────────────────────
(gen_random_uuid()::VARCHAR,'ICSR','515','515001','PRIMARY_REPORTER',       'primaryReporter',       'primaryReporter',       'TEXT',  1,   'N', 'reporterInformations$.primaryReporter',
    'lbl.primaryReporter',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'R2:A.2.1 / R3:C.2.r.1 — Indicates this is the primary reporter'),

(gen_random_uuid()::VARCHAR,'ICSR','515','515002','E2B_R3_REGULATORY_PURPOSE','e2bRegulatoryPurpose', 'e2bRegulatoryPurpose',  'TEXT',  1,   'N', 'reporterInformations$.e2bRegulatoryPurpose',
    'lbl.e2bRegulatoryPurpose',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"18ch", "allowSorting":true}',
    'R3:C.2.r.1 — Primary source for regulatory purposes (R3 only)'),

(gen_random_uuid()::VARCHAR,'ICSR','515','515003','DO_NOT_REPORT_NAME',        'doNotReportName',       'doNotReportName',       'TEXT',  1,   'N', 'reporterInformations$.doNotReportName',
    'lbl.doNotReportName',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true}',
    'R2:A.2.1.1 / R3:C.2.r.1.1 — Protect reporter confidentiality'),

(gen_random_uuid()::VARCHAR,'ICSR','515','515004','REPORTER_TYPE',          'reporterType',          'reporterType',          'TEXT',  50,  'N', 'reporterInformations$.reporterType',
    'lbl.reporterQualification',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"20ch", "allowSorting":true,  "codelist":"CONTACT_QUALIFICATION"}',
    'R2:A.2.1.2 / R3:C.2.r.4 — Reporter qualification / type'),

(gen_random_uuid()::VARCHAR,'ICSR','515','515005','REPORTER_SENT_TO_FDA',   'reporterSentToFDA',     'reporterSentToFDA',     'TEXT',  50,  'N', 'reporterInformations$.reporterSentToFDA',
    'lbl.reporterSentToFDA',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"20ch", "allowSorting":true,  "codelist":"ICSR_REPORTER_INFORMED_AUTH"}',
    'R2:A.2.1.3 — Reporter informed authority directly (Yes/No/Unknown)'),

-- ── Tier 2: Reporter Identity ─────────────────────────────────
(gen_random_uuid()::VARCHAR,'ICSR','515','515006','REPORTER_TITLE',          'reporterTitle',         'reporterTitle',         'TEXT',  50,  'N', 'reporterInformations$.reporterTitle',
    'lbl.reporterTitle',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"10ch", "allowSorting":true,  "codelist":"CONTACT_TITLE"}',
    'R2:A.2.1.4 / R3:C.2.r.2.1 — Reporter title / salutation'),

(gen_random_uuid()::VARCHAR,'ICSR','515','515007','REPORTER_GIVEN_NAME',      'reporterGivenName',     'reporterGivenName',     'TEXT',  50,  'N', 'reporterInformations$.reporterGivenName',
    'lbl.reporterGivenName',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true}',
    'R2:A.2.1.5 / R3:C.2.r.2.2 — Reporter first / given name'),

(gen_random_uuid()::VARCHAR,'ICSR','515','515008','REPORTER_MIDDLE_NAME',     'reporterMiddleName',    'reporterMiddleName',    'TEXT',  50,  'N', 'reporterInformations$.reporterMiddleName',
    'lbl.reporterMiddleName',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'Reporter middle name'),

(gen_random_uuid()::VARCHAR,'ICSR','515','515009','REPORTER_FAMILY_NAME',     'reporterFamilyName',    'reporterFamilyName',    'TEXT',  50,  'N', 'reporterInformations$.reporterFamilyName',
    'lbl.reporterFamilyName',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true}',
    'R2:A.2.1.6 / R3:C.2.r.2.3 — Reporter last / family name'),

(gen_random_uuid()::VARCHAR,'ICSR','515','515010','REPORTER_OR_CONTACT',    'reporterOrContact',     'reporterOrContact',     'TEXT',  50,  'N', 'reporterInformations$.reporterOrContact',
    'lbl.reporterOrContact',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true,  "codelist":"ICSR_PERSON_TYPE"}',
    'Person type — reporter, investigator, or author'),

(gen_random_uuid()::VARCHAR,'ICSR','515','515011','CONSENT_CONTACT',        'consentToContacts',     'consentToContacts',     'TEXT',  1,   'N', 'reporterInformations$.consentToContacts',
    'lbl.consentToContacts',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'Consent given to contact the reporter for follow-up'),

(gen_random_uuid()::VARCHAR,'ICSR','515','515012','FOLLOW_UP',              'followUp',              'followUp',              'TEXT',  1,   'N', 'reporterInformations$.followUp',
    'lbl.canFollowUp',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":true}',
    'Indicates follow-up with this reporter is possible'),

-- ── Tier 3: Professional Details ─────────────────────────────
(gen_random_uuid()::VARCHAR,'ICSR','515','515013','IS_HEALTH_PROFESSIONAL',         'isHealthProf',          'isHealthProf',          'TEXT',  1,   'N', 'reporterInformations$.isHealthProf',
    'lbl.isHealthProf',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true}',
    'R2:A.2.1.2a — Indicates reporter is a healthcare professional'),

(gen_random_uuid()::VARCHAR,'ICSR','515','515014','OCCUPATION',             'occupation',            'occupation',            'TEXT',  50,  'N', 'reporterInformations$.occupation',
    'lbl.occupation',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"18ch", "allowSorting":true,  "codelist":"ICSR_REPORTER_OCCUPATION"}',
    'Reporter occupation / role'),

(gen_random_uuid()::VARCHAR,'ICSR','515','515015','SPECIALTY',              'speciality',            'speciality',            'TEXT',  50,  'N', 'reporterInformations$.speciality',
    'lbl.speciality',
    '{"renderAs":"combo",       "fieldWidth":"2", "columnWidth":"22ch", "allowSorting":true,  "codelist":"CONTACT_SPECIALIZATION"}',
    'R2:A.2.1.2b — Reporter medical specialisation'),

(gen_random_uuid()::VARCHAR,'ICSR','515','515016','HCP_CLASSIFICATION_KR',  'hCPClassificationKR',   'hCPClassificationKR',   'TEXT',  50,  'N', 'reporterInformations$.hCPClassificationKR',
    'lbl.hcpClassification',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"20ch", "allowSorting":true,  "codelist":"ICSR_HCP_CLASSIFICATION"}',
    'Detailed HCP classification (Korea-specific)'),

(gen_random_uuid()::VARCHAR,'ICSR','515','515017','OTHERHCP_KR',            'otherHCPKR',            'otherHCPKR',            'TEXT',  50,  'N', 'reporterInformations$.otherHCPKR',
    'lbl.otherHCP',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true,  "codelist":"ICSR_OTHER_HCP"}',
    'Other healthcare professional type (Korea-specific)'),

(gen_random_uuid()::VARCHAR,'ICSR','515','515018','REPORTER_ORGANIZATION',   'reporterOrganization',  'reporterOrganization',  'TEXT',  50,  'N', 'reporterInformations$.reporterOrganization',
    'lbl.reporterOrganization',
    '{"renderAs":"text",        "fieldWidth":"2", "columnWidth":"24ch", "allowSorting":true}',
    'R2:A.2.1.7 / R3:C.2.r.2.4 — Reporter hospital or organisation name'),

(gen_random_uuid()::VARCHAR,'ICSR','515','515019','REPORTER_DEPARTMENT',    'reporterDeptartment',   'reporterDeptartment',   'TEXT',  50,  'N', 'reporterInformations$.reporterDeptartment',
    'lbl.reporterDepartment',
    '{"renderAs":"lookup",      "fieldWidth":"2", "columnWidth":"20ch", "allowSorting":true,  "lookupModule":"DEPARTMENTS", "lkpStoreValField":"departmentCode"}',
    'Reporter department — lookup from DEPARTMENTS module'),

(gen_random_uuid()::VARCHAR,'ICSR','515','515020','PHYSICIAN_CODE',         'physicianCode',         'physicianCode',         'TEXT',  300, 'N', 'reporterInformations$.physicianCode',
    'lbl.physicianCode',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'Physician or HCP registration code'),

(gen_random_uuid()::VARCHAR,'ICSR','515','515021','PRIMARY_SRC_LIT_REF','primarySrcLitrRefenceNumber','primarySrcLitrRefenceNumber','TEXT',300,'N','reporterInformations$.primarySrcLitrRefenceNumber',
    'lbl.literatureReference',
    '{"renderAs":"text",        "fieldWidth":"3", "columnWidth":"28ch", "allowSorting":true}',
    'R2:A.2.1.8 — Literature reference number for literature-sourced cases'),

-- ── Tier 4: Contact / Address ─────────────────────────────────
(gen_random_uuid()::VARCHAR,'ICSR','515','515022','REPORTER_STREET',         'reporterStreet',        'reporterStreet',        'TEXT',  50,  'N', 'reporterInformations$.reporterStreet',
    'lbl.reporterStreet',
    '{"renderAs":"text",        "fieldWidth":"2", "columnWidth":"22ch", "allowSorting":false}',
    'R2:A.2.1.9 / R3:C.2.r.3.1 — Reporter street address'),

(gen_random_uuid()::VARCHAR,'ICSR','515','515023','STREET_ADDRESS',         'streetAddress',         'streetAddress',         'TEXT',  50,  'N', 'reporterInformations$.streetAddress',
    'lbl.streetAddress',
    '{"renderAs":"text",        "fieldWidth":"2", "columnWidth":"22ch", "allowSorting":false}',
    'Reporter full street address line'),

(gen_random_uuid()::VARCHAR,'ICSR','515','515024','PO_BOX',                 'poBox',                 'poBox',                 'TEXT',  50,  'N', 'reporterInformations$.poBox',
    'lbl.poBox',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":false}',
    'Reporter P.O. Box'),

(gen_random_uuid()::VARCHAR,'ICSR','515','515025','REPORTER_CITY',           'reporterCity',          'reporterCity',          'TEXT',  50,  'N', 'reporterInformations$.reporterCity',
    'lbl.reporterCity',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'R2:A.2.1.10 / R3:C.2.r.3.2 — Reporter city'),

(gen_random_uuid()::VARCHAR,'ICSR','515','515026','REPORTER_STATE',          'reporterState',         'reporterState',         'TEXT',  50,  'N', 'reporterInformations$.reporterState',
    'lbl.reporterState',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'R2:A.2.1.11 / R3:C.2.r.3.3 — Reporter state or province'),

(gen_random_uuid()::VARCHAR,'ICSR','515','515027','REPORTER_POSTCODE',       'reporterPostCode',      'reporterPostCode',      'TEXT',  50,  'N', 'reporterInformations$.reporterPostCode',
    'lbl.reporterPostCode',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":true}',
    'R2:A.2.1.12 / R3:C.2.r.3.4 — Reporter postal code'),

(gen_random_uuid()::VARCHAR,'ICSR','515','515028','REPORTER_COUNTRY',        'reporterCountry',       'reporterCountry',       'TEXT',  50,  'N', 'reporterInformations$.reporterCountry',
    'lbl.reporterCountry',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true,  "codelist":"COUNTRY"}',
    'R2:A.2.1.13 / R3:C.2.r.3.5 — Reporter country'),

(gen_random_uuid()::VARCHAR,'ICSR','515','515029','PHONE',                  'phone',                 'phone',                 'TEXT',  50,  'N', 'reporterInformations$.phone',
    'lbl.reporterPhone',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":false}',
    'R2:A.2.1.14 / R3:C.2.r.3.6 — Reporter telephone number'),

(gen_random_uuid()::VARCHAR,'ICSR','515','515030','TELEPHONE',              'residanceTelephone',    'residanceTelephone',    'TEXT',  50,  'N', 'reporterInformations$.residanceTelephone',
    'lbl.reporterPhoneResidence',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":false}',
    'Reporter residence telephone number'),

(gen_random_uuid()::VARCHAR,'ICSR','515','515031','FAX',                    'fax',                   'fax',                   'TEXT',  300, 'N', 'reporterInformations$.fax',
    'lbl.reporterFax',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":false}',
    'R2:A.2.1.15 / R3:C.2.r.3.7 — Reporter fax number'),

(gen_random_uuid()::VARCHAR,'ICSR','515','515032','EMAIL',                  'email',                 'email',                 'TEXT',  300, 'N', 'reporterInformations$.email',
    'lbl.reporterEmail',
    '{"renderAs":"text",        "fieldWidth":"2", "columnWidth":"24ch", "allowSorting":false}',
    'R2:A.2.1.16 / R3:C.2.r.3.8 — Reporter email address'),

-- ── R3 C.2.r.3.9 — missing from source JSON, added for R3 compliance ─
(gen_random_uuid()::VARCHAR,'ICSR','515','515033','REPORTER_COUNTRY_PRACTICE','reporterCountryPractice','reporterCountryPractice','TEXT', 50,  'N', 'reporterInformations$.reporterCountryPractice',
    'lbl.reporterCountryPractice',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true,  "codelist":"COUNTRY"}',
    'R3:C.2.r.3.9 — Country where the reporter practices (may differ from address country)')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;


-- ── 02_DB_METADATA_520.sql ──
-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 02_DB_METADATA_520.sql
-- Module  : ICSR — Table 520 (ICSR_SOURCE_INFORMATIONS)
-- Purpose : TABLE_METADATA + TABLE_COLUMN_METADATA
--           sourceInformations$ — first-level multi-context
--           R2: A.1 (source/reference tracking)
--           R3: C.1 supplementary source info
--           FK: CASE_ID → ICSR_CASES(ID)
--           Note: dateReceived (515002 in source JSON) moved
--           here as 520009 — correct fieldPath is sourceInformations$
--           Added: 520010 senderOrganisationType (R3:C.1.6.1)
-- ============================================================



INSERT INTO TABLE_METADATA (
    ID, MODULE_ID, TABLE_ID, PARENT_TABLE_ID, DB_TABLE_NAME,
    CONTEXT_NAME, MULTI_CONTEXT, JOIN_COLUMN, REF_JOIN_COLUMN, CONTEXT_PATH)
VALUES
    (gen_random_uuid()::VARCHAR, 'ICSR', '520', '500', 'ICSR_SOURCE_INFORMATIONS',
     'sourceInformations', 'Y', 'CASE_ID', 'ID', 'sourceInformations$')
ON CONFLICT (MODULE_ID, TABLE_ID) DO NOTHING;

INSERT INTO TABLE_COLUMN_METADATA (
    ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS,
    DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION)
VALUES

-- ── Tier 1: Core source identification ───────────────────────
(gen_random_uuid()::VARCHAR,'ICSR','520','520001','PRIMARY_SOURCE_FLAG',    'primarySourceFlag',    'primarySourceFlag',    'TEXT',  1,   'N', 'sourceInformations$.primarySourceFlag',
    'lbl.primarySource',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":true}',
    'R2:A.1 — Indicates this is the primary source for the case'),

(gen_random_uuid()::VARCHAR,'ICSR','520','520002','SOURCE',                 'source',               'source',               'TEXT',  50,  'N', 'sourceInformations$.source',
    'lbl.source',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"18ch", "allowSorting":true,  "codelist":"ICSR_SOURCE_TYPE"}',
    'R2:A.1 / R3:C.1 — Source type (spontaneous, study, literature, etc.)'),

(gen_random_uuid()::VARCHAR,'ICSR','520','520003','DATE_RECEIVED',          'dateReceived',         'dateReceived',         'DATE',  NULL,'N', 'sourceInformations$.dateReceived',
    'lbl.dateReceived',
    '{"renderAs":"date",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'R2:A.1.5 / R3:C.1.7 — Date received from this source'),

(gen_random_uuid()::VARCHAR,'ICSR','520','520004','ORIGINATING_ACCOUNT',    'originatingAccount',   'originatingAccount',   'TEXT',  300, 'N', 'sourceInformations$.originatingAccount',
    'lbl.originatingAccount',
    '{"renderAs":"lookup",      "fieldWidth":"2", "columnWidth":"22ch", "allowSorting":true,  "lookupModule":"ACCOUNTS", "lkpStoreValField":"accId"}',
    'R2:A.1 — Sender organisation for this source — lookup from ACCOUNTS'),

-- ── Tier 2: Reference tracking ───────────────────────────────
(gen_random_uuid()::VARCHAR,'ICSR','520','520005','IDENTIFICATION_NUMBER',  'identificationNo',     'identificationNo',     'TEXT',  300, 'N', 'sourceInformations$.identificationNo',
    'lbl.identificationNo',
    '{"renderAs":"text",        "fieldWidth":"2", "columnWidth":"20ch", "allowSorting":true}',
    'Reference number from the originating source'),

(gen_random_uuid()::VARCHAR,'ICSR','520','520006','REFERENCE_TYPE',         'referenceType',        'referenceType',        'TEXT',  50,  'N', 'sourceInformations$.referenceType',
    'lbl.referenceType',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"20ch", "allowSorting":true,  "codelist":"ICSR_SOURCE_REF_TYPE"}',
    'Type of reference number (manufacturer no., regulatory ref, etc.)'),

(gen_random_uuid()::VARCHAR,'ICSR','520','520007','SOURCE_AER_NUMBER',      'sourceAerNumber',      'sourceAerNumber',      'TEXT',  300, 'N', 'sourceInformations$.sourceAerNumber',
    'lbl.sourceAerNumber',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true}',
    'AER version number from the source system'),

(gen_random_uuid()::VARCHAR,'ICSR','520','520008','FOLLOW_UP',              'followUp',             'followUp',             'TEXT',  1,   'N', 'sourceInformations$.followUp',
    'lbl.sourceFollowUp',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"10ch", "allowSorting":true}',
    'Indicates a follow-up is expected from this source'),

(gen_random_uuid()::VARCHAR,'ICSR','520','520009','DESCRIPTION',            'description',          'description',          'TEXT',  300, 'N', 'sourceInformations$.description',
    'lbl.sourceDescription',
    '{"renderAs":"textarea",    "fieldWidth":"3", "columnWidth":"28ch", "allowSorting":false}',
    'Free-text description of the source'),

-- ── R3 C.1.6.1 — added for R3 compliance (not in source JSON) ─
(gen_random_uuid()::VARCHAR,'ICSR','520','520010','SENDER_ORGANISATION_TYPE','senderOrganisationType','senderOrganisationType','TEXT', 50,  'N', 'sourceInformations$.senderOrganisationType',
    'lbl.senderOrganisationType',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"18ch", "allowSorting":true,  "codelist":"ICSR_SENDER_ORG_TYPE"}',
    'R3:C.1.6.1 — Type of sender organisation (added for R3 compliance)')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;


-- ── 02_DB_METADATA_530.sql ──
-- placeholder
-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 02_DB_METADATA_530.sql
-- Module  : ICSR — Table 530 (ICSR_PATIENT)
-- Purpose : TABLE_METADATA + TABLE_COLUMN_METADATA
--           patient — 1:1 child of ICSR_CASES
--           R2: B.1 / R3: D — Patient characteristics
--           FK: CASE_ID → ICSR_CASES(ID)
--           CN-specific fields excluded.
--           fieldIds ordered by E2B weight:
--           530001-530010  Tier 1: Core R2/R3 mandatory
--           530011-530020  Tier 2: Demographics
--           530021-530032  Tier 3: Physical characteristics
--           530033-530036  Tier 4: Medical background
--           530037-530039  Tier 5: Death / Autopsy
--           530040-530047  Tier 6: Contact / Address
--           530048-530052  Tier 7: Record numbers
--           530053-530059  Tier 8: Vaccine-specific
--           530060-530064  Tier 9: Biological father
--           530065-530066  Tier 10: Admin
-- ============================================================



INSERT INTO TABLE_METADATA (
    ID, MODULE_ID, TABLE_ID, PARENT_TABLE_ID, DB_TABLE_NAME,
    CONTEXT_NAME, MULTI_CONTEXT, JOIN_COLUMN, REF_JOIN_COLUMN, CONTEXT_PATH)
VALUES
    (gen_random_uuid()::VARCHAR, 'ICSR', '530', '500', 'ICSR_PATIENT',
     'patient', 'N', 'CASE_ID', 'ID', 'patient')
ON CONFLICT (MODULE_ID, TABLE_ID) DO NOTHING;

-- ── Tier 1: Core E2B R2(B.1) / R3(D) ────────────────────────
INSERT INTO TABLE_COLUMN_METADATA (
    ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS,
    DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION)
VALUES
(gen_random_uuid()::VARCHAR,'ICSR','530','530001','PATIENT_INITIAL',         'patientInitial',       'patientInitial',       'TEXT',  50,  'N', 'patient.patientInitial',
    'lbl.patientInitial',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":true}',
    'R2:B.1.1 / R3:D.1 — Patient initials or identifier'),

(gen_random_uuid()::VARCHAR,'ICSR','530','530002','PAT_SEX',                 'patSex',               'patSex',               'TEXT',  50,  'N', 'patient.patSex',
    'lbl.patSex',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"10ch", "allowSorting":true,  "codelist":"SEX"}',
    'R2:B.1.2 / R3:D.5 — Patient sex (ICH E2B standard)'),

(gen_random_uuid()::VARCHAR,'ICSR','530','530003','GENDER',                 'patGender',            'patGender',            'TEXT',  50,  'N', 'patient.patGender',
    'lbl.patGender',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true,  "codelist":"ICSR_PAT_GENDER"}',
    'R3:D.5.1 — Patient gender identity (extended R3 field)'),

(gen_random_uuid()::VARCHAR,'ICSR','530','530004','PAT_DOB',                 'patDob',               'patDob',               'TEXT',  50,  'N', 'patient.patDob',
    'lbl.patDob',
    '{"renderAs":"date",        "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":true}',
    'R2:B.1.3 / R3:D.2.1 — Patient date of birth'),

(gen_random_uuid()::VARCHAR,'ICSR','530','530005','PAT_ONSET_AGE',          'patOnsetAge',          'patOnsetAge',          'TEXT',  300, 'N', 'patient.patOnsetAge',
    'lbl.patOnsetAge',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"10ch", "allowSorting":true}',
    'R2:B.1.4 / R3:D.2.2a — Patient age at time of onset'),

(gen_random_uuid()::VARCHAR,'ICSR','530','530006','PAT_ONSET_AGE_UNIT',     'patOnsetAgeUnit',      'patOnsetAgeUnit',      'TEXT',  50,  'N', 'patient.patOnsetAgeUnit',
    'lbl.patOnsetAgeUnit',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":true,  "codelist":"ICSR_AGE_UNIT"}',
    'R2:B.1.4 / R3:D.2.2b — Unit for patient age at onset'),

(gen_random_uuid()::VARCHAR,'ICSR','530','530007','PAT_AGE_GROUP',          'patAgeGroup',          'patAgeGroup',          'TEXT',  50,  'N', 'patient.patAgeGroup',
    'lbl.patAgeGroup',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true,  "codelist":"ICSR_AGE_GROUP"}',
    'R2:B.1.5 / R3:D.2.3 — Patient age group'),

(gen_random_uuid()::VARCHAR,'ICSR','530','530008','PATIENT_AGE_IN_YEARS',   'patientAgeInYears',    'patientAgeInYears',    'TEXT',  300, 'N', 'patient.patientAgeInYears',
    'lbl.patientAgeInYears',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"10ch", "allowSorting":true,  "readOnly":true}',
    'Calculated patient age in years (system-derived)'),

(gen_random_uuid()::VARCHAR,'ICSR','530','530009','DO_NOT_REPORT_NAME',        'doNotReportName',      'doNotReportName',      'TEXT',  1,   'N', 'patient.doNotReportName',
    'lbl.patDoNotReportName',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true}',
    'R2:B.1.1.1 / R3:D.1.1 — Protect patient confidentiality'),

(gen_random_uuid()::VARCHAR,'ICSR','530','530010','PATIENT_IDENTIFIABLE',   'patientIdentify',      'patientIdentify',      'TEXT',  1,   'N', 'patient.patientIdentify',
    'lbl.patientIdentify',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true}',
    'R2:B.1 — Indicates patient is identifiable')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;

-- ── Tier 2: Demographics ─────────────────────────────────────
INSERT INTO TABLE_COLUMN_METADATA (
    ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS,
    DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION)
VALUES
(gen_random_uuid()::VARCHAR,'ICSR','530','530011','TITLE',                  'title',                'title',                'TEXT',  50,  'N', 'patient.title',
    'lbl.patTitle',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"10ch", "allowSorting":true,  "codelist":"CONTACT_TITLE"}',
    'Patient title / salutation'),

(gen_random_uuid()::VARCHAR,'ICSR','530','530012','PATIENT_FIRST_NAME',     'patientFirstName',     'patientFirstName',     'TEXT',  300, 'N', 'patient.patientFirstName',
    'lbl.patFirstName',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true}',
    'Patient first name'),

(gen_random_uuid()::VARCHAR,'ICSR','530','530013','MIDDLE_NAME',            'middleName',           'middleName',           'TEXT',  300, 'N', 'patient.middleName',
    'lbl.patMiddleName',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'Patient middle name'),

(gen_random_uuid()::VARCHAR,'ICSR','530','530014','PATIENT_LAST_NAME',      'patientLastName',      'patientLastName',      'TEXT',  300, 'N', 'patient.patientLastName',
    'lbl.patLastName',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true}',
    'Patient last name'),

(gen_random_uuid()::VARCHAR,'ICSR','530','530015','GENDER_OTHER',           'patGenderOther',       'patGenderOther',       'TEXT',  50,  'N', 'patient.patGenderOther',
    'lbl.patGenderOther',
    '{"renderAs":"text",        "fieldWidth":"2", "columnWidth":"18ch", "allowSorting":false}',
    'R3:D.5.1 — Specify other gender category'),

(gen_random_uuid()::VARCHAR,'ICSR','530','530016','SELECTED_RACE_IDS',      'selectedRaceIds',      'selectedRaceIds',      'TEXT',  50,  'N', 'patient.selectedRaceIds',
    'lbl.race',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"18ch", "allowSorting":true,  "codelist":"ICSR_PAT_RACE"}',
    'R3:D.7 — Patient race'),

(gen_random_uuid()::VARCHAR,'ICSR','530','530017','ETHNIC_ORIGIN',          'ethenicOrgin',         'ethenicOrgin',         'TEXT',  50,  'N', 'patient.ethenicOrgin',
    'lbl.ethnicity',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true,  "codelist":"ICSR_PAT_ETHNICITY"}',
    'R3:D.8 — Patient ethnicity'),

(gen_random_uuid()::VARCHAR,'ICSR','530','530018','CONSENT_TO_CONTACT',     'consentToContact',     'consentToContact',     'TEXT',  50,  'N', 'patient.consentToContact',
    'lbl.consentToContact',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true,  "codelist":"ICSR_CONSENT"}',
    'Consent to contact the patient for follow-up'),

(gen_random_uuid()::VARCHAR,'ICSR','530','530019','FOLLOW_UP',              'followUp',             'followUp',             'TEXT',  1,   'N', 'patient.followUp',
    'lbl.patFollowUp',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":true}',
    'Indicates follow-up with patient is possible'),

(gen_random_uuid()::VARCHAR,'ICSR','530','530020','PATIENT_MILITARY_STATUS','patientPatientMilitaryStatus','patientPatientMilitaryStatus','TEXT',50,'N','patient.patientPatientMilitaryStatus',
    'lbl.militaryStatus',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true,  "codelist":"ICSR_MILITARY_STATUS"}',
    'Patient military status (US-specific)')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;

-- ── Tier 3: Physical Characteristics ─────────────────────────
INSERT INTO TABLE_COLUMN_METADATA (
    ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS,
    DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION)
VALUES
(gen_random_uuid()::VARCHAR,'ICSR','530','530021','PAT_WEIGHT',             'patWeight',            'patWeight',            'TEXT',  300, 'N', 'patient.patWeight',
    'lbl.patWeight',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"10ch", "allowSorting":true}',
    'R2:B.1.6 / R3:D.3 — Patient weight'),

(gen_random_uuid()::VARCHAR,'ICSR','530','530022','PAT_WEIGHT_UNIT',        'patWeightUnitCode',    'patWeightUnitCode',    'TEXT',  50,  'N', 'patient.patWeightUnitCode',
    'lbl.patWeightUnit',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":true,  "codelist":"ICSR_WEIGHT_UNIT"}',
    'R2:B.1.6 / R3:D.3 — Unit for patient weight'),

(gen_random_uuid()::VARCHAR,'ICSR','530','530023','PAT_HEIGHT',             'patHeight',            'patHeight',            'TEXT',  300, 'N', 'patient.patHeight',
    'lbl.patHeight',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"10ch", "allowSorting":true}',
    'R2:B.1.7 / R3:D.4 — Patient height'),

(gen_random_uuid()::VARCHAR,'ICSR','530','530024','PAT_HEIGHT_UNIT',        'patHeightUnitCode',    'patHeightUnitCode',    'TEXT',  50,  'N', 'patient.patHeightUnitCode',
    'lbl.patHeightUnit',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":true,  "codelist":"ICSR_HEIGHT_UNIT"}',
    'R2:B.1.7 / R3:D.4 — Unit for patient height'),

(gen_random_uuid()::VARCHAR,'ICSR','530','530025','BIRTH_WEIGHT',           'birthWeight',          'birthWeight',          'TEXT',  300, 'N', 'patient.birthWeight',
    'lbl.birthWeight',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"10ch", "allowSorting":true}',
    'Patient birth weight (neonatal cases)'),

(gen_random_uuid()::VARCHAR,'ICSR','530','530026','BIRTH_WEIGHT_UNIT',      'birthWeightUnit',      'birthWeightUnit',      'TEXT',  50,  'N', 'patient.birthWeightUnit',
    'lbl.birthWeightUnit',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":true,  "codelist":"ICSR_WEIGHT_UNIT"}',
    'Unit for patient birth weight'),

(gen_random_uuid()::VARCHAR,'ICSR','530','530027','BODY_MASS_INDEX',        'bodyMassIndex',        'bodyMassIndex',        'TEXT',  300, 'N', 'patient.bodyMassIndex',
    'lbl.bodyMassIndex',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"10ch", "allowSorting":true}',
    'Patient body mass index (BMI)'),

(gen_random_uuid()::VARCHAR,'ICSR','530','530028','BODY_SURFACE_INDEX',     'bodySurfaceIndex',     'bodySurfaceIndex',     'TEXT',  300, 'N', 'patient.bodySurfaceIndex',
    'lbl.bodySurfaceIndex',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":true}',
    'Patient body surface area index'),

(gen_random_uuid()::VARCHAR,'ICSR','530','530029','PAT_LAST_MENSTRUAL_DATE','patLastMenstrualDate', 'patLastMenstrualDate', 'TEXT',  50,  'N', 'patient.patLastMenstrualDate',
    'lbl.patLMP',
    '{"renderAs":"date",        "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":true}',
    'R2:B.1.8 / R3:D.6 — Last menstrual period date'),

(gen_random_uuid()::VARCHAR,'ICSR','530','530030','PAT_PREGNANT',           'patientPregnant',      'patientPregnant',      'TEXT',  50,  'N', 'patient.patientPregnant',
    'lbl.patientPregnant',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":true,  "codelist":"YES_NO"}',
    'R2:B.1.9 / R3:D.9 — Was patient pregnant at time of event'),

(gen_random_uuid()::VARCHAR,'ICSR','530','530031','GESTATION_PERIOD',       'gestatationPeriod',    'gestatationPeriod',    'TEXT',  300, 'N', 'patient.gestatationPeriod',
    'lbl.gestationalAge',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":true}',
    'R2:B.1.10 / R3:D.10 — Gestational age at time of event'),

(gen_random_uuid()::VARCHAR,'ICSR','530','530032','GESTATION_PERIOD_UNIT',  'gestatationPeriodUnit','gestatationPeriodUnit', 'TEXT',  50,  'N', 'patient.gestatationPeriodUnit',
    'lbl.gestationalAgeUnit',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":true,  "codelist":"ICSR_GESTATION_UNIT"}',
    'R2:B.1.10 / R3:D.10 — Unit for gestational age')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;

-- ── Tier 4: Medical Background ───────────────────────────────
INSERT INTO TABLE_COLUMN_METADATA (
    ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS,
    DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION)
VALUES
(gen_random_uuid()::VARCHAR,'ICSR','530','530033','PAT_MEDICAL_HISTORY_TEXT','patMedicalHistoryText','patMedicalHistoryText', 'TEXT',  300, 'N', 'patient.patMedicalHistoryText',
    'lbl.patMedicalHistoryText',
    '{"renderAs":"textarea",    "fieldWidth":"3", "columnWidth":"30ch", "allowSorting":false}',
    'R2:B.1.11 / R3:D.7.1 — Medical history and concurrent conditions (free text)'),

(gen_random_uuid()::VARCHAR,'ICSR','530','530034','RESULTS_TESTS_PROCEDURES','resultsTestsProcedures','resultsTestsProcedures','TEXT', 300, 'N', 'patient.resultsTestsProcedures',
    'lbl.resultsTestsProcedures',
    '{"renderAs":"textarea",    "fieldWidth":"3", "columnWidth":"30ch", "allowSorting":false}',
    'R2:B.1.12 / R3:D.7.2 — Results of tests and procedures (free text)'),

(gen_random_uuid()::VARCHAR,'ICSR','530','530035','HAS_CONCOMITANT_THERAPIES','concomitantTherapies', 'concomitantTherapies', 'TEXT',  1,   'N', 'patient.concomitantTherapies',
    'lbl.concomitantTherapies',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"18ch", "allowSorting":true}',
    'Indicates concomitant therapies are present (see drug section)'),

(gen_random_uuid()::VARCHAR,'ICSR','530','530036','HEALTH_DAMAGE_TYPE',     'healthDamageType',     'healthDamageType',     'TEXT',  50,  'N', 'patient.healthDamageType',
    'lbl.healthDamageType',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true,  "codelist":"YES_NO"}',
    'Health damage type indicator (Yes/No/Unknown)')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;

-- ── Tier 5: Death / Autopsy ───────────────────────────────────
INSERT INTO TABLE_COLUMN_METADATA (
    ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS,
    DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION)
VALUES
(gen_random_uuid()::VARCHAR,'ICSR','530','530037','PAT_DEATH_DATE',         'patDeathDate',         'patDeathDate',         'TEXT',  50,  'N', 'patient.patDeathDate',
    'lbl.patDeathDate',
    '{"renderAs":"date",        "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":true}',
    'R2:B.1.13 / R3:D.11 — Date of patient death'),

(gen_random_uuid()::VARCHAR,'ICSR','530','530038','PAT_AUTOPSY_YES_NO',     'patAutopsyYesNo',      'patAutopsyYesNo',      'TEXT',  1,   'N', 'patient.patAutopsyYesNo',
    'lbl.patAutopsyYesNo',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":true}',
    'R2:B.1.14 / R3:D.12 — Was autopsy performed'),

(gen_random_uuid()::VARCHAR,'ICSR','530','530039','PAT_AUTOPSY_DATE',       'patAutopsyDate',       'patAutopsyDate',       'TEXT',  50,  'N', 'patient.patAutopsyDate',
    'lbl.patAutopsyDate',
    '{"renderAs":"date",        "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":true}',
    'Date of autopsy')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;

-- ── Tier 6: Contact / Address ─────────────────────────────────
INSERT INTO TABLE_COLUMN_METADATA (
    ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS,
    DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION)
VALUES
(gen_random_uuid()::VARCHAR,'ICSR','530','530040','ADDRESS1',               'patientAddress1',      'patientAddress1',      'TEXT',  300, 'N', 'patient.patientAddress1',
    'lbl.patAddress1',
    '{"renderAs":"text",        "fieldWidth":"2", "columnWidth":"22ch", "allowSorting":false}',
    'Patient street address line 1'),

(gen_random_uuid()::VARCHAR,'ICSR','530','530041','ADDRESS2',               'patientAddress2',      'patientAddress2',      'TEXT',  300, 'N', 'patient.patientAddress2',
    'lbl.patAddress2',
    '{"renderAs":"text",        "fieldWidth":"2", "columnWidth":"22ch", "allowSorting":false}',
    'Patient street address line 2'),

(gen_random_uuid()::VARCHAR,'ICSR','530','530042','CITY',                   'patientCity',          'patientCity',          'TEXT',  300, 'N', 'patient.patientCity',
    'lbl.patCity',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'Patient city'),

(gen_random_uuid()::VARCHAR,'ICSR','530','530043','STATE',                  'patientState',         'patientState',         'TEXT',  300, 'N', 'patient.patientState',
    'lbl.patState',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'Patient state or province'),

(gen_random_uuid()::VARCHAR,'ICSR','530','530044','POSTAL_CODE',            'patientZipCode',       'patientZipCode',       'TEXT',  300, 'N', 'patient.patientZipCode',
    'lbl.patZipCode',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"10ch", "allowSorting":true}',
    'Patient postal / ZIP code'),

(gen_random_uuid()::VARCHAR,'ICSR','530','530045','COUNTRY',                'country',              'country',              'TEXT',  50,  'N', 'patient.country',
    'lbl.patCountry',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true,  "codelist":"COUNTRY"}',
    'Patient country of residence'),

(gen_random_uuid()::VARCHAR,'ICSR','530','530046','COUNTY',                 'patientCounty',        'patientCounty',        'TEXT',  300, 'N', 'patient.patientCounty',
    'lbl.patCounty',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'Patient county'),

(gen_random_uuid()::VARCHAR,'ICSR','530','530047','PHONE_NUMBER',           'phoneNo',              'phoneNo',              'TEXT',  300, 'N', 'patient.phoneNo',
    'lbl.patPhone',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":false}',
    'Patient telephone number'),

(gen_random_uuid()::VARCHAR,'ICSR','530','530048','EMAIL',               'emailID',              'emailID',              'TEXT',  300, 'N', 'patient.emailID',
    'lbl.patEmail',
    '{"renderAs":"text",        "fieldWidth":"2", "columnWidth":"22ch", "allowSorting":false}',
    'Patient email address')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;

-- ── Tier 7: Record Numbers ────────────────────────────────────
INSERT INTO TABLE_COLUMN_METADATA (
    ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS,
    DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION)
VALUES
(gen_random_uuid()::VARCHAR,'ICSR','530','530049','PAT_HOSPITAL_RECORD_NUMB','patHospitalRecordNumb','patHospitalRecordNumb', 'TEXT',  50,  'N', 'patient.patHospitalRecordNumb',
    'lbl.patHospitalRecordNumb',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true}',
    'R2:B.1.1.2 — Patient hospital record number'),

(gen_random_uuid()::VARCHAR,'ICSR','530','530050','PAT_MEDICAL_RECORD_NUMB','patMedicalRecordNumb', 'patMedicalRecordNumb', 'TEXT',  50,  'N', 'patient.patMedicalRecordNumb',
    'lbl.patMedicalRecordNumb',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true}',
    'Patient GP medical record number'),

(gen_random_uuid()::VARCHAR,'ICSR','530','530051','PAT_SPECIALIST_RECORD_NUMB','patSpecialistRecordNumb','patSpecialistRecordNumb','TEXT',50,'N','patient.patSpecialistRecordNumb',
    'lbl.patSpecialistRecordNumb',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true}',
    'Patient specialist record number'),

(gen_random_uuid()::VARCHAR,'ICSR','530','530052','PAT_INVESTIGATION_NUMB', 'patInvestigationNumb', 'patInvestigationNumb', 'TEXT',  50,  'N', 'patient.patInvestigationNumb',
    'lbl.patInvestigationNumb',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true}',
    'Patient investigation number'),

(gen_random_uuid()::VARCHAR,'ICSR','530','530053','REGISTRATION_NO',        'registrationNo',       'registrationNo',       'TEXT',  300, 'N', 'patient.registrationNo',
    'lbl.patRegistrationNo',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'Patient registration number')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;

-- ── Tier 8: Vaccine-Specific ──────────────────────────────────
INSERT INTO TABLE_COLUMN_METADATA (
    ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS,
    DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION)
VALUES
(gen_random_uuid()::VARCHAR,'ICSR','530','530054','VAC_AGE',                'patientAgeAtTimeOfVaccine','patientAgeAtTimeOfVaccine','TEXT',300,'N','patient.patientAgeAtTimeOfVaccine',
    'lbl.ageAtVaccine',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":true}',
    'Patient age at time of vaccination'),

(gen_random_uuid()::VARCHAR,'ICSR','530','530055','VAC_AGE_UNIT',           'patientAgeAtTimeOfVaccineUnit','patientAgeAtTimeOfVaccineUnit','TEXT',50,'N','patient.patientAgeAtTimeOfVaccineUnit',
    'lbl.ageAtVaccineUnit',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":true,  "codelist":"ICSR_AGE_UNIT"}',
    'Unit for patient age at time of vaccination'),

(gen_random_uuid()::VARCHAR,'ICSR','530','530056','VAC_ILLNESS',            'patientIllnessAtTimeOfVaccine','patientIllnessAtTimeOfVaccine','TEXT',300,'N','patient.patientIllnessAtTimeOfVaccine',
    'lbl.illnessAtVaccine',
    '{"renderAs":"text",        "fieldWidth":"2", "columnWidth":"22ch", "allowSorting":false}',
    'Illness present at time of vaccination (verbatim)'),

(gen_random_uuid()::VARCHAR,'ICSR','530','530057','VAC_MEDDRA_PT_CODE',     'patientVaccineMeddraPTCode','patientVaccineMeddraPTCode','TEXT',300,'N','patient.patientVaccineMeddraPTCode',
    'lbl.vaccineMeddraPT',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true}',
    'MedDRA PT code for illness at time of vaccination'),

(gen_random_uuid()::VARCHAR,'ICSR','530','530058','VAC_MEDDRA_LLT_CODE',    'patientVaccineMeddraLLTCode','patientVaccineMeddraLLTCode','TEXT',300,'N','patient.patientVaccineMeddraLLTCode',
    'lbl.vaccineMeddraLLT',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true}',
    'MedDRA LLT code for illness at time of vaccination'),

(gen_random_uuid()::VARCHAR,'ICSR','530','530059','VAC_PREGNANT',           'patientPregnantAtTimeOfVaccine','patientPregnantAtTimeOfVaccine','TEXT',1,'N','patient.patientPregnantAtTimeOfVaccine',
    'lbl.pregnantAtVaccine',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"18ch", "allowSorting":true}',
    'Was patient pregnant at time of vaccination')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;

-- ── Tier 9: Biological Father ─────────────────────────────────
INSERT INTO TABLE_COLUMN_METADATA (
    ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS,
    DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION)
VALUES
(gen_random_uuid()::VARCHAR,'ICSR','530','530060','PARTNER_NAME',           'partnerName',          'partnerName',          'TEXT',  50,  'N', 'patient.partnerName',
    'lbl.partnerName',
    '{"renderAs":"text",        "fieldWidth":"2", "columnWidth":"18ch", "allowSorting":true}',
    'R3:D.9.1 — Biological father name'),

(gen_random_uuid()::VARCHAR,'ICSR','530','530061','PARTNER_DOB',            'partnerDOB',           'partnerDOB',           'TEXT',  50,  'N', 'patient.partnerDOB',
    'lbl.partnerDOB',
    '{"renderAs":"date",        "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":true}',
    'R3:D.9.2 — Biological father date of birth'),

(gen_random_uuid()::VARCHAR,'ICSR','530','530062','BIOLOGICAL_FATHER_AGE',  'biologicalFatherAge',  'biologicalFatherAge',  'TEXT',  300, 'N', 'patient.biologicalFatherAge',
    'lbl.biologicalFatherAge',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"10ch", "allowSorting":true}',
    'R3:D.9.3 — Biological father age'),

(gen_random_uuid()::VARCHAR,'ICSR','530','530063','BIOLOGICAL_FATHER_AGE_UNIT','biologicalFatherAgeUnit','biologicalFatherAgeUnit','TEXT',50,'N','patient.biologicalFatherAgeUnit',
    'lbl.biologicalFatherAgeUnit',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":true,  "codelist":"ICSR_AGE_UNIT"}',
    'R3:D.9.3 — Unit for biological father age'),

(gen_random_uuid()::VARCHAR,'ICSR','530','530064','BIO_FATHER_CONTACT',     'partnerContactDtls',   'partnerContactDtls',   'TEXT',  50,  'N', 'patient.partnerContactDtls',
    'lbl.partnerContactDtls',
    '{"renderAs":"text",        "fieldWidth":"2", "columnWidth":"20ch", "allowSorting":false}',
    'R3:D.9.4 — Biological father contact details')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;

-- ── Tier 10: Admin ────────────────────────────────────────────
INSERT INTO TABLE_COLUMN_METADATA (
    ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS,
    DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION)
VALUES
(gen_random_uuid()::VARCHAR,'ICSR','530','530065','EVENT_DATE',             'eventStartDate',       'eventStartDate',       'DATE',  NULL,'N', 'patient.eventStartDate',
    'lbl.eventStartDate',
    '{"renderAs":"date",        "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":true}',
    'R2:B.2.1 / R3:E.i.4 — Date of event onset (denormalised from event section)'),

(gen_random_uuid()::VARCHAR,'ICSR','530','530066','USER_NOT_INTENDED_RECIPIENT','userIntendedRecepient','userIntendedRecepient', 'TEXT',  1,   'N', 'patient.userIntendedRecepient',
    'lbl.userIntendedRecepient',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"18ch", "allowSorting":true}',
    'User is not the intended recipient of the product')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;


-- ── 02_DB_METADATA_535.sql ──
-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 02_DB_METADATA_535.sql
-- Module  : ICSR — Table 535 (ICSR_PATIENT_SUMMARY)
-- Purpose : TABLE_METADATA + TABLE_COLUMN_METADATA
--           patient.summary — 1:1 child of ICSR_CASES
--           R2: H / R3: H — Case narrative and comments
--           FK: CASE_ID → ICSR_CASES(ID)
--           fieldIds ordered by E2B weight:
--           535001-535004  Tier 1: Core R2(H)/R3(H) narratives
--           535005-535009  Tier 2: Medical assessment
--           535010-535013  Tier 3: Clinical narrative
--           535014-535018  Tier 4: Device / corrective actions
--           535019-535020  Tier 5: Admin
-- ============================================================



INSERT INTO TABLE_METADATA (
    ID, MODULE_ID, TABLE_ID, PARENT_TABLE_ID, DB_TABLE_NAME,
    CONTEXT_NAME, MULTI_CONTEXT, JOIN_COLUMN, REF_JOIN_COLUMN, CONTEXT_PATH)
VALUES
    (gen_random_uuid()::VARCHAR, 'ICSR', '535', '500', 'ICSR_PATIENT_SUMMARY',
     'summary', 'N', 'CASE_ID', 'ID', 'patient.summary')
ON CONFLICT (MODULE_ID, TABLE_ID) DO NOTHING;

-- ── Tier 1: Core R2(H) / R3(H) Narratives ────────────────────
INSERT INTO TABLE_COLUMN_METADATA (
    ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS,
    DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION)
VALUES
(gen_random_uuid()::VARCHAR,'ICSR','535','535001','COMPANY_NARRATIVE',      'zcompanyNarrative',    'zcompanyNarrative',    'TEXT',  NULL,'N', 'patient.summary.zcompanyNarrative',
    'lbl.companyNarrative',
    '{"renderAs":"textarea",    "fieldWidth":"3", "columnWidth":"40ch", "allowSorting":false}',
    'R2:H.1 / R3:H.1 — Case narrative / event description (company)'),

(gen_random_uuid()::VARCHAR,'ICSR','535','535002','REPORTERCOMMENT',        'zreporterComment',     'zreporterComment',     'TEXT',  NULL,'N', 'patient.summary.zreporterComment',
    'lbl.reporterComment',
    '{"renderAs":"textarea",    "fieldWidth":"3", "columnWidth":"40ch", "allowSorting":false}',
    'R2:H.2 / R3:H.2 — Reaction description as reported by the reporter'),

(gen_random_uuid()::VARCHAR,'ICSR','535','535003','SENDERCOMMENT',          'zsenderComment',       'zsenderComment',       'TEXT',  NULL,'N', 'patient.summary.zsenderComment',
    'lbl.senderComment',
    '{"renderAs":"textarea",    "fieldWidth":"3", "columnWidth":"40ch", "allowSorting":false}',
    'R2:H.3 / R3:H.3 — Sender''s comments / company remarks'),

(gen_random_uuid()::VARCHAR,'ICSR','535','535004','SUMMARY_DESCRIPTION',    'summaryDescription',   'summaryDescription',   'TEXT',  NULL,'N', 'patient.summary.summaryDescription',
    'lbl.summaryDescription',
    '{"renderAs":"textarea",    "fieldWidth":"3", "columnWidth":"40ch", "allowSorting":false}',
    'R3:H.4 — Summary description of the case'),

-- ── Tier 2: Medical Assessment ────────────────────────────────
(gen_random_uuid()::VARCHAR,'ICSR','535','535005','EVALUATION_COMMENTS',    'evaluationComments',   'evaluationComments',   'TEXT',  NULL,'N', 'patient.summary.evaluationComments',
    'lbl.evaluationComments',
    '{"renderAs":"textarea",    "fieldWidth":"3", "columnWidth":"40ch", "allowSorting":false}',
    'R2:H.4 — Pharmacovigilance / medical assessment comments'),

(gen_random_uuid()::VARCHAR,'ICSR','535','535006','EVALUATION_SUMMARY',     'evaluationsummary',    'evaluationsummary',    'TEXT',  NULL,'N', 'patient.summary.evaluationsummary',
    'lbl.evaluationSummary',
    '{"renderAs":"textarea",    "fieldWidth":"3", "columnWidth":"40ch", "allowSorting":false}',
    'Summary of the medical evaluation'),

(gen_random_uuid()::VARCHAR,'ICSR','535','535007','ADDITIONAL_INFORMATION', 'additionalInformation','additionalInformation','TEXT',  300, 'N', 'patient.summary.additionalInformation',
    'lbl.additionalInformation',
    '{"renderAs":"textarea",    "fieldWidth":"3", "columnWidth":"30ch", "allowSorting":false}',
    'Additional information relevant to the case'),

(gen_random_uuid()::VARCHAR,'ICSR','535','535008','ADDTIONAL_COMMENTS',     'addtionalComments',    'addtionalComments',    'TEXT',  300, 'N', 'patient.summary.addtionalComments',
    'lbl.additionalComments',
    '{"renderAs":"textarea",    "fieldWidth":"3", "columnWidth":"30ch", "allowSorting":false}',
    'Additional comments on the case'),

(gen_random_uuid()::VARCHAR,'ICSR','535','535009','WHAT_FURTHER_INVESTIGATIONS','whatFurtherInvestigations','whatFurtherInvestigations','TEXT',300,'N','patient.summary.whatFurtherInvestigations',
    'lbl.whatFurtherInvestigations',
    '{"renderAs":"textarea",    "fieldWidth":"3", "columnWidth":"30ch", "allowSorting":false}',
    'Planned further investigations to reach final conclusions'),

-- ── Tier 3: Clinical Narrative ────────────────────────────────
(gen_random_uuid()::VARCHAR,'ICSR','535','535010','PATIENT_DURING_EVENT_DESC','patientDuringEvent',  'patientDuringEvent',   'TEXT',  300, 'N', 'patient.summary.patientDuringEvent',
    'lbl.patientDuringEvent',
    '{"renderAs":"textarea",    "fieldWidth":"3", "columnWidth":"30ch", "allowSorting":false}',
    'Description of patient condition during the event'),

(gen_random_uuid()::VARCHAR,'ICSR','535','535011','TREATMENT_FOLLOWING_EVENT','treatmentfollowingEvent','treatmentfollowingEvent','TEXT',300,'N','patient.summary.treatmentfollowingEvent',
    'lbl.treatmentFollowingEvent',
    '{"renderAs":"textarea",    "fieldWidth":"3", "columnWidth":"30ch", "allowSorting":false}',
    'Treatment administered following the adverse event'),

(gen_random_uuid()::VARCHAR,'ICSR','535','535012','MANUFACTURER_NARRATIVE', 'manufactureeNarrative','manufactureeNarrative', 'TEXT',  300, 'N', 'patient.summary.manufactureeNarrative',
    'lbl.manufacturerNarrative',
    '{"renderAs":"textarea",    "fieldWidth":"3", "columnWidth":"30ch", "allowSorting":false}',
    'Final comments / narrative from the manufacturer'),

(gen_random_uuid()::VARCHAR,'ICSR','535','535013','ADD_MANUFACTURER_NARRATIVE','additionalmanufacturernarrative','additionalmanufacturernarrative','TEXT',300,'N','patient.summary.additionalmanufacturernarrative',
    'lbl.additionalManufacturerNarrative',
    '{"renderAs":"textarea",    "fieldWidth":"3", "columnWidth":"30ch", "allowSorting":false}',
    'Additional manufacturer narrative'),

-- ── Tier 4: Device / Corrective Actions ──────────────────────
(gen_random_uuid()::VARCHAR,'ICSR','535','535014','CORRECTIVE_ACTIONS',     'correctiveActions',    'correctiveActions',    'TEXT',  300, 'N', 'patient.summary.correctiveActions',
    'lbl.correctiveActions',
    '{"renderAs":"textarea",    "fieldWidth":"3", "columnWidth":"30ch", "allowSorting":false}',
    'Corrective actions taken in response to the event'),

(gen_random_uuid()::VARCHAR,'ICSR','535','535015','CORRECTIVE_PREVN_NARRATIVE','correctivePreventionActionNarrative','correctivePreventionActionNarrative','TEXT',300,'N','patient.summary.correctivePreventionActionNarrative',
    'lbl.correctivePreventionNarrative',
    '{"renderAs":"textarea",    "fieldWidth":"3", "columnWidth":"30ch", "allowSorting":false}',
    'Description of remedial / corrective / preventive action narrative'),

(gen_random_uuid()::VARCHAR,'ICSR','535','535016','IDENTIFIED_ACTON_NARRATIVE','identifiedActionsNarrative','identifiedActionsNarrative','TEXT',300,'N','patient.summary.identifiedActionsNarrative',
    'lbl.identifiedActionsNarrative',
    '{"renderAs":"textarea",    "fieldWidth":"3", "columnWidth":"30ch", "allowSorting":false}',
    'Narrative of identified actions taken'),

(gen_random_uuid()::VARCHAR,'ICSR','535','535017','CORRECTED_DATA',         'correcteddata',        'correcteddata',        'TEXT',  300, 'N', 'patient.summary.correcteddata',
    'lbl.correctedData',
    '{"renderAs":"textarea",    "fieldWidth":"3", "columnWidth":"30ch", "allowSorting":false}',
    'Description of corrected data in follow-up reports'),

(gen_random_uuid()::VARCHAR,'ICSR','535','535018','PRODUCT_COMPLAINT_DETAILS','productComplaintDetails','productComplaintDetails','TEXT',300,'N','patient.summary.productComplaintDetails',
    'lbl.productComplaintDetails',
    '{"renderAs":"textarea",    "fieldWidth":"3", "columnWidth":"30ch", "allowSorting":false}',
    'Product quality complaint details'),

(gen_random_uuid()::VARCHAR,'ICSR','535','535019','VALUE',                  'value',                'value',                'TEXT',  300, 'N', 'patient.summary.initialManufactureAnalysis',
    'lbl.initialManufacturerAnalysis',
    '{"renderAs":"textarea",    "fieldWidth":"3", "columnWidth":"30ch", "allowSorting":false}',
    'Initial manufacturer analysis of the event'),

-- ── Tier 5: Admin ─────────────────────────────────────────────
(gen_random_uuid()::VARCHAR,'ICSR','535','535020','FOLLOW_UP',              'followUp',             'followUp',             'TEXT',  1,   'N', 'patient.summary.followUp',
    'lbl.summaryFollowUp',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"10ch", "allowSorting":true}',
    'Indicates a follow-up is expected for this summary')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;


-- ── 02_DB_METADATA_540.sql ──
-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 02_DB_METADATA_540.sql
-- Module  : ICSR — Table 540 (ICSR_PATIENT_MEDICAL_HISTORIES)
-- Purpose : TABLE_METADATA + TABLE_COLUMN_METADATA
--           patient.patientMedicalHistory$ — first-level multi-context
--           R2: B.1.7 / R3: D.7.r — Patient medical history episodes
--           FK: CASE_ID → ICSR_CASES(ID)
--           fieldIds ordered by E2B weight:
--           540001-540006  Tier 1: Core R2/R3 mandatory
--           540007-540010  Tier 2: Classification
--           540011-540012  Tier 3: Duration
--           540013-540015  Tier 4: Coding / Admin
-- ============================================================



INSERT INTO TABLE_METADATA (
    ID, MODULE_ID, TABLE_ID, PARENT_TABLE_ID, DB_TABLE_NAME,
    CONTEXT_NAME, MULTI_CONTEXT, JOIN_COLUMN, REF_JOIN_COLUMN, CONTEXT_PATH)
VALUES
    (gen_random_uuid()::VARCHAR, 'ICSR', '540', '500', 'ICSR_PATIENT_MEDICAL_HISTORIES',
     'patientMedicalHistory', 'Y', 'CASE_ID', 'ID', 'patient.patientMedicalHistory$')
ON CONFLICT (MODULE_ID, TABLE_ID) DO NOTHING;

-- ── Tier 1: Core R2(B.1.7) / R3(D.7.r) ──────────────────────
INSERT INTO TABLE_COLUMN_METADATA (
    ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS,
    DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION)
VALUES
(gen_random_uuid()::VARCHAR,'ICSR','540','540001','MEDICAL_EPISODE_NAME',     'medicalEpisodeName',   'medicalEpisodeName',   'TEXT',  50,  'N', 'patient.patientMedicalHistory$.medicalEpisodeName',
    'lbl.medicalEpisodeName',
    '{"renderAs":"text",        "fieldWidth":"3", "columnWidth":"28ch", "allowSorting":true}',
    'R2:B.1.7.1a / R3:D.7.r.1a — Medical history episode verbatim term'),

(gen_random_uuid()::VARCHAR,'ICSR','540','540002','MEDICAL_EPISODE_LLT_CODE',    'medicalEpisodeMeddraCode','medicalEpisodeMeddraCode','TEXT',50,'N','patient.patientMedicalHistory$.medicalEpisodeMeddraCode',
    'lbl.medicalEpisodeLLT',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'R2:B.1.7.1b / R3:D.7.r.1b — MedDRA LLT code for medical history term'),

(gen_random_uuid()::VARCHAR,'ICSR','540','540003','MEDICAL_EPISODE_PT_CODE',       'medicalHistoryLLTCode','medicalHistoryLLTCode', 'TEXT',  300, 'N', 'patient.patientMedicalHistory$.medicalHistoryLLTCode',
    'lbl.medicalHistoryPT',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'R3:D.7.r.1c — MedDRA PT code for medical history term'),

(gen_random_uuid()::VARCHAR,'ICSR','540','540004','MEDICAL_START_DATE',       'medicalStartDate',     'medicalStartDate',     'TEXT',  50,  'N', 'patient.patientMedicalHistory$.medicalStartDate',
    'lbl.medicalStartDate',
    '{"renderAs":"date",        "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":true}',
    'R2:B.1.7.2 / R3:D.7.r.2 — Start date of medical history episode'),

(gen_random_uuid()::VARCHAR,'ICSR','540','540005','MEDICAL_END_DATE',         'medicalEndDate',       'medicalEndDate',       'TEXT',  50,  'N', 'patient.patientMedicalHistory$.medicalEndDate',
    'lbl.medicalEndDate',
    '{"renderAs":"date",        "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":true}',
    'R2:B.1.7.3 / R3:D.7.r.3 — End date of medical history episode'),

(gen_random_uuid()::VARCHAR,'ICSR','540','540006','MEDICAL_CONTINUE',        'medicalContinue',      'medicalContinue',      'TEXT',  1,   'N', 'patient.patientMedicalHistory$.medicalContinue',
    'lbl.medicalContinue',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":true}',
    'R2:B.1.7.4 / R3:D.7.r.4 — Is the condition still continuing at time of report'),

-- ── Tier 2: Classification ────────────────────────────────────
(gen_random_uuid()::VARCHAR,'ICSR','540','540007','DISEASE_TYPE',           'diseaseType',          'diseaseType',          'TEXT',  50,  'N', 'patient.patientMedicalHistory$.diseaseType',
    'lbl.diseaseType',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"18ch", "allowSorting":true,  "codelist":"ICSR_MED_HIST_TYPE"}',
    'Type of medical history entry (current/historical condition or procedure)'),

(gen_random_uuid()::VARCHAR,'ICSR','540','540008','CONDITION_TREATED',      'conditionTreated',     'conditionTreated',     'TEXT',  1,   'N', 'patient.patientMedicalHistory$.conditionTreated',
    'lbl.conditionTreated',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'Indicates the condition was being treated at time of event'),

(gen_random_uuid()::VARCHAR,'ICSR','540','540009','IS_FAMILY_HISTORY',      'e2bR3FamilyHist',      'e2bR3FamilyHist',      'TEXT',  1,   'N', 'patient.patientMedicalHistory$.e2bR3FamilyHist',
    'lbl.familyHistory',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":true}',
    'R3:D.7.r.5 — Indicates this is a family history entry (R3 only)'),

(gen_random_uuid()::VARCHAR,'ICSR','540','540010','ILLNESS_AT_VACCINE', 'illnessAtVaccination', 'illnessAtVaccination', 'TEXT',  300, 'N', 'patient.patientMedicalHistory$.illnessAtVaccination',
    'lbl.illnessAtVaccination',
    '{"renderAs":"text",        "fieldWidth":"2", "columnWidth":"22ch", "allowSorting":false}',
    'Illness present at time of vaccination (vaccine cases)'),

-- ── Tier 3: Duration ─────────────────────────────────────────
(gen_random_uuid()::VARCHAR,'ICSR','540','540011','DURATION',               'duration',             'duration',             'TEXT',  300, 'N', 'patient.patientMedicalHistory$.duration',
    'lbl.medHistDuration',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"10ch", "allowSorting":true}',
    'Duration of the medical history episode'),

(gen_random_uuid()::VARCHAR,'ICSR','540','540012','DURATION_UNIT',          'durationUnit',         'durationUnit',         'TEXT',  50,  'N', 'patient.patientMedicalHistory$.durationUnit',
    'lbl.medHistDurationUnit',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":true,  "codelist":"ICSR_DURATION_UNIT"}',
    'Unit for the duration of the medical history episode'),

-- ── Tier 4: Coding / Admin ────────────────────────────────────
(gen_random_uuid()::VARCHAR,'ICSR','540','540013','CODING_TYPE',            'codingType',           'codingType',           'TEXT',  50,  'N', 'patient.patientMedicalHistory$.codingType',
    'lbl.codingType',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true,  "codelist":"ICSR_CODING_TYPE"}',
    'MedDRA coding method used for this medical history term'),

(gen_random_uuid()::VARCHAR,'ICSR','540','540014','CONCOMITANT_THERAPIES',  'concomitantTherapies', 'concomitantTherapies', 'TEXT',  1,   'N', 'patient.patientMedicalHistory$.concomitantTherapies',
    'lbl.concomitantTherapies',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"18ch", "allowSorting":true}',
    'Indicates this condition was treated with concomitant therapy'),

(gen_random_uuid()::VARCHAR,'ICSR','540','540015','MEDICAL_COMMENT',         'medicalComment',       'medicalComment',       'TEXT',  50,  'N', 'patient.patientMedicalHistory$.medicalComment',
    'lbl.medicalComment',
    '{"renderAs":"textarea",    "fieldWidth":"3", "columnWidth":"28ch", "allowSorting":false}',
    'Free-text comments on the medical history episode')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;


-- ── 02_DB_METADATA_545.sql ──
-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 02_DB_METADATA_545.sql
-- Module  : ICSR — Table 545 (ICSR_PATIENT_PAST_DRUG_THERAPIES)
-- Purpose : TABLE_METADATA + TABLE_COLUMN_METADATA
--           patient.patientPastDrugTherapies$ — first-level multi-context
--           R2: B.1.8 / R3: D.8.r — Patient past drug therapy
--           FK: CASE_ID → ICSR_CASES(ID)
--           fieldIds ordered by E2B weight:
--           545001-545008  Tier 1: Core product identification
--           545009-545015  Tier 2: MedDRA coding + product IDs
--           545016-545019  Tier 3: Dates + vaccine
--           545020-545028  Tier 4: Additional product details
-- ============================================================



INSERT INTO TABLE_METADATA (
    ID, MODULE_ID, TABLE_ID, PARENT_TABLE_ID, DB_TABLE_NAME,
    CONTEXT_NAME, MULTI_CONTEXT, JOIN_COLUMN, REF_JOIN_COLUMN, CONTEXT_PATH)
VALUES
    (gen_random_uuid()::VARCHAR, 'ICSR', '545', '500', 'ICSR_PATIENT_PAST_DRUG_THERAPIES',
     'patientPastDrugTherapies', 'Y', 'CASE_ID', 'ID', 'patient.patientPastDrugTherapies$')
ON CONFLICT (MODULE_ID, TABLE_ID) DO NOTHING;

-- ── Tier 1: Core Product Identification ──────────────────────
INSERT INTO TABLE_COLUMN_METADATA (
    ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS,
    DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION)
VALUES
(gen_random_uuid()::VARCHAR,'ICSR','545','545001','DRUG_NAME',              'drugName',             'drugName',             'TEXT',  300, 'N', 'patient.patientPastDrugTherapies$.drugName',
    'lbl.pastDrugName',
    '{"renderAs":"text",        "fieldWidth":"2", "columnWidth":"24ch", "allowSorting":true}',
    'R2:B.1.8.1 / R3:D.8.r.1 — Past drug product name as reported'),

(gen_random_uuid()::VARCHAR,'ICSR','545','545002','PRODUCT_NAMEAS_REPORTED','productNameASReported','productNameASReported', 'TEXT',  300, 'N', 'patient.patientPastDrugTherapies$.productNameASReported',
    'lbl.pastProductDescription',
    '{"renderAs":"text",        "fieldWidth":"2", "columnWidth":"24ch", "allowSorting":true}',
    'R3:D.8.r.1 — Past drug product description'),

(gen_random_uuid()::VARCHAR,'ICSR','545','545003','INVENTED_NAME',         'inventedName',         'inventedName',         'TEXT',  50,  'N', 'patient.patientPastDrugTherapies$.inventedName',
    'lbl.inventedName',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"18ch", "allowSorting":true}',
    'Invented / brand name of the past drug'),

(gen_random_uuid()::VARCHAR,'ICSR','545','545004','TRADEMARK_NAME',        'tradeMarkName',        'tradeMarkName',        'TEXT',  50,  'N', 'patient.patientPastDrugTherapies$.tradeMarkName',
    'lbl.tradeMarkName',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"18ch", "allowSorting":true}',
    'Trademark name of the past drug'),

(gen_random_uuid()::VARCHAR,'ICSR','545','545005','SCIENTIFIC_NAME',       'scientificName',       'scientificName',       'TEXT',  50,  'N', 'patient.patientPastDrugTherapies$.scientificName',
    'lbl.scientificName',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"18ch", "allowSorting":true}',
    'Scientific / INN name of the past drug'),

(gen_random_uuid()::VARCHAR,'ICSR','545','545006','WHODD_CODE',            'whoddCode',            'whoddCode',            'TEXT',  300, 'N', 'patient.patientPastDrugTherapies$.whoddCode',
    'lbl.whoddCode',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'WHO Drug Dictionary code for the past drug'),

(gen_random_uuid()::VARCHAR,'ICSR','545','545007','WHODD_MPID',            'whoddMPID',            'whoddMPID',            'TEXT',  300, 'N', 'patient.patientPastDrugTherapies$.whoddMPID',
    'lbl.whoddMPID',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'WHO Drug Dictionary MPID for the past drug'),

(gen_random_uuid()::VARCHAR,'ICSR','545','545008','KDD_CODE',              'kddcode',              'kddcode',              'TEXT',  300, 'N', 'patient.patientPastDrugTherapies$.kddcode',
    'lbl.kddCode',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'KDD drug code (Japan-specific)'),

-- ── Tier 2: MedDRA Coding + Product IDs ──────────────────────
(gen_random_uuid()::VARCHAR,'ICSR','545','545009','DRUG_INDICATION',        'drugIndication',       'drugIndication',       'TEXT',  50,  'N', 'patient.patientPastDrugTherapies$.drugIndication',
    'lbl.pastDrugIndication',
    '{"renderAs":"text",        "fieldWidth":"2", "columnWidth":"22ch", "allowSorting":true}',
    'R2:B.1.8.2 / R3:D.8.r.2 — Indication for past drug (verbatim)'),

(gen_random_uuid()::VARCHAR,'ICSR','545','545010','DRUG_INDICATION_LLT_CODE',   'drugIndicationMeddraCode','drugIndicationMeddraCode','TEXT',300,'N','patient.patientPastDrugTherapies$.drugIndicationMeddraCode',
    'lbl.pastDrugIndicationLLT',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'R2:B.1.8.2a / R3:D.8.r.2a — MedDRA LLT code for past drug indication'),

(gen_random_uuid()::VARCHAR,'ICSR','545','545011','DRUG_INDICATION_PT_CODE', 'drugIndicationMeddraPtCode','drugIndicationMeddraPtCode','TEXT',300,'N','patient.patientPastDrugTherapies$.drugIndicationMeddraPtCode',
    'lbl.pastDrugIndicationPT',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'R3:D.8.r.2b — MedDRA PT code for past drug indication'),

(gen_random_uuid()::VARCHAR,'ICSR','545','545012','DRUG_REACTION',          'drugReaction',         'drugReaction',         'TEXT',  50,  'N', 'patient.patientPastDrugTherapies$.drugReaction',
    'lbl.pastDrugReaction',
    '{"renderAs":"text",        "fieldWidth":"2", "columnWidth":"22ch", "allowSorting":true}',
    'R2:B.1.8.3 / R3:D.8.r.3 — Reaction to past drug (verbatim)'),

(gen_random_uuid()::VARCHAR,'ICSR','545','545013','DRUG_REACTION_LLT_CODE',     'drugReactionMeddraCode','drugReactionMeddraCode','TEXT',  300, 'N', 'patient.patientPastDrugTherapies$.drugReactionMeddraCode',
    'lbl.pastDrugReactionLLT',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'R2:B.1.8.3a / R3:D.8.r.3a — MedDRA LLT code for past drug reaction'),

(gen_random_uuid()::VARCHAR,'ICSR','545','545014','DRUG_REACTION_PT_CODE',   'drugReactionMeddraPtCode','drugReactionMeddraPtCode','TEXT',300,'N','patient.patientPastDrugTherapies$.drugReactionMeddraPtCode',
    'lbl.pastDrugReactionPT',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'R3:D.8.r.3b — MedDRA PT code for past drug reaction'),

(gen_random_uuid()::VARCHAR,'ICSR','545','545015','E2B_R3_MED_PRODID',     'medicinalProductID',   'medicinalProductID',   'TEXT',  50,  'N', 'patient.patientPastDrugTherapies$.medicinalProductID',
    'lbl.mpid',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true}',
    'R3:D.8.r.7.1 — Medicinal Product Identifier (MPID)'),

(gen_random_uuid()::VARCHAR,'ICSR','545','545016','E2B_R3_MEDPRODID_DATENUMBER','medicinalProductIdDateNumber','medicinalProductIdDateNumber','TEXT',50,'N','patient.patientPastDrugTherapies$.medicinalProductIdDateNumber',
    'lbl.mpidVersion',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'R3:D.8.r.7.2 — MPID version date / number'),

(gen_random_uuid()::VARCHAR,'ICSR','545','545017','E2B_R3_PHARMA_PRODID',  'pharmaProductID',      'pharmaProductID',      'TEXT',  50,  'N', 'patient.patientPastDrugTherapies$.pharmaProductID',
    'lbl.phpid',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'R3:D.8.r.8.1 — Pharmaceutical Product Identifier (PhPID)'),

(gen_random_uuid()::VARCHAR,'ICSR','545','545018','E2B_R3_PHARMAPRODID_DATENUMBER','pharmaProductIdDateNumber','pharmaProductIdDateNumber','TEXT',50,'N','patient.patientPastDrugTherapies$.pharmaProductIdDateNumber',
    'lbl.phpidVersion',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'R3:D.8.r.8.2 — PhPID version date / number'),

(gen_random_uuid()::VARCHAR,'ICSR','545','545019','MED_PRODUCT_ID',        'medProductId',         'medProductId',         'TEXT',  300, 'N', 'patient.patientPastDrugTherapies$.medProductId',
    'lbl.medProductId',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'Internal medicinal product ID'),

-- ── Tier 3: Dates + Vaccine ───────────────────────────────────
(gen_random_uuid()::VARCHAR,'ICSR','545','545020','DRUG_START_DATE',         'drugStartDate',        'drugStartDate',        'TEXT',  50,  'N', 'patient.patientPastDrugTherapies$.drugStartDate',
    'lbl.pastDrugStartDate',
    '{"renderAs":"date",        "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":true}',
    'R2:B.1.8.4 / R3:D.8.r.4 — Start date of past drug therapy'),

(gen_random_uuid()::VARCHAR,'ICSR','545','545021','DRUG_END_DATE',           'drugEndDate',          'drugEndDate',          'TEXT',  50,  'N', 'patient.patientPastDrugTherapies$.drugEndDate',
    'lbl.pastDrugEndDate',
    '{"renderAs":"date",        "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":true}',
    'R2:B.1.8.5 / R3:D.8.r.5 — End date of past drug therapy'),

(gen_random_uuid()::VARCHAR,'ICSR','545','545022','VAC_AGE','patientAgeAtVaccine',  'patientAgeAtVaccine',  'TEXT',  300, 'N', 'patient.patientPastDrugTherapies$.patientAgeAtVaccine',
    'lbl.pastDrugAgeAtVaccine',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":true}',
    'Patient age at time of vaccination (vaccine cases)'),

(gen_random_uuid()::VARCHAR,'ICSR','545','545023','VAC_AGE_UNIT','patientAgeAtVaccineUnit','patientAgeAtVaccineUnit','TEXT',50,'N','patient.patientPastDrugTherapies$.patientAgeAtVaccineUnit',
    'lbl.pastDrugAgeAtVaccineUnit',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":true,  "codelist":"ICSR_AGE_UNIT"}',
    'Unit for patient age at vaccination'),

-- ── Tier 4: Additional Product Details ───────────────────────
(gen_random_uuid()::VARCHAR,'ICSR','545','545024','FORM_NAME',             'formName',             'formName',             'TEXT',  50,  'N', 'patient.patientPastDrugTherapies$.formName',
    'lbl.pastDrugFormName',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true}',
    'Pharmaceutical form name of the past drug'),

(gen_random_uuid()::VARCHAR,'ICSR','545','545025','STRENGTH_NAME',         'strengthName',         'strengthName',         'TEXT',  50,  'N', 'patient.patientPastDrugTherapies$.strengthName',
    'lbl.pastDrugStrengthName',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'Strength name of the past drug'),

(gen_random_uuid()::VARCHAR,'ICSR','545','545026','CONTAINER_NAME',        'containerName',        'containerName',        'TEXT',  50,  'N', 'patient.patientPastDrugTherapies$.containerName',
    'lbl.containerName',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'Container name of the past drug'),

(gen_random_uuid()::VARCHAR,'ICSR','545','545027','DEVICE_NAME',           'deviceName',           'deviceName',           'TEXT',  50,  'N', 'patient.patientPastDrugTherapies$.deviceName',
    'lbl.deviceName',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'Device name associated with the past drug'),

(gen_random_uuid()::VARCHAR,'ICSR','545','545028','INTENDED_USE_NAME',     'intendedUseName',      'intendedUseName',      'TEXT',  50,  'N', 'patient.patientPastDrugTherapies$.intendedUseName',
    'lbl.intendedUseName',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true}',
    'Intended use name of the past drug')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;


-- ── 02_DB_METADATA_546.sql ──
-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 02_DB_METADATA_546.sql
-- Module  : ICSR — Table 546 (ICSR_PAST_DRUG_SUBSTANCES)
-- Purpose : TABLE_METADATA + TABLE_COLUMN_METADATA
--           patientPastDrugSubstanceCollection$ — second-level multi-context
--           R3: D.8.r.6 — Substance / specified substance
--           FK: PAST_DRUG_ID → ICSR_PATIENT_PAST_DRUG_THERAPIES(ID)
-- ============================================================



INSERT INTO TABLE_METADATA (
    ID, MODULE_ID, TABLE_ID, PARENT_TABLE_ID, DB_TABLE_NAME,
    CONTEXT_NAME, MULTI_CONTEXT, JOIN_COLUMN, REF_JOIN_COLUMN, CONTEXT_PATH)
VALUES
    (gen_random_uuid()::VARCHAR, 'ICSR', '546', '545', 'ICSR_PAST_DRUG_SUBSTANCES',
     'patientPastDrugSubstanceCollection', 'Y', 'PAST_DRUG_ID', 'ID',
     'patient.patientPastDrugTherapies$.patientPastDrugSubstanceCollection$')
ON CONFLICT (MODULE_ID, TABLE_ID) DO NOTHING;

INSERT INTO TABLE_COLUMN_METADATA (
    ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS,
    DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION)
VALUES
(gen_random_uuid()::VARCHAR,'ICSR','546','546001','SUBSTANCE_NAME',        'substanceName',        'substanceName',        'TEXT',  300, 'N',
    'patient.patientPastDrugTherapies$.patientPastDrugSubstanceCollection$.substanceName',
    'lbl.substanceName',
    '{"renderAs":"text",        "fieldWidth":"2", "columnWidth":"26ch", "allowSorting":true}',
    'R3:D.8.r.6.1 — Substance / specified substance name'),

(gen_random_uuid()::VARCHAR,'ICSR','546','546002','SUBSTANCE_TERMID',      'substanceTermid',      'substanceTermid',      'TEXT',  300, 'N',
    'patient.patientPastDrugTherapies$.patientPastDrugSubstanceCollection$.substanceTermid',
    'lbl.substanceTermId',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"18ch", "allowSorting":true}',
    'R3:D.8.r.6.2 — Substance / specified substance TermID'),

(gen_random_uuid()::VARCHAR,'ICSR','546','546003','SUBSTANCE_TERMID_VERSION','substanceTermidVersion','substanceTermidVersion','TEXT', 300, 'N',
    'patient.patientPastDrugTherapies$.patientPastDrugSubstanceCollection$.substanceTermidVersion',
    'lbl.substanceTermIdVersion',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true}',
    'R3:D.8.r.6.3 — Substance TermID version date / number'),

(gen_random_uuid()::VARCHAR,'ICSR','546','546004','SUBSTANCE_STRENGTH_NUMBER','substanceStrengthNumber','substanceStrengthNumber','TEXT',300,'N',
    'patient.patientPastDrugTherapies$.patientPastDrugSubstanceCollection$.substanceStrengthNumber',
    'lbl.substanceStrengthNumber',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":true}',
    'R3:D.8.r.6.4 — Substance strength number'),

(gen_random_uuid()::VARCHAR,'ICSR','546','546005','SUBSTANCE_STRENGTH_UNIT','substanceStrengthUnit','substanceStrengthUnit', 'TEXT',  50,  'N',
    'patient.patientPastDrugTherapies$.patientPastDrugSubstanceCollection$.substanceStrengthUnit',
    'lbl.substanceStrengthUnit',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true,  "codelist":"ICSR_SUBSTANCE_STRENGTH_UNIT"}',
    'R3:D.8.r.6.5 — Substance strength unit (EDQM)')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;


-- ── 02_DB_METADATA_550.sql ──
-- ============================================================
-- Script  : 02_DB_METADATA_550.sql — ICSR_PREGNANCY (1:1)
-- R2: B.1.9 / R3: D.9 — FK: CASE_ID → ICSR_CASES(ID)
-- ============================================================


INSERT INTO TABLE_METADATA (ID, MODULE_ID, TABLE_ID, PARENT_TABLE_ID, DB_TABLE_NAME, CONTEXT_NAME, MULTI_CONTEXT, JOIN_COLUMN, REF_JOIN_COLUMN, CONTEXT_PATH) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','550','500','ICSR_PREGNANCY','pregnancy','N','CASE_ID','ID','patient.pregnancy')
ON CONFLICT (MODULE_ID, TABLE_ID) DO NOTHING;

INSERT INTO TABLE_COLUMN_METADATA (ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','550','550001','EXPOSURE_STATUS',         'exposureStatus',         'exposureStatus',         'TEXT',50,'N','patient.pregnancy.exposureStatus',         'lbl.pregnancyType',            '{"renderAs":"combo",       "fieldWidth":"1","columnWidth":"14ch","allowSorting":true, "codelist":"ICSR_PREGNANCY_TYPE"}',   'R3:D.9.1 — Pregnancy type (prospective/retrospective)'),
(gen_random_uuid()::VARCHAR,'ICSR','550','550002','TRIMESTER_OF_EXPOSURE',   'trimesterOfExposure',    'trimesterOfExposure',    'TEXT',50,'N','patient.pregnancy.trimesterOfExposure',    'lbl.trimesterOfExposure',      '{"renderAs":"combo",       "fieldWidth":"1","columnWidth":"14ch","allowSorting":true, "codelist":"ICSR_TRIMESTER"}',         'R3:D.9.2 — Trimester of drug exposure'),
(gen_random_uuid()::VARCHAR,'ICSR','550','550003','PREGNANCY_CONFIRM_DATE',  'pregnancyConfirmDate',   'pregnancyConfirmDate',   'TEXT',50,'N','patient.pregnancy.pregnancyConfirmDate',   'lbl.pregnancyConfirmDate',     '{"renderAs":"date",        "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                          'Date pregnancy was confirmed'),
(gen_random_uuid()::VARCHAR,'ICSR','550','550004','PREGNANCY_CONFIRM_MODE',  'pregnancyConfirmMode',   'pregnancyConfirmMode',   'TEXT',50,'N','patient.pregnancy.pregnancyConfirmMode',   'lbl.pregnancyConfirmMode',     '{"renderAs":"combo",       "fieldWidth":"1","columnWidth":"16ch","allowSorting":true, "codelist":"ICSR_PREGNANCY_CONFIRM_MODE"}','How pregnancy was confirmed'),
(gen_random_uuid()::VARCHAR,'ICSR','550','550005','EXPECTED_DUE_DATE',       'expectedDueDate',        'expectedDueDate',        'DATE',NULL,'N','patient.pregnancy.expectedDueDate',       'lbl.expectedDueDate',          '{"renderAs":"date",        "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                          'Expected delivery date'),
(gen_random_uuid()::VARCHAR,'ICSR','550','550006','GRAVIDITY',               'gravidity',              'gravidity',              'TEXT',50,'N','patient.pregnancy.gravidity',              'lbl.gravidity',                '{"renderAs":"text",        "fieldWidth":"1","columnWidth":"10ch","allowSorting":true}',                                          'Number of pregnancies (gravida)'),
(gen_random_uuid()::VARCHAR,'ICSR','550','550007','PARA',                    'para',                   'para',                   'TEXT',300,'N','patient.pregnancy.para',                  'lbl.para',                     '{"renderAs":"text",        "fieldWidth":"1","columnWidth":"10ch","allowSorting":true}',                                          'Number of deliveries (para)'),
(gen_random_uuid()::VARCHAR,'ICSR','550','550008','PLANNED_PREGNANCY',       'plannedPregnancy',       'plannedPregnancy',       'TEXT',1,'N','patient.pregnancy.plannedPregnancy',       'lbl.plannedPregnancy',         '{"renderAs":"bool-switch", "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'Was the pregnancy planned'),
(gen_random_uuid()::VARCHAR,'ICSR','550','550009','CONTRACEPTIVES_USED',     'contraceptivesUsed',     'contraceptivesUsed',     'TEXT',1,'N','patient.pregnancy.contraceptivesUsed',     'lbl.contraceptivesUsed',       '{"renderAs":"bool-switch", "fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',                                          'Were contraceptives used'),
(gen_random_uuid()::VARCHAR,'ICSR','550','550010','CONTRACEPTIVE_FAILURE',   'contraceptiveFailure',   'contraceptiveFailure',   'TEXT',1,'N','patient.pregnancy.contraceptiveFailure',   'lbl.contraceptiveFailure',     '{"renderAs":"bool-switch", "fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',                                          'Contraceptive failure occurred'),
(gen_random_uuid()::VARCHAR,'ICSR','550','550011','TYPES_OF_CONTRACEPTIVE_USED','typesOfContraceptivesUsed','typesOfContraceptivesUsed','TEXT',50,'N','patient.pregnancy.typesOfContraceptivesUsed','lbl.typesOfContraceptives','{"renderAs":"text",        "fieldWidth":"2","columnWidth":"20ch","allowSorting":false}',                                         'Types of contraceptives used'),
(gen_random_uuid()::VARCHAR,'ICSR','550','550012','PRE_PREGNANCY_WEIGHT',    'prePragnancyWeight',     'prePragnancyWeight',     'TEXT',300,'N','patient.pregnancy.prePragnancyWeight',    'lbl.prePregnancyWeight',       '{"renderAs":"text",        "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                          'Pre-pregnancy weight'),
(gen_random_uuid()::VARCHAR,'ICSR','550','550013','PRE_PREGNANCY_WEIGHT_UNIT','prePragnancyWeightUnit', 'prePragnancyWeightUnit', 'TEXT',50,'N','patient.pregnancy.prePragnancyWeightUnit', 'lbl.prePregnancyWeightUnit',   '{"renderAs":"combo",       "fieldWidth":"1","columnWidth":"12ch","allowSorting":true, "codelist":"ICSR_WEIGHT_UNIT"}',       'Pre-pregnancy weight unit'),
(gen_random_uuid()::VARCHAR,'ICSR','550','550014','DELIVERY_METHOD',         'deliveryMethod',         'deliveryMethod',         'TEXT',50,'N','patient.pregnancy.deliveryMethod',         'lbl.deliveryMethod',           '{"renderAs":"combo",       "fieldWidth":"1","columnWidth":"16ch","allowSorting":true, "codelist":"ICSR_DELIVERY_METHOD"}',   'Method of delivery'),
(gen_random_uuid()::VARCHAR,'ICSR','550','550015','FAMILY_HISTORY_BIRTH_DEFECTS','familyHistoryOfBirthDefects','familyHistoryOfBirthDefects','TEXT',1,'N','patient.pregnancy.familyHistoryOfBirthDefects','lbl.familyHistoryBirthDefects','{"renderAs":"bool-switch","fieldWidth":"1","columnWidth":"18ch","allowSorting":true}',                                  'Family history of birth defects'),
(gen_random_uuid()::VARCHAR,'ICSR','550','550016','FOLLOW_UP',               'followUp',               'followUp',               'TEXT',1,'N','patient.pregnancy.followUp',               'lbl.pregnancyFollowUp',        '{"renderAs":"bool-switch", "fieldWidth":"1","columnWidth":"10ch","allowSorting":true}',                                          'Follow-up expected for pregnancy'),
(gen_random_uuid()::VARCHAR,'ICSR','550','550017','COMMENTS',                'comments',               'comments',               'TEXT',50,'N','patient.pregnancy.comments',               'lbl.pregnancyComments',        '{"renderAs":"textarea",    "fieldWidth":"3","columnWidth":"28ch","allowSorting":false}',                                         'Additional comments on pregnancy')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;


-- ── 02_DB_METADATA_552.sql ──
-- ============================================================
-- Script  : 02_DB_METADATA_552.sql — ICSR_PREGNANCY_OUTCOMES (first-level multi-context)
-- FK: CASE_ID → ICSR_CASES(ID)
-- ============================================================


INSERT INTO TABLE_METADATA (ID, MODULE_ID, TABLE_ID, PARENT_TABLE_ID, DB_TABLE_NAME, CONTEXT_NAME, MULTI_CONTEXT, JOIN_COLUMN, REF_JOIN_COLUMN, CONTEXT_PATH) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','552','550','ICSR_PREGNANCY_OUTCOMES','pregnancyOutcomes','Y','CASE_ID','ID','patient.pregnancy.pregnancyOutcomes$')
ON CONFLICT (MODULE_ID, TABLE_ID) DO NOTHING;

INSERT INTO TABLE_COLUMN_METADATA (ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','552','552001','PREGNANCY_CLINICAL_STATUS','pregnancyClinicalStatus','pregnancyClinicalStatus','TEXT',50,'N','patient.pregnancy.pregnancyOutcomes$.pregnancyClinicalStatus','lbl.pregnancyOutcome',    '{"renderAs":"combo",  "fieldWidth":"2","columnWidth":"22ch","allowSorting":true, "codelist":"ICSR_PREGNANCY_OUTCOME"}','R3:D.9.3 — Pregnancy outcome'),
(gen_random_uuid()::VARCHAR,'ICSR','552','552002','PREGNANCY_OUTCOME_DATE',  'pregenancyOutcomeDate',  'pregenancyOutcomeDate',  'TEXT',50,'N','patient.pregnancy.pregnancyOutcomes$.pregenancyOutcomeDate',  'lbl.pregnancyOutcomeDate','{"renderAs":"date",   "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                         'Date of pregnancy outcome'),
(gen_random_uuid()::VARCHAR,'ICSR','552','552003','PREGNANCY_END_DATE',      'pregenancyEndDate',      'pregenancyEndDate',      'DATE',NULL,'N','patient.pregnancy.pregnancyOutcomes$.pregenancyEndDate',      'lbl.pregnancyEndDate',   '{"renderAs":"date",   "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                         'End date of pregnancy'),
(gen_random_uuid()::VARCHAR,'ICSR','552','552004','METHOD_OF_DELIVERY',      'methodOfDelivery',       'methodOfDelivery',       'TEXT',50,'N','patient.pregnancy.pregnancyOutcomes$.methodOfDelivery',       'lbl.deliveryMethod',     '{"renderAs":"combo",  "fieldWidth":"1","columnWidth":"16ch","allowSorting":true, "codelist":"ICSR_DELIVERY_METHOD"}','Method of delivery for this outcome'),
(gen_random_uuid()::VARCHAR,'ICSR','552','552005','NO_OF_FOETUS',            'noOfFoetus',             'noOfFoetus',             'TEXT',300,'N','patient.pregnancy.pregnancyOutcomes$.noOfFoetus',             'lbl.noOfFoetus',         '{"renderAs":"text",   "fieldWidth":"1","columnWidth":"10ch","allowSorting":true}',                                         'Number of foetuses'),
(gen_random_uuid()::VARCHAR,'ICSR','552','552006','LIVE_BIRTH_COMPLICATIONS','liveBirthComplications', 'liveBirthComplications', 'TEXT',50,'N','patient.pregnancy.pregnancyOutcomes$.liveBirthComplications', 'lbl.liveBirthComplications','{"renderAs":"combo", "fieldWidth":"1","columnWidth":"18ch","allowSorting":true, "codelist":"ICSR_LIVE_BIRTH_COMPLICATIONS"}','Live birth complications (mother/baby/both)')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;


-- ── 02_DB_METADATA_553.sql ──
-- ============================================================
-- Script  : 02_DB_METADATA_553.sql — ICSR_PREV_PREGNANCY_OUTCOMES (second-level)
-- FK: OUTCOME_ID → ICSR_PREGNANCY_OUTCOMES(ID)
-- ============================================================


INSERT INTO TABLE_METADATA (ID, MODULE_ID, TABLE_ID, PARENT_TABLE_ID, DB_TABLE_NAME, CONTEXT_NAME, MULTI_CONTEXT, JOIN_COLUMN, REF_JOIN_COLUMN, CONTEXT_PATH) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','553','552','ICSR_PREV_PREGNANCY_OUTCOMES','previousPregnancyOutcomes','Y','OUTCOME_ID','ID','patient.pregnancy.pregnancyOutcomes$.previousPregnancyOutcomes$')
ON CONFLICT (MODULE_ID, TABLE_ID) DO NOTHING;

INSERT INTO TABLE_COLUMN_METADATA (ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','553','553001','PAST_PREGNANCY_OUTCOME',  'pastPregnancyOutcome',   'pastPregnancyOutcome',   'TEXT',50,'N','patient.pregnancy.pregnancyOutcomes$.previousPregnancyOutcomes$.pastPregnancyOutcome',   'lbl.pastPregnancyOutcome',   '{"renderAs":"combo",  "fieldWidth":"2","columnWidth":"22ch","allowSorting":true, "codelist":"ICSR_PREGNANCY_OUTCOME"}','Previous pregnancy outcome'),
(gen_random_uuid()::VARCHAR,'ICSR','553','553002','PAST_PREGNANCY_OUTCOME_DETAILS','pastPregnancyOutDtls','pastPregnancyOutDtls','TEXT',50,'N','patient.pregnancy.pregnancyOutcomes$.previousPregnancyOutcomes$.pastPregnancyOutDtls','lbl.pastPregnancyOutcomeDetails','{"renderAs":"textarea","fieldWidth":"3","columnWidth":"28ch","allowSorting":false}',                                        'Details of previous pregnancy outcome'),
(gen_random_uuid()::VARCHAR,'ICSR','553','553003','NO_OF_CHILDREN',          'noOfChildren',           'noOfChildren',           'TEXT',300,'N','patient.pregnancy.pregnancyOutcomes$.previousPregnancyOutcomes$.noOfChildren',          'lbl.noOfChildren',           '{"renderAs":"text",   "fieldWidth":"1","columnWidth":"10ch","allowSorting":true}',                                         'Number of children from previous pregnancies'),
(gen_random_uuid()::VARCHAR,'ICSR','553','553004','NUMBER_OF_ABORTIONS',     'numberOfAbortions',      'numberOfAbortions',      'TEXT',300,'N','patient.pregnancy.pregnancyOutcomes$.previousPregnancyOutcomes$.numberOfAbortions',     'lbl.numberOfAbortions',      '{"renderAs":"text",   "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                         'Number of previous abortions')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;


-- ── 02_DB_METADATA_555.sql ──
-- ============================================================
-- Script  : 02_DB_METADATA_555.sql — ICSR_NEONATES (second-level multi-context)
-- FK: OUTCOME_ID → ICSR_PREGNANCY_OUTCOMES(ID)
-- ============================================================


INSERT INTO TABLE_METADATA (ID, MODULE_ID, TABLE_ID, PARENT_TABLE_ID, DB_TABLE_NAME, CONTEXT_NAME, MULTI_CONTEXT, JOIN_COLUMN, REF_JOIN_COLUMN, CONTEXT_PATH) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','555','552','ICSR_NEONATES','neonates','Y','OUTCOME_ID','ID','patient.pregnancy.pregnancyOutcomes$.neonates$')
ON CONFLICT (MODULE_ID, TABLE_ID) DO NOTHING;

INSERT INTO TABLE_COLUMN_METADATA (ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','555','555001','BIRTH_OUTCOME',           'birthOutcome',           'birthOutcome',           'TEXT',50,'N','patient.pregnancy.pregnancyOutcomes$.neonates$.birthOutcome',           'lbl.birthOutcome',           '{"renderAs":"combo",       "fieldWidth":"2","columnWidth":"22ch","allowSorting":true, "codelist":"ICSR_BIRTH_OUTCOME"}',         'R3:D.9.4 — Birth outcome'),
(gen_random_uuid()::VARCHAR,'ICSR','555','555002','CHILD_SEX',               'childSex',               'childSex',               'TEXT',50,'N','patient.pregnancy.pregnancyOutcomes$.neonates$.childSex',               'lbl.childSex',               '{"renderAs":"combo",       "fieldWidth":"1","columnWidth":"10ch","allowSorting":true, "codelist":"SEX"}',                        'Child sex'),
(gen_random_uuid()::VARCHAR,'ICSR','555','555003','WHICH_PREGNANCY',         'whichPregnancy',         'whichPregnancy',         'TEXT',50,'N','patient.pregnancy.pregnancyOutcomes$.neonates$.whichPregnancy',         'lbl.whichPregnancy',         '{"renderAs":"combo",       "fieldWidth":"1","columnWidth":"10ch","allowSorting":true, "codelist":"ICSR_WHICH_PREGNANCY"}',       'Which pregnancy number this neonate belongs to'),
(gen_random_uuid()::VARCHAR,'ICSR','555','555004','CURRENT_PREGNANCY',       'currentPregnancy',       'currentPregnancy',       'TEXT',1,'N','patient.pregnancy.pregnancyOutcomes$.neonates$.currentPregnancy',       'lbl.currentPregnancy',       '{"renderAs":"bool-switch", "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'Indicates this is the current pregnancy'),
(gen_random_uuid()::VARCHAR,'ICSR','555','555005','GESTATIONAL_AGE_BIRTH',   'gestationalagebirth',    'gestationalagebirth',    'TEXT',300,'N','patient.pregnancy.pregnancyOutcomes$.neonates$.gestationalagebirth',   'lbl.gestationalAgeBirth',    '{"renderAs":"text",        "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                          'Gestational age at birth'),
(gen_random_uuid()::VARCHAR,'ICSR','555','555006','GESTATIONAL_AGE_BIRTH_UNIT','gestationalagebirthunit','gestationalagebirthunit','TEXT',50,'N','patient.pregnancy.pregnancyOutcomes$.neonates$.gestationalagebirthunit','lbl.gestationalAgeBirthUnit','{"renderAs":"combo",       "fieldWidth":"1","columnWidth":"12ch","allowSorting":true, "codelist":"ICSR_GESTATION_UNIT"}',    'Unit for gestational age at birth'),
(gen_random_uuid()::VARCHAR,'ICSR','555','555007','METHOD_OF_DELIVERY',      'methodOfDelivery',       'methodOfDelivery',       'TEXT',50,'N','patient.pregnancy.pregnancyOutcomes$.neonates$.methodOfDelivery',      'lbl.deliveryMethod',         '{"renderAs":"combo",       "fieldWidth":"1","columnWidth":"16ch","allowSorting":true, "codelist":"ICSR_DELIVERY_METHOD"}',   'Method of delivery for this neonate'),
(gen_random_uuid()::VARCHAR,'ICSR','555','555008','CONGENITAL_ANOMALY',      'congenitalAnomaly',      'congenitalAnomaly',      'TEXT',1,'N','patient.pregnancy.pregnancyOutcomes$.neonates$.congenitalAnomaly',      'lbl.congenitalAnomaly',      '{"renderAs":"bool-switch", "fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',                                          'Congenital anomaly present'),
(gen_random_uuid()::VARCHAR,'ICSR','555','555009','CONGENITAL_ANOMALY_TYPE', 'congenitalAnomalyType',  'congenitalAnomalyType',  'TEXT',50,'N','patient.pregnancy.pregnancyOutcomes$.neonates$.congenitalAnomalyType', 'lbl.congenitalAnomalyType',  '{"renderAs":"combo",       "fieldWidth":"2","columnWidth":"22ch","allowSorting":true, "codelist":"ICSR_CONGENITAL_ANOMALY_TYPE"}','Type of congenital anomaly'),
(gen_random_uuid()::VARCHAR,'ICSR','555','555010','APGAR_SCORE',             'apgarScore',             'apgarScore',             'TEXT',300,'N','patient.pregnancy.pregnancyOutcomes$.neonates$.apgarScore',             'lbl.apgarScore1',            '{"renderAs":"text",        "fieldWidth":"1","columnWidth":"10ch","allowSorting":true}',                                          'APGAR score at 1 minute'),
(gen_random_uuid()::VARCHAR,'ICSR','555','555011','APGAR_SCORE_5_MINUTE',    'apgarScore5Minute',      'apgarScore5Minute',      'TEXT',50,'N','patient.pregnancy.pregnancyOutcomes$.neonates$.apgarScore5Minute',      'lbl.apgarScore5',            '{"renderAs":"text",        "fieldWidth":"1","columnWidth":"10ch","allowSorting":true}',                                          'APGAR score at 5 minutes'),
(gen_random_uuid()::VARCHAR,'ICSR','555','555012','APGAR_SCORE_10_MINUTE',   'apgarScore10Minute',     'apgarScore10Minute',     'TEXT',50,'N','patient.pregnancy.pregnancyOutcomes$.neonates$.apgarScore10Minute',     'lbl.apgarScore10',           '{"renderAs":"text",        "fieldWidth":"1","columnWidth":"10ch","allowSorting":true}',                                          'APGAR score at 10 minutes'),
(gen_random_uuid()::VARCHAR,'ICSR','555','555013','NICU_ADMISSION',          'nicuAdmission',          'nicuAdmission',          'TEXT',1,'N','patient.pregnancy.pregnancyOutcomes$.neonates$.nicuAdmission',          'lbl.nicuAdmission',          '{"renderAs":"bool-switch", "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                          'NICU admission required'),
(gen_random_uuid()::VARCHAR,'ICSR','555','555014','ADMISSION_DURATION',      'admissionDuration',      'admissionDuration',      'TEXT',50,'N','patient.pregnancy.pregnancyOutcomes$.neonates$.admissionDuration',      'lbl.admissionDuration',      '{"renderAs":"text",        "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                          'Duration of NICU admission'),
(gen_random_uuid()::VARCHAR,'ICSR','555','555015','ADMISSION_DURATION_UNIT', 'admissionDurationUnit',  'admissionDurationUnit',  'TEXT',50,'N','patient.pregnancy.pregnancyOutcomes$.neonates$.admissionDurationUnit', 'lbl.admissionDurationUnit',  '{"renderAs":"combo",       "fieldWidth":"1","columnWidth":"10ch","allowSorting":true, "codelist":"ICSR_DURATION_UNIT"}',     'Unit for NICU admission duration'),
(gen_random_uuid()::VARCHAR,'ICSR','555','555016','RESUSCITATED',            'resuscitated',           'resuscitated',           'TEXT',1,'N','patient.pregnancy.pregnancyOutcomes$.neonates$.resuscitated',           'lbl.resuscitated',           '{"renderAs":"bool-switch", "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                          'Neonate required resuscitation'),
(gen_random_uuid()::VARCHAR,'ICSR','555','555017','OTHER_NEONATE_DETAILS',   'zotherNeonateDetails',   'zotherNeonateDetails',   'TEXT',300,'N','patient.pregnancy.pregnancyOutcomes$.neonates$.zotherNeonateDetails',  'lbl.otherNeonateDetails',    '{"renderAs":"textarea",    "fieldWidth":"3","columnWidth":"28ch","allowSorting":false}',                                         'Other neonate details'),
(gen_random_uuid()::VARCHAR,'ICSR','555','555018','OTHER_OUTCOME_DETAILS',   'zotherOutcomeDetails',   'zotherOutcomeDetails',   'TEXT',300,'N','patient.pregnancy.pregnancyOutcomes$.neonates$.zotherOutcomeDetails',  'lbl.otherOutcomeDetails',    '{"renderAs":"textarea",    "fieldWidth":"3","columnWidth":"28ch","allowSorting":false}',                                         'Other outcome details')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;


-- ── 02_DB_METADATA_556.sql ──
-- ============================================================
-- Script  : 02_DB_METADATA_556.sql — ICSR_NEONATE_CHILDREN (third-level multi-context)
-- FK: NEONATE_ID → ICSR_NEONATES(ID)
-- ============================================================


INSERT INTO TABLE_METADATA (ID, MODULE_ID, TABLE_ID, PARENT_TABLE_ID, DB_TABLE_NAME, CONTEXT_NAME, MULTI_CONTEXT, JOIN_COLUMN, REF_JOIN_COLUMN, CONTEXT_PATH) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','556','555','ICSR_NEONATE_CHILDREN','childCollection','Y','NEONATE_ID','ID','patient.pregnancy.pregnancyOutcomes$.neonates$.childCollection$')
ON CONFLICT (MODULE_ID, TABLE_ID) DO NOTHING;

INSERT INTO TABLE_COLUMN_METADATA (ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','556','556001','CHILD_AGE',           'childAge',           'childAge',           'TEXT',300,'N','patient.pregnancy.pregnancyOutcomes$.neonates$.childCollection$.childAge',           'lbl.childAge',           '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"10ch","allowSorting":true}',                                         'Child age at follow-up'),
(gen_random_uuid()::VARCHAR,'ICSR','556','556002','CHILD_UNIT',          'childUnit',          'childUnit',          'TEXT',50,'N','patient.pregnancy.pregnancyOutcomes$.neonates$.childCollection$.childUnit',          'lbl.childAgeUnit',       '{"renderAs":"combo", "fieldWidth":"1","columnWidth":"10ch","allowSorting":true, "codelist":"ICSR_GESTATION_UNIT"}','Child age unit'),
(gen_random_uuid()::VARCHAR,'ICSR','556','556003','HEAD_CIRCUM_BIRTH',   'headCircumBirth',    'headCircumBirth',    'TEXT',300,'N','patient.pregnancy.pregnancyOutcomes$.neonates$.childCollection$.headCircumBirth',   'lbl.headCircumBirth',    '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                         'Head circumference at birth'),
(gen_random_uuid()::VARCHAR,'ICSR','556','556004','HEAD_CIRCUM_BIRTH_UNIT','headCircumBirthUnit','headCircumBirthUnit','TEXT',50,'N','patient.pregnancy.pregnancyOutcomes$.neonates$.childCollection$.headCircumBirthUnit','lbl.headCircumBirthUnit','{"renderAs":"combo", "fieldWidth":"1","columnWidth":"12ch","allowSorting":true, "codelist":"ICSR_HEIGHT_UNIT"}','Head circumference unit'),
(gen_random_uuid()::VARCHAR,'ICSR','556','556005','NEON_BIRTH_LEN',      'neonBirth',          'neonBirth',          'TEXT',300,'N','patient.pregnancy.pregnancyOutcomes$.neonates$.childCollection$.neonBirth',          'lbl.neonBirthLength',    '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"10ch","allowSorting":true}',                                         'Neonate birth length'),
(gen_random_uuid()::VARCHAR,'ICSR','556','556006','NEON_BIRTH_LEN_UNIT', 'neonBirthUnit',      'neonBirthUnit',      'TEXT',50,'N','patient.pregnancy.pregnancyOutcomes$.neonates$.childCollection$.neonBirthUnit',      'lbl.neonBirthLengthUnit','{"renderAs":"combo", "fieldWidth":"1","columnWidth":"12ch","allowSorting":true, "codelist":"ICSR_HEIGHT_UNIT"}','Neonate birth length unit'),
(gen_random_uuid()::VARCHAR,'ICSR','556','556007','NEON_WEIGHT',         'neonWeight',         'neonWeight',         'TEXT',300,'N','patient.pregnancy.pregnancyOutcomes$.neonates$.childCollection$.neonWeight',         'lbl.neonWeight',         '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"10ch","allowSorting":true}',                                         'Neonate birth weight'),
(gen_random_uuid()::VARCHAR,'ICSR','556','556008','NEON_WEIGHT_UNIT',    'neonWeightUnit',     'neonWeightUnit',     'TEXT',50,'N','patient.pregnancy.pregnancyOutcomes$.neonates$.childCollection$.neonWeightUnit',     'lbl.neonWeightUnit',     '{"renderAs":"combo", "fieldWidth":"1","columnWidth":"12ch","allowSorting":true, "codelist":"ICSR_WEIGHT_UNIT"}','Neonate birth weight unit')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;


-- ── 02_DB_METADATA_560.sql ──
-- ============================================================
-- Script  : 02_DB_METADATA_560.sql â€” ICSR_DEATH_CAUSES (first-level multi-context)
-- R2: B.1.9.1 / R3: D.9.1.r â€” FK: CASE_ID â†’ ICSR_CASES(ID)
-- ============================================================


INSERT INTO TABLE_METADATA (ID, MODULE_ID, TABLE_ID, PARENT_TABLE_ID, DB_TABLE_NAME, CONTEXT_NAME, MULTI_CONTEXT, JOIN_COLUMN, REF_JOIN_COLUMN, CONTEXT_PATH) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','560','500','ICSR_DEATH_CAUSES','deathCauseCollection','Y','CASE_ID','ID','patient.deathCauseCollection$')
ON CONFLICT (MODULE_ID, TABLE_ID) DO NOTHING;

INSERT INTO TABLE_COLUMN_METADATA (ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','560','560102','PAT_DEATH_REPORT_LLT_CODE',   'patDeathReportMeddraCode',   'patDeathReportMeddraCode',   'TEXT',300,'N','patient.deathCauseCollection$.patDeathReportMeddraCode',   'lbl.patDeathReportMeddraCode',   '{"renderAs":"text","fieldWidth":"2","columnWidth":"18ch","allowSorting":true}',  'R2:B.1.9.1 / R3:D.9.1.r â€” MedDRA LLT code for reported cause of death'),
(gen_random_uuid()::VARCHAR,'ICSR','560','560103','PAT_DEATH_REPORT_PT_CODE', 'patDeathReportMeddraPtCode', 'patDeathReportMeddraPtCode', 'TEXT',300,'N','patient.deathCauseCollection$.patDeathReportMeddraPtCode', 'lbl.patDeathReportMeddraPtCode', '{"renderAs":"text","fieldWidth":"2","columnWidth":"18ch","allowSorting":true}',  'MedDRA PT code for reported cause of death'),
(gen_random_uuid()::VARCHAR,'ICSR','560','560104','PAT_DEATH_REPORT',        'patDeathReport',             'patDeathReport',             'TEXT',50, 'N','patient.deathCauseCollection$.patDeathReport',             'lbl.patDeathReport',             '{"renderAs":"text","fieldWidth":"3","columnWidth":"28ch","allowSorting":false}', 'R2:B.1.9 â€” Reported cause of death (free text)')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;


-- ── 02_DB_METADATA_561.sql ──
-- ============================================================
-- Script  : 02_DB_METADATA_561.sql â€” ICSR_PATIENT_AUTOPSIES (first-level multi-context)
-- R2: B.1.9.2 / R3: D.9.2.r â€” FK: CASE_ID â†’ ICSR_CASES(ID)
-- ============================================================


INSERT INTO TABLE_METADATA (ID, MODULE_ID, TABLE_ID, PARENT_TABLE_ID, DB_TABLE_NAME, CONTEXT_NAME, MULTI_CONTEXT, JOIN_COLUMN, REF_JOIN_COLUMN, CONTEXT_PATH) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','561','500','ICSR_PATIENT_AUTOPSIES','patientAutopsyCollection','Y','CASE_ID','ID','patient.patientAutopsyCollection$')
ON CONFLICT (MODULE_ID, TABLE_ID) DO NOTHING;

INSERT INTO TABLE_COLUMN_METADATA (ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','561','561002','PAT_DET_AUTOPSY',        'patDetAutopsy',           'patDetAutopsy',           'TEXT',50, 'N','patient.patientAutopsyCollection$.patDetAutopsy',           'lbl.patDetAutopsy',           '{"renderAs":"text","fieldWidth":"3","columnWidth":"28ch","allowSorting":false}', 'R2:B.1.9.2 â€” Autopsy determined cause of death (free text)'),
(gen_random_uuid()::VARCHAR,'ICSR','561','561003','PAT_DET_AUTOPSY_LLT_CODE',   'patDetAutopsyMeddraCode', 'patDetAutopsyMeddraCode', 'TEXT',300,'N','patient.patientAutopsyCollection$.patDetAutopsyMeddraCode', 'lbl.patDetAutopsyMeddraCode', '{"renderAs":"text","fieldWidth":"2","columnWidth":"18ch","allowSorting":true}',  'MedDRA LLT code for autopsy determined cause of death'),
(gen_random_uuid()::VARCHAR,'ICSR','561','561004','PAT_DET_AUTOPSY_PT_CODE', 'patDetAutopsyMeddraPtCode','patDetAutopsyMeddraPtCode','TEXT',300,'N','patient.patientAutopsyCollection$.patDetAutopsyMeddraPtCode','lbl.patDetAutopsyMeddraPtCode','{"renderAs":"text","fieldWidth":"2","columnWidth":"18ch","allowSorting":true}', 'MedDRA PT code for autopsy determined cause of death')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;


-- ── 02_DB_METADATA_565.sql ──
-- ============================================================
-- Script  : 02_DB_METADATA_565.sql â€” ICSR_PARENT (1:1)
-- R2: B.1.15 / R3: D.10 â€” Parent information
-- FK: CASE_ID â†’ ICSR_CASES(ID)
-- Reused codelists: SEX, ICSR_AGE_UNIT, ICSR_WEIGHT_UNIT,
--                   ICSR_HEIGHT_UNIT, ICSR_PAT_ETHNICITY, ICSR_CONSENT
-- ============================================================


INSERT INTO TABLE_METADATA (ID, MODULE_ID, TABLE_ID, PARENT_TABLE_ID, DB_TABLE_NAME, CONTEXT_NAME, MULTI_CONTEXT, JOIN_COLUMN, REF_JOIN_COLUMN, CONTEXT_PATH) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','565','500','ICSR_PARENT','parent','N','CASE_ID','ID','patient.parent')
ON CONFLICT (MODULE_ID, TABLE_ID) DO NOTHING;

INSERT INTO TABLE_COLUMN_METADATA (ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION) VALUES
-- â”€â”€ Core identification â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
(gen_random_uuid()::VARCHAR,'ICSR','565','565013','PARENT_IDENTIFICATION',       'parentIdentification',    'parentIdentification',    'TEXT',50, 'N','patient.parent.parentIdentification',       'lbl.parentId',              '{"renderAs":"text",        "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'R2:B.1.15 â€” Parent identifier / initials'),
(gen_random_uuid()::VARCHAR,'ICSR','565','565010','PARENT_SEX',                  'parentSex',               'parentSex',               'TEXT',50, 'N','patient.parent.parentSex',                  'lbl.parentSex',             '{"renderAs":"combo",       "fieldWidth":"1","columnWidth":"10ch","allowSorting":true, "codelist":"SEX"}',                        'R2:B.1.15.1 â€” Parent sex'),
(gen_random_uuid()::VARCHAR,'ICSR','565','565009','PARENT_DOB',                  'parentDob',               'parentDob',               'DATE',NULL,'N','patient.parent.parentDob',                  'lbl.parentDob',             '{"renderAs":"date",        "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                          'R2:B.1.15.2 â€” Parent date of birth'),
(gen_random_uuid()::VARCHAR,'ICSR','565','565005','PARENT_AGE',                  'parentAge',               'parentAge',               'TEXT',300,'N','patient.parent.parentAge',                  'lbl.parentAge',             '{"renderAs":"text",        "fieldWidth":"1","columnWidth":"10ch","allowSorting":true}',                                          'R2:B.1.15.3 â€” Parent age'),
(gen_random_uuid()::VARCHAR,'ICSR','565','565008','PARENT_AGE_UNIT',              'parentAgeUnit',           'parentAgeUnit',           'TEXT',50, 'N','patient.parent.parentAgeUnit',              'lbl.parentAgeUnit',         '{"renderAs":"combo",       "fieldWidth":"1","columnWidth":"12ch","allowSorting":true, "codelist":"ICSR_AGE_UNIT"}',              'R2:B.1.15.3 â€” Parent age unit'),
-- â”€â”€ Demographics â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
(gen_random_uuid()::VARCHAR,'ICSR','565','565002','PAR_ETHNIC_ORIGIN',          'parEthnicOrigin',         'parEthnicOrigin',         'TEXT',50, 'N','patient.parent.parEthnicOrigin',            'lbl.parentEthnicity',       '{"renderAs":"combo",       "fieldWidth":"1","columnWidth":"16ch","allowSorting":true, "codelist":"ICSR_PAT_ETHNICITY"}',         'Parent ethnic origin'),
(gen_random_uuid()::VARCHAR,'ICSR','565','565004','PARENT_LAST_MENS_DATE',         'parentLastMensDate',      'parentLastMensDate',      'DATE',NULL,'N','patient.parent.parentLastMensDate',         'lbl.parentLMP',             '{"renderAs":"date",        "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                          'R2:B.1.15.4 â€” Parent last menstrual period date'),
-- â”€â”€ Physical â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
(gen_random_uuid()::VARCHAR,'ICSR','565','565015','PARENT_WEIGHT',               'parentWeight',            'parentWeight',            'TEXT',300,'N','patient.parent.parentWeight',               'lbl.parentWeight',          '{"renderAs":"text",        "fieldWidth":"1","columnWidth":"10ch","allowSorting":true}',                                          'R2:B.1.15.5 â€” Parent weight'),
(gen_random_uuid()::VARCHAR,'ICSR','565','565016','PARENT_WEIGHT_UNIT',          'parentWeightUnit',        'parentWeightUnit',        'TEXT',50, 'N','patient.parent.parentWeightUnit',           'lbl.parentWeightUnit',      '{"renderAs":"combo",       "fieldWidth":"1","columnWidth":"12ch","allowSorting":true, "codelist":"ICSR_WEIGHT_UNIT"}',           'R2:B.1.15.5 â€” Parent weight unit'),
(gen_random_uuid()::VARCHAR,'ICSR','565','565011','PARENT_HEIGHT',               'parentHeight',            'parentHeight',            'TEXT',10, 'N','patient.parent.parentHeight',               'lbl.parentHeight',          '{"renderAs":"text",        "fieldWidth":"1","columnWidth":"10ch","allowSorting":true}',                                          'R2:B.1.15.6 â€” Parent height'),
(gen_random_uuid()::VARCHAR,'ICSR','565','565012','PARENT_HEIGHT_UNIT',          'parentHeightUnit',        'parentHeightUnit',        'TEXT',50, 'N','patient.parent.parentHeightUnit',           'lbl.parentHeightUnit',      '{"renderAs":"combo",       "fieldWidth":"1","columnWidth":"12ch","allowSorting":true, "codelist":"ICSR_HEIGHT_UNIT"}',           'R2:B.1.15.6 â€” Parent height unit'),
-- â”€â”€ Medical history â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
(gen_random_uuid()::VARCHAR,'ICSR','565','565014','PARENT_MED_RELEVANT_TEXT',      'parentMedRelevantText',   'parentMedRelevantText',   'TEXT',50, 'N','patient.parent.parentMedRelevantText',      'lbl.parentMedHistory',      '{"renderAs":"textarea",    "fieldWidth":"3","columnWidth":"28ch","allowSorting":false}',                                         'R2:B.1.15.7 â€” Parent medical history (free text)'),
-- â”€â”€ Vaccine-specific â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
(gen_random_uuid()::VARCHAR,'ICSR','565','565006','PARENT_VAC_AGE',      'parentAgeAtVaccine',      'parentAgeAtVaccine',      'TEXT',10, 'N','patient.parent.parentAgeAtVaccine',         'lbl.parentAgeAtVaccine',    '{"renderAs":"text",        "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                          'Parent age at time of vaccination'),
(gen_random_uuid()::VARCHAR,'ICSR','565','565007','PARENT_VAC_AGE_UNIT', 'parentAgeAtVaccineUnit',  'parentAgeAtVaccineUnit',  'TEXT',50, 'N','patient.parent.parentAgeAtVaccineUnit',     'lbl.parentAgeAtVaccineUnit','{"renderAs":"combo",       "fieldWidth":"1","columnWidth":"12ch","allowSorting":true, "codelist":"ICSR_AGE_UNIT"}',              'Parent age at vaccination unit'),
-- â”€â”€ Admin â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
(gen_random_uuid()::VARCHAR,'ICSR','565','565001','CONSENT_TO_CONTACT_PARENT',  'consentToContactParent',  'consentToContactParent',  'TEXT',50, 'N','patient.parent.consentToContactParent',     'lbl.parentConsentToContact','{"renderAs":"combo",       "fieldWidth":"1","columnWidth":"14ch","allowSorting":true, "codelist":"ICSR_CONSENT"}',               'Consent to contact parent for follow-up'),
(gen_random_uuid()::VARCHAR,'ICSR','565','565003','FOLLOW_UP',                  'followUp',                'followUp',                'TEXT',1,  'N','patient.parent.followUp',                  'lbl.parentFollowUp',        '{"renderAs":"bool-switch", "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                          'Can follow up with parent')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;


-- ── 02_DB_METADATA_570.sql ──
-- ============================================================
-- Script  : 02_DB_METADATA_570.sql â€” ICSR_PARENT_PAST_DRUG_THERAPIES (first-level multi-context)
-- R2: B.1.15.8 / R3: D.10.8 â€” Parent past drug therapies
-- FK: CASE_ID â†’ ICSR_CASES(ID)
-- ============================================================


INSERT INTO TABLE_METADATA (ID, MODULE_ID, TABLE_ID, PARENT_TABLE_ID, DB_TABLE_NAME, CONTEXT_NAME, MULTI_CONTEXT, JOIN_COLUMN, REF_JOIN_COLUMN, CONTEXT_PATH) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','570','565','ICSR_PARENT_PAST_DRUG_THERAPIES','parentPastDrugTherapyCollection','Y','CASE_ID','ID','patient.parent.parentPastDrugTherapyCollection$')
ON CONFLICT (MODULE_ID, TABLE_ID) DO NOTHING;

INSERT INTO TABLE_COLUMN_METADATA (ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION) VALUES
-- â”€â”€ Product identification â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
(gen_random_uuid()::VARCHAR,'ICSR','570','570019','DRUG_NAME',                    'drugName',                  'drugName',                  'TEXT',300,'N','patient.parent.parentPastDrugTherapyCollection$.drugName',                  'lbl.parDrugName',           '{"renderAs":"text",  "fieldWidth":"2","columnWidth":"22ch","allowSorting":true}',   'R2:B.1.15.8.1 â€” Product name as reported (parent)'),
(gen_random_uuid()::VARCHAR,'ICSR','570','570018','PRODUCT_NAMEAS_REPORTED',     'productNameASReported',     'productNameASReported',     'TEXT',300,'N','patient.parent.parentPastDrugTherapyCollection$.productNameASReported',     'lbl.parProductDescription', '{"renderAs":"text",  "fieldWidth":"2","columnWidth":"22ch","allowSorting":false}', 'Product description (parent)'),
(gen_random_uuid()::VARCHAR,'ICSR','570','570007','INVENTED_NAME',               'inventedName',              'inventedName',              'TEXT',50, 'N','patient.parent.parentPastDrugTherapyCollection$.inventedName',              'lbl.parInventedName',       '{"renderAs":"text",  "fieldWidth":"2","columnWidth":"18ch","allowSorting":true}',   'Invented / brand name (parent)'),
(gen_random_uuid()::VARCHAR,'ICSR','570','570021','SCIENTIFIC_NAME',             'scientificName',            'scientificName',            'TEXT',50, 'N','patient.parent.parentPastDrugTherapyCollection$.scientificName',            'lbl.parScientificName',     '{"renderAs":"text",  "fieldWidth":"2","columnWidth":"18ch","allowSorting":true}',   'Scientific / INN name (parent)'),
(gen_random_uuid()::VARCHAR,'ICSR','570','570024','TRADEMARK_NAME',              'tradeMarkName',             'tradeMarkName',             'TEXT',50, 'N','patient.parent.parentPastDrugTherapyCollection$.tradeMarkName',             'lbl.parTrademarkName',      '{"renderAs":"text",  "fieldWidth":"2","columnWidth":"18ch","allowSorting":true}',   'Trademark name (parent)'),
-- â”€â”€ Product identifiers (R3) â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
(gen_random_uuid()::VARCHAR,'ICSR','570','570013','MED_PRODUCT_ID',              'medProductId',              'medProductId',              'TEXT',300,'N','patient.parent.parentPastDrugTherapyCollection$.medProductId',              'lbl.parMedProductId',       '{"renderAs":"text",  "fieldWidth":"2","columnWidth":"18ch","allowSorting":true}',   'Medicinal product ID (parent)'),
(gen_random_uuid()::VARCHAR,'ICSR','570','570014','E2B_R3_MED_PRODID',           'medicinalProductID',        'medicinalProductID',        'TEXT',50, 'N','patient.parent.parentPastDrugTherapyCollection$.medicinalProductID',        'lbl.parMpid',               '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',   'R3 â€” Medicinal Product Identifier (MPID)'),
(gen_random_uuid()::VARCHAR,'ICSR','570','570015','E2B_R3_MEDPRODID_DATENUMBER', 'medicinalProductIdDateNumber','medicinalProductIdDateNumber','TEXT',50,'N','patient.parent.parentPastDrugTherapyCollection$.medicinalProductIdDateNumber','lbl.parMpidVersion',        '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',   'R3 â€” MPID version date/number'),
(gen_random_uuid()::VARCHAR,'ICSR','570','570016','E2B_R3_PHARMA_PRODID',        'pharmaProductID',           'pharmaProductID',           'TEXT',50, 'N','patient.parent.parentPastDrugTherapyCollection$.pharmaProductID',           'lbl.parPhpid',              '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',   'R3 â€” Pharmaceutical Product Identifier (PhPID)'),
(gen_random_uuid()::VARCHAR,'ICSR','570','570017','E2B_R3_PHARMAPRODID_DATENUMBER','pharmaProductIdDateNumber','pharmaProductIdDateNumber','TEXT',50,'N','patient.parent.parentPastDrugTherapyCollection$.pharmaProductIdDateNumber', 'lbl.parPhpidVersion',       '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',   'R3 â€” PhPID version date/number'),
-- â”€â”€ Drug dictionary codes â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
(gen_random_uuid()::VARCHAR,'ICSR','570','570025','WHODD_CODE',                  'whoddCode',                 'whoddCode',                 'TEXT',300,'N','patient.parent.parentPastDrugTherapyCollection$.whoddCode',                 'lbl.parWhoddCode',          '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',   'WHO DD code (parent)'),
(gen_random_uuid()::VARCHAR,'ICSR','570','570026','WHODD_MPID',                  'whoddMPID',                 'whoddMPID',                 'TEXT',300,'N','patient.parent.parentPastDrugTherapyCollection$.whoddMPID',                 'lbl.parWhoddMpid',          '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',   'WHO DD MPID (parent)'),
(gen_random_uuid()::VARCHAR,'ICSR','570','570008','KDD_CODE',                    'kddcode',                   'kddcode',                   'TEXT',300,'N','patient.parent.parentPastDrugTherapyCollection$.kddcode',                   'lbl.parKddCode',            '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',   'KDD drug code (parent)'),
-- â”€â”€ Therapy dates â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
(gen_random_uuid()::VARCHAR,'ICSR','570','570022','DRUG_START_DATE',               'drugStartDate',             'drugStartDate',             'TEXT',50, 'N','patient.parent.parentPastDrugTherapyCollection$.drugStartDate',             'lbl.parDrugStartDate',      '{"renderAs":"date",  "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',   'R2:B.1.15.8.2 â€” Drug start date (parent)'),
(gen_random_uuid()::VARCHAR,'ICSR','570','570003','DRUG_END_DATE',                 'drugEndDate',               'drugEndDate',               'TEXT',50, 'N','patient.parent.parentPastDrugTherapyCollection$.drugEndDate',               'lbl.parDrugEndDate',        '{"renderAs":"date",  "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',   'R2:B.1.15.8.3 â€” Drug end date (parent)'),
-- â”€â”€ Indication / reaction â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
(gen_random_uuid()::VARCHAR,'ICSR','570','570005','DRUG_INDICATION',              'drugIndication',            'drugIndication',            'TEXT',50, 'N','patient.parent.parentPastDrugTherapyCollection$.drugIndication',            'lbl.parDrugIndication',     '{"renderAs":"text",  "fieldWidth":"2","columnWidth":"20ch","allowSorting":false}', 'R2:B.1.15.8.4 â€” Indication term (parent)'),
(gen_random_uuid()::VARCHAR,'ICSR','570','570009','DRUG_INDICATION_LLT_CODE',         'drugIndicationMeddraCode',  'drugIndicationMeddraCode',  'TEXT',300,'N','patient.parent.parentPastDrugTherapyCollection$.drugIndicationMeddraCode',  'lbl.parDrugIndicationLLT',  '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',   'MedDRA LLT code for indication (parent)'),
(gen_random_uuid()::VARCHAR,'ICSR','570','570011','DRUG_INDICATION_PT_CODE',       'drugIndicationMeddraPtCode','drugIndicationMeddraPtCode','TEXT',300,'N','patient.parent.parentPastDrugTherapyCollection$.drugIndicationMeddraPtCode','lbl.parDrugIndicationPT',   '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',   'MedDRA PT code for indication (parent)'),
(gen_random_uuid()::VARCHAR,'ICSR','570','570020','DRUG_REACTION',                'drugReaction',              'drugReaction',              'TEXT',50, 'N','patient.parent.parentPastDrugTherapyCollection$.drugReaction',              'lbl.parDrugReaction',       '{"renderAs":"text",  "fieldWidth":"2","columnWidth":"20ch","allowSorting":false}', 'R2:B.1.15.8.5 â€” Reaction term (parent)'),
(gen_random_uuid()::VARCHAR,'ICSR','570','570010','DRUG_REACTION_LLT_CODE',           'drugReactionMeddraCode',    'drugReactionMeddraCode',    'TEXT',300,'N','patient.parent.parentPastDrugTherapyCollection$.drugReactionMeddraCode',    'lbl.parDrugReactionLLT',    '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',   'MedDRA LLT code for reaction (parent)'),
(gen_random_uuid()::VARCHAR,'ICSR','570','570012','DRUG_REACTION_PT_CODE',         'drugReactionMeddraPtCode',  'drugReactionMeddraPtCode',  'TEXT',300,'N','patient.parent.parentPastDrugTherapyCollection$.drugReactionMeddraPtCode',  'lbl.parDrugReactionPT',     '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',   'MedDRA PT code for reaction (parent)'),
-- â”€â”€ Pharmaceutical form / container â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
(gen_random_uuid()::VARCHAR,'ICSR','570','570004','FORM_NAME',                   'formName',                  'formName',                  'TEXT',50, 'N','patient.parent.parentPastDrugTherapyCollection$.formName',                  'lbl.parFormName',           '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',   'Pharmaceutical form name (parent)'),
(gen_random_uuid()::VARCHAR,'ICSR','570','570023','STRENGTH_NAME',               'strengthName',              'strengthName',              'TEXT',50, 'N','patient.parent.parentPastDrugTherapyCollection$.strengthName',              'lbl.parStrengthName',       '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',   'Strength name (parent)'),
(gen_random_uuid()::VARCHAR,'ICSR','570','570001','CONTAINER_NAME',              'containerName',             'containerName',             'TEXT',50, 'N','patient.parent.parentPastDrugTherapyCollection$.containerName',             'lbl.parContainerName',      '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',   'Container name (parent)'),
(gen_random_uuid()::VARCHAR,'ICSR','570','570002','DEVICE_NAME',                 'deviceName',                'deviceName',                'TEXT',50, 'N','patient.parent.parentPastDrugTherapyCollection$.deviceName',                'lbl.parDeviceName',         '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',   'Device name (parent)'),
(gen_random_uuid()::VARCHAR,'ICSR','570','570006','INTENDED_USE_NAME',           'intendedUseName',           'intendedUseName',           'TEXT',50, 'N','patient.parent.parentPastDrugTherapyCollection$.intendedUseName',           'lbl.parIntendedUseName',    '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',   'Intended use name (parent)')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;


-- ── 02_DB_METADATA_571.sql ──
-- ============================================================
-- Script  : 02_DB_METADATA_571.sql â€” ICSR_PARENT_PAST_DRUG_SUBSTANCES (second-level multi-context)
-- R3: D.10.8 â€” Active substances for parent past drug therapies
-- FK: THERAPY_ID â†’ ICSR_PARENT_PAST_DRUG_THERAPIES(ID)
-- Reused codelist: ICSR_SUBSTANCE_STRENGTH_UNIT (from 546)
-- ============================================================


INSERT INTO TABLE_METADATA (ID, MODULE_ID, TABLE_ID, PARENT_TABLE_ID, DB_TABLE_NAME, CONTEXT_NAME, MULTI_CONTEXT, JOIN_COLUMN, REF_JOIN_COLUMN, CONTEXT_PATH) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','571','570','ICSR_PARENT_PAST_DRUG_SUBSTANCES','parentPastDrugSubstanceCollection','Y','THERAPY_ID','ID','patient.parent.parentPastDrugTherapyCollection$.parentPastDrugSubstanceCollection$')
ON CONFLICT (MODULE_ID, TABLE_ID) DO NOTHING;

INSERT INTO TABLE_COLUMN_METADATA (ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','571','571003','SUBSTANCE_NAME',         'substanceName',         'substanceName',         'TEXT',300,'N','patient.parent.parentPastDrugTherapyCollection$.parentPastDrugSubstanceCollection$.substanceName',         'lbl.substanceName',         '{"renderAs":"text","fieldWidth":"2","columnWidth":"22ch","allowSorting":true}',  'R3 â€” Substance / specified substance name (parent)'),
(gen_random_uuid()::VARCHAR,'ICSR','571','571005','SUBSTANCE_TERMID',       'substanceTermid',       'substanceTermid',       'TEXT',300,'N','patient.parent.parentPastDrugTherapyCollection$.parentPastDrugSubstanceCollection$.substanceTermid',       'lbl.substanceTermId',       '{"renderAs":"text","fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',  'R3 â€” Substance/specified substance TermID (parent)'),
(gen_random_uuid()::VARCHAR,'ICSR','571','571004','SUBSTANCE_TERMID_VERSION','substanceTermidVersion','substanceTermidVersion','TEXT',300,'N','patient.parent.parentPastDrugTherapyCollection$.parentPastDrugSubstanceCollection$.substanceTermidVersion','lbl.substanceTermIdVersion', '{"renderAs":"text","fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',  'R3 â€” Substance term ID version date/number (parent)'),
(gen_random_uuid()::VARCHAR,'ICSR','571','571001','SUBSTANCE_STRENGTH_NUMBER','substanceStrengthNumber','substanceStrengthNumber','TEXT',300,'N','patient.parent.parentPastDrugTherapyCollection$.parentPastDrugSubstanceCollection$.substanceStrengthNumber','lbl.substanceStrength',    '{"renderAs":"text","fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',  'R3 â€” Substance strength number (parent)'),
(gen_random_uuid()::VARCHAR,'ICSR','571','571002','SUBSTANCE_STRENGTH_UNIT', 'substanceStrengthUnit', 'substanceStrengthUnit', 'TEXT',50, 'N','patient.parent.parentPastDrugTherapyCollection$.parentPastDrugSubstanceCollection$.substanceStrengthUnit', 'lbl.substanceStrengthUnit', '{"renderAs":"combo","fieldWidth":"1","columnWidth":"14ch","allowSorting":true, "codelist":"ICSR_SUBSTANCE_STRENGTH_UNIT"}','R3 â€” Substance strength unit (parent)')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;


-- ── 02_DB_METADATA_575.sql ──
-- ============================================================
-- Script  : 02_DB_METADATA_575.sql â€” ICSR_PARENT_MED_HISTORIES (first-level multi-context)
-- R2: B.1.15.9 / R3: D.10.9 â€” Parent medical history episodes
-- FK: CASE_ID â†’ ICSR_CASES(ID)
-- Reused codelists: ICSR_DURATION_UNIT, ICSR_CODING_TYPE, ICSR_MED_HIST_TYPE
-- ============================================================


INSERT INTO TABLE_METADATA (ID, MODULE_ID, TABLE_ID, PARENT_TABLE_ID, DB_TABLE_NAME, CONTEXT_NAME, MULTI_CONTEXT, JOIN_COLUMN, REF_JOIN_COLUMN, CONTEXT_PATH) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','575','565','ICSR_PARENT_MED_HISTORIES','parentMedHistEpisodeCollection','Y','CASE_ID','ID','patient.parent.parentMedHistEpisodeCollection$')
ON CONFLICT (MODULE_ID, TABLE_ID) DO NOTHING;

INSERT INTO TABLE_COLUMN_METADATA (ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','575','575010','MEDICAL_EPISODE_NAME',       'medicalEpisodeName',       'medicalEpisodeName',       'TEXT',50, 'N','patient.parent.parentMedHistEpisodeCollection$.medicalEpisodeName',       'lbl.parMedEpisodeName',       '{"renderAs":"text",  "fieldWidth":"2","columnWidth":"22ch","allowSorting":true}',  'R2:B.1.15.9.1 â€” Reported disease term (parent)'),
(gen_random_uuid()::VARCHAR,'ICSR','575','575008','MEDICALEPISODENAME_CODE',  'medicalEpisodeNameMeddraCode','medicalEpisodeNameMeddraCode','TEXT',300,'N','patient.parent.parentMedHistEpisodeCollection$.medicalEpisodeNameMeddraCode','lbl.parMedEpisodeLLT',       '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',  'MedDRA LLT code for disease term (parent)'),
(gen_random_uuid()::VARCHAR,'ICSR','575','575009','MEDICALEPISODENAME_PTCODE','medicalEpisodeNameMeddraPtCode','medicalEpisodeNameMeddraPtCode','TEXT',300,'N','patient.parent.parentMedHistEpisodeCollection$.medicalEpisodeNameMeddraPtCode','lbl.parMedEpisodePT',      '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',  'MedDRA PT code for disease term (parent)'),
(gen_random_uuid()::VARCHAR,'ICSR','575','575011','MEDICAL_START_DATE',         'medicalStartDate',         'medicalStartDate',         'TEXT',50, 'N','patient.parent.parentMedHistEpisodeCollection$.medicalStartDate',         'lbl.parMedStartDate',         '{"renderAs":"date",  "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',  'R2:B.1.15.9.2 â€” Medical history start date (parent)'),
(gen_random_uuid()::VARCHAR,'ICSR','575','575007','MEDICAL_END_DATE',           'medicalEndDate',           'medicalEndDate',           'TEXT',50, 'N','patient.parent.parentMedHistEpisodeCollection$.medicalEndDate',           'lbl.parMedEndDate',           '{"renderAs":"date",  "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',  'Medical history end date (parent)'),
(gen_random_uuid()::VARCHAR,'ICSR','575','575003','MEDICAL_CONTINUE',          'medicalContinue',          'medicalContinue',          'TEXT',1,  'N','patient.parent.parentMedHistEpisodeCollection$.medicalContinue',          'lbl.parMedContinue',          '{"renderAs":"bool-switch","fieldWidth":"1","columnWidth":"12ch","allowSorting":true}', 'Is condition still continuing (parent)'),
(gen_random_uuid()::VARCHAR,'ICSR','575','575004','DISEASE_TYPE',             'diseaseType',              'diseaseType',              'TEXT',50, 'N','patient.parent.parentMedHistEpisodeCollection$.diseaseType',              'lbl.parDiseaseType',          '{"renderAs":"combo", "fieldWidth":"1","columnWidth":"18ch","allowSorting":true, "codelist":"ICSR_MED_HIST_TYPE"}','Disease type (parent)'),
(gen_random_uuid()::VARCHAR,'ICSR','575','575005','DURATION',                 'duration',                 'duration',                 'TEXT',300,'N','patient.parent.parentMedHistEpisodeCollection$.duration',                 'lbl.parMedDuration',          '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"10ch","allowSorting":true}',  'Duration of medical history episode (parent)'),
(gen_random_uuid()::VARCHAR,'ICSR','575','575006','DURATION_UNIT',            'durationUnit',             'durationUnit',             'TEXT',50, 'N','patient.parent.parentMedHistEpisodeCollection$.durationUnit',             'lbl.parMedDurationUnit',      '{"renderAs":"combo", "fieldWidth":"1","columnWidth":"12ch","allowSorting":true, "codelist":"ICSR_DURATION_UNIT"}','Duration unit (parent)'),
(gen_random_uuid()::VARCHAR,'ICSR','575','575001','CODING_TYPE',              'codingType',               'codingType',               'TEXT',50, 'N','patient.parent.parentMedHistEpisodeCollection$.codingType',               'lbl.parCodingType',           '{"renderAs":"combo", "fieldWidth":"1","columnWidth":"16ch","allowSorting":true, "codelist":"ICSR_CODING_TYPE"}', 'MedDRA coding type (parent)'),
(gen_random_uuid()::VARCHAR,'ICSR','575','575002','MEDICAL_COMMENT',           'medicalComment',           'medicalComment',           'TEXT',50, 'N','patient.parent.parentMedHistEpisodeCollection$.medicalComment',           'lbl.parMedComment',           '{"renderAs":"textarea","fieldWidth":"3","columnWidth":"28ch","allowSorting":false}','Comments on medical history episode (parent)')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;


-- ── 02_DB_METADATA_580.sql ──
-- ============================================================
-- Script  : 02_DB_METADATA_580.sql â€” ICSR_STUDY (1:1)
-- R2: C / R3: G â€” Study information
-- FK: CASE_ID â†’ ICSR_CASES(ID)
-- Reused codelists: BLINDING_TECHNIQUE, CODE_STATUS, STUDY_DESIGN,
--                   STUDY_PHASE, STUDY_TYPE (from 25_STUDY module)
-- New codelists: ICSR_STUDY_CODE_BROKEN, ICSR_ENROLMENT_STATUS,
--                ICSR_STUDY_COMPLETION_STATUS, ICSR_STUDY_DISCONT_REASON,
--                ICSR_SAFETY_REPORTING, ICSR_OTHER_STUDY,
--                ICSR_MEDICAL_DEVICE_SAFETY (YES_NO reused for parentIND)
-- ============================================================


INSERT INTO TABLE_METADATA (ID, MODULE_ID, TABLE_ID, PARENT_TABLE_ID, DB_TABLE_NAME, CONTEXT_NAME, MULTI_CONTEXT, JOIN_COLUMN, REF_JOIN_COLUMN, CONTEXT_PATH) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','580','500','ICSR_STUDY','study','N','CASE_ID','ID','study')
ON CONFLICT (MODULE_ID, TABLE_ID) DO NOTHING;

INSERT INTO TABLE_COLUMN_METADATA (ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION) VALUES
-- â”€â”€ Tier 1: Core study identification â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
(gen_random_uuid()::VARCHAR,'ICSR','580','580026','PROTOCOL_NO',                    'protocolNo',                  'protocolNo',                  'TEXT',50, 'N','study.protocolNo',                    'lbl.studySponsorStudyNo',       '{"renderAs":"text",        "fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',                                          'R2:C.5.1 / R3:G.k.1 â€” Sponsor study number / protocol number'),
(gen_random_uuid()::VARCHAR,'ICSR','580','580034','STUDY_TITLE',                    'studyTitle',                  'studyTitle',                   'TEXT',50, 'N','study.studyTitle',                    'lbl.studyName',                 '{"renderAs":"text",        "fieldWidth":"2","columnWidth":"22ch","allowSorting":true}',                                          'R2:C.5.2 / R3:G.k.2 â€” Study name / title'),
(gen_random_uuid()::VARCHAR,'ICSR','580','580037','LSMV_STUDY_TITLE',               'studyTitleClob',              'studyTitleClob',               'TEXT',300,'N','study.studyTitleClob',                'lbl.studyTitle',                '{"renderAs":"textarea",    "fieldWidth":"3","columnWidth":"28ch","allowSorting":false}',                                         'Full study title (long text)'),
(gen_random_uuid()::VARCHAR,'ICSR','580','580027','STUDY_ACRONYM',                  'studyAcronym',                'studyAcronym',                 'TEXT',300,'N','study.studyAcronym',                  'lbl.studyAcronym',              '{"renderAs":"text",        "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'Study acronym / short name'),
(gen_random_uuid()::VARCHAR,'ICSR','580','580033','STUDY_LIBRARY_RECORD_ID',        'studyLibraryRecordID',        'studyLibraryRecordID',         'TEXT',300,'N','study.studyLibraryRecordID',          'lbl.studyLibraryRecordId',      '{"renderAs":"text",        "fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',                                          'Link to study library record'),
-- â”€â”€ Tier 2: Study design â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
(gen_random_uuid()::VARCHAR,'ICSR','580','580038','STUDY_TYPE',                     'studyType',                   'studyType',                    'TEXT',50, 'N','study.studyType',                    'lbl.studyType',                 '{"renderAs":"combo",       "fieldWidth":"1","columnWidth":"18ch","allowSorting":true, "codelist":"STUDY_TYPE"}',                 'R2:C.5.3 / R3:G.k.3 â€” Study type'),
(gen_random_uuid()::VARCHAR,'ICSR','580','580030','STUDY_DESIGN',                   'studyDesign',                 'studyDesign',                  'TEXT',50, 'N','study.studyDesign',                  'lbl.studyDesign',               '{"renderAs":"combo",       "fieldWidth":"1","columnWidth":"16ch","allowSorting":true, "codelist":"STUDY_DESIGN"}',               'R2:C.5.4 / R3:G.k.4 â€” Study design'),
(gen_random_uuid()::VARCHAR,'ICSR','580','580035','STUDY_PHASE',                    'studyPhase',                  'studyPhase',                   'TEXT',50, 'N','study.studyPhase',                   'lbl.studyPhase',                '{"renderAs":"combo",       "fieldWidth":"1","columnWidth":"14ch","allowSorting":true, "codelist":"STUDY_PHASE"}',                'R2:C.5.5 / R3:G.k.5 â€” Study phase'),
(gen_random_uuid()::VARCHAR,'ICSR','580','580001','BLINDING_TECHNIQUE',             'blindingTechnique',           'blindingTechnique',            'TEXT',50, 'N','study.blindingTechnique',             'lbl.blindingTechnique',         '{"renderAs":"combo",       "fieldWidth":"1","columnWidth":"16ch","allowSorting":true, "codelist":"BLINDING_TECHNIQUE"}',         'R2:C.5.6 / R3:G.k.6 â€” Blinding technique'),
-- â”€â”€ Tier 3: Subject / enrollment â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
(gen_random_uuid()::VARCHAR,'ICSR','580','580039','SUBJECT_ID',                     'subjectId',                   'subjectId',                    'TEXT',50, 'N','study.subjectId',                    'lbl.subjectId',                 '{"renderAs":"text",        "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'R2:C.5.7 / R3:G.k.7 â€” Subject identifier'),
(gen_random_uuid()::VARCHAR,'ICSR','580','580023','RANDOMIZATION_NUMBER',           'randomizationNumber',         'randomizationNumber',          'TEXT',50, 'N','study.randomizationNumber',           'lbl.randomizationNumber',       '{"renderAs":"text",        "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'R2:C.5.8 / R3:G.k.8 â€” Randomization number'),
(gen_random_uuid()::VARCHAR,'ICSR','580','580006','ENROLMENT_DATE',                 'enrolDate',                   'enrolDate',                    'TEXT',50, 'N','study.enrolDate',                    'lbl.enrolDate',                 '{"renderAs":"date",        "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                          'Patient enrollment date in study'),
(gen_random_uuid()::VARCHAR,'ICSR','580','580007','ENROLMENT_STATUS',               'enrollStatus',                'enrollStatus',                 'TEXT',50, 'N','study.enrollStatus',                 'lbl.enrollStatus',              '{"renderAs":"combo",       "fieldWidth":"1","columnWidth":"16ch","allowSorting":true, "codelist":"ICSR_ENROLMENT_STATUS"}',      'Patient enrollment status'),
(gen_random_uuid()::VARCHAR,'ICSR','580','580011','GLOBAL_STUDY_ENROLLMENT_COUNT',  'globalStudyEnrollmentCount',  'globalStudyEnrollmentCount',   'TEXT',300,'N','study.globalStudyEnrollmentCount',   'lbl.globalStudyEnrollmentCount','{"renderAs":"text",        "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'Global study enrollment count'),
(gen_random_uuid()::VARCHAR,'ICSR','580','580040','WITHDRAWN_DATE',                 'withdrawnDate',               'withdrawnDate',                'TEXT',50, 'N','study.withdrawnDate',                'lbl.withdrawnDate',             '{"renderAs":"date",        "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                          'Date patient was withdrawn from study'),
(gen_random_uuid()::VARCHAR,'ICSR','580','580029','STUDY_COMPLETION_STATUS',        'studyCompletionStatus',       'studyCompletionStatus',        'TEXT',50, 'N','study.studyCompletionStatus',        'lbl.studyCompletionStatus',     '{"renderAs":"combo",       "fieldWidth":"1","columnWidth":"18ch","allowSorting":true, "codelist":"ICSR_STUDY_COMPLETION_STATUS"}','Study completion status'),
(gen_random_uuid()::VARCHAR,'ICSR','580','580031','STUDY_DISCONT_REASON_CODE',      'studyDiscontReasonCode',      'studyDiscontReasonCode',       'TEXT',50, 'N','study.studyDiscontReasonCode',       'lbl.studyDiscontReason',        '{"renderAs":"combo",       "fieldWidth":"1","columnWidth":"20ch","allowSorting":true, "codelist":"ICSR_STUDY_DISCONT_REASON"}',  'Reason for study discontinuation'),
-- â”€â”€ Tier 4: Site / investigator â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
(gen_random_uuid()::VARCHAR,'ICSR','580','580004','SITE_NUMBER',                    'siteNumber',                  'siteNumber',                   'TEXT',50, 'N','study.siteNumber',                   'lbl.siteNumber',                '{"renderAs":"text",        "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                          'R2:C.5.9 / R3:G.k.9 â€” Center / site number'),
(gen_random_uuid()::VARCHAR,'ICSR','580','580014','INVESTIGATOR_NO',                'investigatorNo',              'investigatorNo',               'TEXT',300,'N','study.investigatorNo',               'lbl.investigatorNo',            '{"renderAs":"text",        "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'Investigator number'),
(gen_random_uuid()::VARCHAR,'ICSR','580','580012','INVESTIGATION_SITE',             'investigationSite',           'investigationSite',            'TEXT',50, 'N','study.investigationSite',            'lbl.investigationSite',         '{"renderAs":"text",        "fieldWidth":"2","columnWidth":"20ch","allowSorting":true}',                                          'Investigation site name'),
(gen_random_uuid()::VARCHAR,'ICSR','580','580013','INVESTIGATION_SITE_RECORD_ID',   'investigationSiteRecordId',   'investigationSiteRecordId',    'TEXT',50, 'N','study.investigationSiteRecordId',    'lbl.investigationSiteRecordId', '{"renderAs":"text",        "fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',                                          'Investigation site record ID (linked to ACCOUNTS)'),
-- â”€â”€ Tier 5: Regulatory identifiers â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
(gen_random_uuid()::VARCHAR,'ICSR','580','580009','EUDRACT_NO',                     'eudractNo',                   'eudractNo',                    'TEXT',300,'N','study.eudractNo',                    'lbl.eudractNo',                 '{"renderAs":"text",        "fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',                                          'EudraCT registration number'),
(gen_random_uuid()::VARCHAR,'ICSR','580','580019','PRIMARY_IND',                    'primaryInd',                  'primaryInd',                   'TEXT',300,'N','study.primaryInd',                   'lbl.primaryInd',                '{"renderAs":"text",        "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'Primary IND number'),
(gen_random_uuid()::VARCHAR,'ICSR','580','580024','REPORTED_PRIMARY_IND',           'reporterPrimaryInd',          'reporterPrimaryInd',           'TEXT',300,'N','study.reporterPrimaryInd',           'lbl.reportedPrimaryInd',        '{"renderAs":"text",        "fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',                                          'Reported IND / Pre-ANDA number'),
(gen_random_uuid()::VARCHAR,'ICSR','580','580018','PANDA_NO',                       'panda',                       'panda',                        'TEXT',50, 'N','study.panda',                        'lbl.panda',                     '{"renderAs":"text",        "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                          'PANDA reference number'),
(gen_random_uuid()::VARCHAR,'ICSR','580','580020','PROJECT_NO',                     'projectNo',                   'projectNo',                    'TEXT',300,'N','study.projectNo',                    'lbl.projectNo',                 '{"renderAs":"text",        "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'Project number'),
(gen_random_uuid()::VARCHAR,'ICSR','580','580015','STUDY_SERIAL_NUMBER',            'studySerialNumber',           'studySerialNumber',            'TEXT',300,'N','study.studySerialNumber',             'lbl.studySerialNumber',         '{"renderAs":"text",        "fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',                                          'Korean study serial number'),
-- â”€â”€ Tier 6: Blinding / code â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
(gen_random_uuid()::VARCHAR,'ICSR','580','580002','CODE_BROKEN',                    'codeBroken',                  'codeBroken',                   'TEXT',50, 'N','study.codeBroken',                   'lbl.codeBroken',                '{"renderAs":"combo",       "fieldWidth":"1","columnWidth":"14ch","allowSorting":true, "codelist":"CODE_STATUS"}',                'Case code broken status'),
(gen_random_uuid()::VARCHAR,'ICSR','580','580003','DATE_CODE_BROKEN',               'dateCodeBroken',              'dateCodeBroken',               'DATE',NULL,'N','study.dateCodeBroken',               'lbl.dateCodeBroken',            '{"renderAs":"date",        "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                          'Date case code was broken'),
(gen_random_uuid()::VARCHAR,'ICSR','580','580028','STUDY_CODE_BROKEN',              'studyCodeBroken',             'studyCodeBroken',              'TEXT',50, 'N','study.studyCodeBroken',              'lbl.studyCodeBroken',           '{"renderAs":"combo",       "fieldWidth":"1","columnWidth":"14ch","allowSorting":true, "codelist":"CODE_STATUS"}',                'Study-level code broken status'),
(gen_random_uuid()::VARCHAR,'ICSR','580','580041','UNBLINDED_INFORMATION',          'unblindedInformation',        'unblindedInformation',         'TEXT',300,'N','study.unblindedInformation',          'lbl.unblindedInformation',      '{"renderAs":"textarea",    "fieldWidth":"3","columnWidth":"28ch","allowSorting":false}',                                         'Unblinded information details'),
-- â”€â”€ Tier 7: EU CT / dates â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
(gen_random_uuid()::VARCHAR,'ICSR','580','580008','EUCT_REGULATION',                'euctRegulation',              'euctRegulation',               'TEXT',1,  'N','study.euctRegulation',               'lbl.euctRegulation',            '{"renderAs":"bool-switch", "fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',                                          'EU CT Regulation 2019/536 applies'),
(gen_random_uuid()::VARCHAR,'ICSR','580','580005','CTD_TO_CTR_TRANSITION_DATE',     'ctdctrDate',                  'ctdctrDate',                   'DATE',NULL,'N','study.ctdctrDate',                   'lbl.ctdctrDate',                '{"renderAs":"date",        "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'CTD to CTR transition date'),
(gen_random_uuid()::VARCHAR,'ICSR','580','580036','STUDY_START_DATE',               'studyStartDate',              'studyStartDate',               'DATE',NULL,'N','study.studyStartDate',               'lbl.studyStartDate',            '{"renderAs":"date",        "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                          'Study start date'),
(gen_random_uuid()::VARCHAR,'ICSR','580','580032','STUDY_END_DATE',                 'studyEndDate',                'studyEndDate',                 'DATE',NULL,'N','study.studyEndDate',                 'lbl.studyEndDate',              '{"renderAs":"date",        "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                          'Study end date'),
-- â”€â”€ Tier 8: Safety reporting / admin â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
(gen_random_uuid()::VARCHAR,'ICSR','580','580025','SAFETY_REPORTING_RESPONSIBILITY','safetyReporting',             'safetyReporting',              'TEXT',50, 'N','study.safetyReporting',              'lbl.safetyReporting',           '{"renderAs":"combo",       "fieldWidth":"1","columnWidth":"22ch","allowSorting":true, "codelist":"ICSR_SAFETY_REPORTING"}',     'Safety reporting responsibility'),
(gen_random_uuid()::VARCHAR,'ICSR','580','580016','MEDICAL_DEVICE_SAFETY_REPORTING','medicalDeviceSafetyReporting','medicalDeviceSafetyReporting', 'TEXT',50, 'N','study.medicalDeviceSafetyReporting', 'lbl.medicalDeviceSafetyReporting','{"renderAs":"combo",      "fieldWidth":"1","columnWidth":"22ch","allowSorting":true, "codelist":"ICSR_SAFETY_REPORTING"}',     'Medical device safety reporting responsibility'),
(gen_random_uuid()::VARCHAR,'ICSR','580','580017','OTHER_STUDY',                    'otherStudy',                  'otherStudy',                   'TEXT',50, 'N','study.otherStudy',                   'lbl.otherStudy',                '{"renderAs":"combo",       "fieldWidth":"1","columnWidth":"18ch","allowSorting":true, "codelist":"ICSR_OTHER_STUDY"}',           'Other examination / study details'),
(gen_random_uuid()::VARCHAR,'ICSR','580','580021','PROTOCOL_DETAILS',               'protocolDetails',             'protocolDetails',              'TEXT',300,'N','study.protocolDetails',               'lbl.protocolDetails',           '{"renderAs":"textarea",    "fieldWidth":"3","columnWidth":"28ch","allowSorting":false}',                                         'Protocol details and amendments'),
(gen_random_uuid()::VARCHAR,'ICSR','580','580022','QUERY_CONTACT',                  'queryContact',                'queryContact',                 'TEXT',300,'N','study.queryContact',                  'lbl.queryContact',              '{"renderAs":"text",        "fieldWidth":"2","columnWidth":"20ch","allowSorting":false}',                                         'Query contact details'),
(gen_random_uuid()::VARCHAR,'ICSR','580','580010','FOLLOW_UP',                      'followUp',                    'followUp',                     'TEXT',1,  'N','study.followUp',                     'lbl.studyFollowUp',             '{"renderAs":"bool-switch", "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                          'Follow-up expected for study')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;


-- ── 02_DB_METADATA_582.sql ──
-- ============================================================
-- Script  : 02_DB_METADATA_582.sql â€” ICSR_STUDY_REGISTRATIONS (first-level multi-context)
-- R2: C.5.10 / R3: G.k.10 â€” Study registration per country
-- FK: CASE_ID â†’ ICSR_CASES(ID)
-- Reused codelist: COUNTRY
-- ============================================================


INSERT INTO TABLE_METADATA (ID, MODULE_ID, TABLE_ID, PARENT_TABLE_ID, DB_TABLE_NAME, CONTEXT_NAME, MULTI_CONTEXT, JOIN_COLUMN, REF_JOIN_COLUMN, CONTEXT_PATH) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','582','580','ICSR_STUDY_REGISTRATIONS','studyRegistrationCollection','Y','CASE_ID','ID','study.studyRegistrationCollection$')
ON CONFLICT (MODULE_ID, TABLE_ID) DO NOTHING;

INSERT INTO TABLE_COLUMN_METADATA (ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','582','582004','REG_NO',                    'registrationNumber',    'registrationNumber',    'TEXT',50, 'N','study.studyRegistrationCollection$.registrationNumber',    'lbl.studyRegNumber',         '{"renderAs":"text",  "fieldWidth":"2","columnWidth":"20ch","allowSorting":true}',  'R2:C.5.10.1 / R3:G.k.10.1 â€” Study registration number'),
(gen_random_uuid()::VARCHAR,'ICSR','582','582003','COUNTRY',                   'country',               'country',               'TEXT',50, 'N','study.studyRegistrationCollection$.country',               'lbl.studyRegCountry',        '{"renderAs":"combo", "fieldWidth":"1","columnWidth":"14ch","allowSorting":true, "codelist":"COUNTRY"}','R2:C.5.10.2 / R3:G.k.10.2 â€” Registration country'),
(gen_random_uuid()::VARCHAR,'ICSR','582','582005','STUDY_REGISTRATION_DATE',   'studyRegistrationDate', 'studyRegistrationDate', 'DATE',NULL,'N','study.studyRegistrationCollection$.studyRegistrationDate', 'lbl.studyRegDate',           '{"renderAs":"date",  "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',  'Study registration date'),
(gen_random_uuid()::VARCHAR,'ICSR','582','582002','NO_OF_PATIENTSENROLLED',     'noOfPatientsEnrolled',  'noOfPatientsEnrolled',  'TEXT',50, 'N','study.studyRegistrationCollection$.noOfPatientsEnrolled',  'lbl.noOfPatientsEnrolled',   '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',  'Number of patients enrolled to date per country'),
(gen_random_uuid()::VARCHAR,'ICSR','582','582001','NO_OF_MEDICINALPRODUCT',     'noOfMedicinalProduct',  'noOfMedicinalProduct',  'TEXT',50, 'N','study.studyRegistrationCollection$.noOfMedicinalProduct',  'lbl.noOfMedicinalProduct',   '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',  'Number of medicinal products used to date per country')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;


-- ── 02_DB_METADATA_583.sql ──
-- ============================================================
-- Script  : 02_DB_METADATA_583.sql â€” ICSR_STUDY_CROSS_REF_INDS (first-level multi-context)
-- R2: C.5.11 / R3: G.k.11 â€” Cross-referenced INDs
-- FK: CASE_ID â†’ ICSR_CASES(ID)
-- Reused codelist: YES_NO (for parentIND)
-- ============================================================


INSERT INTO TABLE_METADATA (ID, MODULE_ID, TABLE_ID, PARENT_TABLE_ID, DB_TABLE_NAME, CONTEXT_NAME, MULTI_CONTEXT, JOIN_COLUMN, REF_JOIN_COLUMN, CONTEXT_PATH) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','583','580','ICSR_STUDY_CROSS_REF_INDS','studyCrossReferenceINDsCollection','Y','CASE_ID','ID','study.studyCrossReferenceINDsCollection$')
ON CONFLICT (MODULE_ID, TABLE_ID) DO NOTHING;

INSERT INTO TABLE_COLUMN_METADATA (ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','583','583001','STUDY_CROSS_REF_IND',    'studycrossRefIND',    'studycrossRefIND',    'TEXT',300,'N','study.studyCrossReferenceINDsCollection$.studycrossRefIND',    'lbl.crossRefInd',          '{"renderAs":"text",  "fieldWidth":"2","columnWidth":"20ch","allowSorting":true}',                                         'R2:C.5.11.1 / R3:G.k.11.1 â€” IND number of cross-referenced IND'),
(gen_random_uuid()::VARCHAR,'ICSR','583','583002','PARENT_IND',             'parentIND',           'parentIND',           'TEXT',50, 'N','study.studyCrossReferenceINDsCollection$.parentIND',           'lbl.parentInd',            '{"renderAs":"combo", "fieldWidth":"1","columnWidth":"10ch","allowSorting":true, "codelist":"YES_NO"}','R2:C.5.11.2 â€” Is this a parent IND (Yes/No)'),
(gen_random_uuid()::VARCHAR,'ICSR','583','583003','REPORTED_SPSR_STUDY_NO', 'reportedSpnsrStdNo',  'reportedSpnsrStdNo',  'TEXT',300,'N','study.studyCrossReferenceINDsCollection$.reportedSpnsrStdNo',  'lbl.reportedSponsorStudyNo','{"renderAs":"text",  "fieldWidth":"2","columnWidth":"20ch","allowSorting":true}',                                         'Reported sponsor study number for cross-referenced IND'),
(gen_random_uuid()::VARCHAR,'ICSR','583','583004','STUDY_NAME',             'studyName',           'studyName',           'TEXT',300,'N','study.studyCrossReferenceINDsCollection$.studyName',           'lbl.crossRefStudyName',    '{"renderAs":"text",  "fieldWidth":"2","columnWidth":"22ch","allowSorting":true}',                                         'Study name for cross-referenced IND')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;


-- ── 02_DB_METADATA_600.sql ──
-- ============================================================
-- Script  : 02_DB_METADATA_600.sql â€” ICSR_EVENT_REACTIONS (first-level multi-context)
-- R2: B.2 / R3: E â€” Event/Reaction information
-- FK: CASE_ID â†’ ICSR_CASES(ID)
-- Reused: ICSR_DURATION_UNIT, ICSR_CODING_TYPE, COUNTRY
-- New: ICSR_REACT_OUTCOME, ICSR_SEVERITY, ICSR_TERM_HIGHLIGHTED,
--      ICSR_EVENT_TYPE, ICSR_REACTION_SITE, ICSR_CAUSE_AE,
--      ICSR_TREATMENT_PERFORMED, ICSR_REACT_CONDITION,
--      ICSR_DEVICE_EVENT_SEVERITY, ICSR_EVENT_OCCUR_LOCATION,
--      ICSR_INCIDENT_OCCURRED_DURING, ICSR_LOCATION,
--      ICSR_EVENTS_DURING_INCIDENT, ICSR_SIMILAR_INCIDENT_BASIS,
--      ICSR_DEVICE_MARKET_CRITERIA, ICSR_NATIVE_LANGUAGE
-- ============================================================


INSERT INTO TABLE_METADATA (ID, MODULE_ID, TABLE_ID, PARENT_TABLE_ID, DB_TABLE_NAME, CONTEXT_NAME, MULTI_CONTEXT, JOIN_COLUMN, REF_JOIN_COLUMN, CONTEXT_PATH) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','600','500','ICSR_EVENT_REACTIONS','eventReactions','Y','CASE_ID','ID','eventReactions$')
ON CONFLICT (MODULE_ID, TABLE_ID) DO NOTHING;

-- â”€â”€ Tier 1: Core reaction term (R2:B.2.1 / R3:E.i.1) â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO TABLE_COLUMN_METADATA (ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','600','600029','REACTION_TERM',           'reactionTerm',           'reactionTerm',           'TEXT',50, 'N','eventReactions$.reactionTerm',           'lbl.reactionTerm',           '{"renderAs":"text",        "fieldWidth":"2","columnWidth":"22ch","allowSorting":true}',                                          'R2:B.2.1 / R3:E.i.1 â€” Reported reaction term'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600015','REACT_MEDDRA_LLT_CODE',    'reactMedDraLltCode',     'reactMedDraLltCode',     'TEXT',300,'N','eventReactions$.reactMedDraLltCode',     'lbl.reactMeddraLlt',         '{"renderAs":"text",        "fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',                                          'R2:B.2.1a / R3:E.i.1a â€” MedDRA LLT code for reaction'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600016','REACT_MEDDRA_PT_CODE',     'reactMedDraPtCode',      'reactMedDraPtCode',      'TEXT',50, 'N','eventReactions$.reactMedDraPtCode',      'lbl.reactMeddraPt',          '{"renderAs":"text",        "fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',                                          'R3:E.i.1b â€” MedDRA PT code for reaction'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600032','TERM_HIGHLIGHTED',        'termHighlighted',        'termHighlighted',        'TEXT',50, 'N','eventReactions$.termHighlighted',        'lbl.termHighlighted',        '{"renderAs":"combo",       "fieldWidth":"1","columnWidth":"14ch","allowSorting":true, "codelist":"ICSR_TERM_HIGHLIGHTED"}',      'R2:B.2.2 / R3:E.i.2 â€” Term highlighted by reporter'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600030','E2B_R3_PRIMARY_SOURCE_TRANSLN','primarySrcReactionTransaction','primarySrcReactionTransaction','TEXT',50,'N','eventReactions$.primarySrcReactionTransaction','lbl.reactionNativeLang',  '{"renderAs":"text",        "fieldWidth":"2","columnWidth":"22ch","allowSorting":false}',                                         'R3:E.i.1.2 â€” Reported term in native language'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600023','PRIMARY_SRC_REACTION_LANG','primarySrcReactionLang', 'primarySrcReactionLang', 'TEXT',50, 'N','eventReactions$.primarySrcReactionLang', 'lbl.nativeLanguage',         '{"renderAs":"combo",       "fieldWidth":"1","columnWidth":"14ch","allowSorting":true, "codelist":"ICSR_NATIVE_LANGUAGE"}',       'R3:E.i.1.2a â€” Native language of primary source')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;

-- â”€â”€ Tier 2: Dates and duration (R2:B.2.3-5 / R3:E.i.3-5) â”€â”€â”€â”€â”€
INSERT INTO TABLE_COLUMN_METADATA (ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','600','600024','REACT_START_DATE',         'reactStartDate',         'reactStartDate',         'TEXT',50, 'N','eventReactions$.reactStartDate',         'lbl.reactStartDate',         '{"renderAs":"date",        "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                          'R2:B.2.3 / R3:E.i.3 â€” Reaction onset date'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600008','REACT_END_DATE',           'reactEndDate',           'reactEndDate',           'TEXT',50, 'N','eventReactions$.reactEndDate',           'lbl.reactEndDate',           '{"renderAs":"date",        "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                          'R2:B.2.4 / R3:E.i.4 â€” Reaction cessation date'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600013','REACT_DURATION',          'reactDuration',          'reactDuration',          'TEXT',300,'N','eventReactions$.reactDuration',          'lbl.reactDuration',          '{"renderAs":"text",        "fieldWidth":"1","columnWidth":"10ch","allowSorting":true}',                                          'R2:B.2.5 / R3:E.i.5 â€” Reaction duration'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600014','REACT_DURATION_UNIT',      'reactDurationUnit',      'reactDurationUnit',      'TEXT',50, 'N','eventReactions$.reactDurationUnit',      'lbl.reactDurationUnit',      '{"renderAs":"combo",       "fieldWidth":"1","columnWidth":"12ch","allowSorting":true, "codelist":"ICSR_DURATION_UNIT"}',         'R2:B.2.5 / R3:E.i.5 â€” Reaction duration unit'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600046','REACT_FIRST_TIME',         'reactFirstTime',         'reactFirstTime',         'TEXT',300,'N','eventReactions$.reactFirstTime',         'lbl.reactFirstTime',         '{"renderAs":"text",        "fieldWidth":"1","columnWidth":"10ch","allowSorting":true}',                                          'R3:E.i.6a â€” Start latency'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600047','REACT_FIRST_TIME_UNIT',     'reactFirstTimeUnit',     'reactFirstTimeUnit',     'TEXT',50, 'N','eventReactions$.reactFirstTimeUnit',     'lbl.reactFirstTimeUnit',     '{"renderAs":"combo",       "fieldWidth":"1","columnWidth":"12ch","allowSorting":true, "codelist":"ICSR_DURATION_UNIT"}',         'R3:E.i.6a â€” Start latency unit'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600044','REACT_LAST_TIME',          'reactLastTime',          'reactLastTime',          'TEXT',300,'N','eventReactions$.reactLastTime',          'lbl.reactLastTime',          '{"renderAs":"text",        "fieldWidth":"1","columnWidth":"10ch","allowSorting":true}',                                          'R3:E.i.6b â€” End latency'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600045','REACT_LAST_TIME_UNIT',      'reactLastTimeUnit',      'reactLastTimeUnit',      'TEXT',50, 'N','eventReactions$.reactLastTimeUnit',      'lbl.reactLastTimeUnit',      '{"renderAs":"combo",       "fieldWidth":"1","columnWidth":"12ch","allowSorting":true, "codelist":"ICSR_DURATION_UNIT"}',         'R3:E.i.6b â€” End latency unit')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;

-- â”€â”€ Tier 3: Outcome and seriousness (R2:B.2.6-7 / R3:E.i.6-7) â”€
INSERT INTO TABLE_COLUMN_METADATA (ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','600','600026','REACT_OUTCOME',           'reactOutcome',           'reactOutcome',           'TEXT',50, 'N','eventReactions$.reactOutcome',           'lbl.reactOutcome',           '{"renderAs":"combo",       "fieldWidth":"1","columnWidth":"22ch","allowSorting":true, "codelist":"ICSR_REACT_OUTCOME"}',         'R2:B.2.7 / R3:E.i.7 â€” Reaction outcome'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600031','SEVERITY',               'severity',               'severity',               'TEXT',50, 'N','eventReactions$.severity',               'lbl.severity',               '{"renderAs":"combo",       "fieldWidth":"1","columnWidth":"14ch","allowSorting":true, "codelist":"ICSR_SEVERITY"}',               'Reaction severity'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600043','SERIOUSNESS',            'seriousness',            'seriousness',            'TEXT',1,  'N','eventReactions$.seriousness',            'lbl.seriousness',            '{"renderAs":"bool-switch", "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                          'R2:B.2.6 / R3:E.i.6 â€” Is reaction serious'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600035','DEATH',                  'death',                  'death',                  'TEXT',1,  'N','eventReactions$.death',                  'lbl.death',                  '{"renderAs":"bool-switch", "fieldWidth":"1","columnWidth":"10ch","allowSorting":true}',                                          'R2:B.2.6.1 / R3:E.i.6.1 â€” Resulted in death'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600039','LIFE_THREATENING',        'lifethreatening',        'lifethreatening',        'TEXT',1,  'N','eventReactions$.lifethreatening',        'lbl.lifeThreatening',        '{"renderAs":"bool-switch", "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'R2:B.2.6.2 / R3:E.i.6.2 â€” Life threatening'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600033','HOSPITALIZATION',        'hospitalization',        'hospitalization',        'TEXT',1,  'N','eventReactions$.hospitalization',        'lbl.hospitalization',        '{"renderAs":"bool-switch", "fieldWidth":"1","columnWidth":"18ch","allowSorting":true}',                                          'R2:B.2.6.3 / R3:E.i.6.3 â€” Caused/prolonged hospitalization'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600036','DISABILITY',             'disability',             'disability',             'TEXT',1,  'N','eventReactions$.disability',             'lbl.disability',             '{"renderAs":"bool-switch", "fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',                                          'R2:B.2.6.4 / R3:E.i.6.4 â€” Disability/permanent damage'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600034','CONGENITAL_ANOMALY',      'congenitalanomaly',      'congenitalanomaly',      'TEXT',1,  'N','eventReactions$.congenitalanomaly',      'lbl.congenitalAnomalyEvent', '{"renderAs":"bool-switch", "fieldWidth":"1","columnWidth":"18ch","allowSorting":true}',                                          'R2:B.2.6.5 / R3:E.i.6.5 â€” Congenital anomaly/birth defect'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600040','NON_SERIOUS',             'nonserious',             'nonserious',             'TEXT',1,  'N','eventReactions$.nonserious',             'lbl.otherMedImportant',      '{"renderAs":"bool-switch", "fieldWidth":"1","columnWidth":"22ch","allowSorting":true}',                                          'R2:B.2.6.6 / R3:E.i.6.6 â€” Other medically important condition'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600041','NON_SERIOUS_INFO',        'nonseriousInfo',         'nonseriousInfo',         'TEXT',300,'N','eventReactions$.nonseriousInfo',         'lbl.otherMedImportantInfo',  '{"renderAs":"textarea",    "fieldWidth":"3","columnWidth":"28ch","allowSorting":false}',                                         'Details for other medically important condition'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600042','INTERVENTION_REQUIRED',   'interventionRequired',   'interventionRequired',   'TEXT',1,  'N','eventReactions$.interventionRequired',   'lbl.interventionRequired',   '{"renderAs":"bool-switch", "fieldWidth":"1","columnWidth":"18ch","allowSorting":true}',                                          'Required intervention to prevent permanent impairment')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;

-- â”€â”€ Tier 4: Hospitalization details â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO TABLE_COLUMN_METADATA (ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','600','600037','HOSPITALISATION_DATE',   'hospitalisationDate',    'hospitalisationDate',    'TEXT',50, 'N','eventReactions$.hospitalisationDate',    'lbl.hospitalisationDate',    '{"renderAs":"date",        "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                          'Hospitalization start date'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600038','HOSPITAL_DISCHARGE_DATE','hospitalDischargeDate',  'hospitalDischargeDate',  'TEXT',50, 'N','eventReactions$.hospitalDischargeDate',  'lbl.hospitalDischargeDate',  '{"renderAs":"date",        "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                          'Hospitalization discharge date')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;

-- â”€â”€ Tier 5: Classification and coding â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO TABLE_COLUMN_METADATA (ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','600','600018','EVENT_TYPE',             'eventType',              'eventType',              'TEXT',50, 'N','eventReactions$.eventType',              'lbl.eventType',              '{"renderAs":"combo",       "fieldWidth":"1","columnWidth":"18ch","allowSorting":true, "codelist":"ICSR_EVENT_TYPE"}',             'Event type classification'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600050','CONDITION',              'condition',              'condition',              'TEXT',50, 'N','eventReactions$.condition',              'lbl.reactCondition',         '{"renderAs":"combo",       "fieldWidth":"1","columnWidth":"16ch","allowSorting":true, "codelist":"ICSR_REACT_CONDITION"}',       'Reaction condition status'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600009','CODING_TYPE',            'codingType',             'codingType',             'TEXT',50, 'N','eventReactions$.codingType',             'lbl.codingType',             '{"renderAs":"combo",       "fieldWidth":"1","columnWidth":"16ch","allowSorting":true, "codelist":"ICSR_CODING_TYPE"}',            'MedDRA coding type'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600027','RANK_ORDER',             'rankOrder',              'rankOrder',              'TEXT',300,'N','eventReactions$.rankOrder',              'lbl.rankOrder',              '{"renderAs":"text",        "fieldWidth":"1","columnWidth":"10ch","allowSorting":true}',                                          'Rank order of this reaction'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600003','IS_SERIOUS_EVENT',       'isalwaysSeriousEvent',   'isalwaysSeriousEvent',   'TEXT',1,  'N','eventReactions$.isalwaysSeriousEvent',   'lbl.alwaysSeriousEvent',     '{"renderAs":"bool-switch", "fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',                                          'Always serious event flag'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600021','IS_IME',                 'isIME',                  'isIME',                  'TEXT',1,  'N','eventReactions$.isIME',                  'lbl.isIme',                  '{"renderAs":"bool-switch", "fieldWidth":"1","columnWidth":"10ch","allowSorting":true}',                                          'Important Medical Event (IME) flag'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600012','IS_DME',                 'isDME',                  'isDME',                  'TEXT',1,  'N','eventReactions$.isDME',                  'lbl.isDme',                  '{"renderAs":"bool-switch", "fieldWidth":"1","columnWidth":"10ch","allowSorting":true}',                                          'Designated Medical Event (DME) flag'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600004','ANTICIPATED_EVENTS',     'anticipatedEvents',      'anticipatedEvents',      'TEXT',1,  'N','eventReactions$.anticipatedEvents',      'lbl.anticipatedEvents',      '{"renderAs":"bool-switch", "fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',                                          'Anticipated/expected event'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600019','EXEMPTED_EVENTS',        'exemptedEvents',         'exemptedEvents',         'TEXT',1,  'N','eventReactions$.exemptedEvents',         'lbl.exemptedEvents',         '{"renderAs":"bool-switch", "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'Exempted event flag'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600022','MEDICALLY_CONFIRMED',      'medicallyConfirm',       'medicallyConfirm',       'TEXT',1,  'N','eventReactions$.medicallyConfirm',       'lbl.medicallyConfirmed',     '{"renderAs":"bool-switch", "fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',                                          'Medically confirmed event')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;

-- â”€â”€ Tier 6: Cause of AE â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO TABLE_COLUMN_METADATA (ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','600','600005','CAUSE_OF_ADVERSE_EVENT',         'causeOfAdverseEvent',         'causeOfAdverseEvent',         'TEXT',50, 'N','eventReactions$.causeOfAdverseEvent',         'lbl.causeOfAe',              '{"renderAs":"combo",       "fieldWidth":"1","columnWidth":"16ch","allowSorting":true, "codelist":"ICSR_CAUSE_AE"}',               'Cause of adverse event'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600006','DRUG_INTERACTION',               'drugInteraction',             'drugInteraction',             'TEXT',1,  'N','eventReactions$.drugInteraction',             'lbl.drugInteraction',        '{"renderAs":"bool-switch", "fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',                                          'Caused by drug interaction'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600007','CAUSED_BY_LO_DEFECT',            'causedByLackOfEffect',        'causedByLackOfEffect',        'TEXT',1,  'N','eventReactions$.causedByLackOfEffect',        'lbl.causedByLackOfEffect',   '{"renderAs":"bool-switch", "fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',                                          'Caused by lack of effect'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600025','OTHER_CAUSE_OF_ADVERSE_EVENT_DETAILS','otherCauseOfAEDetails',  'otherCauseOfAEDetails',       'TEXT',300,'N','eventReactions$.otherCauseOfAEDetails',       'lbl.otherCauseAeDetails',    '{"renderAs":"textarea",    "fieldWidth":"3","columnWidth":"28ch","allowSorting":false}',                                         'Other cause of adverse event details')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;

-- â”€â”€ Tier 7: Treatment â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO TABLE_COLUMN_METADATA (ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','600','600049','TREATMENT_PERFORMED',    'treatmentPerformed',     'treatmentPerformed',     'TEXT',50, 'N','eventReactions$.treatmentPerformed',     'lbl.treatmentPerformed',     '{"renderAs":"combo",       "fieldWidth":"1","columnWidth":"16ch","allowSorting":true, "codelist":"ICSR_TREATMENT_PERFORMED"}',   'Treatment performed for reaction'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600048','TREATMENT_DESC',         'treatmentDescr',         'treatmentDescr',         'TEXT',300,'N','eventReactions$.treatmentDescr',         'lbl.treatmentDescription',   '{"renderAs":"textarea",    "fieldWidth":"3","columnWidth":"28ch","allowSorting":false}',                                         'Treatment description')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;

-- â”€â”€ Tier 8: Location / detection â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO TABLE_COLUMN_METADATA (ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','600','600010','DETECTED_COUNTRY',       'countryOfDetection',     'countryOfDetection',     'TEXT',50, 'N','eventReactions$.countryOfDetection',     'lbl.countryOfDetection',     '{"renderAs":"combo",       "fieldWidth":"1","columnWidth":"14ch","allowSorting":true, "codelist":"COUNTRY"}',                    'Country where event was detected'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600011','COUNTRY_DETECTION_MANUAL','countryDetectionManual', 'countryDetectionManual', 'TEXT',300,'N','eventReactions$.countryDetectionManual', 'lbl.countryDetectionManual', '{"renderAs":"text",        "fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',                                          'Country of detection (manual entry)'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600059','EVENT_OCCUR_LOCATION',   'eventOccurLocation',     'eventOccurLocation',     'TEXT',50, 'N','eventReactions$.eventOccurLocation',     'lbl.eventOccurLocation',     '{"renderAs":"combo",       "fieldWidth":"1","columnWidth":"18ch","allowSorting":true, "codelist":"ICSR_EVENT_OCCUR_LOCATION"}',   'Location where event occurred'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600053','OTHER_EVENT_OCCUR_LOCATION','otherEventOccurLocation','otherEventOccurLocation','TEXT',300,'N','eventReactions$.otherEventOccurLocation','lbl.otherEventLocation',    '{"renderAs":"text",        "fieldWidth":"2","columnWidth":"20ch","allowSorting":false}',                                         'Other event location details'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600028','REACTION_SITE',          'reactionSite',           'reactionSite',           'TEXT',50, 'N','eventReactions$.reactionSite',           'lbl.reactionSite',           '{"renderAs":"combo",       "fieldWidth":"1","columnWidth":"16ch","allowSorting":true, "codelist":"ICSR_REACTION_SITE"}',         'Reaction site'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600001','REACTION_SITE_TEXT',       'reactionSiteText',       'reactionSiteText',       'TEXT',300,'N','eventReactions$.reactionSiteText',       'lbl.reactionSiteText',       '{"renderAs":"text",        "fieldWidth":"2","columnWidth":"20ch","allowSorting":false}',                                         'Reaction site free text')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;

-- â”€â”€ Tier 9: Device-specific fields â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO TABLE_COLUMN_METADATA (ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','600','600051','DEVICE_EVENT_SEVERITY',  'deviceEventSeverity',    'deviceEventSeverity',    'TEXT',50, 'N','eventReactions$.deviceEventSeverity',    'lbl.deviceEventSeverity',    '{"renderAs":"combo",       "fieldWidth":"1","columnWidth":"18ch","allowSorting":true, "codelist":"ICSR_DEVICE_EVENT_SEVERITY"}',  'Device event severity'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600052','EUDAMED_REF_NUMBER',     'eudamedReferenceNumber', 'eudamedReferenceNumber', 'TEXT',50, 'N','eventReactions$.eudamedReferenceNumber', 'lbl.eudamedRefNumber',       '{"renderAs":"text",        "fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',                                          'EUDAMED reference number'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600057','INCIDENT_OCCURRED_DURING','incidentOccurredDuring', 'incidentOccurredDuring', 'TEXT',50, 'N','eventReactions$.incidentOccurredDuring', 'lbl.incidentOccurredDuring', '{"renderAs":"combo",       "fieldWidth":"1","columnWidth":"18ch","allowSorting":true, "codelist":"ICSR_INCIDENT_OCCURRED_DURING"}','Incident occurred during'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600058','LOCATION',               'location',               'location',               'TEXT',50, 'N','eventReactions$.location',               'lbl.location',               '{"renderAs":"combo",       "fieldWidth":"1","columnWidth":"16ch","allowSorting":true, "codelist":"ICSR_LOCATION"}',               'Location type'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600060','MUNICIPALITY',           'municipality',           'municipality',           'TEXT',300,'N','eventReactions$.municipality',           'lbl.municipality',           '{"renderAs":"text",        "fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',                                          'Municipality'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600061','HCF_NAME',               'healthCareFacilityName', 'healthCareFacilityName', 'TEXT',50, 'N','eventReactions$.healthCareFacilityName', 'lbl.hcfName',                '{"renderAs":"text",        "fieldWidth":"2","columnWidth":"22ch","allowSorting":true}',                                          'Healthcare facility name'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600056','HCF_NUMBER',             'healthCareFacilityNumber','healthCareFacilityNumber','TEXT',50,'N','eventReactions$.healthCareFacilityNumber','lbl.hcfNumber',             '{"renderAs":"text",        "fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',                                          'Healthcare facility report number'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600054','EVENTS_DURING_INCIDENT','eventsOccurredDuringTheIncident','eventsOccurredDuringTheIncident','TEXT',50,'N','eventReactions$.eventsOccurredDuringTheIncident','lbl.eventsDuringIncident','{"renderAs":"combo","fieldWidth":"1","columnWidth":"18ch","allowSorting":true, "codelist":"ICSR_EVENTS_DURING_INCIDENT"}','Events occurred during the incident'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600062','NEAR_INCIDENT',  'nearIncidentRelated',    'nearIncidentRelated',    'TEXT',1,  'N','eventReactions$.nearIncidentRelated',    'lbl.nearIncident',           '{"renderAs":"bool-switch", "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'Near incident flag'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600063','SERIOUS_PUBLIC_HEALTH_THREAT','seriousPublicHealthThreat','seriousPublicHealthThreat','TEXT',1,'N','eventReactions$.seriousPublicHealthThreat','lbl.seriousPublicHealthThreat','{"renderAs":"bool-switch","fieldWidth":"1","columnWidth":"20ch","allowSorting":true}',                                   'Serious public health threat'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600065','UNANTICIPATED_STATE_HEALTH','unAnticipatedStateHealth','unAnticipatedStateHealth','TEXT',1,'N','eventReactions$.unAnticipatedStateHealth','lbl.unanticipatedStateHealth','{"renderAs":"bool-switch","fieldWidth":"1","columnWidth":"22ch","allowSorting":true}',                                   'Unanticipated serious deterioration in state of health'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600064','TOTAL_INCIDENTS_REPORTED','totalNumberOfIncidentsReportedToDate','totalNumberOfIncidentsReportedToDate','TEXT',300,'N','eventReactions$.totalNumberOfIncidentsReportedToDate','lbl.totalIncidentsReported','{"renderAs":"text","fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',       'Total number of incidents reported to date')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;

-- â”€â”€ Tier 10: Similar incident / IMDRF â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO TABLE_COLUMN_METADATA (ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','600','600074','BASIC_IDENTIFICATION',   'similarIncidentIdentification','similarIncidentIdentification','TEXT',50,'N','eventReactions$.similarIncidentIdentification','lbl.similarIncidentBasis','{"renderAs":"combo","fieldWidth":"1","columnWidth":"20ch","allowSorting":true, "codelist":"ICSR_SIMILAR_INCIDENT_BASIS"}','Basis of similar incident identification'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600068','BASIC_ID_DESC',          'similarIncidentIdDesc',  'similarIncidentIdDesc',  'TEXT',50, 'N','eventReactions$.similarIncidentIdDesc',  'lbl.similarIncidentIdDesc',  '{"renderAs":"textarea",    "fieldWidth":"3","columnWidth":"28ch","allowSorting":false}',                                         'Explanation of selected basis for similar incident'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600075','DEVICE_CRITERIA',        'deviceMarketCriteria',   'deviceMarketCriteria',   'TEXT',50, 'N','eventReactions$.deviceMarketCriteria',   'lbl.deviceMarketCriteria',   '{"renderAs":"combo",       "fieldWidth":"1","columnWidth":"18ch","allowSorting":true, "codelist":"ICSR_DEVICE_MARKET_CRITERIA"}', 'Criteria for devices in market'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600067','DEVICE_CRITERIA_DESC',   'deviceCriteriaDesc',     'deviceCriteriaDesc',     'TEXT',50, 'N','eventReactions$.deviceCriteriaDesc',     'lbl.deviceCriteriaDesc',     '{"renderAs":"textarea",    "fieldWidth":"3","columnWidth":"28ch","allowSorting":false}',                                         'Description of other criteria for devices'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600069','IMDRF_SIMILAR_CODES',    'imrdfSimilarCodes',      'imrdfSimilarCodes',      'TEXT',50, 'N','eventReactions$.imrdfSimilarCodes',      'lbl.imdrfSimilarCodes',      '{"renderAs":"text",        "fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',                                          'IMDRF codes used for identifying similar incidents'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600070','IMDRF_SIMILAR_DESC',     'imrdfSimilarDesc',       'imrdfSimilarDesc',       'TEXT',50, 'N','eventReactions$.imrdfSimilarDesc',       'lbl.imdrfSimilarDesc',       '{"renderAs":"text",        "fieldWidth":"2","columnWidth":"20ch","allowSorting":false}',                                         'IMDRF similar incident other description'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600066','COMMENTS_SIMILAR_INCIDENT','commentsOnSimilarDevice','commentsOnSimilarDevice','TEXT',300,'N','eventReactions$.commentsOnSimilarDevice','lbl.commentsSimilarIncident','{"renderAs":"textarea",    "fieldWidth":"3","columnWidth":"28ch","allowSorting":false}',                                         'Comments on determination of similar incidents'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600071','INVESTIGATION_FINDING',  'investigationFinding',   'investigationFinding',   'TEXT',300,'N','eventReactions$.investigationFinding',   'lbl.investigationFinding',   '{"renderAs":"textarea",    "fieldWidth":"3","columnWidth":"28ch","allowSorting":false}',                                         'Investigation finding (Annex C)'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600072','MEDICAL_DEVICE_PROBLEM', 'medicalDeviceProblem',   'medicalDeviceProblem',   'TEXT',300,'N','eventReactions$.medicalDeviceProblem',   'lbl.medicalDeviceProblem',   '{"renderAs":"textarea",    "fieldWidth":"3","columnWidth":"28ch","allowSorting":false}',                                         'Medical device problem (Annex A)'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600077','PROBLEM_CODE',           'mostRelevantProblemCode','mostRelevantProblemCode', 'TEXT',50, 'N','eventReactions$.mostRelevantProblemCode','lbl.problemCode',            '{"renderAs":"text",        "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'Most relevant problem code'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600078','PROBLEM_TERM',           'mostRelevantProblemTerm','mostRelevantProblemTerm', 'TEXT',50, 'N','eventReactions$.mostRelevantProblemTerm','lbl.problemTerm',            '{"renderAs":"text",        "fieldWidth":"2","columnWidth":"20ch","allowSorting":true}',                                          'Most relevant problem term'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600079','ROOT_CAUSE_CODE',        'mostRelevantRootCauseCode','mostRelevantRootCauseCode','TEXT',50,'N','eventReactions$.mostRelevantRootCauseCode','lbl.rootCauseCode',       '{"renderAs":"text",        "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'Most relevant root cause evaluation code'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600080','ROOT_CAUSE_TERM',        'mostRelevantRootCauseTerm','mostRelevantRootCauseTerm','TEXT',50,'N','eventReactions$.mostRelevantRootCauseTerm','lbl.rootCauseTerm',       '{"renderAs":"text",        "fieldWidth":"2","columnWidth":"20ch","allowSorting":true}',                                          'Most relevant root cause evaluation term'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600081','OTHER_CODE_FLAG',        'otherInHouseCode',       'otherInHouseCode',       'TEXT',50, 'N','eventReactions$.otherInHouseCode',       'lbl.otherInHouseCode',       '{"renderAs":"text",        "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'Other in-house code'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600076','OTHER_CODE_DESC',        'otherInHouseCodeDesc',   'otherInHouseCodeDesc',   'TEXT',50, 'N','eventReactions$.otherInHouseCodeDesc',   'lbl.otherInHouseCodeDesc',   '{"renderAs":"textarea",    "fieldWidth":"3","columnWidth":"28ch","allowSorting":false}',                                         'Description for other in-house codes')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;

-- â”€â”€ Tier 11: Admin â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO TABLE_COLUMN_METADATA (ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','600','600017','EVENT_RECEIVED_DATE',    'eventReceivedDate',      'eventReceivedDate',      'DATE',NULL,'N','eventReactions$.eventReceivedDate',      'lbl.eventReceivedDate',      '{"renderAs":"date",        "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                          'Date event was received'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600020','FOLLOW_UP',              'followUp',               'followUp',               'TEXT',1,  'N','eventReactions$.followUp',               'lbl.eventFollowUp',          '{"renderAs":"bool-switch", "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                          'Follow-up expected for this event'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600002','AE_ADDITIONAL_INFO','aeAdditionalInformation','aeAdditionalInformation','TEXT',300,'N','eventReactions$.aeAdditionalInformation','lbl.aeAdditionalInfo',       '{"renderAs":"textarea",    "fieldWidth":"3","columnWidth":"28ch","allowSorting":false}',                                         'Additional information about the adverse event'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600073','OTHER',                  'other',                  'other',                  'TEXT',300,'N','eventReactions$.other',                  'lbl.other',                  '{"renderAs":"textarea",    "fieldWidth":"3","columnWidth":"28ch","allowSorting":false}',                                         'Other information'),
(gen_random_uuid()::VARCHAR,'ICSR','600','600055','FAILED_REASON_OR_OTHER_INFO','failedReasonOrOtherInformation','failedReasonOrOtherInformation','TEXT',300,'N','eventReactions$.failedReasonOrOtherInformation','lbl.failedReasonOtherInfo','{"renderAs":"textarea","fieldWidth":"3","columnWidth":"28ch","allowSorting":false}',                    'Failed reason or other information')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;


-- ── 02_DB_METADATA_602.sql ──
-- ============================================================
-- Script  : 02_DB_METADATA_602.sql â€” ICSR_REACTION_VACCINE (1:1 child of each reaction)
-- Vaccine-specific reaction details
-- FK: REACTION_ID â†’ ICSR_EVENT_REACTIONS(ID)
-- ============================================================


INSERT INTO TABLE_METADATA (ID, MODULE_ID, TABLE_ID, PARENT_TABLE_ID, DB_TABLE_NAME, CONTEXT_NAME, MULTI_CONTEXT, JOIN_COLUMN, REF_JOIN_COLUMN, CONTEXT_PATH) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','602','600','ICSR_REACTION_VACCINE','reactionVaccine','N','REACTION_ID','ID','eventReactions$.reactionVaccine')
ON CONFLICT (MODULE_ID, TABLE_ID) DO NOTHING;

INSERT INTO TABLE_COLUMN_METADATA (ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','602','602007','HOSPITALIZATION_REQUIRED','hospitalRequired',      'hospitalRequired',      'TEXT',1,  'N','eventReactions$.reactionVaccine.hospitalRequired',      'lbl.vacHospRequired',       '{"renderAs":"bool-switch","fieldWidth":"1","columnWidth":"18ch","allowSorting":true}',  'Hospitalization required (vaccine)'),
(gen_random_uuid()::VARCHAR,'ICSR','602','602001','NO_OF_DAYS_HOSPITALIZED','noOfDaysHospitalized',  'noOfDaysHospitalized',  'TEXT',300,'N','eventReactions$.reactionVaccine.noOfDaysHospitalized',  'lbl.vacDaysHospitalized',   '{"renderAs":"text",       "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',  'Number of days hospitalized (vaccine)'),
(gen_random_uuid()::VARCHAR,'ICSR','602','602008','RESULT_PROLONG_HOSPITAL','prolongationInHospital','prolongationInHospital','TEXT',1,  'N','eventReactions$.reactionVaccine.prolongationInHospital','lbl.vacProlongHospital',    '{"renderAs":"bool-switch","fieldWidth":"1","columnWidth":"22ch","allowSorting":true}',  'Resulted in prolongation of hospitalization'),
(gen_random_uuid()::VARCHAR,'ICSR','602','602002','AE_OUTCOME',             'aeOutcome',             'aeOutcome',             'TEXT',1,  'N','eventReactions$.reactionVaccine.aeOutcome',             'lbl.vacAeOutcomeNone',      '{"renderAs":"bool-switch","fieldWidth":"1","columnWidth":"18ch","allowSorting":true}',  'AE outcome â€” none of the above'),
(gen_random_uuid()::VARCHAR,'ICSR','602','602004','HEALTHCARE_PROFESSIONAL','healthcareProfessional','healthcareProfessional','TEXT',1,  'N','eventReactions$.reactionVaccine.healthcareProfessional','lbl.vacHcpOffice',          '{"renderAs":"bool-switch","fieldWidth":"1","columnWidth":"22ch","allowSorting":true}',  'Doctor/healthcare professional office'),
(gen_random_uuid()::VARCHAR,'ICSR','602','602005','DEPARTMENT',             'department',            'department',            'TEXT',1,  'N','eventReactions$.reactionVaccine.department',            'lbl.vacEmergencyDept',      '{"renderAs":"bool-switch","fieldWidth":"1","columnWidth":"22ch","allowSorting":true}',  'Emergency room/department or urgent care'),
(gen_random_uuid()::VARCHAR,'ICSR','602','602006','HOSPITAL_NAME',          'hospitalName',          'hospitalName',          'TEXT',300,'N','eventReactions$.reactionVaccine.hospitalName',          'lbl.vacHospitalName',       '{"renderAs":"text",       "fieldWidth":"2","columnWidth":"22ch","allowSorting":true}',  'Hospital name'),
(gen_random_uuid()::VARCHAR,'ICSR','602','602003','CITY',                   'city',                  'city',                  'TEXT',300,'N','eventReactions$.reactionVaccine.city',                  'lbl.vacCity',               '{"renderAs":"text",       "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',  'City'),
(gen_random_uuid()::VARCHAR,'ICSR','602','602009','STATE',                  'state',                 'state',                 'TEXT',300,'N','eventReactions$.reactionVaccine.state',                 'lbl.vacState',              '{"renderAs":"text",       "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',  'State')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;


-- ── 02_DB_METADATA_603.sql ──
-- ============================================================
-- Script  : 02_DB_METADATA_603.sql â€” ICSR_SIMILAR_INCIDENTS (second-level multi-context)
-- Device similar incident and market data
-- FK: REACTION_ID â†’ ICSR_EVENT_REACTIONS(ID)
-- ============================================================


INSERT INTO TABLE_METADATA (ID, MODULE_ID, TABLE_ID, PARENT_TABLE_ID, DB_TABLE_NAME, CONTEXT_NAME, MULTI_CONTEXT, JOIN_COLUMN, REF_JOIN_COLUMN, CONTEXT_PATH) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','603','600','ICSR_SIMILAR_INCIDENTS','similarIncidentAndDeviceCollection','Y','REACTION_ID','ID','eventReactions$.similarIncidentAndDeviceCollection$')
ON CONFLICT (MODULE_ID, TABLE_ID) DO NOTHING;

INSERT INTO TABLE_COLUMN_METADATA (ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','603','603006','START_DATE',           'startDate',           'startDate',           'DATE',NULL,'N','eventReactions$.similarIncidentAndDeviceCollection$.startDate',           'lbl.simIncidentStartDate',  '{"renderAs":"date","fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',  'Period start date for similar incident data'),
(gen_random_uuid()::VARCHAR,'ICSR','603','603003','END_DATE',             'endDate',             'endDate',             'DATE',NULL,'N','eventReactions$.similarIncidentAndDeviceCollection$.endDate',             'lbl.simIncidentEndDate',    '{"renderAs":"date","fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',  'Period end date for similar incident data'),
(gen_random_uuid()::VARCHAR,'ICSR','603','603001','EEA_NO_DEVICE_MARKET', 'eeaNoDeviceOnMarket', 'eeaNoDeviceOnMarket', 'TEXT',300,'N','eventReactions$.similarIncidentAndDeviceCollection$.eeaNoDeviceOnMarket', 'lbl.eeaNoDeviceMarket',     '{"renderAs":"text","fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',  'EEA+CH+TR number of devices on market'),
(gen_random_uuid()::VARCHAR,'ICSR','603','603002','EEA_NO_SIMILAR_EVENTS','eeaNoSimilarEvents',  'eeaNoSimilarEvents',  'TEXT',300,'N','eventReactions$.similarIncidentAndDeviceCollection$.eeaNoSimilarEvents',  'lbl.eeaNoSimilarEvents',    '{"renderAs":"text","fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',  'EEA+CH+TR number of similar incidents'),
(gen_random_uuid()::VARCHAR,'ICSR','603','603004','COI_NO_DEVICE_MARKET', 'coiNoDeviceOnMarket', 'coiNoDeviceOnMarket', 'TEXT',300,'N','eventReactions$.similarIncidentAndDeviceCollection$.coiNoDeviceOnMarket', 'lbl.coiNoDeviceMarket',     '{"renderAs":"text","fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',  'Incident country â€” number of devices on market'),
(gen_random_uuid()::VARCHAR,'ICSR','603','603005','COI_NO_SIMILAR_EVENTS','coiNoSimilarEvents',  'coiNoSimilarEvents',  'TEXT',300,'N','eventReactions$.similarIncidentAndDeviceCollection$.coiNoSimilarEvents',  'lbl.coiNoSimilarEvents',    '{"renderAs":"text","fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',  'Incident country â€” number of similar incidents'),
(gen_random_uuid()::VARCHAR,'ICSR','603','603007','WORLD_NO_DEVICE_MARKET','worldNoDeviceOnMarket','worldNoDeviceOnMarket','TEXT',300,'N','eventReactions$.similarIncidentAndDeviceCollection$.worldNoDeviceOnMarket','lbl.worldNoDeviceMarket',  '{"renderAs":"text","fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',  'World â€” number of devices on market'),
(gen_random_uuid()::VARCHAR,'ICSR','603','603008','WORLD_NO_SIMILAR_EVENTS','worldNoSimilarEvents','worldNoSimilarEvents','TEXT',300,'N','eventReactions$.similarIncidentAndDeviceCollection$.worldNoSimilarEvents','lbl.worldNoSimilarEvents',  '{"renderAs":"text","fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',  'World â€” number of similar incidents')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;


-- ── 02_DB_METADATA_610.sql ──
-- ============================================================
-- Script  : 02_DB_METADATA_610.sql â€” ICSR_DRUG_PRODUCTS (first-level multi-context)
-- R2: B.4 / R3: G â€” Drug/Product information
-- FK: CASE_ID â†’ ICSR_CASES(ID)
-- Reused: ROUTE_OF_ADMIN, FORM_OF_ADMIN, PRODUCT_FLAG,
--         STUDY_PRODUCT_TYPE, ICSR_DURATION_UNIT, COUNTRY
-- New: ICSR_DRUG_CHAR, ICSR_ACTION_DRUG, ICSR_DECHALLENGE,
--      ICSR_RECHALLENGE, ICSR_DOSAGE_UNIT, ICSR_SUBSTANCE_STRENGTH_UNIT
-- ============================================================


INSERT INTO TABLE_METADATA (ID, MODULE_ID, TABLE_ID, PARENT_TABLE_ID, DB_TABLE_NAME, CONTEXT_NAME, MULTI_CONTEXT, JOIN_COLUMN, REF_JOIN_COLUMN, CONTEXT_PATH) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','610','500','ICSR_DRUG_PRODUCTS','drugProducts','Y','CASE_ID','ID','drugProducts$')
ON CONFLICT (MODULE_ID, TABLE_ID) DO NOTHING;

-- â”€â”€ Tier 1: Product identification (R2:B.4.k.2 / R3:G.k.2) â”€â”€
INSERT INTO TABLE_COLUMN_METADATA (ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','610','610052','REPORTED_MEDICINAL_PRODUCT',  'reportedMedicinalProduct',  'reportedMedicinalProduct',  'TEXT',300,'N','drugProducts$.reportedMedicinalProduct',  'lbl.productNameAsReported',  '{"renderAs":"text",  "fieldWidth":"2","columnWidth":"22ch","allowSorting":true}',                                          'R2:B.4.k.2.1 / R3:G.k.2.2 â€” Product name as reported'),
(gen_random_uuid()::VARCHAR,'ICSR','610','610034','MEDICINAL_PRODUCT',          'medicinalProduct',          'medicinalProduct',          'TEXT',300,'N','drugProducts$.medicinalProduct',          'lbl.productDescription',     '{"renderAs":"text",  "fieldWidth":"2","columnWidth":"22ch","allowSorting":false}',                                         'Product description'),
(gen_random_uuid()::VARCHAR,'ICSR','610','610035','PREFERRED_PRODUCT_DESC','preferedProductDescription','preferedProductDescription','TEXT',300,'N','drugProducts$.preferedProductDescription','lbl.preferredProductDesc',   '{"renderAs":"text",  "fieldWidth":"2","columnWidth":"22ch","allowSorting":true}',                                          'Preferred product description'),
(gen_random_uuid()::VARCHAR,'ICSR','610','610027','INVENTED_NAME',             'inventedName',              'inventedName',              'TEXT',50, 'N','drugProducts$.inventedName',             'lbl.inventedName',           '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"18ch","allowSorting":true}',                                          'Invented / brand name'),
(gen_random_uuid()::VARCHAR,'ICSR','610','610063','SCIENTIFIC_NAME',           'scientificName',            'scientificName',            'TEXT',50, 'N','drugProducts$.scientificName',           'lbl.scientificName',         '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"18ch","allowSorting":true}',                                          'Scientific / INN name'),
(gen_random_uuid()::VARCHAR,'ICSR','610','610069','TRADEMARK_NAME',            'tradeMarkName',             'tradeMarkName',             'TEXT',50, 'N','drugProducts$.tradeMarkName',            'lbl.trademarkName',          '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"18ch","allowSorting":true}',                                          'Trademark name'),
(gen_random_uuid()::VARCHAR,'ICSR','610','610057','SYNONYM_DRUG',              'synonym',                   'synonym',                   'TEXT',300,'N','drugProducts$.synonym',                  'lbl.productSynonym',         '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',                                          'Product synonym'),
(gen_random_uuid()::VARCHAR,'ICSR','610','610048','PRODUCT_ACTIVE_INGREDIENT', 'productActiveIngredient',   'productActiveIngredient',   'TEXT',300,'N','drugProducts$.productActiveIngredient',  'lbl.activeIngredient',       '{"renderAs":"text",  "fieldWidth":"2","columnWidth":"20ch","allowSorting":true}',                                          'Product active ingredient')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;

-- â”€â”€ Tier 2: Product identifiers (R3:G.k.2.1-2) â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO TABLE_COLUMN_METADATA (ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','610','610032','MEDICINAL_PRODUCT_ID',          'medProductId',              'medProductId',              'TEXT',300,'N','drugProducts$.medProductId',              'lbl.medProductId',           '{"renderAs":"text",  "fieldWidth":"2","columnWidth":"18ch","allowSorting":true}',                                          'Medicinal product ID'),
(gen_random_uuid()::VARCHAR,'ICSR','610','610033','E2B_R3_MED_PRODID',          'medicinalProductID',        'medicinalProductID',        'TEXT',100,'N','drugProducts$.medicinalProductID',        'lbl.mpid',                   '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',                                          'R3:G.k.2.1.1 â€” Medicinal Product Identifier (MPID)'),
(gen_random_uuid()::VARCHAR,'ICSR','610','610036','E2B_R3_MEDPRODID_DATENUMBER','medicinalProductIdDateNumber','medicinalProductIdDateNumber','TEXT',50,'N','drugProducts$.medicinalProductIdDateNumber','lbl.mpidVersion',          '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'R3:G.k.2.1.2 â€” MPID version date/number'),
(gen_random_uuid()::VARCHAR,'ICSR','610','610040','E2B_R3_PHARMA_PRODID',       'pharmaProductID',           'pharmaProductID',           'TEXT',50, 'N','drugProducts$.pharmaProductID',           'lbl.phpid',                  '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',                                          'R3:G.k.2.2.1 â€” Pharmaceutical Product Identifier (PhPID)'),
(gen_random_uuid()::VARCHAR,'ICSR','610','610041','E2B_R3_PHARMAPRODID_DATENUMBER','pharmaProductIdDateNumber','pharmaProductIdDateNumber','TEXT',50,'N','drugProducts$.pharmaProductIdDateNumber', 'lbl.phpidVersion',           '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'R3:G.k.2.2.2 â€” PhPID version date/number'),
(gen_random_uuid()::VARCHAR,'ICSR','610','610074','WHODD_CODE',                  'whoDDCode',                 'whoDDCode',                 'TEXT',50, 'N','drugProducts$.whoDDCode',                 'lbl.whoddCode',              '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'WHO DD code'),
(gen_random_uuid()::VARCHAR,'ICSR','610','610029','KDD_CODE',                   'kddcode',                   'kddcode',                   'TEXT',300,'N','drugProducts$.kddcode',                   'lbl.kddCode',                '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'KDD drug code'),
(gen_random_uuid()::VARCHAR,'ICSR','610','610038','NDC_NO',                     'ndcNo',                     'ndcNo',                     'TEXT',300,'N','drugProducts$.ndcNo',                     'lbl.ndcNumber',              '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'NDC number'),
(gen_random_uuid()::VARCHAR,'ICSR','610','610037','NDC_CODE_VERSION',           'ndcCodeVersion',            'ndcCodeVersion',            'TEXT',300,'N','drugProducts$.ndcCodeVersion',            'lbl.ndcCodeVersion',         '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'NDC code version'),
(gen_random_uuid()::VARCHAR,'ICSR','610','610026','INTERNAL_DRUG_CODE',         'internalCode',              'internalCode',              'TEXT',300,'N','drugProducts$.internalCode',              'lbl.internalDrugCode',       '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'Internal drug code'),
(gen_random_uuid()::VARCHAR,'ICSR','610','610054','PRODUCT_RECORD_ID',          'productRecordID',           'productRecordID',           'TEXT',300,'N','drugProducts$.productRecordID',           'lbl.productRecordId',        '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'Product record ID (linked to PRODUCTS library)')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;

-- â”€â”€ Tier 3: Characterization and classification â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO TABLE_COLUMN_METADATA (ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','610','610050','DRUG_CHARACTERIZATION',      'drugCharacterization',      'drugCharacterization',      'TEXT',50, 'N','drugProducts$.drugCharacterization',      'lbl.drugCharacterization',   '{"renderAs":"combo", "fieldWidth":"1","columnWidth":"16ch","allowSorting":true, "codelist":"ICSR_DRUG_CHAR"}',             'R2:B.4.k.1 / R3:G.k.1 â€” Drug characterization'),
(gen_random_uuid()::VARCHAR,'ICSR','610','610051','PRODUCT_TYPE',              'productType',               'productType',               'TEXT',50, 'N','drugProducts$.productType',               'lbl.productFlag',            '{"renderAs":"combo", "fieldWidth":"1","columnWidth":"14ch","allowSorting":true, "codelist":"PRODUCT_FLAG"}',               'Product flag (Drug/Device/Vaccine/Biologic)'),
(gen_random_uuid()::VARCHAR,'ICSR','610','610058','PRODUCT_TYPE',              'selectedProductTypes',      'selectedProductTypes',      'TEXT',50, 'N','drugProducts$.selectedProductTypes',      'lbl.productType',            '{"renderAs":"combo", "fieldWidth":"1","columnWidth":"16ch","allowSorting":true, "codelist":"PRODUCT_FLAG"}',               'Product type'),
(gen_random_uuid()::VARCHAR,'ICSR','610','610067','STUDY_PRODUCT_TYPE',        'studyProductType',          'studyProductType',          'TEXT',50, 'N','drugProducts$.studyProductType',          'lbl.studyProductType',       '{"renderAs":"combo", "fieldWidth":"1","columnWidth":"18ch","allowSorting":true, "codelist":"STUDY_PRODUCT_TYPE"}',         'Study product type'),
(gen_random_uuid()::VARCHAR,'ICSR','610','610062','RANK_ORDER',                'rankOrder',                 'rankOrder',                 'TEXT',300,'N','drugProducts$.rankOrder',                 'lbl.rankOrder',              '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"10ch","allowSorting":true}',                                          'Rank order of this drug product'),
(gen_random_uuid()::VARCHAR,'ICSR','610','610006','COMPANY_PRODUCT',           'companyProduct',            'companyProduct',            'TEXT',1,  'N','drugProducts$.companyProduct',            'lbl.companyProduct',         '{"renderAs":"bool-switch","fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                      'Company product flag'),
(gen_random_uuid()::VARCHAR,'ICSR','610','610031','MANUFACTURER_NAME',         'manufacturerName',          'manufacturerName',          'TEXT',300,'N','drugProducts$.manufacturerName',          'lbl.manufacturerName',       '{"renderAs":"text",  "fieldWidth":"2","columnWidth":"20ch","allowSorting":true}',                                          'Manufacturer name')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;

-- â”€â”€ Tier 4: Dosage and administration â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO TABLE_COLUMN_METADATA (ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','610','610065','STRENGTH_NAME',             'strengthName',              'strengthName',              'TEXT',50, 'N','drugProducts$.strengthName',             'lbl.strengthName',           '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'Strength name'),
(gen_random_uuid()::VARCHAR,'ICSR','610','610066','FORM_STRENGTH_UNIT',        'formStrengthUnit',          'formStrengthUnit',          'TEXT',50, 'N','drugProducts$.formStrengthUnit',         'lbl.strengthUnit',           '{"renderAs":"combo", "fieldWidth":"1","columnWidth":"12ch","allowSorting":true, "codelist":"ICSR_DOSAGE_UNIT"}',            'Strength unit'),
(gen_random_uuid()::VARCHAR,'ICSR','610','610024','FORM_NAME',                 'formName',                  'formName',                  'TEXT',50, 'N','drugProducts$.formName',                 'lbl.formName',               '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'Pharmaceutical form name'),
(gen_random_uuid()::VARCHAR,'ICSR','610','610009','CONTAINER_NAME',            'containerName',             'containerName',             'TEXT',50, 'N','drugProducts$.containerName',            'lbl.containerName',          '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'Container name'),
(gen_random_uuid()::VARCHAR,'ICSR','610','610014','DEVICE_NAME',               'deviceName',                'deviceName',                'TEXT',50, 'N','drugProducts$.deviceName',               'lbl.deviceName',             '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'Device name'),
(gen_random_uuid()::VARCHAR,'ICSR','610','610025','INTENDED_USE_NAME',         'intendedUseName',           'intendedUseName',           'TEXT',50, 'N','drugProducts$.intendedUseName',          'lbl.intendedUseName',        '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',                                          'Intended use name'),
(gen_random_uuid()::VARCHAR,'ICSR','610','610011','DRUG_CUMULATIVE_DOSE_NUMB',   'drugCumulativeDosageNumb',  'drugCumulativeDosageNumb',  'TEXT',300,'N','drugProducts$.drugCumulativeDosageNumb', 'lbl.cumulativeDose',         '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                          'R2:B.4.k.6a â€” Cumulative dose to first reaction'),
(gen_random_uuid()::VARCHAR,'ICSR','610','610012','DRUG_CUMULATIVE_DOSE_UNIT',   'drugCumulativeDosageUnit',  'drugCumulativeDosageUnit',  'TEXT',50, 'N','drugProducts$.drugCumulativeDosageUnit', 'lbl.cumulativeDoseUnit',     '{"renderAs":"combo", "fieldWidth":"1","columnWidth":"12ch","allowSorting":true, "codelist":"ICSR_DOSAGE_UNIT"}',            'R2:B.4.k.6b â€” Cumulative dose unit'),
(gen_random_uuid()::VARCHAR,'ICSR','610','610019','EXPIRATION_DATE',           'expirationDate',            'expirationDate',            'DATE',NULL,'N','drugProducts$.expirationDate',           'lbl.expirationDate',         '{"renderAs":"date",  "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                          'Product expiration date'),
(gen_random_uuid()::VARCHAR,'ICSR','610','610010','OBTAIN_DRUG_COUNTRY',         'obtainDrugCountry',         'obtainDrugCountry',         'TEXT',50, 'N','drugProducts$.obtainDrugCountry',        'lbl.countryObtained',        '{"renderAs":"combo", "fieldWidth":"1","columnWidth":"14ch","allowSorting":true, "codelist":"COUNTRY"}',                    'Country where drug was obtained')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;

-- â”€â”€ Tier 5: Dechallenge / rechallenge â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO TABLE_COLUMN_METADATA (ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','610','610017','DECHALLENGE',               'deChallenge',               'deChallenge',               'TEXT',50, 'N','drugProducts$.deChallenge',               'lbl.dechallenge',            '{"renderAs":"combo", "fieldWidth":"1","columnWidth":"18ch","allowSorting":true, "codelist":"ICSR_DECHALLENGE"}',           'R2:B.4.k.15 / R3:G.k.9.i.3 â€” Dechallenge result'),
(gen_random_uuid()::VARCHAR,'ICSR','610','610018','DRUG_RECHALLENGE',  'drugRecurreAdministration', 'drugRecurreAdministration', 'TEXT',50, 'N','drugProducts$.drugRecurreAdministration', 'lbl.rechallenge',            '{"renderAs":"combo", "fieldWidth":"1","columnWidth":"18ch","allowSorting":true, "codelist":"ICSR_RECHALLENGE"}',           'R2:B.4.k.16 / R3:G.k.9.i.4 â€” Rechallenge result'),
(gen_random_uuid()::VARCHAR,'ICSR','610','610001','ACTION_DRUG',                'actionDug',                 'actionDug',                 'TEXT',50, 'N','drugProducts$.actionDug',                 'lbl.actionDrug',             '{"renderAs":"combo", "fieldWidth":"1","columnWidth":"18ch","allowSorting":true, "codelist":"ICSR_ACTION_DRUG"}',           'R2:B.4.k.7 / R3:G.k.8 â€” Action taken with drug')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;

-- â”€â”€ Tier 6: Product flags and admin â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO TABLE_COLUMN_METADATA (ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','610','610028','INVESTIGATIONAL_PROD_BLINDED','investigationalProductBlinded','investigationalProductBlinded','TEXT',1,'N','drugProducts$.investigationalProductBlinded','lbl.blindedProduct',       '{"renderAs":"bool-switch","fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                      'Blinded product flag'),
(gen_random_uuid()::VARCHAR,'ICSR','610','610046','PRIOR_USE',                 'priorUse',                  'priorUse',                  'TEXT',1,  'N','drugProducts$.priorUse',                  'lbl.priorUse',               '{"renderAs":"bool-switch","fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                      'Prior use of this product'),
(gen_random_uuid()::VARCHAR,'ICSR','610','610047','PRIOR_USE_EQUIVALENT_DRUG',           'priorUseOfEquivalentDrug',  'priorUseOfEquivalentDrug',  'TEXT',1,  'N','drugProducts$.priorUseOfEquivalentDrug',  'lbl.priorUseEquivalent',     '{"renderAs":"bool-switch","fieldWidth":"1","columnWidth":"18ch","allowSorting":true}',                                      'Prior use of equivalent drug'),
(gen_random_uuid()::VARCHAR,'ICSR','610','610030','CAUSED_BY_LACK_OF_EFFECT',       'causedByLackOfEffect',      'causedByLackOfEffect',      'TEXT',1,  'N','drugProducts$.causedByLackOfEffect',      'lbl.lackOfEffect',           '{"renderAs":"bool-switch","fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                      'Caused by lack of effect'),
(gen_random_uuid()::VARCHAR,'ICSR','610','610004','BIO_FATHER_DRUG',           'biologicalFatherExposedToDrug','biologicalFatherExposedToDrug','TEXT',1,'N','drugProducts$.biologicalFatherExposedToDrug','lbl.bioFatherDrug',       '{"renderAs":"bool-switch","fieldWidth":"1","columnWidth":"18ch","allowSorting":true}',                                      'Biological father exposed to drug'),
(gen_random_uuid()::VARCHAR,'ICSR','610','610049','PRODUCT_AVAILABLE_FLAG',    'productAvailableFlag',      'productAvailableFlag',      'TEXT',1,  'N','drugProducts$.productAvailableFlag',      'lbl.productAvailable',       '{"renderAs":"bool-switch","fieldWidth":"1","columnWidth":"18ch","allowSorting":true}',                                      'Product available for evaluation'),
(gen_random_uuid()::VARCHAR,'ICSR','610','610064','SERIOUS_PUBLIC_HEALTH_THREAT','seriousPublicHealthThreat','seriousPublicHealthThreat','TEXT',1,  'N','drugProducts$.seriousPublicHealthThreat', 'lbl.seriousPublicHealth',    '{"renderAs":"bool-switch","fieldWidth":"1","columnWidth":"20ch","allowSorting":true}',                                      'Serious public health threat'),
(gen_random_uuid()::VARCHAR,'ICSR','610','610059','BIOSIMILAR',                'biosimilar',                'biosimilar',                'TEXT',1,  'N','drugProducts$.biosimilar',                'lbl.biosimilar',             '{"renderAs":"bool-switch","fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                      'Biosimilar product'),
(gen_random_uuid()::VARCHAR,'ICSR','610','610060','GENERIC',                   'generic',                   'generic',                   'TEXT',1,  'N','drugProducts$.generic',                   'lbl.generic',                '{"renderAs":"bool-switch","fieldWidth":"1","columnWidth":"10ch","allowSorting":true}',                                      'Generic product'),
(gen_random_uuid()::VARCHAR,'ICSR','610','610061','PRODUCT_OTC',      'productOverCounter',        'productOverCounter',        'TEXT',1,  'N','drugProducts$.productOverCounter',        'lbl.otc',                    '{"renderAs":"bool-switch","fieldWidth":"1","columnWidth":"10ch","allowSorting":true}',                                      'Over-the-counter product'),
(gen_random_uuid()::VARCHAR,'ICSR','610','610008','PRODUCT_COMPOUNDED',        'productCompounded',         'productCompounded',         'TEXT',1,  'N','drugProducts$.productCompounded',         'lbl.productCompounded',      '{"renderAs":"bool-switch","fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',                                      'Product type compounded'),
(gen_random_uuid()::VARCHAR,'ICSR','610','610013','RETURNED_TO_MFR_DATE',      'returnedToMfrDate',         'returnedToMfrDate',         'TEXT',50, 'N','drugProducts$.returnedToMfrDate',         'lbl.returnedToMfrDate',      '{"renderAs":"date",  "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                          'Date returned to manufacturer'),
(gen_random_uuid()::VARCHAR,'ICSR','610','610002','DRUG_ADDITIONAL_INFO',        'zdrugAdditionalInfo',       'zdrugAdditionalInfo',       'TEXT',50, 'N','drugProducts$.zdrugAdditionalInfo',       'lbl.drugAdditionalInfo',     '{"renderAs":"textarea","fieldWidth":"3","columnWidth":"28ch","allowSorting":false}',                                        'Additional drug information'),
(gen_random_uuid()::VARCHAR,'ICSR','610','610055','PROD_REF_COMMENTS',         'prodRefComments',           'prodRefComments',           'TEXT',300,'N','drugProducts$.prodRefComments',           'lbl.productReferralComments','{"renderAs":"textarea","fieldWidth":"3","columnWidth":"28ch","allowSorting":false}',                                        'Product referral comments'),
(gen_random_uuid()::VARCHAR,'ICSR','610','610056','PROD_REF_REQUIRED',         'prodRefReqd',               'prodRefReqd',               'TEXT',1,  'N','drugProducts$.prodRefReqd',               'lbl.productReferralRequired','{"renderAs":"bool-switch","fieldWidth":"1","columnWidth":"18ch","allowSorting":true}',                                      'Product referral required')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;


-- ── 02_DB_METADATA_612.sql ──
-- ============================================================
-- Script  : 02_DB_METADATA_612.sql â€” ICSR_DRUG_ACTIVE_SUBSTANCES (second-level multi-context)
-- R3: G.k.2.3 â€” Active substances per drug product
-- FK: DRUG_ID â†’ ICSR_DRUG_PRODUCTS(ID)
-- Reused: ICSR_SUBSTANCE_STRENGTH_UNIT (03_CODELIST_610.sql)
-- ============================================================


INSERT INTO TABLE_METADATA (ID, MODULE_ID, TABLE_ID, PARENT_TABLE_ID, DB_TABLE_NAME, CONTEXT_NAME, MULTI_CONTEXT, JOIN_COLUMN, REF_JOIN_COLUMN, CONTEXT_PATH) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','612','610','ICSR_DRUG_ACTIVE_SUBSTANCES','activeSubstances','Y','DRUG_ID','ID','drugProducts$.activeSubstances$')
ON CONFLICT (MODULE_ID, TABLE_ID) DO NOTHING;

INSERT INTO TABLE_COLUMN_METADATA (ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','612','612003','ACTIVE_SUBSTANCE_NAME',    'activeSubstanceName',    'activeSubstanceName',    'TEXT',50, 'N','drugProducts$.activeSubstances$.activeSubstanceName',    'lbl.activeSubstanceName',    '{"renderAs":"text",  "fieldWidth":"2","columnWidth":"22ch","allowSorting":true}',                                          'R3:G.k.2.3.1 â€” Active substance name'),
(gen_random_uuid()::VARCHAR,'ICSR','612','612009','SUBSTANCE_TERMID',       'substanceTermID',        'substanceTermID',        'TEXT',300,'N','drugProducts$.activeSubstances$.substanceTermID',        'lbl.substanceTermId',        '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',                                          'R3:G.k.2.3.2a â€” Substance TermID'),
(gen_random_uuid()::VARCHAR,'ICSR','612','612008','SUBSTANCE_TERMID_VERSION','substanceTermIDVersion', 'substanceTermIDVersion', 'TEXT',300,'N','drugProducts$.activeSubstances$.substanceTermIDVersion', 'lbl.substanceTermIdVersion', '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',                                          'R3:G.k.2.3.2b â€” Substance TermID version'),
(gen_random_uuid()::VARCHAR,'ICSR','612','612006','SUBSTANCE_STRENGTH',     'substanceStrength',      'substanceStrength',      'TEXT',300,'N','drugProducts$.activeSubstances$.substanceStrength',      'lbl.substanceStrength',      '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                          'R3:G.k.2.3.3a â€” Substance strength number'),
(gen_random_uuid()::VARCHAR,'ICSR','612','612007','SUBSTANCE_STRENGTH_UNIT','substanceStrengthUnit',  'substanceStrengthUnit',  'TEXT',50, 'N','drugProducts$.activeSubstances$.substanceStrengthUnit',  'lbl.substanceStrengthUnit',  '{"renderAs":"combo", "fieldWidth":"1","columnWidth":"12ch","allowSorting":true, "codelist":"ICSR_SUBSTANCE_STRENGTH_UNIT"}','R3:G.k.2.3.3b â€” Substance strength unit'),
(gen_random_uuid()::VARCHAR,'ICSR','612','612004','CAS_NUMBER',             'casNumber',              'casNumber',              'TEXT',300,'N','drugProducts$.activeSubstances$.casNumber',              'lbl.casNumber',              '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'CAS number'),
(gen_random_uuid()::VARCHAR,'ICSR','612','612005','KDD_CODE',               'kddcode',                'kddcode',                'TEXT',300,'N','drugProducts$.activeSubstances$.kddcode',                'lbl.kddCode',                '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'KDD drug code'),
(gen_random_uuid()::VARCHAR,'ICSR','612','612001','CLINICAL_DRUG_CODE_JPN',  'cdc',                    'cdc',                    'TEXT',300,'N','drugProducts$.activeSubstances$.cdc',                    'lbl.clinicalDrugCode',       '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'Clinical drug code (Japan)'),
(gen_random_uuid()::VARCHAR,'ICSR','612','612002','PRIMARY_ACTIVE',         'primaryActive',          'primaryActive',          'TEXT',300,'N','drugProducts$.activeSubstances$.primaryActive',          'lbl.primaryActive',          '{"renderAs":"bool-switch","fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                      'Primary active substance flag')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;


-- ── 02_DB_METADATA_615.sql ──
-- ============================================================
-- Script  : 02_DB_METADATA_615.sql â€” ICSR_DRUG_THERAPIES (second-level multi-context)
-- R2: B.4.k.3-14 / R3: G.k.4-7 â€” Drug therapy details
-- FK: DRUG_ID â†’ ICSR_DRUG_PRODUCTS(ID)
-- Reused: ROUTE_OF_ADMIN, FORM_OF_ADMIN, ICSR_DOSAGE_UNIT,
--         ICSR_DURATION_UNIT, ICSR_SUBSTANCE_STRENGTH_UNIT,
--         ICSR_FREQ_TIME_UNIT, ICSR_THERAPY_SITE, ICSR_VACC_ANAT_SITE
-- ============================================================


INSERT INTO TABLE_METADATA (ID, MODULE_ID, TABLE_ID, PARENT_TABLE_ID, DB_TABLE_NAME, CONTEXT_NAME, MULTI_CONTEXT, JOIN_COLUMN, REF_JOIN_COLUMN, CONTEXT_PATH) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','615','610','ICSR_DRUG_THERAPIES','drugTherapies','Y','DRUG_ID','ID','drugProducts$.drugTherapies$')
ON CONFLICT (MODULE_ID, TABLE_ID) DO NOTHING;

INSERT INTO TABLE_COLUMN_METADATA (ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION) VALUES
-- â”€â”€ Dates â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
(gen_random_uuid()::VARCHAR,'ICSR','615','615031','DRUG_START_DATE',              'drugStartDate',              'drugStartDate',              'TEXT',50, 'N','drugProducts$.drugTherapies$.drugStartDate',              'lbl.therapyStartDate',       '{"renderAs":"date",  "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                          'R2:B.4.k.3 / R3:G.k.4.1 â€” Therapy start date'),
(gen_random_uuid()::VARCHAR,'ICSR','615','615032','THERAPY_START_DATE_TEXT',    'therapyStartDateText',       'therapyStartDateText',       'TEXT',300,'N','drugProducts$.drugTherapies$.therapyStartDateText',       'lbl.therapyStartDateText',   '{"renderAs":"text",  "fieldWidth":"2","columnWidth":"18ch","allowSorting":false}',                                         'Therapy start date text'),
(gen_random_uuid()::VARCHAR,'ICSR','615','615027','DRUG_END_DATE',                'drugEndDate',                'drugEndDate',                'TEXT',50, 'N','drugProducts$.drugTherapies$.drugEndDate',                'lbl.therapyEndDate',         '{"renderAs":"date",  "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                          'R2:B.4.k.4 / R3:G.k.4.2 â€” Therapy end date'),
(gen_random_uuid()::VARCHAR,'ICSR','615','615028','THERAPY_END_DATE_TEXT',      'therapyEndDateText',         'therapyEndDateText',         'TEXT',300,'N','drugProducts$.drugTherapies$.therapyEndDateText',         'lbl.therapyEndDateText',     '{"renderAs":"text",  "fieldWidth":"2","columnWidth":"18ch","allowSorting":false}',                                         'Therapy end date text'),
(gen_random_uuid()::VARCHAR,'ICSR','615','615029','THERAPY_ONGOING',      'drugTherapyOnGoing',         'drugTherapyOnGoing',         'TEXT',1,  'N','drugProducts$.drugTherapies$.drugTherapyOnGoing',         'lbl.therapyOngoing',         '{"renderAs":"bool-switch","fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                      'Therapy ongoing flag'),
(gen_random_uuid()::VARCHAR,'ICSR','615','615026','THERAPY_DOSE_REDUCED_DATE',  'drugTherapyDoseReducedDate', 'drugTherapyDoseReducedDate', 'TEXT',50, 'N','drugProducts$.drugTherapies$.drugTherapyDoseReducedDate', 'lbl.doseReducedDate',        '{"renderAs":"date",  "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                          'Therapy dose reduced date'),
-- â”€â”€ Duration â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
(gen_random_uuid()::VARCHAR,'ICSR','615','615007','DRUG_ADMIN_DURATION',          'drugAdminDuration',          'drugAdminDuration',          'TEXT',300,'N','drugProducts$.drugTherapies$.drugAdminDuration',          'lbl.adminDuration',          '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"10ch","allowSorting":true}',                                          'R2:B.4.k.5 / R3:G.k.4.3 â€” Duration of drug administration'),
(gen_random_uuid()::VARCHAR,'ICSR','615','615008','DRUG_ADMIN_DURATION_UNIT',      'drugAdminDurationUnit',      'drugAdminDurationUnit',      'TEXT',50, 'N','drugProducts$.drugTherapies$.drugAdminDurationUnit',      'lbl.adminDurationUnit',      '{"renderAs":"combo", "fieldWidth":"1","columnWidth":"12ch","allowSorting":true, "codelist":"ICSR_DURATION_UNIT"}',         'R2:B.4.k.5 / R3:G.k.4.3 â€” Duration unit'),
-- â”€â”€ Dose â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
(gen_random_uuid()::VARCHAR,'ICSR','615','615035','DRUG_UNIT_DOSE_NUMB',    'drugStructureDosageNumb',    'drugStructureDosageNumb',    'TEXT',300,'N','drugProducts$.drugTherapies$.drugStructureDosageNumb',    'lbl.unitDose',               '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"10ch","allowSorting":true}',                                          'R2:B.4.k.6a / R3:G.k.4.4 â€” Unit dose number'),
(gen_random_uuid()::VARCHAR,'ICSR','615','615036','DRUG_UNIT_DOSE_UNIT',    'drugStructureDosageUnit',    'drugStructureDosageUnit',    'TEXT',50, 'N','drugProducts$.drugTherapies$.drugStructureDosageUnit',    'lbl.unitDoseUnit',           '{"renderAs":"combo", "fieldWidth":"1","columnWidth":"12ch","allowSorting":true, "codelist":"ICSR_DOSAGE_UNIT"}',            'R2:B.4.k.6b / R3:G.k.4.4 â€” Unit dose unit'),
(gen_random_uuid()::VARCHAR,'ICSR','615','615003','DAILY_DOSE',                 'dailyDose',                  'dailyDose',                  'TEXT',300,'N','drugProducts$.drugTherapies$.dailyDose',                  'lbl.dailyDose',              '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"10ch","allowSorting":true}',                                          'Daily dose'),
(gen_random_uuid()::VARCHAR,'ICSR','615','615004','DAILY_DOSE_UNIT',            'dailyDoseUnit',              'dailyDoseUnit',              'TEXT',50, 'N','drugProducts$.drugTherapies$.dailyDoseUnit',              'lbl.dailyDoseUnit',          '{"renderAs":"combo", "fieldWidth":"1","columnWidth":"12ch","allowSorting":true, "codelist":"ICSR_DOSAGE_UNIT"}',            'Daily dose unit'),
(gen_random_uuid()::VARCHAR,'ICSR','615','615033','TOTAL_DOSE',                 'totalDose',                  'totalDose',                  'TEXT',300,'N','drugProducts$.drugTherapies$.totalDose',                  'lbl.totalDose',              '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"10ch","allowSorting":true}',                                          'Total dose'),
(gen_random_uuid()::VARCHAR,'ICSR','615','615034','TOTAL_DOSE_UNIT',            'totalDoseUnit',              'totalDoseUnit',              'TEXT',50, 'N','drugProducts$.drugTherapies$.totalDoseUnit',              'lbl.totalDoseUnit',          '{"renderAs":"combo", "fieldWidth":"1","columnWidth":"12ch","allowSorting":true, "codelist":"ICSR_DOSAGE_UNIT"}',            'Total dose unit'),
(gen_random_uuid()::VARCHAR,'ICSR','615','615001','DRUG_CUMULATIVE_DOSE_NUMB',   'drugCumulativeDosageNumb',   'drugCumulativeDosageNumb',   'TEXT',300,'N','drugProducts$.drugTherapies$.drugCumulativeDosageNumb',   'lbl.cumulativeDose',         '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                          'Cumulative dose to first reaction'),
(gen_random_uuid()::VARCHAR,'ICSR','615','615002','DRUG_CUMULATIVE_DOSE_UNIT',   'drugCumulativeDosageUnit',   'drugCumulativeDosageUnit',   'TEXT',50, 'N','drugProducts$.drugTherapies$.drugCumulativeDosageUnit',   'lbl.cumulativeDoseUnit',     '{"renderAs":"combo", "fieldWidth":"1","columnWidth":"12ch","allowSorting":true, "codelist":"ICSR_DOSAGE_UNIT"}',            'Cumulative dose unit'),
(gen_random_uuid()::VARCHAR,'ICSR','615','615005','DRUG_DOSAGE_TEXT',             'drugDosageText',             'drugDosageText',             'TEXT',50, 'N','drugProducts$.drugTherapies$.drugDosageText',             'lbl.dosageText',             '{"renderAs":"text",  "fieldWidth":"2","columnWidth":"20ch","allowSorting":false}',                                         'Dosage text (free text)')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;

INSERT INTO TABLE_COLUMN_METADATA (ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION) VALUES
-- â”€â”€ Frequency â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
(gen_random_uuid()::VARCHAR,'ICSR','615','615012','DRUG_FREQUENCY_NUMB',     'drugSeparateDosageMumb',     'drugSeparateDosageMumb',     'TEXT',50, 'N','drugProducts$.drugTherapies$.drugSeparateDosageMumb',     'lbl.frequency',              '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"10ch","allowSorting":true}',                                          'R2:B.4.k.8 / R3:G.k.4.6 â€” Frequency (number of doses)'),
(gen_random_uuid()::VARCHAR,'ICSR','615','615013','DRUG_FREQ_TIME_NUMB',      'drugIntDosageUnitNumb',      'drugIntDosageUnitNumb',      'TEXT',300,'N','drugProducts$.drugTherapies$.drugIntDosageUnitNumb',      'lbl.frequencyTime',          '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"10ch","allowSorting":true}',                                          'R2:B.4.k.9 / R3:G.k.4.7 â€” Frequency time interval'),
(gen_random_uuid()::VARCHAR,'ICSR','615','615014','DRUG_FREQ_TIME_UNIT',       'drugIntDosageUnitDef',       'drugIntDosageUnitDef',       'TEXT',50, 'N','drugProducts$.drugTherapies$.drugIntDosageUnitDef',       'lbl.frequencyTimeUnit',      '{"renderAs":"combo", "fieldWidth":"1","columnWidth":"12ch","allowSorting":true, "codelist":"ICSR_FREQ_TIME_UNIT"}',        'R2:B.4.k.9 / R3:G.k.4.7 â€” Frequency time unit'),
(gen_random_uuid()::VARCHAR,'ICSR','615','615006','DOSE_NUM_SERIES',            'doseNumberInSeries',         'doseNumberInSeries',         'TEXT',300,'N','drugProducts$.drugTherapies$.doseNumberInSeries',         'lbl.doseNumberInSeries',     '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                          'Dose number in series (vaccine)'),
-- â”€â”€ Route and form â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
(gen_random_uuid()::VARCHAR,'ICSR','615','615023','DRUG_ADMIN_ROUTE',    'drugAdministrationRoute',    'drugAdministrationRoute',    'TEXT',50, 'N','drugProducts$.drugTherapies$.drugAdministrationRoute',    'lbl.routeOfAdmin',           '{"renderAs":"combo", "fieldWidth":"1","columnWidth":"16ch","allowSorting":true, "codelist":"ROUTE_OF_ADMIN"}',             'R2:B.4.k.10 / R3:G.k.4.8 â€” Route of administration'),
(gen_random_uuid()::VARCHAR,'ICSR','615','615025','ROUTE_ADMIN_TERMID',         'routeOfAdministratorTermID', 'routeOfAdministratorTermID', 'TEXT',300,'N','drugProducts$.drugTherapies$.routeOfAdministratorTermID', 'lbl.routeTermId',            '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'R3:G.k.4.8.1 â€” Route of administration TermID'),
(gen_random_uuid()::VARCHAR,'ICSR','615','615024','ROUTE_ADMIN_TERMID_VER',     'routeOfAdministratorTermIDVersion','routeOfAdministratorTermIDVersion','TEXT',300,'N','drugProducts$.drugTherapies$.routeOfAdministratorTermIDVersion','lbl.routeTermIdVersion','{"renderAs":"text","fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                   'R3:G.k.4.8.2 â€” Route TermID version'),
(gen_random_uuid()::VARCHAR,'ICSR','615','615020','DRUG_PARENT_ADMIN_ROUTE',      'drugParadministration',      'drugParadministration',      'TEXT',50, 'N','drugProducts$.drugTherapies$.drugParadministration',      'lbl.parentRouteAdmin',       '{"renderAs":"combo", "fieldWidth":"1","columnWidth":"16ch","allowSorting":true, "codelist":"ROUTE_OF_ADMIN"}',             'Parent route of administration'),
(gen_random_uuid()::VARCHAR,'ICSR','615','615009','DRUG_DOSAGE_FORM',             'drugDosageForm',             'drugDosageForm',             'TEXT',50, 'N','drugProducts$.drugTherapies$.drugDosageForm',             'lbl.dosageForm',             '{"renderAs":"combo", "fieldWidth":"1","columnWidth":"16ch","allowSorting":true, "codelist":"FORM_OF_ADMIN"}',              'R2:B.4.k.11 / R3:G.k.4.9 â€” Pharmaceutical dose form'),
(gen_random_uuid()::VARCHAR,'ICSR','615','615022','PHARMACEUTICAL_TERMID',      'pharmaceuticalDoseTermID',   'pharmaceuticalDoseTermID',   'TEXT',50, 'N','drugProducts$.drugTherapies$.pharmaceuticalDoseTermID',   'lbl.pharmaTermId',           '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'R3:G.k.4.9.1 â€” Pharmaceutical dose form TermID'),
(gen_random_uuid()::VARCHAR,'ICSR','615','615021','PHARMACEUTICAL_TERMID_VER',  'pharmaceuticalDoseTermIDVersion','pharmaceuticalDoseTermIDVersion','TEXT',50,'N','drugProducts$.drugTherapies$.pharmaceuticalDoseTermIDVersion','lbl.pharmaTermIdVersion','{"renderAs":"text","fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                    'R3:G.k.4.9.2 â€” Pharmaceutical dose form TermID version'),
(gen_random_uuid()::VARCHAR,'ICSR','615','615010','FORM_STRENGTH',              'formStrength',               'formStrength',               'TEXT',300,'N','drugProducts$.drugTherapies$.formStrength',               'lbl.formStrength',           '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                          'Form strength'),
(gen_random_uuid()::VARCHAR,'ICSR','615','615011','FORM_STRENGTH_UNIT',         'formStrengthUnit',           'formStrengthUnit',           'TEXT',50, 'N','drugProducts$.drugTherapies$.formStrengthUnit',           'lbl.formStrengthUnit',       '{"renderAs":"combo", "fieldWidth":"1","columnWidth":"12ch","allowSorting":true, "codelist":"ICSR_SUBSTANCE_STRENGTH_UNIT"}','Form strength unit'),
-- â”€â”€ Lot / batch â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
(gen_random_uuid()::VARCHAR,'ICSR','615','615017','LOT_NUMBER',                 'lotNumber',                  'lotNumber',                  'TEXT',50, 'N','drugProducts$.drugTherapies$.lotNumber',                  'lbl.lotNumber',              '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'R2:B.4.k.12 / R3:G.k.4.10 â€” Lot/batch number'),
(gen_random_uuid()::VARCHAR,'ICSR','615','615016','EXPIRATION_DATE',            'expirationDate',             'expirationDate',             'TEXT',50, 'N','drugProducts$.drugTherapies$.expirationDate',             'lbl.lotExpirationDate',      '{"renderAs":"date",  "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                          'R2:B.4.k.13 / R3:G.k.4.11 â€” Lot expiration date'),
-- â”€â”€ Therapy site / vaccine â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
(gen_random_uuid()::VARCHAR,'ICSR','615','615030','THERAPY_SITE',              'theraphySite',               'theraphySite',               'TEXT',50, 'N','drugProducts$.drugTherapies$.theraphySite',               'lbl.therapySite',            '{"renderAs":"combo", "fieldWidth":"1","columnWidth":"14ch","allowSorting":true, "codelist":"ICSR_THERAPY_SITE"}',          'Therapy administration site'),
(gen_random_uuid()::VARCHAR,'ICSR','615','615037','ANATOMICAL_APPROACH_SITE',   'anatomicalApproachSite',     'anatomicalApproachSite',     'TEXT',50, 'N','drugProducts$.drugTherapies$.anatomicalApproachSite',     'lbl.vaccineAnatomicalSite',  '{"renderAs":"combo", "fieldWidth":"1","columnWidth":"16ch","allowSorting":true, "codelist":"ICSR_VACC_ANAT_SITE"}',        'Vaccine anatomical approach site'),
(gen_random_uuid()::VARCHAR,'ICSR','615','615015','IS_SAMPLE_AVAILABLE',        'isSampleAvailable',          'isSampleAvailable',          'TEXT',1,  'N','drugProducts$.drugTherapies$.isSampleAvailable',          'lbl.sampleAvailable',        '{"renderAs":"bool-switch","fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',                                      'Is sample available'),
-- â”€â”€ Prescribing doctor â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
(gen_random_uuid()::VARCHAR,'ICSR','615','615043','TITLE',                      'title',                      'title',                      'TEXT',50, 'N','drugProducts$.drugTherapies$.title',                      'lbl.docTitle',               '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"10ch","allowSorting":true}',                                          'Prescribing doctor title'),
(gen_random_uuid()::VARCHAR,'ICSR','615','615039','FIRST_NAME',                 'firstName',                  'firstName',                  'TEXT',300,'N','drugProducts$.drugTherapies$.firstName',                  'lbl.docFirstName',           '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'Prescribing doctor first name'),
(gen_random_uuid()::VARCHAR,'ICSR','615','615041','MIDDLE_NAME',                'middleName',                 'middleName',                 'TEXT',300,'N','drugProducts$.drugTherapies$.middleName',                 'lbl.docMiddleName',          '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'Prescribing doctor middle name'),
(gen_random_uuid()::VARCHAR,'ICSR','615','615040','LAST_NAME',                  'lastName',                   'lastName',                   'TEXT',300,'N','drugProducts$.drugTherapies$.lastName',                   'lbl.docLastName',            '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'Prescribing doctor last name'),
(gen_random_uuid()::VARCHAR,'ICSR','615','615042','TELEPHONE',                  'telephone',                  'telephone',                  'TEXT',300,'N','drugProducts$.drugTherapies$.telephone',                  'lbl.docTelephone',           '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"14ch","allowSorting":false}',                                         'Prescribing doctor telephone'),
(gen_random_uuid()::VARCHAR,'ICSR','615','615038','EMAIL',                   'emailId',                    'emailId',                    'TEXT',300,'N','drugProducts$.drugTherapies$.emailId',                    'lbl.docEmail',               '{"renderAs":"text",  "fieldWidth":"2","columnWidth":"20ch","allowSorting":false}',                                         'Prescribing doctor email')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;


-- ── 02_DB_METADATA_617.sql ──
-- ============================================================
-- Script  : 02_DB_METADATA_617.sql â€” ICSR_DRUG_THERAPY_VACCINES (third-level multi-context)
-- Vaccine facility details per drug therapy
-- FK: THERAPY_ID â†’ ICSR_DRUG_THERAPIES(ID)
-- Reused: COUNTRY, ICSR_VACC_FACILITY_TYPE
-- ============================================================


INSERT INTO TABLE_METADATA (ID, MODULE_ID, TABLE_ID, PARENT_TABLE_ID, DB_TABLE_NAME, CONTEXT_NAME, MULTI_CONTEXT, JOIN_COLUMN, REF_JOIN_COLUMN, CONTEXT_PATH) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','617','615','ICSR_DRUG_THERAPY_VACCINES','drugTherapyVaccineCollection','Y','THERAPY_ID','ID','drugProducts$.drugTherapies$.drugTherapyVaccineCollection$')
ON CONFLICT (MODULE_ID, TABLE_ID) DO NOTHING;

INSERT INTO TABLE_COLUMN_METADATA (ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','617','617007','VACCINE_NAME',          'vaccineName',          'vaccineName',          'TEXT',300,'N','drugProducts$.drugTherapies$.drugTherapyVaccineCollection$.vaccineName',          'lbl.vaccFacilityName',    '{"renderAs":"text",  "fieldWidth":"2","columnWidth":"22ch","allowSorting":true}',                                          'Vaccination facility name'),
(gen_random_uuid()::VARCHAR,'ICSR','617','617011','VACCINATION_TYPE',      'vaccinationType',      'vaccinationType',      'TEXT',50, 'N','drugProducts$.drugTherapies$.drugTherapyVaccineCollection$.vaccinationType',      'lbl.vaccFacilityType',    '{"renderAs":"combo", "fieldWidth":"1","columnWidth":"16ch","allowSorting":true, "codelist":"ICSR_VACC_FACILITY_TYPE"}','Vaccination facility type'),
(gen_random_uuid()::VARCHAR,'ICSR','617','617001','VACCINATION_ADDRESS1',  'vaccinationAddress1',  'vaccinationAddress1',  'TEXT',300,'N','drugProducts$.drugTherapies$.drugTherapyVaccineCollection$.vaccinationAddress1',  'lbl.vaccAddress1',        '{"renderAs":"text",  "fieldWidth":"2","columnWidth":"22ch","allowSorting":false}',                                         'Vaccination facility address line 1'),
(gen_random_uuid()::VARCHAR,'ICSR','617','617002','VACCINATION_ADDRESS2',  'vaccinationAddress2',  'vaccinationAddress2',  'TEXT',300,'N','drugProducts$.drugTherapies$.drugTherapyVaccineCollection$.vaccinationAddress2',  'lbl.vaccAddress2',        '{"renderAs":"text",  "fieldWidth":"2","columnWidth":"22ch","allowSorting":false}',                                         'Vaccination facility address line 2'),
(gen_random_uuid()::VARCHAR,'ICSR','617','617003','VACCINATION_CITY',      'vaccinationCity',      'vaccinationCity',      'TEXT',300,'N','drugProducts$.drugTherapies$.drugTherapyVaccineCollection$.vaccinationCity',      'lbl.vaccCity',            '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'Vaccination facility city'),
(gen_random_uuid()::VARCHAR,'ICSR','617','617009','VACCINATION_STATE',     'vaccinationState',     'vaccinationState',     'TEXT',50, 'N','drugProducts$.drugTherapies$.drugTherapyVaccineCollection$.vaccinationState',     'lbl.vaccState',           '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'Vaccination facility state'),
(gen_random_uuid()::VARCHAR,'ICSR','617','617008','VACCINATION_POSTAL_CODE','vaccinationPostalCode','vaccinationPostalCode','TEXT',300,'N','drugProducts$.drugTherapies$.drugTherapyVaccineCollection$.vaccinationPostalCode','lbl.vaccPostalCode',      '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                          'Vaccination facility postal code'),
(gen_random_uuid()::VARCHAR,'ICSR','617','617004','VACCINATION_COUNTRY',   'vaccinationCountry',   'vaccinationCountry',   'TEXT',50, 'N','drugProducts$.drugTherapies$.drugTherapyVaccineCollection$.vaccinationCountry',   'lbl.vaccCountry',         '{"renderAs":"combo", "fieldWidth":"1","columnWidth":"14ch","allowSorting":true, "codelist":"COUNTRY"}',            'Vaccination facility country'),
(gen_random_uuid()::VARCHAR,'ICSR','617','617010','VACCINATION_TELEPHONE', 'vaccinationTelephone', 'vaccinationTelephone', 'TEXT',300,'N','drugProducts$.drugTherapies$.drugTherapyVaccineCollection$.vaccinationTelephone', 'lbl.vaccTelephone',       '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"14ch","allowSorting":false}',                                         'Vaccination facility telephone'),
(gen_random_uuid()::VARCHAR,'ICSR','617','617005','VACCINATION_FAX',       'vaccinationFax',       'vaccinationFax',       'TEXT',300,'N','drugProducts$.drugTherapies$.drugTherapyVaccineCollection$.vaccinationFax',       'lbl.vaccFax',             '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"14ch","allowSorting":false}',                                         'Vaccination facility fax'),
(gen_random_uuid()::VARCHAR,'ICSR','617','617006','VACCINE_FACILITY_MILITARY_FLAG','vaccineMilitaryFlag','vaccineMilitaryFlag','TEXT',1,'N','drugProducts$.drugTherapies$.drugTherapyVaccineCollection$.vaccineMilitaryFlag','lbl.vaccMilitaryFlag',    '{"renderAs":"bool-switch","fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                      'Vaccination facility military flag')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;


-- ── 02_DB_METADATA_620.sql ──
-- ============================================================
-- Script  : 02_DB_METADATA_620.sql â€” ICSR_DRUG_INDICATIONS (second-level multi-context)
-- R2: B.4.k.11 / R3: G.k.7 â€” Drug indications
-- FK: DRUG_ID â†’ ICSR_DRUG_PRODUCTS(ID)
-- ============================================================


INSERT INTO TABLE_METADATA (ID, MODULE_ID, TABLE_ID, PARENT_TABLE_ID, DB_TABLE_NAME, CONTEXT_NAME, MULTI_CONTEXT, JOIN_COLUMN, REF_JOIN_COLUMN, CONTEXT_PATH) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','620','610','ICSR_DRUG_INDICATIONS','drugIndications','Y','DRUG_ID','ID','drugProducts$.drugIndications$')
ON CONFLICT (MODULE_ID, TABLE_ID) DO NOTHING;

INSERT INTO TABLE_COLUMN_METADATA (ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','620','620001','DRUG_INDICATION',      'drugIndication',      'drugIndication',      'TEXT',50, 'N','drugProducts$.drugIndications$.drugIndication',      'lbl.indicationTerm',    '{"renderAs":"text","fieldWidth":"2","columnWidth":"22ch","allowSorting":true}',  'R2:B.4.k.11 / R3:G.k.7.1 â€” Indication term (verbatim)'),
(gen_random_uuid()::VARCHAR,'ICSR','620','620002','DRUG_INDICATION_LLT_CODE', 'drugIndicationCode',  'drugIndicationCode',  'TEXT',300,'N','drugProducts$.drugIndications$.drugIndicationCode',  'lbl.indicationLltCode', '{"renderAs":"text","fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',  'R2:B.4.k.11a â€” Indication MedDRA LLT code'),
(gen_random_uuid()::VARCHAR,'ICSR','620','620003','DRUG_INDICATION_PT_CODE',    'drugIndicationLLTCode','drugIndicationLLTCode','TEXT',300,'N','drugProducts$.drugIndications$.drugIndicationLLTCode','lbl.indicationPtCode',  '{"renderAs":"text","fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',  'R3:G.k.7.2 â€” Indication MedDRA PT code')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;


-- ── 02_DB_METADATA_625.sql ──
-- ============================================================
-- Script  : 02_DB_METADATA_625.sql â€” ICSR_PRODUCT_DEVICES (second-level multi-context)
-- Device-specific product details
-- FK: DRUG_ID â†’ ICSR_DRUG_PRODUCTS(ID)
-- Reused: ICSR_DURATION_UNIT, ICSR_DEVICE_LOCATION, ICSR_DEVICE_EVALUATED,
--         ICSR_DEVICE_EVAL_NOT_PROVIDED, ICSR_REMEDIAL_ACTION,
--         ICSR_DEVICE_USAGE, ICSR_DEVICE_OPERATOR, ICSR_DEVICE_REPROCESSED
-- ============================================================


INSERT INTO TABLE_METADATA (ID, MODULE_ID, TABLE_ID, PARENT_TABLE_ID, DB_TABLE_NAME, CONTEXT_NAME, MULTI_CONTEXT, JOIN_COLUMN, REF_JOIN_COLUMN, CONTEXT_PATH) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','625','610','ICSR_PRODUCT_DEVICES','productDevices','Y','DRUG_ID','ID','drugProducts$.productDevices$')
ON CONFLICT (MODULE_ID, TABLE_ID) DO NOTHING;

-- â”€â”€ Core device identification â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO TABLE_COLUMN_METADATA (ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','625','625005','BRAND_NAME',              'brandName',              'brandName',              'TEXT',300,'N','drugProducts$.productDevices$.brandName',              'lbl.deviceBrandName',        '{"renderAs":"text",  "fieldWidth":"2","columnWidth":"22ch","allowSorting":true}',                                          'Device brand name'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625008','COMMON_DEVICE_NAME',      'commonDeviceName',       'commonDeviceName',       'TEXT',300,'N','drugProducts$.productDevices$.commonDeviceName',       'lbl.commonDeviceName',       '{"renderAs":"text",  "fieldWidth":"2","columnWidth":"22ch","allowSorting":true}',                                          'Common device name'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625038','GENERAL_NAME',            'generalName',            'generalName',            'TEXT',300,'N','drugProducts$.productDevices$.generalName',            'lbl.generalName',            '{"renderAs":"text",  "fieldWidth":"2","columnWidth":"20ch","allowSorting":true}',                                          'General name'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625039','GENERAL_NAME_CODE',       'generalNameCode',        'generalNameCode',        'TEXT',300,'N','drugProducts$.productDevices$.generalNameCode',        'lbl.generalNameCode',        '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'General name code'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625064','PRODUCT_DESC',            'productDesc',            'productDesc',            'TEXT',300,'N','drugProducts$.productDevices$.productDesc',            'lbl.deviceProductDesc',      '{"renderAs":"textarea","fieldWidth":"3","columnWidth":"28ch","allowSorting":false}',                                        'Product description'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625063','PRO_CODE',                'proCode',                'proCode',                'TEXT',300,'N','drugProducts$.productDevices$.proCode',                'lbl.deviceProductCode',      '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'Product code'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625076','UDI_NUMBER',              'udiNumber',              'udiNumber',              'TEXT',50, 'N','drugProducts$.productDevices$.udiNumber',              'lbl.udiNumber',              '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',                                          'UDI device identifier / EUDAMED ID'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625006','CATALOGUE_NUMBER',        'catalogueNumber',        'catalogueNumber',        'TEXT',300,'N','drugProducts$.productDevices$.catalogueNumber',        'lbl.catalogueNumber',        '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'Catalogue number'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625047','MODEL_NUMBER',            'modelNumber',            'modelNumber',            'TEXT',300,'N','drugProducts$.productDevices$.modelNumber',            'lbl.modelNumber',            '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'Model number'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625073','SERIAL_NUMBER',           'serialNo',               'serialNo',               'TEXT',300,'N','drugProducts$.productDevices$.serialNo',               'lbl.serialNumber',           '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'Serial number'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625018','LOT_NUMBER',              'lotNumber',              'lotNumber',              'TEXT',50, 'N','drugProducts$.productDevices$.lotNumber',              'lbl.deviceLotNumber',        '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'Device batch/lot number'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625007','DEVICE_CE_NUMBER',       'prodDeviceCEnum',        'prodDeviceCEnum',        'TEXT',300,'N','drugProducts$.productDevices$.prodDeviceCEnum',        'lbl.ceNumber',               '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                          'CE number'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625002','APPROVAL_NO',             'approvalNo',             'approvalNo',             'TEXT',300,'N','drugProducts$.productDevices$.approvalNo',             'lbl.deviceApprovalNo',       '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'Approval number'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625035','FDA_REG_NUM',             'fdaRegNumber',           'fdaRegNumber',           'TEXT',300,'N','drugProducts$.productDevices$.fdaRegNumber',           'lbl.fdaRegNumber',           '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'FDA registration number'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625003','PROD_ARTG_NUM',           'prodArtgNum',            'prodArtgNum',            'TEXT',300,'N','drugProducts$.productDevices$.prodArtgNum',            'lbl.artgNumber',             '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'ARTG number (Australia)')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;

-- â”€â”€ Device dates and age â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO TABLE_COLUMN_METADATA (ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','625','625025','DEVICE_MANUFACTURE_DATE', 'deviceManufactureDate',  'deviceManufactureDate',  'DATE',NULL,'N','drugProducts$.productDevices$.deviceManufactureDate',  'lbl.deviceManufactureDate',  '{"renderAs":"date",  "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                          'Device manufacture date'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625024','EXPIRATION_DATE',         'expirationDate',         'expirationDate',         'DATE',NULL,'N','drugProducts$.productDevices$.expirationDate',         'lbl.deviceExpirationDate',   '{"renderAs":"date",  "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                          'Device expiration date'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625014','IMPLANTED_DATE',          'implantedDate',          'implantedDate',          'DATE',NULL,'N','drugProducts$.productDevices$.implantedDate',          'lbl.implantedDate',          '{"renderAs":"date",  "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                          'Date implanted'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625013','EXPLANTED_DATE',          'explantedDate',          'explantedDate',          'DATE',NULL,'N','drugProducts$.productDevices$.explantedDate',          'lbl.explantedDate',          '{"renderAs":"date",  "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                          'Date explanted'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625027','DURATION_OF_IMPLANTATION','durationOfImplantation', 'durationOfImplantation', 'TEXT',300,'N','drugProducts$.productDevices$.durationOfImplantation', 'lbl.durationImplantation',   '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                          'Duration of implantation/usage'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625026','DURATION_OF_IMPLANTATION_UNIT','durationOfImplantationUnit','durationOfImplantationUnit','TEXT',50,'N','drugProducts$.productDevices$.durationOfImplantationUnit','lbl.durationImplantationUnit','{"renderAs":"combo","fieldWidth":"1","columnWidth":"12ch","allowSorting":true, "codelist":"ICSR_DURATION_UNIT"}','Duration of implantation unit'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625016','DEVICE_AGE',              'deviceAge',              'deviceAge',              'TEXT',300,'N','drugProducts$.productDevices$.deviceAge',              'lbl.deviceAge',              '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"10ch","allowSorting":true}',                                          'Device age'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625017','DEVICE_AGE_UNIT',         'deviceAgeUnit',          'deviceAgeUnit',          'TEXT',50, 'N','drugProducts$.productDevices$.deviceAgeUnit',          'lbl.deviceAgeUnit',          '{"renderAs":"combo", "fieldWidth":"1","columnWidth":"12ch","allowSorting":true, "codelist":"ICSR_DURATION_UNIT"}',         'Device age unit'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625066','PROD_RETURN_DATE',        'prodReturnDate',         'prodReturnDate',         'DATE',NULL,'N','drugProducts$.productDevices$.prodReturnDate',         'lbl.productReturnDate',      '{"renderAs":"date",  "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                          'Product return date'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625028','DATE_EXPECTED_NEXT_REPORT','expectedDateNextReport', 'expectedDateNextReport', 'DATE',NULL,'N','drugProducts$.productDevices$.expectedDateNextReport', 'lbl.expectedNextReportDate', '{"renderAs":"date",  "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                          'Expected date of next report')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;

-- â”€â”€ Device evaluation and remedial action â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO TABLE_COLUMN_METADATA (ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','625','625022','DEVICE_EVALUATED_BY_MFR','evaluatedByManufacturer','evaluatedByManufacturer','TEXT',50,'N','drugProducts$.productDevices$.evaluatedByManufacturer','lbl.evaluatedByManufacturer','{"renderAs":"combo","fieldWidth":"1","columnWidth":"20ch","allowSorting":true, "codelist":"ICSR_DEVICE_EVALUATED"}','Device evaluated by manufacturer'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625067','REASON_EVALUATION_NOT_PROVIDED','reasonEvaluationNotProvided','reasonEvaluationNotProvided','TEXT',50,'N','drugProducts$.productDevices$.reasonEvaluationNotProvided','lbl.reasonEvalNotProvided','{"renderAs":"combo","fieldWidth":"1","columnWidth":"20ch","allowSorting":true, "codelist":"ICSR_DEVICE_EVAL_NOT_PROVIDED"}','Reason device was not evaluated'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625012','CURRENT_DEV_LOCATION',    'currentDevLocation',     'currentDevLocation',     'TEXT',50, 'N','drugProducts$.productDevices$.currentDevLocation',     'lbl.currentDevLocation',     '{"renderAs":"combo", "fieldWidth":"1","columnWidth":"18ch","allowSorting":true, "codelist":"ICSR_DEVICE_LOCATION"}',       'Current device location'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625068','REMEDIAL_ACTION','ifRemedialActionInitiated','ifRemedialActionInitiated','TEXT',50,'N','drugProducts$.productDevices$.ifRemedialActionInitiated','lbl.remedialAction',        '{"renderAs":"combo","fieldWidth":"1","columnWidth":"18ch","allowSorting":true, "codelist":"ICSR_REMEDIAL_ACTION"}',       'Remedial action initiated'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625015','REMEDIAL_ACTION_OTHER',   'remedialActionOther',    'remedialActionOther',    'TEXT',300,'N','drugProducts$.productDevices$.remedialActionOther',    'lbl.remedialActionOther',    '{"renderAs":"textarea","fieldWidth":"3","columnWidth":"28ch","allowSorting":false}',                                        'Describe other remedial action'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625011','CORRECTION_REMOVE_REPORTING_NO','removalReportingNumber','removalReportingNumber','TEXT',300,'N','drugProducts$.productDevices$.removalReportingNumber','lbl.correctionRemovalNo',   '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"18ch","allowSorting":true}',                                          'Correction/removal reporting number'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625077','DEVICE_USED_FOR',         'deviceUsedFor',          'deviceUsedFor',          'TEXT',50, 'N','drugProducts$.productDevices$.deviceUsedFor',          'lbl.deviceUsage',            '{"renderAs":"combo", "fieldWidth":"1","columnWidth":"16ch","allowSorting":true, "codelist":"ICSR_DEVICE_USAGE"}',          'Usage of device'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625055','OPERATOR_OF_DEVICE',      'operatorOfDevice',       'operatorOfDevice',       'TEXT',50, 'N','drugProducts$.productDevices$.operatorOfDevice',       'lbl.deviceOperator',         '{"renderAs":"combo", "fieldWidth":"1","columnWidth":"18ch","allowSorting":true, "codelist":"ICSR_DEVICE_OPERATOR"}',       'Operator of device'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625042','DEVICE_REPROCESSED_AND_REUSED','deviceReprocessedAndReused','deviceReprocessedAndReused','TEXT',50,'N','drugProducts$.productDevices$.deviceReprocessedAndReused','lbl.deviceReprocessed',  '{"renderAs":"combo","fieldWidth":"1","columnWidth":"20ch","allowSorting":true, "codelist":"ICSR_DEVICE_REPROCESSED"}',    'Single-use device reprocessed and reused'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625043','LABELLED_FOR_SINGLE_USE', 'labelled',               'labelled',               'TEXT',1,  'N','drugProducts$.productDevices$.labelled',               'lbl.labelledSingleUse',      '{"renderAs":"bool-switch","fieldWidth":"1","columnWidth":"18ch","allowSorting":true}',                                      'Labeled single use device'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625044','MAL_FUNCTION',            'malFunction',            'malFunction',            'TEXT',1,  'N','drugProducts$.productDevices$.malFunction',            'lbl.malfunction',            '{"renderAs":"bool-switch","fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                      'Malfunction occurred'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625057','IS_PROD_COMBINATION',     'isProdCombination',      'isProdCombination',      'TEXT',1,  'N','drugProducts$.productDevices$.isProdCombination',      'lbl.partOfCombination',      '{"renderAs":"bool-switch","fieldWidth":"1","columnWidth":"18ch","allowSorting":true}',                                      'Part of combination product'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625060','PRIMARY_DEVICE_FLAG',     'primaryDeviceFlag',      'primaryDeviceFlag',      'TEXT',50, 'N','drugProducts$.productDevices$.primaryDeviceFlag',      'lbl.primaryCausalDevice',    '{"renderAs":"combo", "fieldWidth":"1","columnWidth":"16ch","allowSorting":true, "codelist":"ICSR_LABELLING"}',             'Primary causal device flag'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625062','PRODUCT_CHARACTERIZATION','productCharacterisation','productCharacterisation','TEXT',50, 'N','drugProducts$.productDevices$.productCharacterisation','lbl.productCharacterisation','{"renderAs":"combo", "fieldWidth":"1","columnWidth":"18ch","allowSorting":true, "codelist":"ICSR_DRUG_CHAR"}',            'Product characterization'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625074','SUMMARY_REPORT',          'summaryReport',          'summaryReport',          'TEXT',1,  'N','drugProducts$.productDevices$.summaryReport',          'lbl.summaryReport',          '{"renderAs":"bool-switch","fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                      'Summary report flag'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625085','RISK_ASSESSMENT_REVIEWED','riskAssessmentReviewed', 'riskAssessmentReviewed', 'TEXT',1,  'N','drugProducts$.productDevices$.riskAssessmentReviewed', 'lbl.riskAssessmentReviewed', '{"renderAs":"bool-switch","fieldWidth":"1","columnWidth":"20ch","allowSorting":true}',                                      'Risk assessment reviewed'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625086','RISK_ASSESSMENT_ADEQUATE','riskAssessmentBeenReviewed','riskAssessmentBeenReviewed','TEXT',1,'N','drugProducts$.productDevices$.riskAssessmentBeenReviewed','lbl.riskAssessmentAdequate','{"renderAs":"bool-switch","fieldWidth":"1","columnWidth":"20ch","allowSorting":true}',                                  'Risk assessment still adequate'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625087','ROOT_CAUSE_CONFIRMED','isRouteCauseConfirmed',  'isRouteCauseConfirmed',  'TEXT',1,  'N','drugProducts$.productDevices$.isRouteCauseConfirmed',  'lbl.rootCauseConfirmed',     '{"renderAs":"bool-switch","fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',                                      'Root cause confirmed')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;

-- â”€â”€ Nomenclature and component â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO TABLE_COLUMN_METADATA (ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','625','625052','NOMENCLATURE_CODE',       'nomenClatureCode',       'nomenClatureCode',       'TEXT',300,'N','drugProducts$.productDevices$.nomenClatureCode',       'lbl.nomenclatureCode',       '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'Nomenclature code'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625053','NOMENCLATURE_SYSTEM',     'nomenClatureSystem',     'nomenClatureSystem',     'TEXT',50, 'N','drugProducts$.productDevices$.nomenClatureSystem',     'lbl.nomenclatureSystem',     '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',                                          'Nomenclature system'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625054','NOMENCLATURE_TEXT',       'nomenClatureText',       'nomenClatureText',       'TEXT',300,'N','drugProducts$.productDevices$.nomenClatureText',       'lbl.nomenclatureText',       '{"renderAs":"textarea","fieldWidth":"3","columnWidth":"28ch","allowSorting":false}',                                        'Nomenclature text and intended use'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625019','DEVICE_COMPONENT_NAME',   'deviceComponentName',    'deviceComponentName',    'TEXT',50, 'N','drugProducts$.productDevices$.deviceComponentName',    'lbl.deviceComponentName',    '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"18ch","allowSorting":true}',                                          'Device component name'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625020','DEVICE_COMPONENT_TERMID', 'deviceComponentTermID',  'deviceComponentTermID',  'TEXT',50, 'N','drugProducts$.productDevices$.deviceComponentTermID',  'lbl.deviceComponentTermId',  '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',                                          'Device component TermID'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625021','DEVICE_COMPONENT_TERMID_VER','deviceComponentTermIDversion','deviceComponentTermIDversion','TEXT',50,'N','drugProducts$.productDevices$.deviceComponentTermIDversion','lbl.deviceComponentTermIdVer','{"renderAs":"text","fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',                                  'Device component TermID version'),
-- â”€â”€ Facility / reporting â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
(gen_random_uuid()::VARCHAR,'ICSR','625','625009','COMPETENT_AUTHORITY_NAME',    'cuNameforCompAuth',      'cuNameforCompAuth',      'TEXT',300,'N','drugProducts$.productDevices$.cuNameforCompAuth',      'lbl.competentAuthority',     '{"renderAs":"text",  "fieldWidth":"2","columnWidth":"20ch","allowSorting":true}',                                          'Competent authority name'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625048','NCA_LOCAL_REF_NUM',       'ncaLocalReferenceumber', 'ncaLocalReferenceumber', 'TEXT',300,'N','drugProducts$.productDevices$.ncaLocalReferenceumber', 'lbl.ncaLocalRefNum',         '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',                                          'NCA local FSCA reference number'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625049','NCA_FSCA_REF_NUM',        'ncafscaRefNumber',       'ncafscaRefNumber',       'TEXT',300,'N','drugProducts$.productDevices$.ncafscaRefNumber',       'lbl.ncaFscaRefNum',          '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',                                          'NCA local reference number'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625046','MFR_NUMBER',              'mfrNumber',              'mfrNumber',              'TEXT',300,'N','drugProducts$.productDevices$.mfrNumber',              'lbl.mfrNumber',              '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'MFR number'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625069','REPORT_SENT_TO_FDA',      'reportSentToFda',        'reportSentToFda',        'TEXT',1,  'N','drugProducts$.productDevices$.reportSentToFda',        'lbl.reportSentToFda',        '{"renderAs":"bool-switch","fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',                                      'Report sent to FDA'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625034','REPORT_SENT_FDA_DATE',    'reportSentFdaDate',      'reportSentFdaDate',      'DATE',NULL,'N','drugProducts$.productDevices$.reportSentFdaDate',      'lbl.reportSentFdaDate',      '{"renderAs":"date",  "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                          'FDA report sent date'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625070','REPORT_SENT_TO_MANUF',    'reportSentToManuf',      'reportSentToManuf',      'TEXT',1,  'N','drugProducts$.productDevices$.reportSentToManuf',      'lbl.reportSentToManuf',      '{"renderAs":"bool-switch","fieldWidth":"1","columnWidth":"18ch","allowSorting":true}',                                      'Report sent to manufacturer'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625045','REPORT_SENT_MANUF_DATE',  'reportSentManufDate',    'reportSentManufDate',    'DATE',NULL,'N','drugProducts$.productDevices$.reportSentManufDate',    'lbl.reportSentManufDate',    '{"renderAs":"date",  "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                          'Manufacturer report sent date'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625072','RESPONSE_TO_AUTHORITY_REQD','followUpResponseToFda', 'followUpResponseToFda',  'TEXT',1,  'N','drugProducts$.productDevices$.followUpResponseToFda',  'lbl.responseToAuthorityReqd','{"renderAs":"bool-switch","fieldWidth":"1","columnWidth":"20ch","allowSorting":true}',                                      'Response to authority required'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625078','USER_FACILITY','userFacilityOrImporter','userFacilityOrImporter', 'TEXT',300,'N','drugProducts$.productDevices$.userFacilityOrImporter', 'lbl.userFacility',           '{"renderAs":"text",  "fieldWidth":"2","columnWidth":"20ch","allowSorting":true}',                                          'User facility'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625079','USER_FACILITY_REPORT_NO','ufOrImporterReportNo',   'ufOrImporterReportNo',   'TEXT',300,'N','drugProducts$.productDevices$.ufOrImporterReportNo',   'lbl.ufImporterReportNo',     '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',                                          'User facility/importer report number'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625041','IMPORTER',             'ufImporter',             'ufImporter',             'TEXT',300,'N','drugProducts$.productDevices$.ufImporter',             'lbl.importer',               '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'Importer'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625071','REPROCESSOR_UNIT', 'deviceReprocessorUnit',  'deviceReprocessorUnit',  'TEXT',300,'N','drugProducts$.productDevices$.deviceReprocessorUnit',  'lbl.reprocessorUnit',        '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',                                          'Reprocessor unit'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625082','OTHER_PLEASE_SPECIFY',    'otherPleaseSpecify',     'otherPleaseSpecify',     'TEXT',300,'N','drugProducts$.productDevices$.otherPleaseSpecify',     'lbl.specifyCompanyUnit',     '{"renderAs":"text",  "fieldWidth":"2","columnWidth":"20ch","allowSorting":false}',                                         'Please specify company unit'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625081','DEVICE_TYPE',             'deviceType',             'deviceType',             'TEXT',300,'N','drugProducts$.productDevices$.deviceType',             'lbl.deviceType',             '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'Device type'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625051','NO_OF_EVENTS_SUMMARIZED', 'noOfEventsSummarized',   'noOfEventsSummarized',   'TEXT',300,'N','drugProducts$.productDevices$.noOfEventsSummarized',   'lbl.noOfEventsSummarized',   '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'Number of events summarized'),
-- â”€â”€ Follow-up flags â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
(gen_random_uuid()::VARCHAR,'ICSR','625','625001','FOLLOW_UP_ADDITIONAL_INFO',      'followUpAddInfo',        'followUpAddInfo',        'TEXT',1,  'N','drugProducts$.productDevices$.followUpAddInfo',        'lbl.followUpAddInfo',        '{"renderAs":"bool-switch","fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                      'Follow-up additional info flag'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625010','FOLLOW_UP_CORRECTION',    'followUpCorrection',     'followUpCorrection',     'TEXT',1,  'N','drugProducts$.productDevices$.followUpCorrection',     'lbl.followUpCorrection',     '{"renderAs":"bool-switch","fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                      'Follow-up correction flag'),
(gen_random_uuid()::VARCHAR,'ICSR','625','625023','FOLLOW_UP_DEVICE_EVALUATION','followUpDeviceEvaluation','followUpDeviceEvaluation','TEXT',1,'N','drugProducts$.productDevices$.followUpDeviceEvaluation','lbl.followUpDeviceEval',  '{"renderAs":"bool-switch","fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',                                      'Follow-up device evaluation flag')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;


-- ── 02_DB_METADATA_627.sql ──
-- ============================================================
-- Script  : 02_DB_METADATA_627.sql â€” ICSR_DEVICE_MANUFACTURERS (third-level multi-context)
-- Device manufacturer details
-- FK: DEVICE_ID â†’ ICSR_PRODUCT_DEVICES(ID)
-- Reused: COUNTRY
-- ============================================================


INSERT INTO TABLE_METADATA (ID, MODULE_ID, TABLE_ID, PARENT_TABLE_ID, DB_TABLE_NAME, CONTEXT_NAME, MULTI_CONTEXT, JOIN_COLUMN, REF_JOIN_COLUMN, CONTEXT_PATH) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','627','625','ICSR_DEVICE_MANUFACTURERS','deviceManufacturerers','Y','DEVICE_ID','ID','drugProducts$.productDevices$.deviceManufacturerers$')
ON CONFLICT (MODULE_ID, TABLE_ID) DO NOTHING;

INSERT INTO TABLE_COLUMN_METADATA (ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','627','627005','MANUFACTURER_AS_REPORTED','manufacturerAsReported','manufacturerAsReported','TEXT',300,'N','drugProducts$.productDevices$.deviceManufacturerers$.manufacturerAsReported','lbl.manufacturerAsReported','{"renderAs":"text",  "fieldWidth":"2","columnWidth":"22ch","allowSorting":true}',                                          'Manufacturer name as reported'),
(gen_random_uuid()::VARCHAR,'ICSR','627','627004','MANUFACTURER_AS_CODED',  'manufacturerAsCoded',  'manufacturerAsCoded',  'TEXT',300,'N','drugProducts$.productDevices$.deviceManufacturerers$.manufacturerAsCoded',  'lbl.manufacturerAsCoded',  '{"renderAs":"text",  "fieldWidth":"2","columnWidth":"22ch","allowSorting":true}',                                          'Manufacturer name as coded'),
(gen_random_uuid()::VARCHAR,'ICSR','627','627003','MANUFACTURER_ADDRESS',   'manufacturerAddress',  'manufacturerAddress',  'TEXT',300,'N','drugProducts$.productDevices$.deviceManufacturerers$.manufacturerAddress',  'lbl.manufacturerAddress',  '{"renderAs":"textarea","fieldWidth":"3","columnWidth":"28ch","allowSorting":false}',                                        'Manufacturer address'),
(gen_random_uuid()::VARCHAR,'ICSR','627','627001','CITY',                   'city',                 'city',                 'TEXT',300,'N','drugProducts$.productDevices$.deviceManufacturerers$.city',                 'lbl.manufacturerCity',     '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'Manufacturer city'),
(gen_random_uuid()::VARCHAR,'ICSR','627','627006','STATE',                  'state',                'state',                'TEXT',300,'N','drugProducts$.productDevices$.deviceManufacturerers$.state',                'lbl.manufacturerState',    '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'Manufacturer state'),
(gen_random_uuid()::VARCHAR,'ICSR','627','627002','COUNTRY',                'country',              'country',              'TEXT',50, 'N','drugProducts$.productDevices$.deviceManufacturerers$.country',              'lbl.manufacturerCountry',  '{"renderAs":"combo", "fieldWidth":"1","columnWidth":"14ch","allowSorting":true, "codelist":"COUNTRY"}','Manufacturer country')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;


-- ── 02_DB_METADATA_628.sql ──
-- ============================================================
-- Script  : 02_DB_METADATA_628.sql â€” ICSR_DEVICE_PROBLEM_EVALUATIONS (third-level multi-context)
-- Device problem evaluation type/value pairs
-- FK: DEVICE_ID â†’ ICSR_PRODUCT_DEVICES(ID)
-- ============================================================


INSERT INTO TABLE_METADATA (ID, MODULE_ID, TABLE_ID, PARENT_TABLE_ID, DB_TABLE_NAME, CONTEXT_NAME, MULTI_CONTEXT, JOIN_COLUMN, REF_JOIN_COLUMN, CONTEXT_PATH) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','628','625','ICSR_DEVICE_PROBLEM_EVALUATIONS','deviceProblemEvaluationCollection','Y','DEVICE_ID','ID','drugProducts$.productDevices$.deviceProblemEvaluationCollection$')
ON CONFLICT (MODULE_ID, TABLE_ID) DO NOTHING;

INSERT INTO TABLE_COLUMN_METADATA (ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','628','628001','EVALUATION_TYPE',  'evaluationType',  'evaluationType',  'TEXT',50, 'N','drugProducts$.productDevices$.deviceProblemEvaluationCollection$.evaluationType',  'lbl.evaluationType',  '{"renderAs":"text","fieldWidth":"2","columnWidth":"20ch","allowSorting":true}',  'Device problem evaluation type'),
(gen_random_uuid()::VARCHAR,'ICSR','628','629002','EVALUATION_VALUE', 'evaluationValue', 'evaluationValue', 'TEXT',300,'N','drugProducts$.productDevices$.deviceProblemEvaluationCollection$.evaluationValue', 'lbl.evaluationValue', '{"renderAs":"text","fieldWidth":"2","columnWidth":"22ch","allowSorting":false}', 'Device problem evaluation value')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;


-- ── 02_DB_METADATA_629.sql ──
-- ============================================================
-- Script  : 02_DB_METADATA_629.sql â€” ICSR_DEVICE_IMDRF_EVALUATIONS (third-level multi-context)
-- IMDRF-coded device problem evaluations (Annex A-D, G)
-- FK: DEVICE_ID â†’ ICSR_PRODUCT_DEVICES(ID)
-- ============================================================


INSERT INTO TABLE_METADATA (ID, MODULE_ID, TABLE_ID, PARENT_TABLE_ID, DB_TABLE_NAME, CONTEXT_NAME, MULTI_CONTEXT, JOIN_COLUMN, REF_JOIN_COLUMN, CONTEXT_PATH) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','629','625','ICSR_DEVICE_IMDRF_EVALUATIONS','deviceProblemEvaluationIMDRFCollection','Y','DEVICE_ID','ID','drugProducts$.productDevices$.deviceProblemEvaluationIMDRFCollection$')
ON CONFLICT (MODULE_ID, TABLE_ID) DO NOTHING;

INSERT INTO TABLE_COLUMN_METADATA (ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','629','629005','EVALUATION_TYPE_IMDRF_1','evaluationTypeImdrf1','evaluationTypeImdrf1','TEXT',300,'N','drugProducts$.productDevices$.deviceProblemEvaluationIMDRFCollection$.evaluationTypeImdrf1','lbl.imdrfAnnexA','{"renderAs":"text","fieldWidth":"3","columnWidth":"28ch","allowSorting":false}','Medical Device Problem â€” Annex A'),
(gen_random_uuid()::VARCHAR,'ICSR','629','629006','EVALUATION_TYPE_IMDRF_2','evaluationTypeImdrf2','evaluationTypeImdrf2','TEXT',300,'N','drugProducts$.productDevices$.deviceProblemEvaluationIMDRFCollection$.evaluationTypeImdrf2','lbl.imdrfAnnexB','{"renderAs":"text","fieldWidth":"3","columnWidth":"28ch","allowSorting":false}','Type of Investigation â€” Annex B'),
(gen_random_uuid()::VARCHAR,'ICSR','629','629007','EVALUATION_TYPE_IMDRF_3','evaluationTypeImdrf3','evaluationTypeImdrf3','TEXT',300,'N','drugProducts$.productDevices$.deviceProblemEvaluationIMDRFCollection$.evaluationTypeImdrf3','lbl.imdrfAnnexC','{"renderAs":"text","fieldWidth":"3","columnWidth":"28ch","allowSorting":false}','Investigation Findings â€” Annex C'),
(gen_random_uuid()::VARCHAR,'ICSR','629','629008','EVALUATION_TYPE_IMDRF_4','evaluationTypeImdrf4','evaluationTypeImdrf4','TEXT',300,'N','drugProducts$.productDevices$.deviceProblemEvaluationIMDRFCollection$.evaluationTypeImdrf4','lbl.imdrfAnnexD','{"renderAs":"text","fieldWidth":"3","columnWidth":"28ch","allowSorting":false}','Investigation Conclusion â€” Annex D'),
(gen_random_uuid()::VARCHAR,'ICSR','629','629009','EVALUATION_TYPE_IMDRF_5','evaluationTypeImdrf5','evaluationTypeImdrf5','TEXT',300,'N','drugProducts$.productDevices$.deviceProblemEvaluationIMDRFCollection$.evaluationTypeImdrf5','lbl.imdrfAnnexG','{"renderAs":"text","fieldWidth":"3","columnWidth":"28ch","allowSorting":false}','Medical Device Component â€” Annex G')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;


-- ── 02_DB_METADATA_630.sql ──
-- ============================================================
-- Script  : 02_DB_METADATA_630.sql â€” ICSR_DRUG_APPROVALS (second-level multi-context)
-- R2: B.4.k.2.2 / R3: G.k.3 â€” Drug authorization / approval per country
-- FK: DRUG_ID â†’ ICSR_DRUG_PRODUCTS(ID)
-- Reused: COUNTRY, PRODUCT_FLAG, ICSR_APPROVAL_TYPE, ICSR_DEVICE_CLASS
-- ============================================================


INSERT INTO TABLE_METADATA (ID, MODULE_ID, TABLE_ID, PARENT_TABLE_ID, DB_TABLE_NAME, CONTEXT_NAME, MULTI_CONTEXT, JOIN_COLUMN, REF_JOIN_COLUMN, CONTEXT_PATH) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','630','610','ICSR_DRUG_APPROVALS','drugApprovalCollection','Y','DRUG_ID','ID','drugProducts$.drugApprovalCollection$')
ON CONFLICT (MODULE_ID, TABLE_ID) DO NOTHING;

INSERT INTO TABLE_COLUMN_METADATA (ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','630','630006','AUTHORIZATION_NUMBER',   'approvalNo',              'approvalNo',              'TEXT',300,'N','drugProducts$.drugApprovalCollection$.approvalNo',              'lbl.authorizationNumber',    '{"renderAs":"text",  "fieldWidth":"2","columnWidth":"20ch","allowSorting":true}',                                          'R2:B.4.k.2.2 / R3:G.k.3.1 â€” Authorization number'),
(gen_random_uuid()::VARCHAR,'ICSR','630','630004','AUTHORIZATION_TYPE',   'approvalType',            'approvalType',            'TEXT',50, 'N','drugProducts$.drugApprovalCollection$.approvalType',            'lbl.authorizationType',      '{"renderAs":"combo", "fieldWidth":"1","columnWidth":"18ch","allowSorting":true, "codelist":"ICSR_APPROVAL_TYPE"}',         'R2:B.4.k.2.2 / R3:G.k.3.2 â€” Authorization type'),
(gen_random_uuid()::VARCHAR,'ICSR','630','630005','AUTHORIZATION_COUNTRY','approvalCoutry',          'approvalCoutry',          'TEXT',50, 'N','drugProducts$.drugApprovalCollection$.approvalCoutry',          'lbl.authorizationCountry',   '{"renderAs":"combo", "fieldWidth":"1","columnWidth":"14ch","allowSorting":true, "codelist":"COUNTRY"}',                    'R2:B.4.k.2.2 / R3:G.k.3.3 â€” Authorization country'),
(gen_random_uuid()::VARCHAR,'ICSR','630','630026','TRADE_NAME',              'tradeName',               'tradeName',               'TEXT',300,'N','drugProducts$.drugApprovalCollection$.tradeName',               'lbl.tradeBrandName',         '{"renderAs":"text",  "fieldWidth":"2","columnWidth":"20ch","allowSorting":true}',                                          'Trade/brand name'),
(gen_random_uuid()::VARCHAR,'ICSR','630','630019','MAH_AS_REPORTED', 'mahAsReported',           'mahAsReported',           'TEXT',300,'N','drugProducts$.drugApprovalCollection$.mahAsReported',           'lbl.mahAsReported',          '{"renderAs":"text",  "fieldWidth":"2","columnWidth":"20ch","allowSorting":true}',                                          'MAH as reported'),
(gen_random_uuid()::VARCHAR,'ICSR','630','630018','MAH_AS_CODED',            'mahAsCoded',              'mahAsCoded',              'TEXT',300,'N','drugProducts$.drugApprovalCollection$.mahAsCoded',              'lbl.mahAsCoded',             '{"renderAs":"text",  "fieldWidth":"2","columnWidth":"20ch","allowSorting":true}',                                          'MAH as coded'),
(gen_random_uuid()::VARCHAR,'ICSR','630','630025','SUBSTANCE_NAME','substanceName',          'substanceName',           'TEXT',300,'N','drugProducts$.drugApprovalCollection$.substanceName',           'lbl.substanceNameApproval',  '{"renderAs":"text",  "fieldWidth":"2","columnWidth":"20ch","allowSorting":true}',                                          'Substance name (approval)'),
(gen_random_uuid()::VARCHAR,'ICSR','630','630024','PRODUCT_TYPE',            'productType',             'productType',             'TEXT',50, 'N','drugProducts$.drugApprovalCollection$.productType',             'lbl.productFlagApproval',    '{"renderAs":"combo", "fieldWidth":"1","columnWidth":"14ch","allowSorting":true, "codelist":"PRODUCT_FLAG"}',               'Product flag (approval)'),
(gen_random_uuid()::VARCHAR,'ICSR','630','630029','WHODD_MPID',              'whoddMPID',               'whoddMPID',               'TEXT',300,'N','drugProducts$.drugApprovalCollection$.whoddMPID',               'lbl.whoddMpid',              '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'WHO DD MPID'),
(gen_random_uuid()::VARCHAR,'ICSR','630','630007','DEVICE_CLASS',            'deviceClass',             'deviceClass',             'TEXT',50, 'N','drugProducts$.drugApprovalCollection$.deviceClass',             'lbl.deviceClass',            '{"renderAs":"combo", "fieldWidth":"1","columnWidth":"12ch","allowSorting":true, "codelist":"ICSR_DEVICE_CLASS"}',          'Class of device'),
(gen_random_uuid()::VARCHAR,'ICSR','630','630011','DEVICE_DEMOGRAPHIC','demographicForWhichTheDeviceWasDesigned','demographicForWhichTheDeviceWasDesigned','TEXT',50,'N','drugProducts$.drugApprovalCollection$.demographicForWhichTheDeviceWasDesigned','lbl.deviceDemographic','{"renderAs":"combo","fieldWidth":"1","columnWidth":"16ch","allowSorting":true, "codelist":"ICSR_DEVICE_DEMOGRAPHIC"}','Demographic for which device was designed'),
(gen_random_uuid()::VARCHAR,'ICSR','630','630013','DEVICE_MARKETED_BEFORE',  'deviceMarketedBefore',    'deviceMarketedBefore',    'TEXT',1,  'N','drugProducts$.drugApprovalCollection$.deviceMarketedBefore',    'lbl.deviceMarketedBefore',   '{"renderAs":"bool-switch","fieldWidth":"1","columnWidth":"20ch","allowSorting":true}',                                      'Device marketed before MDD/AIMDD/IVDD'),
(gen_random_uuid()::VARCHAR,'ICSR','630','630015','NOTIFIED_BODY_IDENT_NO',  'notifiedBodyIdentNo',     'notifiedBodyIdentNo',     'TEXT',300,'N','drugProducts$.drugApprovalCollection$.notifiedBodyIdentNo',     'lbl.notifiedBodyIdentNo',    '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',                                          'Identification number of notified body'),
(gen_random_uuid()::VARCHAR,'ICSR','630','630022','NOTIFIED_CERTIFICATE_NO', 'notifiedBodyCertificateNo','notifiedBodyCertificateNo','TEXT',300,'N','drugProducts$.drugApprovalCollection$.notifiedBodyCertificateNo','lbl.notifiedCertificateNo', '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',                                          'Notified body certificate number'),
(gen_random_uuid()::VARCHAR,'ICSR','630','630014','HC_ID_NUMBER',            'hcIdNumber',              'hcIdNumber',              'TEXT',300,'N','drugProducts$.drugApprovalCollection$.hcIdNumber',              'lbl.hcIdNumber',             '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'Health Canada ID number'),
(gen_random_uuid()::VARCHAR,'ICSR','630','630021','DEVICE_MARKET_MONTHS',        'devMarketMonths',         'devMarketMonths',         'TEXT',300,'N','drugProducts$.drugApprovalCollection$.devMarketMonths',         'lbl.devMarketMonths',        '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"10ch","allowSorting":true}',                                          'Device market months'),
(gen_random_uuid()::VARCHAR,'ICSR','630','630030','DEVICE_MARKET_YEARS',         'devMarketYears',          'devMarketYears',          'TEXT',300,'N','drugProducts$.drugApprovalCollection$.devMarketYears',          'lbl.devMarketYears',         '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"10ch","allowSorting":true}',                                          'Device market years')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;


-- ── 02_DB_METADATA_635.sql ──
-- ============================================================
-- Script  : 02_DB_METADATA_635.sql â€” ICSR_DRUG_REACTION_RELATEDNESS (second-level multi-context)
-- R2: B.4.k.17-18 / R3: G.k.9 â€” Drug-reaction relatedness assessment
-- FK: DRUG_ID â†’ ICSR_DRUG_PRODUCTS(ID)
-- Reused: ICSR_ACTION_DRUG, ICSR_DECHALLENGE, ICSR_RECHALLENGE,
--         ICSR_CAUSALITY, ICSR_REACT_OUTCOME, ICSR_DURATION_UNIT
-- ============================================================


INSERT INTO TABLE_METADATA (ID, MODULE_ID, TABLE_ID, PARENT_TABLE_ID, DB_TABLE_NAME, CONTEXT_NAME, MULTI_CONTEXT, JOIN_COLUMN, REF_JOIN_COLUMN, CONTEXT_PATH) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','635','610','ICSR_DRUG_REACTION_RELATEDNESS','drugReactionRelatednes','Y','DRUG_ID','ID','drugProducts$.drugReactionRelatednes$')
ON CONFLICT (MODULE_ID, TABLE_ID) DO NOTHING;

INSERT INTO TABLE_COLUMN_METADATA (ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','635','635004','REACTION_NAME',           'reactionName',           'reactionName',           'TEXT',300,'N','drugProducts$.drugReactionRelatednes$.reactionName',           'lbl.reactionName',           '{"renderAs":"text",  "fieldWidth":"2","columnWidth":"22ch","allowSorting":true}',                                          'Reported reaction term'),
(gen_random_uuid()::VARCHAR,'ICSR','635','635002','FK_AR_REC_ID',            'reaction',               'reaction',               'TEXT',300,'N','drugProducts$.drugReactionRelatednes$.reaction',               'lbl.reactionRecordId',       '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'Event reaction record ID (FK to event reactions)'),
(gen_random_uuid()::VARCHAR,'ICSR','635','635018','DRUG_REACT_ASSESS_TERM',          'drugReactAssesMeddraCode','drugReactAssesMeddraCode','TEXT',50, 'N','drugProducts$.drugReactionRelatednes$.drugReactAssesMeddraCode','lbl.drugReactAssessTerm',   '{"renderAs":"text",  "fieldWidth":"2","columnWidth":"20ch","allowSorting":true}',                                          'Reported term for drug-reaction assessment'),
(gen_random_uuid()::VARCHAR,'ICSR','635','635005','ACTION_DRUG',              'actionDug',              'actionDug',              'TEXT',50, 'N','drugProducts$.drugReactionRelatednes$.actionDug',              'lbl.actionDrug',             '{"renderAs":"combo", "fieldWidth":"1","columnWidth":"18ch","allowSorting":true, "codelist":"ICSR_ACTION_DRUG"}',           'R2:B.4.k.7 / R3:G.k.8 â€” Action taken with drug'),
(gen_random_uuid()::VARCHAR,'ICSR','635','635010','DECHALLENGE',             'deChallenge',            'deChallenge',            'TEXT',50, 'N','drugProducts$.drugReactionRelatednes$.deChallenge',            'lbl.dechallenge',            '{"renderAs":"combo", "fieldWidth":"1","columnWidth":"18ch","allowSorting":true, "codelist":"ICSR_DECHALLENGE"}',           'R2:B.4.k.15 / R3:G.k.9.i.3 â€” Dechallenge result'),
(gen_random_uuid()::VARCHAR,'ICSR','635','635017','RECHALLENGE',             'reChallenge',            'reChallenge',            'TEXT',50, 'N','drugProducts$.drugReactionRelatednes$.reChallenge',            'lbl.rechallenge',            '{"renderAs":"combo", "fieldWidth":"1","columnWidth":"18ch","allowSorting":true, "codelist":"ICSR_RECHALLENGE"}',           'R2:B.4.k.16 / R3:G.k.9.i.4 â€” Rechallenge result'),
(gen_random_uuid()::VARCHAR,'ICSR','635','635008','COMPANY_CAUSALITY',       'companyCausality',       'companyCausality',       'TEXT',50, 'N','drugProducts$.drugReactionRelatednes$.companyCausality',       'lbl.companyCausality',       '{"renderAs":"combo", "fieldWidth":"1","columnWidth":"18ch","allowSorting":true, "codelist":"ICSR_CAUSALITY"}',             'R2:B.4.k.17 / R3:G.k.9.i.1 â€” Company causality assessment'),
(gen_random_uuid()::VARCHAR,'ICSR','635','635019','REPORTER_CAUSALITY',      'reporterCausality',      'reporterCausality',      'TEXT',50, 'N','drugProducts$.drugReactionRelatednes$.reporterCausality',      'lbl.reporterCausality',      '{"renderAs":"combo", "fieldWidth":"1","columnWidth":"18ch","allowSorting":true, "codelist":"ICSR_CAUSALITY"}',             'R2:B.4.k.18 / R3:G.k.9.i.2 â€” Reporter causality assessment'),
(gen_random_uuid()::VARCHAR,'ICSR','635','635015','OUTCOME_AFTER_CHANGE',    'outcomeAfterChange',     'outcomeAfterChange',     'TEXT',50, 'N','drugProducts$.drugReactionRelatednes$.outcomeAfterChange',     'lbl.outcomeAfterChange',     '{"renderAs":"combo", "fieldWidth":"1","columnWidth":"20ch","allowSorting":true, "codelist":"ICSR_REACT_OUTCOME"}',         'Outcome after drug action change'),
(gen_random_uuid()::VARCHAR,'ICSR','635','635022','DRUG_START_LATENCY',        'drugStartLatency',       'drugStartLatency',       'TEXT',300,'N','drugProducts$.drugReactionRelatednes$.drugStartLatency',       'lbl.drugStartLatency',       '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"10ch","allowSorting":true}',                                          'Start latency'),
(gen_random_uuid()::VARCHAR,'ICSR','635','635023','DRUG_START_LATENCY_UNIT',    'drugStartLatencyUnit',   'drugStartLatencyUnit',   'TEXT',50, 'N','drugProducts$.drugReactionRelatednes$.drugStartLatencyUnit',   'lbl.drugStartLatencyUnit',   '{"renderAs":"combo", "fieldWidth":"1","columnWidth":"12ch","allowSorting":true, "codelist":"ICSR_DURATION_UNIT"}',         'Start latency unit'),
(gen_random_uuid()::VARCHAR,'ICSR','635','635012','DRUG_END_LATENCY',          'drugEndLatency',         'drugEndLatency',         'TEXT',300,'N','drugProducts$.drugReactionRelatednes$.drugEndLatency',         'lbl.drugEndLatency',         '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"10ch","allowSorting":true}',                                          'End latency'),
(gen_random_uuid()::VARCHAR,'ICSR','635','635013','DRUG_END_LATENCY_UNIT',      'drugEndLatencyUnit',     'drugEndLatencyUnit',     'TEXT',50, 'N','drugProducts$.drugReactionRelatednes$.drugEndLatencyUnit',     'lbl.drugEndLatencyUnit',     '{"renderAs":"combo", "fieldWidth":"1","columnWidth":"12ch","allowSorting":true, "codelist":"ICSR_DURATION_UNIT"}',         'End latency unit'),
(gen_random_uuid()::VARCHAR,'ICSR','635','635006','IS_AESI',                  'isAesi',                 'isAesi',                 'TEXT',1,  'N','drugProducts$.drugReactionRelatednes$.isAesi',                 'lbl.isAesi',                 '{"renderAs":"bool-switch","fieldWidth":"1","columnWidth":"10ch","allowSorting":true}',                                      'AESI flag'),
(gen_random_uuid()::VARCHAR,'ICSR','635','635007','ASSESS_RELATIONSHIP',     'accessRelationShip',     'accessRelationShip',     'TEXT',1,  'N','drugProducts$.drugReactionRelatednes$.accessRelationShip',     'lbl.assessRelationship',     '{"renderAs":"bool-switch","fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',                                      'Assess relationship flag'),
(gen_random_uuid()::VARCHAR,'ICSR','635','635001','ASSESS_RELATIONSHIP_MANUAL','accessReletionshipManual','accessReletionshipManual','TEXT',1,'N','drugProducts$.drugReactionRelatednes$.accessReletionshipManual','lbl.assessRelationshipManual','{"renderAs":"bool-switch","fieldWidth":"1","columnWidth":"18ch","allowSorting":true}',                                   'Assess relationship (manual) flag'),
(gen_random_uuid()::VARCHAR,'ICSR','635','635003','COMPANY_CAUSALITY_MANUAL','companyCausalityManual', 'companyCausalityManual', 'TEXT',1,  'N','drugProducts$.drugReactionRelatednes$.companyCausalityManual', 'lbl.companyCausalityManual', '{"renderAs":"bool-switch","fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',                                      'Company causality (manual) flag'),
(gen_random_uuid()::VARCHAR,'ICSR','635','635009','COMPANY_CAUSALITY_PROCEDURE','companyCausalityProcedure','companyCausalityProcedure','TEXT',50,'N','drugProducts$.drugReactionRelatednes$.companyCausalityProcedure','lbl.companyCausalityProc','{"renderAs":"combo","fieldWidth":"1","columnWidth":"18ch","allowSorting":true, "codelist":"ICSR_CAUSALITY"}',          'Company causality procedure'),
(gen_random_uuid()::VARCHAR,'ICSR','635','635020','REPORTER_CAUSALITY_PROCEDURE','reporterCausalityProcedure','reporterCausalityProcedure','TEXT',50,'N','drugProducts$.drugReactionRelatednes$.reporterCausalityProcedure','lbl.reporterCausalityProc','{"renderAs":"combo","fieldWidth":"1","columnWidth":"18ch","allowSorting":true, "codelist":"ICSR_CAUSALITY"}',     'Reporter causality procedure'),
(gen_random_uuid()::VARCHAR,'ICSR','635','635016','PROCEDURE_COMMENTS',      'procedureComments',      'procedureComments',      'TEXT',300,'N','drugProducts$.drugReactionRelatednes$.procedureComments',      'lbl.procedureComments',      '{"renderAs":"textarea","fieldWidth":"3","columnWidth":"28ch","allowSorting":false}',                                        'Procedure comments'),
(gen_random_uuid()::VARCHAR,'ICSR','635','635014','FOLLOW_UP',               'followUp',               'followUp',               'TEXT',1,  'N','drugProducts$.drugReactionRelatednes$.followUp',               'lbl.relatednessFollowUp',    '{"renderAs":"bool-switch","fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                      'Follow-up expected'),
(gen_random_uuid()::VARCHAR,'ICSR','635','635024','TEMPORAL_ASSOCIATION',        'tempAssociation',        'tempAssociation',        'TEXT',1,  'N','drugProducts$.drugReactionRelatednes$.tempAssociation',        'lbl.temporalAssociation',    '{"renderAs":"bool-switch","fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',                                      'Temporal association flag'),
(gen_random_uuid()::VARCHAR,'ICSR','635','635011','END_LATENCY_MANUAL',      'endLatencyManual',       'endLatencyManual',       'TEXT',1,  'N','drugProducts$.drugReactionRelatednes$.endLatencyManual',       'lbl.endLatencyManual',       '{"renderAs":"bool-switch","fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                      'End latency (manual) flag'),
(gen_random_uuid()::VARCHAR,'ICSR','635','635021','START_LATENCY_MANUAL',    'startLatencyManual',     'startLatencyManual',     'TEXT',1,  'N','drugProducts$.drugReactionRelatednes$.startLatencyManual',     'lbl.startLatencyManual',     '{"renderAs":"bool-switch","fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                      'Start latency (manual) flag')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;


-- ── 02_DB_METADATA_636.sql ──
-- ============================================================
-- Script  : 02_DB_METADATA_636.sql â€” ICSR_DRUG_REACTION_LABELLINGS (third-level multi-context)
-- R2: B.4.k.17.1 / R3: G.k.9.i.1 â€” Labelling per country
-- FK: RELATEDNESS_ID â†’ ICSR_DRUG_REACTION_RELATEDNESS(ID)
-- Reused: COUNTRY, ICSR_LABELLING
-- ============================================================


INSERT INTO TABLE_METADATA (ID, MODULE_ID, TABLE_ID, PARENT_TABLE_ID, DB_TABLE_NAME, CONTEXT_NAME, MULTI_CONTEXT, JOIN_COLUMN, REF_JOIN_COLUMN, CONTEXT_PATH) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','636','635','ICSR_DRUG_REACTION_LABELLINGS','drugReactionLabellings','Y','RELATEDNESS_ID','ID','drugProducts$.drugReactionRelatednes$.drugReactionLabellings$')
ON CONFLICT (MODULE_ID, TABLE_ID) DO NOTHING;

INSERT INTO TABLE_COLUMN_METADATA (ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','636','636002','COUNTRY',           'country',            'country',            'TEXT',50, 'N','drugProducts$.drugReactionRelatednes$.drugReactionLabellings$.country',           'lbl.labellingCountry',   '{"renderAs":"combo", "fieldWidth":"1","columnWidth":"14ch","allowSorting":true, "codelist":"COUNTRY"}','R2:B.4.k.17.1 â€” Labelling country'),
(gen_random_uuid()::VARCHAR,'ICSR','636','636003','LABELLING_STATUS',         'listed',             'listed',             'TEXT',50, 'N','drugProducts$.drugReactionRelatednes$.drugReactionLabellings$.listed',           'lbl.labelling',          '{"renderAs":"combo", "fieldWidth":"1","columnWidth":"14ch","allowSorting":true, "codelist":"ICSR_LABELLING"}','R2:B.4.k.17.1 / R3:G.k.9.i.1 â€” Listed/Unlisted'),
(gen_random_uuid()::VARCHAR,'ICSR','636','636004','LABELLING_VERSION', 'labellingVersion',   'labellingVersion',   'TEXT',300,'N','drugProducts$.drugReactionRelatednes$.drugReactionLabellings$.labellingVersion', 'lbl.labellingVersion',   '{"renderAs":"text",  "fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',                                          'Labelling version'),
(gen_random_uuid()::VARCHAR,'ICSR','636','636005','REASON_FOR_LISTEDNESS','reasonForListedness','reasonForListedness','TEXT',300,'N','drugProducts$.drugReactionRelatednes$.drugReactionLabellings$.reasonForListedness','lbl.reasonForListedness','{"renderAs":"textarea","fieldWidth":"3","columnWidth":"28ch","allowSorting":false}',                                       'Reason for listedness'),
(gen_random_uuid()::VARCHAR,'ICSR','636','636006','SUSAR',             'susar',              'susar',              'TEXT',1,  'N','drugProducts$.drugReactionRelatednes$.drugReactionLabellings$.susar',             'lbl.susar',              '{"renderAs":"bool-switch","fieldWidth":"1","columnWidth":"10ch","allowSorting":true}',                                      'SUSAR flag'),
(gen_random_uuid()::VARCHAR,'ICSR','636','636001','LABELLING_MANUAL',            'labelingVersionManual','labelingVersionManual','TEXT',1,'N','drugProducts$.drugReactionRelatednes$.drugReactionLabellings$.labelingVersionManual','lbl.labellingManual',  '{"renderAs":"bool-switch","fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                      'Labelling version (manual) flag')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;


-- ── 02_DB_METADATA_640.sql ──
-- ============================================================
-- Script  : 02_DB_METADATA_640.sql â€” ICSR_LAB_TESTS (first-level multi-context)
-- R2: B.3 / R3: F â€” Lab test results
-- FK: CASE_ID â†’ ICSR_CASES(ID)
-- Reused: ICSR_CODING_TYPE (values: Dictionary/Manual/VTA/Intelligent/Rejected)
-- New: ICSR_LAB_RESULT_CODE, ICSR_LAB_UNIT
-- ============================================================


INSERT INTO TABLE_METADATA (ID, MODULE_ID, TABLE_ID, PARENT_TABLE_ID, DB_TABLE_NAME, CONTEXT_NAME, MULTI_CONTEXT, JOIN_COLUMN, REF_JOIN_COLUMN, CONTEXT_PATH) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','640','500','ICSR_LAB_TESTS','labTests','Y','CASE_ID','ID','labTests$')
ON CONFLICT (MODULE_ID, TABLE_ID) DO NOTHING;

INSERT INTO TABLE_COLUMN_METADATA (ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION) VALUES
-- â”€â”€ Core test identification â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
(gen_random_uuid()::VARCHAR,'ICSR','640','640009','TEST_NAME',           'testName',           'testName',           'TEXT',50, 'N','labTests$.testName',           'lbl.testName',           '{"renderAs":"text",        "fieldWidth":"2","columnWidth":"22ch","allowSorting":true}',                                          'R2:B.3.1.a / R3:F.r.1 â€” Test name (verbatim)'),
(gen_random_uuid()::VARCHAR,'ICSR','640','640010','MEDICAL_EPISODE_LLT_CODE', 'medicalEpisodeMeddraCode','medicalEpisodeMeddraCode','TEXT',300,'N','labTests$.medicalEpisodeMeddraCode','lbl.testMeddraLlt',      '{"renderAs":"text",        "fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',                                          'R2:B.3.1.a / R3:F.r.1a â€” Test name MedDRA LLT code'),
(gen_random_uuid()::VARCHAR,'ICSR','640','640011','TEST_PT_CODE',        'testPTCode',         'testPTCode',         'TEXT',300,'N','labTests$.testPTCode',         'lbl.testMeddraPt',       '{"renderAs":"text",        "fieldWidth":"1","columnWidth":"16ch","allowSorting":true}',                                          'R3:F.r.1b â€” Test name MedDRA PT code'),
(gen_random_uuid()::VARCHAR,'ICSR','640','640008','TEST_DATE',            'testDate',           'testDate',           'TEXT',50, 'N','labTests$.testDate',           'lbl.testDate',           '{"renderAs":"date",        "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                          'R2:B.3.1.b / R3:F.r.2 â€” Test date'),
-- â”€â”€ Test result â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
(gen_random_uuid()::VARCHAR,'ICSR','640','640013','TEST_RESULT_VALUE',   'testResultValue',    'testResultValue',    'TEXT',300,'N','labTests$.testResultValue',    'lbl.testResultValue',    '{"renderAs":"text",        "fieldWidth":"1","columnWidth":"14ch","allowSorting":true}',                                          'R2:B.3.1.c / R3:F.r.3 â€” Test result value (numeric)'),
(gen_random_uuid()::VARCHAR,'ICSR','640','640012','TEST_UNIT',            'testUnit',           'testUnit',           'TEXT',50, 'N','labTests$.testUnit',           'lbl.testUnit',           '{"renderAs":"combo",       "fieldWidth":"1","columnWidth":"12ch","allowSorting":true, "codelist":"ICSR_LAB_UNIT"}',              'R2:B.3.1.d / R3:F.r.3.1 â€” Test result unit'),
(gen_random_uuid()::VARCHAR,'ICSR','640','640014','TEST_RESULT_CODE',    'testResultCode',     'testResultCode',     'TEXT',50, 'N','labTests$.testResultCode',     'lbl.testResultCode',     '{"renderAs":"combo",       "fieldWidth":"1","columnWidth":"14ch","allowSorting":true, "codelist":"ICSR_LAB_RESULT_CODE"}',       'R2:B.3.1.e / R3:F.r.3.2 â€” Test result qualifier code'),
(gen_random_uuid()::VARCHAR,'ICSR','640','640007','TEST_RESULT_TEXT',    'testResultText',     'testResultText',     'TEXT',50, 'N','labTests$.testResultText',     'lbl.testResultText',     '{"renderAs":"text",        "fieldWidth":"2","columnWidth":"20ch","allowSorting":false}',                                         'R2:B.3.1.f / R3:F.r.4 â€” Test result unstructured (free text)'),
-- â”€â”€ Normal range â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
(gen_random_uuid()::VARCHAR,'ICSR','640','640006','LOW_TEST_RANGE',        'lowTestRange',       'lowTestRange',       'TEXT',50, 'N','labTests$.lowTestRange',       'lbl.lowTestRange',       '{"renderAs":"text",        "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                          'R2:B.3.1.g / R3:F.r.5.1 â€” Normal range low value'),
(gen_random_uuid()::VARCHAR,'ICSR','640','640005','HIGH_TEST_RANGE',       'highTestRange',      'highTestRange',      'TEXT',50, 'N','labTests$.highTestRange',      'lbl.highTestRange',      '{"renderAs":"text",        "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                          'R2:B.3.1.h / R3:F.r.5.2 â€” Normal range high value'),
-- â”€â”€ Coding and admin â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
(gen_random_uuid()::VARCHAR,'ICSR','640','640001','CODING_TYPE',         'codingType',         'codingType',         'TEXT',50, 'N','labTests$.codingType',         'lbl.codingType',         '{"renderAs":"combo",       "fieldWidth":"1","columnWidth":"16ch","allowSorting":true, "codelist":"ICSR_CODING_TYPE"}',            'MedDRA coding type for test name'),
(gen_random_uuid()::VARCHAR,'ICSR','640','640004','MORE_INFORMATION',     'moreInformation',    'moreInformation',    'TEXT',1,  'N','labTests$.moreInformation',    'lbl.moreInformation',    '{"renderAs":"bool-switch", "fieldWidth":"1","columnWidth":"18ch","allowSorting":true}',                                          'R2:B.3.1 / R3:F.r â€” More information available'),
(gen_random_uuid()::VARCHAR,'ICSR','640','640002','FOLLOW_UP',           'followUp',           'followUp',           'TEXT',1,  'N','labTests$.followUp',           'lbl.labFollowUp',        '{"renderAs":"bool-switch", "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',                                          'Follow-up expected for this lab test'),
(gen_random_uuid()::VARCHAR,'ICSR','640','640003','LAB_COMMENTS',            'zcomments',          'zcomments',          'TEXT',300,'N','labTests$.zcomments',          'lbl.labComments',        '{"renderAs":"textarea",    "fieldWidth":"3","columnWidth":"28ch","allowSorting":false}',                                         'Lab test comments')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;


-- ── 02_DB_METADATA_645.sql ──
-- ============================================================
-- Script  : 02_DB_METADATA_645.sql â€” ICSR_LITERATURE (first-level multi-context)
-- R2: A.2.3 / R3: C.4 â€” Literature references
-- FK: CASE_ID â†’ ICSR_CASES(ID)
-- No new codelists needed â€” all text fields
-- ============================================================


INSERT INTO TABLE_METADATA (ID, MODULE_ID, TABLE_ID, PARENT_TABLE_ID, DB_TABLE_NAME, CONTEXT_NAME, MULTI_CONTEXT, JOIN_COLUMN, REF_JOIN_COLUMN, CONTEXT_PATH) VALUES
(gen_random_uuid()::VARCHAR,'ICSR','645','500','ICSR_LITERATURE','literatureCollection','Y','CASE_ID','ID','literatureCollection$')
ON CONFLICT (MODULE_ID, TABLE_ID) DO NOTHING;

INSERT INTO TABLE_COLUMN_METADATA (ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION) VALUES
-- â”€â”€ Core reference â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
(gen_random_uuid()::VARCHAR,'ICSR','645','645009','LITERATURE_REFERENCE',      'literatureReference',      'literatureReference',      'TEXT',50, 'N','literatureCollection$.literatureReference',      'lbl.literatureReference',      '{"renderAs":"text",        "fieldWidth":"3","columnWidth":"28ch","allowSorting":true}',  'R2:A.2.3.1 / R3:C.4.1 â€” Literature reference (full citation)'),
(gen_random_uuid()::VARCHAR,'ICSR','645','645002','ARTICLE_TITLE',            'articleTitle',             'articleTitle',             'TEXT',50, 'N','literatureCollection$.articleTitle',             'lbl.articleTitle',             '{"renderAs":"text",        "fieldWidth":"3","columnWidth":"28ch","allowSorting":true}',  'R3:C.4.2 â€” Article title'),
(gen_random_uuid()::VARCHAR,'ICSR','645','645007','JOURNAL_TITLE',            'journalTitle',             'journalTitle',             'TEXT',50, 'N','literatureCollection$.journalTitle',             'lbl.journalTitle',             '{"renderAs":"text",        "fieldWidth":"2","columnWidth":"22ch","allowSorting":true}',  'Journal / publication title'),
(gen_random_uuid()::VARCHAR,'ICSR','645','645003','DOI',       'digitalObjectIdentifier',  'digitalObjectIdentifier',  'TEXT',50, 'N','literatureCollection$.digitalObjectIdentifier',  'lbl.doi',                      '{"renderAs":"text",        "fieldWidth":"2","columnWidth":"20ch","allowSorting":true}',  'R3:C.4.3 â€” Digital Object Identifier (DOI)'),
(gen_random_uuid()::VARCHAR,'ICSR','645','645008','DOCUMENT_NAME',      'literatureDocName',        'literatureDocName',        'TEXT',300,'N','literatureCollection$.literatureDocName',        'lbl.literatureDocName',        '{"renderAs":"text",        "fieldWidth":"2","columnWidth":"22ch","allowSorting":true}',  'Literature document name'),
-- â”€â”€ Publication details â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
(gen_random_uuid()::VARCHAR,'ICSR','645','645012','PUBLICATION_DATE',                 'pubDate',                  'pubDate',                  'TEXT',50, 'N','literatureCollection$.pubDate',                  'lbl.pubDate',                  '{"renderAs":"date",        "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',  'Publication date'),
(gen_random_uuid()::VARCHAR,'ICSR','645','645004','EDITION',                 'edition',                  'edition',                  'TEXT',50, 'N','literatureCollection$.edition',                  'lbl.edition',                  '{"renderAs":"text",        "fieldWidth":"1","columnWidth":"10ch","allowSorting":true}',  'Edition'),
(gen_random_uuid()::VARCHAR,'ICSR','645','645006','ISSUE',                    'issue',                    'issue',                    'TEXT',50, 'N','literatureCollection$.issue',                    'lbl.issue',                    '{"renderAs":"text",        "fieldWidth":"1","columnWidth":"10ch","allowSorting":true}',  'Issue number'),
(gen_random_uuid()::VARCHAR,'ICSR','645','645010','PAGE_FROM',                'pageFrom',                 'pageFrom',                 'TEXT',50, 'N','literatureCollection$.pageFrom',                 'lbl.pageFrom',                 '{"renderAs":"text",        "fieldWidth":"1","columnWidth":"10ch","allowSorting":true}',  'Page from'),
(gen_random_uuid()::VARCHAR,'ICSR','645','645011','PAGE_TO',                 'pageTo',                   'pageTo',                   'TEXT',50, 'N','literatureCollection$.pageTo',                   'lbl.pageTo',                   '{"renderAs":"text",        "fieldWidth":"1","columnWidth":"10ch","allowSorting":true}',  'Page to'),
-- â”€â”€ Admin â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
(gen_random_uuid()::VARCHAR,'ICSR','645','645001','ADDITIONAL_LIT_INFO','additionalLitInformation', 'additionalLitInformation', 'TEXT',300,'N','literatureCollection$.additionalLitInformation', 'lbl.additionalLitInfo',        '{"renderAs":"textarea",    "fieldWidth":"3","columnWidth":"28ch","allowSorting":false}', 'Additional literature information'),
(gen_random_uuid()::VARCHAR,'ICSR','645','645013','RETAIN_LITERATURE_REF','retainLiteratureReference', 'retainLiteratureReference', 'TEXT',1,  'N','literatureCollection$.retainLiteratureReference', 'lbl.retainLiteratureReference','{"renderAs":"bool-switch", "fieldWidth":"1","columnWidth":"18ch","allowSorting":true}',  'Retain literature reference flag'),
(gen_random_uuid()::VARCHAR,'ICSR','645','645005','FOLLOW_UP',                'followUp',                 'followUp',                 'TEXT',1,  'N','literatureCollection$.followUp',                 'lbl.litFollowUp',              '{"renderAs":"bool-switch", "fieldWidth":"1","columnWidth":"12ch","allowSorting":true}',  'Follow-up expected for this literature reference')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;

