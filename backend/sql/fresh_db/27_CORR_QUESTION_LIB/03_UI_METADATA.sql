-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 03_UI_METADATA.sql
-- Module  : CORR_QUESTION_LIB
-- Purpose : FORM, LISTING, LOOKUP, I18N metadata
--           Form sections reference fieldId only — all render
--           config lives in TABLE_COLUMN_METADATA.UI_METADATA.
-- ============================================================

-- CORR_QUESTION_LIB — FORM
INSERT INTO UI_METADATA (ID, MODULE_ID, NAME, TYPE, METADATA_JSON) VALUES (gen_random_uuid()::VARCHAR,'CORR_QUESTION_LIB','CORR_QUESTION_LIB_FULL_FORM','FORM','{
  "formID": "FULL_FORM",
  "formName": "Correspondence Question Library",
  "version": "1.0",
  "layout": {
    "recordTitleField": "questionTitle",
    "enableFilterSection": false,
    "navigationWidth": "260px",
    "formPanelWidth": "75%",
    "responsive": { "webFieldsPerRow": 3, "tabletFieldsPerRow": 2, "mobileFieldsPerRow": 1 }
  },
  "formHeaderActions": [
    { "actionId": "save",   "label": "app.save",   "icon": "save",  "type": "standard" },
    { "actionId": "cancel", "label": "app.cancel", "icon": "close" }
  ],
  "sections": [{
    "sectionId": "270", "title": "Question", "sequence": 1, "multiContext": false,
    "sections": [
      {
        "sectionId": "270_001", "title": "lbl.sec_questionDetails", "sequence": 1, "multiContext": false, "tabPanel": true,
        "fields": [
          { "fieldId": "270001" },
          { "fieldId": "270008" },
          { "fieldId": "270002" },
          { "fieldId": "270003" },
          { "fieldId": "270004" },
          { "fieldId": "270005" },
          { "fieldId": "270006" },
          { "fieldId": "270007" },
          { "fieldId": "270009" },
          { "fieldId": "270010" },
          { "fieldId": "270012" },
          { "fieldId": "270013" },
          { "fieldId": "270011" },
          { "fieldId": "270014" }
        ]
      },
      {
        "sectionId": "270_002", "title": "lbl.sec_auditInfo", "sequence": 2, "multiContext": false, "tabPanel": true,
        "fields": [
          { "fieldId": "270015" },
          { "fieldId": "270016" },
          { "fieldId": "270017" }
        ]
      },
      {
        "sectionId": "271_001", "title": "lbl.sec_translations", "sequence": 3, "multiContext": true,
        "contextPath": "translations$", "tabPanel": true,
        "dataGridConfig": { "allowAdd": true, "allowDelete": true, "allowCopy": false, "pagination": true, "pageSizeOptions": [5, 10] },
        "fields": [
          { "fieldId": "271001" },
          { "fieldId": "271002" },
          { "fieldId": "271003" }
        ],
        "gridFields": [
          { "fieldId": "271001" },
          { "fieldId": "271002" }
        ]
      },
      {
        "sectionId": "272_001", "title": "lbl.sec_usageHistory", "sequence": 4, "multiContext": true,
        "contextPath": "usageHistory$", "tabPanel": true,
        "dataGridConfig": { "allowAdd": false, "allowDelete": false, "pagination": true, "pageSizeOptions": [5, 10, 25] },
        "fields": [
          { "fieldId": "272001" },
          { "fieldId": "272002" },
          { "fieldId": "272003" },
          { "fieldId": "272004" }
        ],
        "gridFields": [
          { "fieldId": "272001" },
          { "fieldId": "272002" },
          { "fieldId": "272003" },
          { "fieldId": "272004" }
        ]
      }
    ]
  }]
}') ON CONFLICT (NAME) DO NOTHING;

