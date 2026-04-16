-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 03_UI_METADATA.sql
-- Module  : APP_ROLES
-- Purpose : FORM, LISTING, LOOKUP, I18N metadata
--           Form sections reference fieldId only — all render
--           config lives in TABLE_COLUMN_METADATA.UI_METADATA.
-- ============================================================

-- APP_ROLES — FORM
INSERT INTO UI_METADATA (ID, MODULE_ID, NAME, TYPE, METADATA_JSON) VALUES (gen_random_uuid()::VARCHAR,'APP_ROLES','USER_ROLES_FULL_FORM','FORM','{
  "formID": "FULL_FORM",
  "formName": "User Roles",
  "version": "2.0",
  "layout": {
    "recordTitleField": "roleName",
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
    "sectionId": "140", "title": "Role", "sequence": 1, "multiContext": false,
    "sections": [
      {
        "sectionId": "140_001", "title": "lbl.sec_roleDetails", "sequence": 1, "multiContext": false, "tabPanel": true,
        "fields": [
          { "fieldId": "140001" },
          { "fieldId": "140002" },
          { "fieldId": "140003" }
        ]
      },
      {
        "sectionId": "145_001", "title": "lbl.sec_privileges", "sequence": 2, "multiContext": true,
        "contextPath": "privileges$", "tabPanel": true,
        "dataGridConfig": {"disableDelete":true },
        "fields": [
          { "fieldId": "145002" },
          { "fieldId": "145003" },
          { "fieldId": "145004" }
        ],
        "gridFields": [
          { "fieldId": "145002" },
          { "fieldId": "145003" },
          { "fieldId": "145004" }
        ]
      }
    ]
  }]
}') ON CONFLICT (NAME) DO NOTHING;

-- APP_ROLES — LISTING
INSERT INTO UI_METADATA (ID, MODULE_ID, NAME, TYPE, METADATA_JSON) VALUES (gen_random_uuid()::VARCHAR,'APP_ROLES','USER_ROLES_LISTING','LISTING','{
  "module": "APP_ROLES",
  "title": "User Roles",
  "FILTERS_FIELDS": [
    { "fieldId": "140001" },
    { "fieldId": "140002" },
    { "fieldId": "140003", "renderAs":"combo", "dataValues": [{"code":"Y","decode":"Yes"},{"code":"N","decode":"No"}] }
  ],
  "GRID_FIELDS": [
    { "fieldId": "140001" },
    { "fieldId": "140002" },
    { "fieldId": "140003" }
  ],
  "DASHBOARD_WIDGETS": [
    { "widgetId": "totalRoles",  "label": "lbl.widget_totalRoles",  "iconColor": "blue",  "icon": "M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z", "filters": [] },
    { "widgetId": "activeRoles", "label": "lbl.widget_activeRoles", "iconColor": "green", "icon": "M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z", "filters": [{ "field": "isActive", "operator": "eq", "value": "Y" }] }
  ]
}') ON CONFLICT (NAME) DO NOTHING;

-- APP_ROLES — LOOKUP
INSERT INTO UI_METADATA (ID, MODULE_ID, NAME, TYPE, METADATA_JSON) VALUES (gen_random_uuid()::VARCHAR,'APP_ROLES','USER_ROLES_LOOKUP','LOOKUP','{
  "module": "APP_ROLES",
  "title": "User Roles",
  "FILTERS_FIELDS": [
    { "fieldId": "140001" },
    { "fieldId": "140002" }
  ],
  "GRID_FIELDS": [
    { "fieldId": "140001" },
    { "fieldId": "140002" }
  ]
}') ON CONFLICT (NAME) DO NOTHING;

-- APP_ROLES — I18N
INSERT INTO UI_METADATA (ID, MODULE_ID, NAME, TYPE, METADATA_JSON) VALUES (gen_random_uuid()::VARCHAR,'APP_ROLES','USER_ROLES_I18N','I18N','{
  "en": {
    "lbl.roleId":               "Role ID",
    "lbl.roleName":             "Role Name",
    "lbl.moduleId":             "Module",
    "lbl.readAccess":           "Read Access",
    "lbl.writeAccess":          "Write Access",
    "lbl.active":               "Active",
    "lbl.sec_roleDetails":      "Role Details",
    "lbl.sec_privileges":       "Module Privileges",
    "lbl.widget_totalRoles":    "Total Roles",
    "lbl.widget_activeRoles":   "Active"
  },
  "fr": {
    "lbl.roleId":               "ID du rôle",
    "lbl.roleName":             "Nom du rôle",
    "lbl.moduleId":             "Module",
    "lbl.readAccess":           "Accès en lecture",
    "lbl.writeAccess":          "Accès en écriture",
    "lbl.active":               "Actif",
    "lbl.sec_roleDetails":      "Détails du rôle",
    "lbl.sec_privileges":       "Privilèges du module",
    "lbl.widget_totalRoles":    "Total des rôles",
    "lbl.widget_activeRoles":   "Actif"
  },
  "de": {
    "lbl.roleId":               "Rollen-ID",
    "lbl.roleName":             "Rollenname",
    "lbl.moduleId":             "Modul",
    "lbl.readAccess":           "Lesezugriff",
    "lbl.writeAccess":          "Schreibzugriff",
    "lbl.active":               "Aktiv",
    "lbl.sec_roleDetails":      "Rollendetails",
    "lbl.sec_privileges":       "Modulberechtigungen",
    "lbl.widget_totalRoles":    "Rollen gesamt",
    "lbl.widget_activeRoles":   "Aktiv"
  }
}') ON CONFLICT (NAME) DO NOTHING;
