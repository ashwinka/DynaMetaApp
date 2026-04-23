-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 03_UI_METADATA.sql
-- Module  : CONTACTS
-- Purpose : FORM, LISTING, LOOKUP, I18N metadata
--           Form sections reference fieldId only — all render
--           config lives in TABLE_COLUMN_METADATA.UI_METADATA.
-- ============================================================

-- CONTACTS — FORM
INSERT INTO UI_METADATA (ID, MODULE_ID, NAME, TYPE, METADATA_JSON) VALUES (gen_random_uuid()::VARCHAR,'CONTACTS','CONTACTS_FULL_FORM','FORM','{
  "formID": "FULL_FORM",
  "formName": "Contacts",
  "version": "1.0",
  "layout": {
    "recordTitleField": "firstName",
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
	"sectionId": "220_001", "title": "lbl.sec_contactDetails", "sequence": 1, "multiContext": false,
	"fields": [
	  { "fieldId": "220003" },
	  { "fieldId": "220001" },
	  { "fieldId": "220002" },
	  { "fieldId": "220004" },
	  { "fieldId": "220005" },
	  { "fieldId": "220006" },
	  { "fieldId": "220010" },
	  { "fieldId": "220014" },
	  { "fieldId": "220012" },
	  { "fieldId": "220013" },
	  { "fieldId": "220007" },
	  { "fieldId": "220009" },
	  { "fieldId": "220008" },
	  { "fieldId": "220011" }
	]
  },
  {
	"sectionId": "220_002", "title": "lbl.sec_phoneDetails", "sequence": 2, "multiContext": false,
	"fields": [
	  { "fieldId": "220015" },
	  { "fieldId": "220016" },
	  { "fieldId": "220017" },
	  { "fieldId": "220018" },
	  { "fieldId": "220019" },
	  { "fieldId": "220020" }
	]
  },
  {
	"sectionId": "225_001", "title": "lbl.sec_addresses", "sequence": 3, "multiContext": true, "contextPath": "addresses$",
	"dataGridConfig": {},
	"fields": [
	  { "fieldId": "225001" },
	  { "fieldId": "225002" },
	  { "fieldId": "225003" },
	  { "fieldId": "225004" },
	  { "fieldId": "225005" },
	  { "fieldId": "225006" },
	  { "fieldId": "225007" }
	],
	"gridFields": [
	  { "fieldId": "225001" },
	  { "fieldId": "225007" },
	  { "fieldId": "225004" },
	  { "fieldId": "225005" },
	  { "fieldId": "225006" }
	]
  }]
}') ON CONFLICT (NAME) DO NOTHING;

-- CONTACTS — LISTING
INSERT INTO UI_METADATA (ID, MODULE_ID, NAME, TYPE, METADATA_JSON) VALUES (gen_random_uuid()::VARCHAR,'CONTACTS','CONTACTS_LISTING','LISTING','{
  "module": "CONTACTS",
  "title": "Contacts",
  "FILTERS_FIELDS": [
    { "fieldId": "220001" },
    { "fieldId": "220004" },
    { "fieldId": "220006" },
    { "fieldId": "220009" },
    { "fieldId": "220014" },
    { "fieldId": "220002", "dataValues": [{"code":"Y","decode":"Yes"},{"code":"N","decode":"No"}] }
  ],
  "GRID_FIELDS": [
    { "fieldId": "220001" },
    { "fieldId": "220003" },
    { "fieldId": "220004" },
    { "fieldId": "220006" },
    { "fieldId": "220009" },
    { "fieldId": "220014" },
    { "fieldId": "220013" },
    { "fieldId": "220008" },
    { "fieldId": "220002" }
  ],
  "DASHBOARD_WIDGETS": [
    { "widgetId": "totalContacts",    "label": "lbl.widget_totalContacts",    "iconColor": "blue",   "icon": "M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0z", "filters": [] },
    { "widgetId": "activeContacts",   "label": "lbl.widget_activeContacts",   "iconColor": "green",  "icon": "M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z", "filters": [{ "field": "isActive", "operator": "eq", "value": "Y" }] },
    { "widgetId": "hcpContacts",      "label": "lbl.widget_hcpContacts",      "iconColor": "purple", "icon": "M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z", "filters": [{ "field": "contactCategory", "operator": "in", "value": ["INT_HCP","EXT_HCP"] }] }
  ]
}') ON CONFLICT (NAME) DO NOTHING;

-- CONTACTS — LOOKUP
INSERT INTO UI_METADATA (ID, MODULE_ID, NAME, TYPE, METADATA_JSON) VALUES (gen_random_uuid()::VARCHAR,'CONTACTS','CONTACTS_LOOKUP','LOOKUP','{
  "module": "CONTACTS",
  "title": "Contacts",
  "lookupModule": "CONTACTS",
  "storeValField": "contactId",
  "lkpStoreValField": "contactId",
  "lkpDispValField": "firstName",
  "FILTERS_FIELDS": [
    { "fieldId": "220001" },
    { "fieldId": "220004" },
    { "fieldId": "220006" },
    { "fieldId": "220002", "dataValues": [{"code":"Y","decode":"Yes"},{"code":"N","decode":"No"}] }
  ],
  "GRID_FIELDS": [
    { "fieldId": "220001" },
    { "fieldId": "220003" },
    { "fieldId": "220004" },
    { "fieldId": "220006" },
    { "fieldId": "220009" },
    { "fieldId": "220002" }
  ]
}') ON CONFLICT (NAME) DO NOTHING;