-- CORR_QUESTION_LIB — LISTING
INSERT INTO UI_METADATA (ID, MODULE_ID, NAME, TYPE, METADATA_JSON) VALUES (gen_random_uuid()::VARCHAR,'CORR_QUESTION_LIB','CORR_QUESTION_LIB_LISTING','LISTING','{
  "module": "CORR_QUESTION_LIB",
  "title": "Correspondence Question Library",
  "FILTERS_FIELDS": [
    { "fieldId": "270001" },
    { "fieldId": "270002" },
    { "fieldId": "270004" },
    { "fieldId": "270005" },
    { "fieldId": "270007" },
    { "fieldId": "270010" },
    { "fieldId": "270012" },
    { "fieldId": "270008", "dataValues": [{"code":"Y","decode":"Yes"},{"code":"N","decode":"No"}] }
  ],
  "GRID_FIELDS": [
    { "fieldId": "270001" },
    { "fieldId": "270002" },
    { "fieldId": "270004" },
    { "fieldId": "270005" },
    { "fieldId": "270007" },
    { "fieldId": "270010" },
    { "fieldId": "270009" },
    { "fieldId": "270008" }
  ],
  "DASHBOARD_WIDGETS": [
    { "widgetId": "totalQuestions",     "label": "lbl.widget_totalQuestions",     "iconColor": "blue",   "icon": "M8 10h.01M12 10h.01M16 10h.01M9 16H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-5l-5 5v-5z", "filters": [] },
    { "widgetId": "activeQuestions",    "label": "lbl.widget_activeQuestions",    "iconColor": "green",  "icon": "M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z", "filters": [{ "field": "isActive", "operator": "eq", "value": "Y" }] },
    { "widgetId": "mandatoryQuestions", "label": "lbl.widget_mandatoryQuestions", "iconColor": "orange", "icon": "M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z", "filters": [{ "field": "isMandatory", "operator": "eq", "value": "Y" }] }
  ]
}') ON CONFLICT (NAME) DO NOTHING;

-- CORR_QUESTION_LIB — LOOKUP
INSERT INTO UI_METADATA (ID, MODULE_ID, NAME, TYPE, METADATA_JSON) VALUES (gen_random_uuid()::VARCHAR,'CORR_QUESTION_LIB','CORR_QUESTION_LIB_LOOKUP','LOOKUP','{
  "module": "CORR_QUESTION_LIB",
  "title": "Correspondence Question Library",
  "lookupModule": "CORR_QUESTION_LIB",
  "storeValField": "questionId",
  "lkpStoreValField": "questionId",
  "lkpDispValField": "questionTitle",
  "FILTERS_FIELDS": [
    { "fieldId": "270001" },
    { "fieldId": "270002" },
    { "fieldId": "270004" },
    { "fieldId": "270010" },
    { "fieldId": "270008", "dataValues": [{"code":"Y","decode":"Yes"},{"code":"N","decode":"No"}] }
  ],
  "GRID_FIELDS": [
    { "fieldId": "270001" },
    { "fieldId": "270002" },
    { "fieldId": "270004" },
    { "fieldId": "270010" },
    { "fieldId": "270008" }
  ]
}') ON CONFLICT (NAME) DO NOTHING;

