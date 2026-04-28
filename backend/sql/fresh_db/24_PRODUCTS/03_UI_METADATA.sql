-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 03_UI_METADATA.sql
-- Module  : PRODUCTS
-- Purpose : FORM, LISTING, LOOKUP, I18N metadata
--           Form sections reference fieldId only — all render
--           config lives in TABLE_COLUMN_METADATA.UI_METADATA.
-- ============================================================

-- PRODUCTS — FORM
INSERT INTO UI_METADATA (ID, MODULE_ID, NAME, TYPE, METADATA_JSON) VALUES (gen_random_uuid()::VARCHAR,'PRODUCTS','PRODUCTS_FULL_FORM','FORM','{
  "formID": "FULL_FORM",
  "formName": "Drug Products Library",
  "version": "1.0",
  "layout": {
    "recordTitleField": "preferredDescription",
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
	"sectionId": "260_001", "title": "lbl.sec_productDetails", "sequence": 1, "multiContext": false, "tabPanel": true,
	"fields": [
	  { "fieldId": "260001" },
	  { "fieldId": "260003" },
	  { "fieldId": "260002" },
	  
	  { "fieldId": "line1", "dataType":"line-separator"},
	  { "fieldId": "260004" },
	  { "fieldId": "260005" },
	  
	  { "fieldId": "line1", "dataType":"line-separator"},
	  { "fieldId": "260011" },
	  { "fieldId": "260012" },
	  
	  { "fieldId": "260013" },
	  { "fieldId": "260014" },
	  { "fieldId": "260020" },
	  
	  { "fieldId": "260019" },
	  { "fieldId": "260021" },
	  { "fieldId": "260022" },
	  
	  { "fieldId": "line1", "dataType":"line-separator"},
	  { "fieldId": "260006" },
	  { "fieldId": "260007" },
	  
	  { "fieldId": "260008" },
	  { "fieldId": "260009" },
	  
	  { "fieldId": "260017" },
	  { "fieldId": "260018" },
	  
	  
	  { "fieldId": "260015" },
	  { "fieldId": "260016" },
	  
	  { "fieldId": "260010" }
	]
  },
  {
	"sectionId": "260_003", "title": "lbl.sec_deviceInfo", "sequence": 3, "multiContext": false, "tabPanel": true,
	"fields": [
	  { "fieldId": "260023" },
	  { "fieldId": "260024" },
	  { "fieldId": "260025" },
	  { "fieldId": "260026" },
	  { "fieldId": "260027" },
	  { "fieldId": "260028" },
	  { "fieldId": "260029" },
	  { "fieldId": "260030" }
	]
  },
  {
	"sectionId": "261_001", "title": "lbl.sec_substances", "sequence": 4, "multiContext": true,
	"contextPath": "substances$", "tabPanel": true,
	"dataGridConfig": { "allowAdd": true, "allowDelete": true, "allowCopy": false, "pagination": true, "pageSizeOptions": [5, 10] },
	"fields": [
	  { "fieldId": "261001" },
	  { "fieldId": "261002" },
	  { "fieldId": "261003" }
	],
	"gridFields": [
	  { "fieldId": "261001" },
	  { "fieldId": "261002" },
	  { "fieldId": "261003" }
	]
  },
  {
	"sectionId": "262_001", "title": "lbl.sec_localTradeNames", "sequence": 5, "multiContext": true,
	"contextPath": "localTradeNames$", "tabPanel": true,
	"dataGridConfig": { "allowAdd": true, "allowDelete": true, "allowCopy": true, "pagination": true, "pageSizeOptions": [5, 10, 25] },
	"fields": [
	  { "fieldId": "262001" },
	  
	  { "fieldId": "line1", "dataType":"line-separator"},
	  { "fieldId": "262005" },
	  { "fieldId": "262004" },
	  { "fieldId": "262007" },
	  
	  { "fieldId": "262002" },
	  { "fieldId": "262003" },
	  { "fieldId": "262006" },
	  { "fieldId": "262008" },
	  { "fieldId": "262009" },
	  { "fieldId": "262010" }
	],
	"gridFields": [
	  { "fieldId": "262001" },
	  { "fieldId": "262005" },
	  { "fieldId": "262004" },
	  { "fieldId": "262007" },
	  { "fieldId": "262006" }
	]
  },
  {
	"sectionId": "263_001", "title": "lbl.sec_synonyms", "sequence": 6, "multiContext": true,
	"contextPath": "synonyms$", "tabPanel": true,
	"dataGridConfig": { "allowAdd": true, "allowDelete": true, "allowCopy": false, "pagination": true, "pageSizeOptions": [5, 10, 25] },
	"fields": [
	  { "fieldId": "263001" },
	  { "fieldId": "263002" }
	],
	"gridFields": [
	  { "fieldId": "263001" },
	  { "fieldId": "263002" }
	]
  }]
}') ON CONFLICT (NAME) DO NOTHING;