-- CONTACTS — I18N
INSERT INTO UI_METADATA (ID, MODULE_ID, NAME, TYPE, METADATA_JSON) VALUES (gen_random_uuid()::VARCHAR,'CONTACTS','CONTACTS_I18N','I18N','{
  "en": {
    "lbl.contactId":            "Contact ID",
    "lbl.active":               "Active",
    "lbl.title":                "Title",
    "lbl.firstName":            "First Name",
    "lbl.middleName":           "Middle Name",
    "lbl.lastName":             "Last Name",
    "lbl.contactMedium":        "Contact Medium",
    "lbl.doNotContact":         "Do Not Contact",
    "lbl.emailId":              "Email ID",
    "lbl.gender":               "Gender",
    "lbl.department":           "Department",
    "lbl.qualification":        "Qualification",
    "lbl.specialization":       "Specialization",
    "lbl.contactCategory":      "Contact Category",
    "lbl.phoneCountryCode":     "Country Code",
    "lbl.phoneAreaCode":        "Area Code",
    "lbl.phoneNumber":          "Ph Number",
    "lbl.faxCountryCode":       "Country Code",
    "lbl.faxAreaCode":          "Area Code",
    "lbl.faxNumber":            "Number",
    "lbl.isPrimary":            "Primary Address",
    "lbl.houseAptNumber":       "House / Apt Number",
    "lbl.address":              "Address",
    "lbl.country":              "Country",
    "lbl.city":                 "City",
    "lbl.state":                "State",
    "lbl.addressType":          "Address Type",
    "lbl.sec_contactDetails":   "Contact Details",
    "lbl.sec_phoneDetails":     "Contact Details (Phone & Fax)",
    "lbl.sec_addresses":        "Addresses",
    "lbl.widget_totalContacts": "Total Contacts",
    "lbl.widget_activeContacts":"Active",
    "lbl.widget_hcpContacts":   "HCP Contacts"
  },
  "fr": {
    "lbl.contactId":            "ID contact",
    "lbl.active":               "Actif",
    "lbl.title":                "Titre",
    "lbl.firstName":            "Prénom",
    "lbl.middleName":           "Deuxième prénom",
    "lbl.lastName":             "Nom de famille",
    "lbl.contactMedium":        "Moyen de contact",
    "lbl.doNotContact":         "Ne pas contacter",
    "lbl.emailId":              "Adresse e-mail",
    "lbl.gender":               "Genre",
    "lbl.department":           "Département",
    "lbl.qualification":        "Qualification",
    "lbl.specialization":       "Spécialisation",
    "lbl.contactCategory":      "Catégorie de contact",
    "lbl.phoneCountryCode":     "Indicatif pays",
    "lbl.phoneAreaCode":        "Indicatif régional",
    "lbl.phoneNumber":          "Numéro de téléphone",
    "lbl.faxCountryCode":       "Indicatif pays",
    "lbl.faxAreaCode":          "Indicatif régional",
    "lbl.faxNumber":            "Numéro de fax",
    "lbl.isPrimary":            "Adresse principale",
    "lbl.houseAptNumber":       "Numéro de maison / appartement",
    "lbl.address":              "Adresse",
    "lbl.country":              "Pays",
    "lbl.city":                 "Ville",
    "lbl.state":                "État / Province",
    "lbl.addressType":          "Type d''adresse",
    "lbl.sec_contactDetails":   "Détails du contact",
    "lbl.sec_phoneDetails":     "Coordonnées (téléphone et fax)",
    "lbl.sec_addresses":        "Adresses",
    "lbl.widget_totalContacts": "Total contacts",
    "lbl.widget_activeContacts":"Actif",
    "lbl.widget_hcpContacts":   "Contacts PS"
  },
  "ja": {
    "lbl.contactId":            "連絡先ID",
    "lbl.active":               "有効",
    "lbl.title":                "敬称",
    "lbl.firstName":            "名",
    "lbl.middleName":           "ミドルネーム",
    "lbl.lastName":             "姓",
    "lbl.contactMedium":        "連絡手段",
    "lbl.doNotContact":         "連絡不可",
    "lbl.emailId":              "メールアドレス",
    "lbl.gender":               "性別",
    "lbl.department":           "部門",
    "lbl.qualification":        "資格",
    "lbl.specialization":       "専門分野",
    "lbl.contactCategory":      "連絡先カテゴリ",
    "lbl.phoneCountryCode":     "国番号",
    "lbl.phoneAreaCode":        "市外局番",
    "lbl.phoneNumber":          "電話番号",
    "lbl.faxCountryCode":       "国番号",
    "lbl.faxAreaCode":          "市外局番",
    "lbl.faxNumber":            "ファックス番号",
    "lbl.isPrimary":            "主要住所",
    "lbl.houseAptNumber":       "番地・部屋番号",
    "lbl.address":              "住所",
    "lbl.country":              "国",
    "lbl.city":                 "市区町村",
    "lbl.state":                "都道府県",
    "lbl.addressType":          "住所種別",
    "lbl.sec_contactDetails":   "連絡先詳細",
    "lbl.sec_phoneDetails":     "連絡先（電話・ファックス）",
    "lbl.sec_addresses":        "住所",
    "lbl.widget_totalContacts": "連絡先合計",
    "lbl.widget_activeContacts":"有効",
    "lbl.widget_hcpContacts":   "医療従事者連絡先"
  }
}') ON CONFLICT (NAME) DO NOTHING;
