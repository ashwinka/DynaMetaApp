-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 03_UI_METADATA.sql
-- Module  : ACCOUNTS
-- Purpose : FORM, LISTING, LOOKUP, I18N metadata
--           Form sections reference fieldId only — all render
--           config lives in TABLE_COLUMN_METADATA.UI_METADATA.
-- ============================================================

-- ACCOUNTS — FORM
DELETE FROM UI_METADATA WHERE MODULE_ID = 'ACCOUNTS' AND TYPE='FORM';
INSERT INTO UI_METADATA (ID, MODULE_ID, NAME, TYPE, METADATA_JSON) VALUES (gen_random_uuid()::VARCHAR,'ACCOUNTS','ACCOUNTS_FULL_FORM','FORM','{
  "formID": "FULL_FORM",
  "formName": "Accounts / Company Units",
  "version": "2.0",
  "layout": {
    "recordTitleField": "accName",
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
	"sectionId": "230_001", "title": "lbl.sec_accDetails", "sequence": 1,
	"fields": [
	  { "fieldId": "230001" },
	  { "fieldId": "230002" },
	  { "fieldId": "230003" },
	  { "fieldId": "230004" },
	  { "fieldId": "230005" },
	  { "fieldId": "230006" },
	  { "fieldId": "230007" }
	],
	"sections":[
	  {
		"sectionId": "231_001", "title": "lbl.sec_regNumbers", "sequence": 2, "multiContext": true,
		"contextPath": "regNumbers$",
		"dataGridConfig": { },
		"fields": [
		  { "fieldId": "231001" },
		  { "fieldId": "231002" }
		],
		"gridFields": [
		  { "fieldId": "231001" },
		  { "fieldId": "231002" }
		]
	  }
	]
  }
  ,
  {
	"sectionId": "230_002", "title": "lbl.sec_contactDetails", "sequence": 3,
	"fields": [
	  { "fieldId": "230008" },
	  { "fieldId": "230009" },
	  { "fieldId": "230010" },
	  { "fieldId": "230011" },
	  { "fieldId": "230012" },
	  { "fieldId": "230013" },
	  { "fieldId": "230014" },
	  { "fieldId": "230015" },
	  { "fieldId": "230016" },
	  { "fieldId": "230017" },
	  { "fieldId": "230018" },
	  { "fieldId": "230019" }
	]
  },
  {
	"sectionId": "232_001", "title": "lbl.sec_contacts", "sequence": 4, "multiContext": true,
	"contextPath": "contacts$",
	"dataGridConfig": { },
	"fields": [
	  { "fieldId": "232001" },
	  { "fieldId": "232005" },
	  { "fieldId": "232006" },
	  { "fieldId": "232002" },
	  { "fieldId": "232003" },
	  { "fieldId": "232004" }
	],
	"gridFields": [
	  { "fieldId": "232001" },
	  { "fieldId": "232003" },
	  { "fieldId": "232006" },
	  { "fieldId": "232005" },
	  { "fieldId": "232004" }
	]
  },
  {
	"sectionId": "233_001", "title": "lbl.sec_contracts", "sequence": 5, "multiContext": true,
	"contextPath": "contracts$",
	"dataGridConfig": { },
	"fields": [
	  { "fieldId": "233001" },
	  { "fieldId": "233002" },
	  { "fieldId": "233003" },
	  { "fieldId": "233004" },
	  { "fieldId": "233005" },
	  { "fieldId": "233006" },
	  { "fieldId": "233007" },
	  { "fieldId": "233008" }
	],
	"gridFields": [
	  { "fieldId": "233001" },
	  { "fieldId": "233004" },
	  { "fieldId": "233005" },
	  { "fieldId": "233006" },
	  { "fieldId": "233007" }
	]
  }]
}') ON CONFLICT (NAME) DO NOTHING;

-- ACCOUNTS — LISTING
DELETE FROM UI_METADATA WHERE MODULE_ID = 'ACCOUNTS' AND TYPE='LISTING';
INSERT INTO UI_METADATA (ID, MODULE_ID, NAME, TYPE, METADATA_JSON) VALUES (gen_random_uuid()::VARCHAR,'ACCOUNTS','ACCOUNTS_LISTING','LISTING','{
  "module": "ACCOUNTS",
  "title": "Accounts / Company Units",
  "FILTERS_FIELDS": [
    { "fieldId": "230001" },
    { "fieldId": "230002" },
    { "fieldId": "230004" },
    { "fieldId": "230005" },
    { "fieldId": "230009" },
    { "fieldId": "230003", "dataValues": [{"code":"Y","decode":"Yes"},{"code":"N","decode":"No"}] }
  ],
  "GRID_FIELDS": [
    { "fieldId": "230001" },
    { "fieldId": "230002" },
    { "fieldId": "230004" },
    { "fieldId": "230005" },
    { "fieldId": "230009" },
    { "fieldId": "230010" },
    { "fieldId": "230003" }
  ],
  "DASHBOARD_WIDGETS": [
    { "widgetId": "totalAccounts",  "label": "lbl.widget_totalAccounts",  "iconColor": "blue",   "icon": "M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-2 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4", "filters": [] },
    { "widgetId": "activeAccounts", "label": "lbl.widget_activeAccounts", "iconColor": "green",  "icon": "M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z", "filters": [{ "field": "isActive", "operator": "eq", "value": "Y" }] }
  ]
}') ON CONFLICT (NAME) DO NOTHING;

