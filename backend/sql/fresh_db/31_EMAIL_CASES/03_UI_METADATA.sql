-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 03_UI_METADATA.sql
-- Purpose : UI_METADATA entries — FORM, LISTING, LOOKUP, I18N
-- ============================================================

-- FORM
INSERT INTO UI_METADATA (ID, MODULE_ID, NAME, TYPE, METADATA_JSON) VALUES (gen_random_uuid()::VARCHAR,'EMAIL_CASES','EMAIL_CASES_FULL_FORM','FORM','{
  "formID": "FULL_FORM",
  "formName": "Email Cases",
  "version": "1.0",
  "layout": {
    "recordTitleField": "caseId",
    "enableFilterSection": false,
    "navigationWidth": "260px",
    "formPanelWidth": "75%",
    "responsive": { "webFieldsPerRow": 3, "tabletFieldsPerRow": 2, "mobileFieldsPerRow": 1 }
  },
  "formHeaderActions": [
    { "actionId": "save",   "label": "Save",   "icon": "save",  "type": "standard" },
    { "actionId": "cancel", "label": "Cancel", "icon": "close" }
  ],
  "sections": [{
	"sectionId": "340_001", "title": "Case Information", "sequence": 1, "multiContext": false, "tabPanel": true,
	"fields": [
	  { "fieldId": "340001", "label": "lbl.caseId",          "fieldPath": "caseId",          "dataType": "text", "renderAs": "text",  "fieldWidth": 1 },
	  { "fieldId": "340007", "label": "lbl.status",          "fieldPath": "status",          "dataType": "text", "renderAs": "combo", "fieldWidth": 1, "codelist": "CASE_STATUS" },
	  { "fieldId": "340008", "label": "lbl.priority",        "fieldPath": "priority",        "dataType": "text", "renderAs": "combo", "fieldWidth": 1, "codelist": "PRIORITY" },
	  { "fieldId": "340009", "label": "lbl.assignedTo",      "fieldPath": "assignedTo",      "dataType": "text", "renderAs": "text",  "fieldWidth": 1 },
	  { "fieldId": "340010", "label": "lbl.dueDate",         "fieldPath": "dueDate",         "dataType": "date", "renderAs": "date",  "fieldWidth": 1 },
	  { "fieldId": "340012", "label": "lbl.linkedCaseId",    "fieldPath": "linkedCaseId",    "dataType": "text", "renderAs": "text",  "fieldWidth": 1 },
	  { "fieldId": "340013", "label": "lbl.isSafetyRelated", "fieldPath": "isSafetyRelated", "dataType": "text", "renderAs": "radio", "fieldWidth": 1, "codelist": "YES_NO" },
	  { "fieldId": "340017", "label": "lbl.serious",         "fieldPath": "serious",         "dataType": "text", "renderAs": "radio", "fieldWidth": 1, "codelist": "YES_NO" },
	  { "fieldId": "340011", "label": "lbl.caseCreated",     "fieldPath": "caseCreated",     "dataType": "text", "renderAs": "radio", "fieldWidth": 1, "codelist": "YES_NO" }
	]
  },
  {
	"sectionId": "340_002", "title": "Sender & Email Details", "sequence": 2, "multiContext": false, "tabPanel": true,
	"fields": [
	  { "fieldId": "340002", "label": "lbl.emailSubject",    "fieldPath": "emailSubject",    "dataType": "text", "renderAs": "text",     "fieldWidth": 3 },
	  { "fieldId": "340003", "label": "lbl.senderName",      "fieldPath": "senderName",      "dataType": "text", "renderAs": "text",     "fieldWidth": 2 },
	  { "fieldId": "340004", "label": "lbl.senderEmail",     "fieldPath": "senderEmail",     "dataType": "text", "renderAs": "text",     "fieldWidth": 2 },
	  { "fieldId": "340005", "label": "lbl.senderCountry",   "fieldPath": "senderCountry",   "dataType": "text", "renderAs": "combo",    "fieldWidth": 1, "codelist": "1015" },
	  { "fieldId": "340006", "label": "lbl.receivedDate",    "fieldPath": "receivedDate",    "dataType": "date", "renderAs": "date",     "fieldWidth": 1 },
	  { "fieldId": "340014", "label": "lbl.reporterType",    "fieldPath": "reporterType",    "dataType": "text", "renderAs": "combo",    "fieldWidth": 1, "codelist": "REPORTER_TYPE" },
	  { "fieldId": "340015", "label": "lbl.productMentioned","fieldPath": "productMentioned","dataType": "text", "renderAs": "text",     "fieldWidth": 2 },
	  { "fieldId": "340016", "label": "lbl.eventMentioned",  "fieldPath": "eventMentioned",  "dataType": "text", "renderAs": "text",     "fieldWidth": 2 },
	  { "fieldId": "340021", "label": "lbl.emailBody",       "fieldPath": "emailBody",       "dataType": "text", "renderAs": "textarea", "fieldWidth": 3 }
	]
  },
  {
	"sectionId": "340_003", "title": "Triage & Processing", "sequence": 3, "multiContext": false, "tabPanel": true,
	"fields": [
	  { "fieldId": "340018", "label": "lbl.triageDecision",  "fieldPath": "triageDecision",  "dataType": "text", "renderAs": "combo",    "fieldWidth": 1, "codelist": "TRIAGE_DECISION" },
	  { "fieldId": "340019", "label": "lbl.triageDate",      "fieldPath": "triageDate",      "dataType": "date", "renderAs": "date",     "fieldWidth": 1 },
	  { "fieldId": "340020", "label": "lbl.triageBy",        "fieldPath": "triageBy",        "dataType": "text", "renderAs": "text",     "fieldWidth": 1 },
	  { "fieldId": "340022", "label": "lbl.processingNotes", "fieldPath": "processingNotes", "dataType": "text", "renderAs": "textarea", "fieldWidth": 3 }
	]
  }]
}') ON CONFLICT (NAME) DO NOTHING;