-- CORR_QUESTION_LIB — I18N
INSERT INTO UI_METADATA (ID, MODULE_ID, NAME, TYPE, METADATA_JSON) VALUES (gen_random_uuid()::VARCHAR,'CORR_QUESTION_LIB','CORR_QUESTION_LIB_I18N','I18N','{
  "en": {
    "lbl.questionId":             "Question ID",
    "lbl.questionTitle":          "Question Title",
    "lbl.questionText":           "Question Text",
    "lbl.category":               "Category",
    "lbl.subCategory":            "Sub Category",
    "lbl.language":               "Language",
    "lbl.priority":               "Priority",
    "lbl.active":                 "Active",
    "lbl.isMandatory":            "Mandatory",
    "lbl.responseType":           "Response Type",
    "lbl.expectedResponse":       "Expected Response",
    "lbl.applicableTo":           "Applicable To",
    "lbl.followUpQuestionId":     "Follow-up Question",
    "lbl.helpText":               "Help Text",
    "lbl.createdBy":              "Created By",
    "lbl.createdDate":            "Created Date",
    "lbl.lastModified":           "Last Modified",
    "lbl.translatedTitle":        "Translated Title",
    "lbl.translatedText":         "Translated Text",
    "lbl.caseId":                 "Case ID",
    "lbl.usedDate":               "Used Date",
    "lbl.usedBy":                 "Used By",
    "lbl.channel":                "Channel",
    "lbl.sec_questionDetails":    "Question Details",
    "lbl.sec_auditInfo":          "Audit Information",
    "lbl.sec_translations":       "Translations",
    "lbl.sec_usageHistory":       "Usage History",
    "lbl.widget_totalQuestions":    "Total Questions",
    "lbl.widget_activeQuestions":   "Active",
    "lbl.widget_mandatoryQuestions":"Mandatory"
  },
  "fr": {
    "lbl.questionId":             "ID question",
    "lbl.questionTitle":          "Titre de la question",
    "lbl.questionText":           "Texte de la question",
    "lbl.category":               "Catégorie",
    "lbl.subCategory":            "Sous-catégorie",
    "lbl.language":               "Langue",
    "lbl.priority":               "Priorité",
    "lbl.active":                 "Actif",
    "lbl.isMandatory":            "Obligatoire",
    "lbl.responseType":           "Type de réponse",
    "lbl.expectedResponse":       "Réponse attendue",
    "lbl.applicableTo":           "Applicable à",
    "lbl.followUpQuestionId":     "Question de suivi",
    "lbl.helpText":               "Texte d''aide",
    "lbl.createdBy":              "Créé par",
    "lbl.createdDate":            "Date de création",
    "lbl.lastModified":           "Dernière modification",
    "lbl.translatedTitle":        "Titre traduit",
    "lbl.translatedText":         "Texte traduit",
    "lbl.caseId":                 "ID cas",
    "lbl.usedDate":               "Date d''utilisation",
    "lbl.usedBy":                 "Utilisé par",
    "lbl.channel":                "Canal",
    "lbl.sec_questionDetails":    "Détails de la question",
    "lbl.sec_auditInfo":          "Informations d''audit",
    "lbl.sec_translations":       "Traductions",
    "lbl.sec_usageHistory":       "Historique d''utilisation",
    "lbl.widget_totalQuestions":    "Total questions",
    "lbl.widget_activeQuestions":   "Actif",
    "lbl.widget_mandatoryQuestions":"Obligatoire"
  },
  "ja": {
    "lbl.questionId":             "質問ID",
    "lbl.questionTitle":          "質問タイトル",
    "lbl.questionText":           "質問テキスト",
    "lbl.category":               "カテゴリ",
    "lbl.subCategory":            "サブカテゴリ",
    "lbl.language":               "言語",
    "lbl.priority":               "優先度",
    "lbl.active":                 "有効",
    "lbl.isMandatory":            "必須",
    "lbl.responseType":           "回答タイプ",
    "lbl.expectedResponse":       "期待される回答",
    "lbl.applicableTo":           "適用対象",
    "lbl.followUpQuestionId":     "フォローアップ質問",
    "lbl.helpText":               "ヘルプテキスト",
    "lbl.createdBy":              "作成者",
    "lbl.createdDate":            "作成日",
    "lbl.lastModified":           "最終更新日",
    "lbl.translatedTitle":        "翻訳タイトル",
    "lbl.translatedText":         "翻訳テキスト",
    "lbl.caseId":                 "ケースID",
    "lbl.usedDate":               "使用日",
    "lbl.usedBy":                 "使用者",
    "lbl.channel":                "チャネル",
    "lbl.sec_questionDetails":    "質問詳細",
    "lbl.sec_auditInfo":          "監査情報",
    "lbl.sec_translations":       "翻訳",
    "lbl.sec_usageHistory":       "使用履歴",
    "lbl.widget_totalQuestions":    "質問合計",
    "lbl.widget_activeQuestions":   "有効",
    "lbl.widget_mandatoryQuestions":"必須"
  }
}') ON CONFLICT (NAME) DO NOTHING;