-- ACCOUNTS — LOOKUP
DELETE FROM UI_METADATA WHERE MODULE_ID = 'ACCOUNTS' AND TYPE='LOOKUP';
INSERT INTO UI_METADATA (ID, MODULE_ID, NAME, TYPE, METADATA_JSON) VALUES (gen_random_uuid()::VARCHAR,'ACCOUNTS','ACCOUNTS_LOOKUP','LOOKUP','{
  "module": "ACCOUNTS",
  "title": "Accounts / Company Units",
  "lookupModule": "ACCOUNTS",
  "storeValField": "accId",
  "lkpStoreValField": "accId",
  "lkpDispValField": "accName",
  "FILTERS_FIELDS": [
    { "fieldId": "230001" },
    { "fieldId": "230002" },
    { "fieldId": "230004" },
    { "fieldId": "230003", "dataValues": [{"code":"Y","decode":"Yes"},{"code":"N","decode":"No"}] }
  ],
  "GRID_FIELDS": [
    { "fieldId": "230001" },
    { "fieldId": "230002" },
    { "fieldId": "230004" },
    { "fieldId": "230003" }
  ]
}') ON CONFLICT (NAME) DO NOTHING;

-- ACCOUNTS — I18N
DELETE FROM UI_METADATA WHERE MODULE_ID = 'ACCOUNTS' AND TYPE='I18N';
INSERT INTO UI_METADATA (ID, MODULE_ID, NAME, TYPE, METADATA_JSON) VALUES (gen_random_uuid()::VARCHAR,'ACCOUNTS','ACCOUNTS_I18N','I18N','{
  "en": {
    "lbl.accId":                "Account ID",
    "lbl.accName":              "Account Name",
    "lbl.active":               "Active",
    "lbl.accountType":          "Account Type",
    "lbl.healthAuthority":      "Health Authority",
    "lbl.singleRegNumber":      "Single Registration Number",
    "lbl.description":          "Description",
    "lbl.address":              "Address",
    "lbl.country":              "Country",
    "lbl.city":                 "City",
    "lbl.state":                "State",
    "lbl.postcode":             "Postcode",
    "lbl.phoneCountryCode":     "Country Code",
    "lbl.phoneAreaCode":        "Area Code",
    "lbl.phoneNumber":          "Ph Number",
    "lbl.website":              "Website",
    "lbl.faxCountryCode":       "Country Code",
    "lbl.faxAreaCode":          "Area Code",
    "lbl.faxNumber":            "Number",
    "lbl.authorityName":        "Authority Name",
    "lbl.registrationNumber":   "Registration Number",
    "lbl.isPrimary":            "Primary Contact",
    "lbl.contactId":            "Contact ID",
    "lbl.contactName":          "Contact Name",
    "lbl.interchangeId":        "Interchange ID",
    "lbl.e2bContact":           "E2B Contact",
    "lbl.caseDistribution":     "Case Distribution",
    "lbl.contractName":         "Contract Name",
    "lbl.fileName":             "File Name",
    "lbl.documentId":           "Document ID",
    "lbl.contractNumber":       "Contract Number",
    "lbl.effectiveStartDate":   "Effective Start Date",
    "lbl.expiryDate":           "Expiry Date",
    "lbl.sec_accDetails":       "Account Details",
    "lbl.sec_regNumbers":       "Registration Numbers",
    "lbl.sec_contactDetails":   "Contact Details",
    "lbl.sec_contacts":         "Contacts",
    "lbl.sec_contracts":        "Contracts",
    "lbl.widget_totalAccounts": "Total Accounts",
    "lbl.widget_activeAccounts":"Active"
  },
  "fr": {
    "lbl.accId":                "ID compte",
    "lbl.accName":              "Nom du compte",
    "lbl.active":               "Actif",
    "lbl.accountType":          "Type de compte",
    "lbl.healthAuthority":      "Autorité de santé",
    "lbl.singleRegNumber":      "Numéro d''enregistrement unique",
    "lbl.description":          "Description",
    "lbl.address":              "Adresse",
    "lbl.country":              "Pays",
    "lbl.city":                 "Ville",
    "lbl.state":                "État / Province",
    "lbl.postcode":             "Code postal",
    "lbl.phoneCountryCode":     "Indicatif pays",
    "lbl.phoneAreaCode":        "Indicatif régional",
    "lbl.phoneNumber":          "Numéro de téléphone",
    "lbl.website":              "Site web",
    "lbl.faxCountryCode":       "Indicatif pays",
    "lbl.faxAreaCode":          "Indicatif régional",
    "lbl.faxNumber":            "Numéro de fax",
    "lbl.authorityName":        "Nom de l''autorité",
    "lbl.registrationNumber":   "Numéro d''enregistrement",
    "lbl.isPrimary":            "Contact principal",
    "lbl.contactId":            "ID contact",
    "lbl.contactName":          "Nom du contact",
    "lbl.interchangeId":        "ID d''interchange",
    "lbl.e2bContact":           "Contact E2B",
    "lbl.caseDistribution":     "Distribution des cas",
    "lbl.contractName":         "Nom du contrat",
    "lbl.fileName":             "Nom du fichier",
    "lbl.documentId":           "ID document",
    "lbl.contractNumber":       "Numéro de contrat",
    "lbl.effectiveStartDate":   "Date d''entrée en vigueur",
    "lbl.expiryDate":           "Date d''expiration",
    "lbl.sec_accDetails":       "Détails du compte",
    "lbl.sec_regNumbers":       "Numéros d''enregistrement",
    "lbl.sec_contactDetails":   "Coordonnées",
    "lbl.sec_contacts":         "Contacts",
    "lbl.sec_contracts":        "Contrats",
    "lbl.widget_totalAccounts": "Total comptes",
    "lbl.widget_activeAccounts":"Actif"
  },
  "ja": {
    "lbl.accId":                "アカウントID",
    "lbl.accName":              "アカウント名",
    "lbl.active":               "有効",
    "lbl.accountType":          "アカウント種別",
    "lbl.healthAuthority":      "保健当局",
    "lbl.singleRegNumber":      "単一登録番号",
    "lbl.description":          "説明",
    "lbl.address":              "住所",
    "lbl.country":              "国",
    "lbl.city":                 "市区町村",
    "lbl.state":                "都道府県",
    "lbl.postcode":             "郵便番号",
    "lbl.phoneCountryCode":     "国番号",
    "lbl.phoneAreaCode":        "市外局番",
    "lbl.phoneNumber":          "電話番号",
    "lbl.website":              "ウェブサイト",
    "lbl.faxCountryCode":       "国番号",
    "lbl.faxAreaCode":          "市外局番",
    "lbl.faxNumber":            "ファックス番号",
    "lbl.authorityName":        "当局名",
    "lbl.registrationNumber":   "登録番号",
    "lbl.isPrimary":            "主要連絡先",
    "lbl.contactId":            "連絡先ID",
    "lbl.contactName":          "連絡先名",
    "lbl.interchangeId":        "インターチェンジID",
    "lbl.e2bContact":           "E2B連絡先",
    "lbl.caseDistribution":     "ケース配布",
    "lbl.contractName":         "契約名",
    "lbl.fileName":             "ファイル名",
    "lbl.documentId":           "文書ID",
    "lbl.contractNumber":       "契約番号",
    "lbl.effectiveStartDate":   "発効日",
    "lbl.expiryDate":           "有効期限",
    "lbl.sec_accDetails":       "アカウント詳細",
    "lbl.sec_regNumbers":       "登録番号",
    "lbl.sec_contactDetails":   "連絡先情報",
    "lbl.sec_contacts":         "連絡先",
    "lbl.sec_contracts":        "契約",
    "lbl.widget_totalAccounts": "アカウント合計",
    "lbl.widget_activeAccounts":"有効"
  }
}') ON CONFLICT (NAME) DO NOTHING;





---------------- UI render rules metadata ------------------
INSERT INTO APP_RULES
(ID,						 MODULE_ID,	 RULE_ID,			STATUS,			IS_ACTIVE,	IS_OOB,	RULE_TYPE,	TRIGGER_FIELDS,	CONTEXT_PATH,	
	RULE_EXPRESSION) values
(gen_random_uuid()::VARCHAR, 'ACCOUNTS', 'ACC_E2B_CNT_Y', 	'PUBLISHED',	'Y',		'Y',	'RENDERER', '232005',		'contacts$',	
	'{"logic":"AND", "conditions":[{"lhsFieldId":"232005", "operator":"eq", "rhsValue":"Y"}], "expressions":[]}');