-- PRODUCTS — LISTING
INSERT INTO UI_METADATA (ID, MODULE_ID, NAME, TYPE, METADATA_JSON) VALUES (gen_random_uuid()::VARCHAR,'PRODUCTS','PRODUCTS_LISTING','LISTING','{
  "module": "PRODUCTS",
  "title": "Drug Products Library",
  "FILTERS_FIELDS": [
    { "fieldId": "260001" },
    { "fieldId": "260002" },
    { "fieldId": "260004" },
    { "fieldId": "260013" },
    { "fieldId": "260020" },
    { "fieldId": "260003", "dataValues": [{"code":"Y","decode":"Yes"},{"code":"N","decode":"No"}] }
  ],
  "GRID_FIELDS": [
    { "fieldId": "260001" },
    { "fieldId": "260002" },
    { "fieldId": "260004" },
    { "fieldId": "260006" },
    { "fieldId": "260008" },
    { "fieldId": "260011" },
    { "fieldId": "260021" },
    { "fieldId": "260003" }
  ],
  "DASHBOARD_WIDGETS": [
    { "widgetId": "totalProducts",   "label": "lbl.widget_totalProducts",   "iconColor": "blue",   "icon": "M9 3a4 4 0 00-4 4v10a4 4 0 008 0V7a4 4 0 00-4-4zm0 2a2 2 0 012 2v4H7V7a2 2 0 012-2zm0 8v4a2 2 0 01-4 0v-4h4zM17.5 3.5l3 3-7 7-1.5-1.5 7-7zM15 13l1.5 1.5-1 1L14 14l1-1zM20 2l2 2-1 1-2-2 1-1z", "filters": [] },
    { "widgetId": "activeProducts",  "label": "lbl.widget_activeProducts",  "iconColor": "green",  "icon": "M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z", "filters": [{ "field": "isActive", "operator": "eq", "value": "Y" }] },
    { "widgetId": "companyProducts", "label": "lbl.widget_companyProducts", "iconColor": "purple", "icon": "M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-2 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4", "filters": [{ "field": "companyProduct", "operator": "eq", "value": "Y" }] }
  ]
}') ON CONFLICT (NAME) DO NOTHING;

-- PRODUCTS — LOOKUP
INSERT INTO UI_METADATA (ID, MODULE_ID, NAME, TYPE, METADATA_JSON) VALUES (gen_random_uuid()::VARCHAR,'PRODUCTS','PRODUCTS_LOOKUP','LOOKUP','{
  "module": "PRODUCTS",
  "title": "Drug Products Library",
  "lookupModule": "PRODUCTS",
  "storeValField": "productId",
  "lkpStoreValField": "productId",
  "lkpDispValField": "preferredDescription",
  "FILTERS_FIELDS": [
    { "fieldId": "260001" },
    { "fieldId": "260002" },
    { "fieldId": "260004" },
    { "fieldId": "260003", "dataValues": [{"code":"Y","decode":"Yes"},{"code":"N","decode":"No"}] }
  ],
  "GRID_FIELDS": [
    { "fieldId": "260001" },
    { "fieldId": "260002" },
    { "fieldId": "260004" },
    { "fieldId": "260006" },
    { "fieldId": "260003" }
  ]
}') ON CONFLICT (NAME) DO NOTHING;

