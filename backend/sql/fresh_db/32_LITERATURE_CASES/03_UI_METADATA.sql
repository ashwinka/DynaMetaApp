-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 03_UI_METADATA.sql
-- Purpose : UI_METADATA entries — FORM, LISTING, LOOKUP, I18N
-- ============================================================

-- FORM
INSERT INTO UI_METADATA (ID, MODULE_ID, NAME, TYPE, METADATA_JSON) VALUES (gen_random_uuid()::VARCHAR,'LITERATURE_CASES','LITERATURE_CASES_FULL_FORM','FORM','{
  "formID": "FULL_FORM",
  "formName": "Literature Cases",
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
    "sectionId": "360", "title": "Literature Case", "sequence": 1, "multiContext": false,
    "sections": [
      {
        "sectionId": "360_001", "title": "Case Information", "sequence": 1, "multiContext": false, "tabPanel": true,
        "fields": [
          { "fieldId": "360001", "label": "lbl.caseId",          "fieldPath": "caseId",          "dataType": "text", "renderAs": "text",  "fieldWidth": 1 },
          { "fieldId": "360008", "label": "lbl.status",          "fieldPath": "status",          "dataType": "text", "renderAs": "combo", "fieldWidth": 1, "codelist": "CASE_STATUS" },
          { "fieldId": "360009", "label": "lbl.priority",        "fieldPath": "priority",        "dataType": "text", "renderAs": "combo", "fieldWidth": 1, "codelist": "PRIORITY" },
          { "fieldId": "360017", "label": "lbl.assignedTo",      "fieldPath": "assignedTo",      "dataType": "text", "renderAs": "text",  "fieldWidth": 1 },
          { "fieldId": "360010", "label": "lbl.isSafetyRelated", "fieldPath": "isSafetyRelated", "dataType": "text", "renderAs": "radio", "fieldWidth": 1, "codelist": "YES_NO" },
          { "fieldId": "360013", "label": "lbl.serious",         "fieldPath": "serious",         "dataType": "text", "renderAs": "radio", "fieldWidth": 1, "codelist": "YES_NO" },
          { "fieldId": "360014", "label": "lbl.caseReportable",  "fieldPath": "caseReportable",  "dataType": "text", "renderAs": "radio", "fieldWidth": 1, "codelist": "YES_NO" },
          { "fieldId": "360015", "label": "lbl.caseCreated",     "fieldPath": "caseCreated",     "dataType": "text", "renderAs": "radio", "fieldWidth": 1, "codelist": "YES_NO" },
          { "fieldId": "360016", "label": "lbl.linkedCaseId",    "fieldPath": "linkedCaseId",    "dataType": "text", "renderAs": "text",  "fieldWidth": 1 },
          { "fieldId": "360011", "label": "lbl.productMentioned","fieldPath": "productMentioned","dataType": "text", "renderAs": "text",  "fieldWidth": 2 },
          { "fieldId": "360012", "label": "lbl.aeTerm",          "fieldPath": "aeTerm",          "dataType": "text", "renderAs": "text",  "fieldWidth": 2 }
        ]
      },
      {
        "sectionId": "360_002", "title": "Publication Details", "sequence": 2, "multiContext": false, "tabPanel": true,
        "fields": [
          { "fieldId": "360002", "label": "lbl.articleTitle",    "fieldPath": "articleTitle",    "dataType": "text", "renderAs": "text",  "fieldWidth": 3 },
          { "fieldId": "360003", "label": "lbl.journalName",     "fieldPath": "journalName",     "dataType": "text", "renderAs": "text",  "fieldWidth": 2 },
          { "fieldId": "360004", "label": "lbl.authors",         "fieldPath": "authors",         "dataType": "text", "renderAs": "text",  "fieldWidth": 2 },
          { "fieldId": "360005", "label": "lbl.publicationDate", "fieldPath": "publicationDate", "dataType": "date", "renderAs": "date",  "fieldWidth": 1 },
          { "fieldId": "360006", "label": "lbl.doi",             "fieldPath": "doi",             "dataType": "text", "renderAs": "text",  "fieldWidth": 1 },
          { "fieldId": "360007", "label": "lbl.sourceType",      "fieldPath": "sourceType",      "dataType": "text", "renderAs": "combo", "fieldWidth": 1, "codelist": "SOURCE_TYPE" }
        ]
      },
      {
        "sectionId": "360_003", "title": "Search & Assessment", "sequence": 3, "multiContext": false, "tabPanel": true,
        "fields": [
          { "fieldId": "360020", "label": "lbl.searchDatabase",  "fieldPath": "searchDatabase",  "dataType": "text", "renderAs": "combo",    "fieldWidth": 1, "codelist": "SEARCH_DB" },
          { "fieldId": "360021", "label": "lbl.searchDate",      "fieldPath": "searchDate",      "dataType": "date", "renderAs": "date",     "fieldWidth": 1 },
          { "fieldId": "360022", "label": "lbl.searchTerms",     "fieldPath": "searchTerms",     "dataType": "text", "renderAs": "text",     "fieldWidth": 2 },
          { "fieldId": "360024", "label": "lbl.searchedBy",      "fieldPath": "searchedBy",      "dataType": "text", "renderAs": "text",     "fieldWidth": 1 },
          { "fieldId": "360018", "label": "lbl.assessmentDate",  "fieldPath": "assessmentDate",  "dataType": "date", "renderAs": "date",     "fieldWidth": 1 },
          { "fieldId": "360019", "label": "lbl.assessmentNotes", "fieldPath": "assessmentNotes", "dataType": "text", "renderAs": "textarea", "fieldWidth": 3 }
        ]
      }
    ]
  }]
}') ON CONFLICT (NAME) DO NOTHING;