-- LISTING
INSERT INTO UI_METADATA (ID, MODULE_ID, NAME, TYPE, METADATA_JSON) VALUES (gen_random_uuid()::VARCHAR,'EMAIL_CASES','EMAIL_CASES_LISTING','LISTING','{
  "module": "EMAIL_CASES",
  "title": "Email Cases",
  "FILTERS_FIELDS": [
    { "fieldId": "340001", "label": "lbl.caseId",          "fieldPath": "caseId",          "renderAs": "text",  "fieldWidth": 1 },
    { "fieldId": "340007", "label": "lbl.status",          "fieldPath": "status",          "renderAs": "combo", "codelist": "CASE_STATUS", "fieldWidth": 1 },
    { "fieldId": "340008", "label": "lbl.priority",        "fieldPath": "priority",        "renderAs": "combo", "codelist": "PRIORITY",    "fieldWidth": 1 },
    { "fieldId": "340013", "label": "lbl.isSafetyRelated", "fieldPath": "isSafetyRelated", "renderAs": "combo", "codelist": "YES_NO",      "fieldWidth": 1 }
  ],
  "GRID_FIELDS": [
    { "fieldId": "340001", "label": "lbl.caseId",          "fieldPath": "caseId",          "renderAs": "text",  "allowSorting": true, "width": "14ch", "primaryKey": true },
    { "fieldId": "340002", "label": "lbl.emailSubject",    "fieldPath": "emailSubject",    "renderAs": "text",  "allowSorting": true, "width": "28ch" },
    { "fieldId": "340003", "label": "lbl.senderName",      "fieldPath": "senderName",      "renderAs": "text",  "allowSorting": true, "width": "18ch" },
    { "fieldId": "340007", "label": "lbl.status",          "fieldPath": "status",          "renderAs": "badge", "codelist": "CASE_STATUS", "allowSorting": true, "width": "12ch" },
    { "fieldId": "340008", "label": "lbl.priority",        "fieldPath": "priority",        "renderAs": "badge", "codelist": "PRIORITY",    "allowSorting": true, "width": "10ch" },
    { "fieldId": "340013", "label": "lbl.safetyRelated",   "fieldPath": "isSafetyRelated", "renderAs": "yesno", "allowSorting": true, "width": "10ch", "align": "center" },
    { "fieldId": "340006", "label": "lbl.receivedDate",    "fieldPath": "receivedDate",    "renderAs": "text",  "allowSorting": true, "width": "14ch" }
  ],
  "DASHBOARD_WIDGETS": [
    { "widgetId": "totalEmails",   "label": "Total",         "iconColor": "blue",   "icon": "M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z", "filters": [] },
    { "widgetId": "openEmails",    "label": "Open",          "iconColor": "orange", "icon": "M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z", "filters": [{ "field": "status", "operator": "eq", "value": "OPEN" }] },
    { "widgetId": "safetyEmails",  "label": "Safety Related","iconColor": "red",    "icon": "M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z", "filters": [{ "field": "isSafetyRelated", "operator": "eq", "value": "Y" }] }
  ]
}') ON CONFLICT (NAME) DO NOTHING;