-- PRODUCTS — I18N
INSERT INTO UI_METADATA (ID, MODULE_ID, NAME, TYPE, METADATA_JSON) VALUES (gen_random_uuid()::VARCHAR,'PRODUCTS','PRODUCTS_I18N','I18N','{
  "en": {
    "lbl.productId":                "Product ID",
    "lbl.preferredDescription":     "Preferred Description",
    "lbl.active":                   "Active",
    "lbl.productFlag":              "Product Flag",
    "lbl.productClass":             "Product Class",
    "lbl.routeOfAdmin":             "Route of Administration",
    "lbl.routeOfAdminTermId":       "Route of Admin Term ID",
    "lbl.formOfAdmin":              "Form of Administration",
    "lbl.pharmaDoseFormTermId":     "Pharmaceutical Dose Form Term ID",
    "lbl.description":              "Description",
    "lbl.manufacturerName":         "Manufacturer Name",
    "lbl.manufacturerCode":         "Manufacturer Code",
    "lbl.vigilanceType":            "Vigilance Type",
    "lbl.vaccineType":              "Vaccine Type",
    "lbl.productKeywords":          "Product Keywords",
    "lbl.productActiveIngredient":  "Product Active Ingredient",
    "lbl.whoDdCode":                "WHO DD Code",
    "lbl.whoDdDecode":              "WHO DD Decode",
    "lbl.internalDrugCode":         "Internal Drug Code",
    "lbl.madeBy":                   "Made By",
    "lbl.companyProduct":           "Company Product",
    "lbl.subjectToRiskMgmt":        "Subject to Risk Management",
    "lbl.brandName":                "Brand Name",
    "lbl.modelNumber":              "Model Number",
    "lbl.catalogueNumber":          "Catalogue Number",
    "lbl.deviceComponentName":      "Device Component Name",
    "lbl.deviceComponentTermId":    "Device Component Term ID",
    "lbl.deviceComponentTermIdVer": "Device Component Term ID Ver.",
    "lbl.manufacturedBy":           "Manufactured By",
    "lbl.deviceMfgSite":            "Device Manufacturing Site",
    "lbl.substanceId":              "Substance ID",
    "lbl.substanceName":            "Substance Name",
    "lbl.ltn":                      "Local Trade Name",
    "lbl.ndcCode":                  "NDC Code",
    "lbl.atcCode":                  "ATC Code",
    "lbl.authorizationNo":          "Authorization No.",
    "lbl.approvalType":             "Approval Type",
    "lbl.mah":                      "Marketing Authorization Holder",
    "lbl.authorizationCountry":     "Authorization Country",
    "lbl.submissionType":           "Submission Type",
    "lbl.synonymName":              "Synonym Name",
    "lbl.sec_productDetails":       "Product Details",
    "lbl.sec_adminDetails":         "Administration & Coding",
    "lbl.sec_deviceInfo":           "Device Information",
    "lbl.sec_substances":           "Substances",
    "lbl.sec_localTradeNames":      "Local Trade Names",
    "lbl.sec_synonyms":             "Synonyms",
    "lbl.widget_totalProducts":     "Total Products",
    "lbl.widget_activeProducts":    "Active",
    "lbl.widget_companyProducts":   "Company Products"
  },
  "fr": {
    "lbl.productId":                "ID produit",
    "lbl.preferredDescription":     "Description préférée",
    "lbl.active":                   "Actif",
    "lbl.productFlag":              "Indicateur produit",
    "lbl.productClass":             "Classe produit",
    "lbl.routeOfAdmin":             "Voie d''administration",
    "lbl.routeOfAdminTermId":       "ID terme voie d''administration",
    "lbl.formOfAdmin":              "Forme d''administration",
    "lbl.pharmaDoseFormTermId":     "ID terme forme pharmaceutique",
    "lbl.description":              "Description",
    "lbl.manufacturerName":         "Nom du fabricant",
    "lbl.manufacturerCode":         "Code fabricant",
    "lbl.vigilanceType":            "Type de vigilance",
    "lbl.vaccineType":              "Type de vaccin",
    "lbl.productKeywords":          "Mots-clés produit",
    "lbl.productActiveIngredient":  "Principe actif",
    "lbl.whoDdCode":                "Code WHO DD",
    "lbl.whoDdDecode":              "Décodage WHO DD",
    "lbl.internalDrugCode":         "Code médicament interne",
    "lbl.madeBy":                   "Fabriqué par",
    "lbl.companyProduct":           "Produit de la société",
    "lbl.subjectToRiskMgmt":        "Soumis à un plan de gestion des risques",
    "lbl.brandName":                "Nom de marque",
    "lbl.modelNumber":              "Numéro de modèle",
    "lbl.catalogueNumber":          "Numéro de catalogue",
    "lbl.deviceComponentName":      "Nom du composant",
    "lbl.deviceComponentTermId":    "ID terme composant",
    "lbl.deviceComponentTermIdVer": "Version ID terme composant",
    "lbl.manufacturedBy":           "Fabriqué par",
    "lbl.deviceMfgSite":            "Site de fabrication",
    "lbl.substanceId":              "ID substance",
    "lbl.substanceName":            "Nom de la substance",
    "lbl.ltn":                      "Nom commercial local",
    "lbl.ndcCode":                  "Code NDC",
    "lbl.atcCode":                  "Code ATC",
    "lbl.authorizationNo":          "Numéro d''autorisation",
    "lbl.approvalType":             "Type d''approbation",
    "lbl.mah":                      "Titulaire de l''AMM",
    "lbl.authorizationCountry":     "Pays d''autorisation",
    "lbl.submissionType":           "Type de soumission",
    "lbl.synonymName":              "Nom du synonyme",
    "lbl.sec_productDetails":       "Détails du produit",
    "lbl.sec_adminDetails":         "Administration et codage",
    "lbl.sec_deviceInfo":           "Informations sur le dispositif",
    "lbl.sec_substances":           "Substances",
    "lbl.sec_localTradeNames":      "Noms commerciaux locaux",
    "lbl.sec_synonyms":             "Synonymes",
    "lbl.widget_totalProducts":     "Total produits",
    "lbl.widget_activeProducts":    "Actif",
    "lbl.widget_companyProducts":   "Produits de la société"
  },
  "ja": {
    "lbl.productId":                "製品ID",
    "lbl.preferredDescription":     "優先説明",
    "lbl.active":                   "有効",
    "lbl.productFlag":              "製品フラグ",
    "lbl.productClass":             "製品クラス",
    "lbl.routeOfAdmin":             "投与経路",
    "lbl.routeOfAdminTermId":       "投与経路TermID",
    "lbl.formOfAdmin":              "投与剤形",
    "lbl.pharmaDoseFormTermId":     "医薬品剤形TermID",
    "lbl.description":              "説明",
    "lbl.manufacturerName":         "製造業者名",
    "lbl.manufacturerCode":         "製造業者コード",
    "lbl.vigilanceType":            "ビジランスタイプ",
    "lbl.vaccineType":              "ワクチン種別",
    "lbl.productKeywords":          "製品キーワード",
    "lbl.productActiveIngredient":  "有効成分",
    "lbl.whoDdCode":                "WHO DDコード",
    "lbl.whoDdDecode":              "WHO DDデコード",
    "lbl.internalDrugCode":         "社内薬品コード",
    "lbl.madeBy":                   "製造元",
    "lbl.companyProduct":           "自社製品",
    "lbl.subjectToRiskMgmt":        "リスク管理計画対象",
    "lbl.brandName":                "ブランド名",
    "lbl.modelNumber":              "型番",
    "lbl.catalogueNumber":          "カタログ番号",
    "lbl.deviceComponentName":      "デバイス構成部品名",
    "lbl.deviceComponentTermId":    "デバイス構成部品TermID",
    "lbl.deviceComponentTermIdVer": "デバイス構成部品TermIDバージョン",
    "lbl.manufacturedBy":           "製造業者",
    "lbl.deviceMfgSite":            "製造サイト",
    "lbl.substanceId":              "物質ID",
    "lbl.substanceName":            "物質名",
    "lbl.ltn":                      "現地商品名",
    "lbl.ndcCode":                  "NDCコード",
    "lbl.atcCode":                  "ATCコード",
    "lbl.authorizationNo":          "承認番号",
    "lbl.approvalType":             "承認種別",
    "lbl.mah":                      "製造販売承認取得者",
    "lbl.authorizationCountry":     "承認国",
    "lbl.submissionType":           "申請種別",
    "lbl.synonymName":              "同義語名",
    "lbl.sec_productDetails":       "製品詳細",
    "lbl.sec_adminDetails":         "投与・コーディング",
    "lbl.sec_deviceInfo":           "デバイス情報",
    "lbl.sec_substances":           "物質",
    "lbl.sec_localTradeNames":      "現地商品名",
    "lbl.sec_synonyms":             "同義語",
    "lbl.widget_totalProducts":     "製品合計",
    "lbl.widget_activeProducts":    "有効",
    "lbl.widget_companyProducts":   "自社製品"
  }
}') ON CONFLICT (NAME) DO NOTHING;