-- LISTING
INSERT INTO UI_METADATA (ID, MODULE_ID, NAME, TYPE, METADATA_JSON) VALUES (gen_random_uuid()::VARCHAR,'LITERATURE_CASES','LITERATURE_CASES_LISTING','LISTING','{
  "module": "LITERATURE_CASES",
  "title": "Literature Cases",
  "FILTERS_FIELDS": [
    { "fieldId": "360001", "label": "lbl.caseId",          "fieldPath": "caseId",          "renderAs": "text",  "fieldWidth": 1 },
    { "fieldId": "360008", "label": "lbl.status",          "fieldPath": "status",          "renderAs": "combo", "codelist": "CASE_STATUS", "fieldWidth": 1 },
    { "fieldId": "360010", "label": "lbl.isSafetyRelated", "fieldPath": "isSafetyRelated", "renderAs": "combo", "codelist": "YES_NO",      "fieldWidth": 1 },
    { "fieldId": "360009", "label": "lbl.priority",        "fieldPath": "priority",        "renderAs": "combo", "codelist": "PRIORITY",    "fieldWidth": 1 }
  ],
  "GRID_FIELDS": [
    { "fieldId": "360001", "label": "lbl.caseId",          "fieldPath": "caseId",          "renderAs": "text",  "allowSorting": true, "width": "14ch", "primaryKey": true },
    { "fieldId": "360002", "label": "lbl.articleTitle",    "fieldPath": "articleTitle",    "renderAs": "text",  "allowSorting": true, "width": "30ch" },
    { "fieldId": "360003", "label": "lbl.journalName",     "fieldPath": "journalName",     "renderAs": "text",  "allowSorting": true, "width": "18ch" },
    { "fieldId": "360008", "label": "lbl.status",          "fieldPath": "status",          "renderAs": "badge", "codelist": "CASE_STATUS", "allowSorting": true, "width": "12ch" },
    { "fieldId": "360010", "label": "lbl.safetyRelated",   "fieldPath": "isSafetyRelated", "renderAs": "yesno", "allowSorting": true, "width": "10ch", "align": "center" },
    { "fieldId": "360005", "label": "lbl.publicationDate", "fieldPath": "publicationDate", "renderAs": "text",  "allowSorting": true, "width": "14ch" }
  ],
  "DASHBOARD_WIDGETS": [
    { "widgetId": "totalLit",   "label": "Total",          "iconColor": "blue",   "icon": "M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253", "filters": [] },
    { "widgetId": "safetyLit",  "label": "Safety Related", "iconColor": "red",    "icon": "M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z", "filters": [{ "field": "isSafetyRelated", "operator": "eq", "value": "Y" }] },
    { "widgetId": "openLit",    "label": "Open",           "iconColor": "orange", "icon": "M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z", "filters": [{ "field": "status", "operator": "eq", "value": "OPEN" }] }
  ]
}') ON CONFLICT (NAME) DO NOTHING;