-- LOOKUP
INSERT INTO UI_METADATA (ID, MODULE_ID, NAME, TYPE, METADATA_JSON) VALUES (gen_random_uuid()::VARCHAR,'EMAIL_CASES','EMAIL_CASES_LOOKUP','LOOKUP','{
  "module": "EMAIL_CASES",
  "title": "Email Cases",
  "FILTERS_FIELDS": [
    { "fieldId": "340001", "label": "lbl.caseId", "fieldPath": "caseId", "renderAs": "text",  "fieldWidth": 1 },
    { "fieldId": "340007", "label": "lbl.status", "fieldPath": "status", "renderAs": "combo", "codelist": "CASE_STATUS", "fieldWidth": 1 }
  ],
  "GRID_FIELDS": [
    { "fieldId": "340001", "label": "lbl.caseId",       "fieldPath": "caseId",       "renderAs": "text",  "allowSorting": true, "width": "14ch", "primaryKey": true },
    { "fieldId": "340002", "label": "lbl.emailSubject", "fieldPath": "emailSubject", "renderAs": "text",  "allowSorting": true, "width": "30ch" },
    { "fieldId": "340007", "label": "lbl.status",       "fieldPath": "status",       "renderAs": "badge", "codelist": "CASE_STATUS", "allowSorting": true, "width": "12ch" }
  ]
}') ON CONFLICT (NAME) DO NOTHING;

-- I18N
INSERT INTO UI_METADATA (ID, MODULE_ID, NAME, TYPE, METADATA_JSON) VALUES (gen_random_uuid()::VARCHAR,'EMAIL_CASES','EMAIL_CASES_I18N','I18N','{
  "en": {
    "lbl.caseId":          "Case ID",
    "lbl.status":          "Status",
    "lbl.priority":        "Priority",
    "lbl.assignedTo":      "Assigned To",
    "lbl.dueDate":         "Due Date",
    "lbl.linkedCaseId":    "Linked Case ID",
    "lbl.isSafetyRelated": "Safety Related",
    "lbl.safetyRelated":   "Safety Related",
    "lbl.serious":         "Serious",
    "lbl.caseCreated":     "Case Created",
    "lbl.emailSubject":    "Email Subject",
    "lbl.senderName":      "Sender Name",
    "lbl.senderEmail":     "Sender Email",
    "lbl.senderCountry":   "Sender Country",
    "lbl.receivedDate":    "Received Date",
    "lbl.reporterType":    "Reporter Type",
    "lbl.productMentioned":"Product Mentioned",
    "lbl.eventMentioned":  "Event Mentioned",
    "lbl.emailBody":       "Email Body",
    "lbl.triageDecision":  "Triage Decision",
    "lbl.triageDate":      "Triage Date",
    "lbl.triageBy":        "Triaged By",
    "lbl.processingNotes": "Processing Notes",
    "sec.caseInfo":        "Case Information",
    "sec.senderDetails":   "Sender & Email Details",
    "sec.triage":          "Triage & Processing"
  }
}') ON CONFLICT (NAME) DO NOTHING;