-- LOOKUP
INSERT INTO UI_METADATA (ID, MODULE_ID, NAME, TYPE, METADATA_JSON) VALUES (gen_random_uuid()::VARCHAR,'LITERATURE_CASES','LITERATURE_CASES_LOOKUP','LOOKUP','{
  "module": "LITERATURE_CASES",
  "title": "Literature Cases",
  "FILTERS_FIELDS": [
    { "fieldId": "360001", "label": "lbl.caseId",       "fieldPath": "caseId",       "renderAs": "text",  "fieldWidth": 1 },
    { "fieldId": "360008", "label": "lbl.status",       "fieldPath": "status",       "renderAs": "combo", "codelist": "CASE_STATUS", "fieldWidth": 1 }
  ],
  "GRID_FIELDS": [
    { "fieldId": "360001", "label": "lbl.caseId",       "fieldPath": "caseId",       "renderAs": "text",  "allowSorting": true, "width": "14ch", "primaryKey": true },
    { "fieldId": "360002", "label": "lbl.articleTitle", "fieldPath": "articleTitle", "renderAs": "text",  "allowSorting": true, "width": "32ch" },
    { "fieldId": "360008", "label": "lbl.status",       "fieldPath": "status",       "renderAs": "badge", "codelist": "CASE_STATUS", "allowSorting": true, "width": "12ch" }
  ]
}') ON CONFLICT (NAME) DO NOTHING;

-- I18N
INSERT INTO UI_METADATA (ID, MODULE_ID, NAME, TYPE, METADATA_JSON) VALUES (gen_random_uuid()::VARCHAR,'LITERATURE_CASES','LITERATURE_CASES_I18N','I18N','{
  "en": {
    "lbl.caseId":          "Case ID",
    "lbl.status":          "Status",
    "lbl.priority":        "Priority",
    "lbl.assignedTo":      "Assigned To",
    "lbl.isSafetyRelated": "Safety Related",
    "lbl.safetyRelated":   "Safety Related",
    "lbl.serious":         "Serious",
    "lbl.caseReportable":  "Case Reportable",
    "lbl.caseCreated":     "Case Created",
    "lbl.linkedCaseId":    "Linked Case ID",
    "lbl.productMentioned":"Product Mentioned",
    "lbl.aeTerm":          "AE Term",
    "lbl.articleTitle":    "Article Title",
    "lbl.journalName":     "Journal Name",
    "lbl.authors":         "Authors",
    "lbl.publicationDate": "Publication Date",
    "lbl.doi":             "DOI",
    "lbl.sourceType":      "Source Type",
    "lbl.searchDatabase":  "Search Database",
    "lbl.searchDate":      "Search Date",
    "lbl.searchTerms":     "Search Terms",
    "lbl.searchedBy":      "Searched By",
    "lbl.assessmentDate":  "Assessment Date",
    "lbl.assessmentNotes": "Assessment Notes",
    "sec.caseInfo":        "Case Information",
    "sec.publication":     "Publication Details",
    "sec.searchAssessment":"Search & Assessment"
  }
}') ON CONFLICT (NAME) DO NOTHING;
