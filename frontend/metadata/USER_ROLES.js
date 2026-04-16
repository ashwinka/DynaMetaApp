(() => {
  window.offline_metadata = {
    "formMetadata": {
      "module": "APP_ROLES",
      "FORMS": {
        "USER_ROLES_FULL_FORM": {
          "formID": "FULL_FORM",
          "formName": "User Roles",
          "version": "2.0",
          "layout": {
            "recordTitleField": "roleName",
            "enableFilterSection": false,
            "navigationWidth": "260px",
            "formPanelWidth": "75%",
            "responsive": {
              "webFieldsPerRow": 3,
              "tabletFieldsPerRow": 2,
              "mobileFieldsPerRow": 1
            }
          },
          "formHeaderActions": [{
              "actionId": "save",
              "label": "app.save",
              "icon": "save",
              "type": "standard"
            },
            {
              "actionId": "cancel",
              "label": "app.cancel",
              "icon": "close"
            }
          ],
          "sections": [{
            "sectionId": "140",
            "title": "Role",
            "sequence": 1,
            "multiContext": false,
            "sections": [{
                "sectionId": "140_001",
                "title": "lbl.sec_roleDetails",
                "sequence": 1,
                "multiContext": false,
                "tabPanel": true,
                "fields": [{
                    "fieldId": "140001"
                  },
                  {
                    "fieldId": "140002"
                  },
                  {
                    "fieldId": "140003"
                  }
                ]
              },
              {
                "sectionId": "145_001",
                "title": "lbl.sec_privileges",
                "sequence": 2,
                "multiContext": true,
                "contextPath": "privileges$",
                "tabPanel": true,
                "dataGridConfig": {
                  "disableDelete": true
                },
                "fields": [{
                    "fieldId": "145002"
                  },
                  {
                    "fieldId": "145003"
                  },
                  {
                    "fieldId": "145004"
                  }
                ],
                "gridFields": [{
                    "fieldId": "145002"
                  },
                  {
                    "fieldId": "145003"
                  },
                  {
                    "fieldId": "145004"
                  }
                ]
              }
            ]
          }]
        }
      }
    },
    "listingMetadata": {
      "module": "APP_ROLES",
      "title": "User Roles",
      "FILTERS_FIELDS": [{
          "fieldId": "140001"
        },
        {
          "fieldId": "140002"
        },
        {
          "fieldId": "140003",
          "renderAs": "combo",
          "dataValues": [{
              "code": "Y",
              "decode": "Yes"
            },
            {
              "code": "N",
              "decode": "No"
            }
          ]
        }
      ],
      "GRID_FIELDS": [{
          "fieldId": "140001"
        },
        {
          "fieldId": "140002"
        },
        {
          "fieldId": "140003"
        }
      ],
      "DASHBOARD_WIDGETS": [{
          "widgetId": "totalRoles",
          "label": "lbl.widget_totalRoles",
          "iconColor": "blue",
          "icon": "M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z",
          "filters": []
        },
        {
          "widgetId": "activeRoles",
          "label": "lbl.widget_activeRoles",
          "iconColor": "green",
          "icon": "M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z",
          "filters": [{
            "field": "isActive",
            "operator": "eq",
            "value": "Y"
          }]
        }
      ]
    },
    "lookupMetadata": {
      "module": "APP_ROLES",
      "title": "User Roles",
      "FILTERS_FIELDS": [{
          "fieldId": "140001"
        },
        {
          "fieldId": "140002"
        }
      ],
      "GRID_FIELDS": [{
          "fieldId": "140001"
        },
        {
          "fieldId": "140002"
        }
      ]
    },
    "i18nTrans": {
      "en": {
        "lbl.roleId": "Role ID",
        "lbl.roleName": "Role Name",
        "lbl.moduleId": "Module",
        "lbl.readAccess": "Read Access",
        "lbl.writeAccess": "Write Access",
        "lbl.active": "Active",
        "lbl.sec_roleDetails": "Role Details",
        "lbl.sec_privileges": "Module Privileges",
        "lbl.widget_totalRoles": "Total Roles",
        "lbl.widget_activeRoles": "Active"
      },
      "fr": {
        "lbl.roleId": "ID du rôle",
        "lbl.roleName": "Nom du rôle",
        "lbl.moduleId": "Module",
        "lbl.readAccess": "Accès en lecture",
        "lbl.writeAccess": "Accès en écriture",
        "lbl.active": "Actif",
        "lbl.sec_roleDetails": "Détails du rôle",
        "lbl.sec_privileges": "Privilèges du module",
        "lbl.widget_totalRoles": "Total des rôles",
        "lbl.widget_activeRoles": "Actif"
      },
      "de": {
        "lbl.roleId": "Rollen-ID",
        "lbl.roleName": "Rollenname",
        "lbl.moduleId": "Modul",
        "lbl.readAccess": "Lesezugriff",
        "lbl.writeAccess": "Schreibzugriff",
        "lbl.active": "Aktiv",
        "lbl.sec_roleDetails": "Rollendetails",
        "lbl.sec_privileges": "Modulberechtigungen",
        "lbl.widget_totalRoles": "Rollen gesamt",
        "lbl.widget_activeRoles": "Aktiv"
      }
    },
    "fields": [{
        "id": "1e1dafdf-4df6-46c6-9599-5d80a572b575",
        "moduleId": "APP_ROLES",
        "tableId": "140",
        "fieldId": "140002",
        "columnName": "ROLE_NAME",
        "fieldName": "roleName",
        "fieldPath": "roleName",
        "dataType": "TEXT",
        "maxLength": 300,
        "requiredField": "Y",
        "listingAlias": "roleName",
        "label": "lbl.roleName",
        "description": "Display name of the role",
        "uiMetadata": "{\"renderAs\":\"text\",        \"fieldWidth\":\"2\", \"columnWidth\":\"28ch\", \"allowSorting\":true}"
      },
      {
        "id": "730a142d-c49a-4944-b085-61142b0873b8",
        "moduleId": "APP_ROLES",
        "tableId": "140",
        "fieldId": "140003",
        "columnName": "IS_ACTIVE",
        "fieldName": "isActive",
        "fieldPath": "isActive",
        "dataType": "TEXT",
        "maxLength": 1,
        "requiredField": "N",
        "listingAlias": "isActive",
        "label": "lbl.active",
        "description": "Indicates whether the role is active",
        "uiMetadata": "{\"renderAs\":\"bool-switch\", \"fieldWidth\":\"1\", \"columnWidth\":\"8ch\",  \"allowSorting\":true,  \"align\":\"center\"}"
      },
      {
        "id": "75f75a88-796f-44b1-9b51-fdf8fe72723a",
        "moduleId": "APP_ROLES",
        "tableId": "140",
        "fieldId": "140001",
        "columnName": "ROLE_ID",
        "fieldName": "roleId",
        "fieldPath": "roleId",
        "dataType": "TEXT",
        "maxLength": 300,
        "requiredField": "Y",
        "listingAlias": "roleId",
        "label": "lbl.roleId",
        "description": "Unique identifier for the role (e.g. ADMIN, CASE_MGR)",
        "uiMetadata": "{\"renderAs\":\"text\",        \"fieldWidth\":\"1\", \"columnWidth\":\"16ch\", \"allowSorting\":true,  \"primaryKey\":true}"
      },
      {
        "id": "b1fd504d-c482-46d2-8015-b55f577a0abb",
        "moduleId": "APP_ROLES",
        "tableId": "145",
        "fieldId": "145004",
        "columnName": "WRITE_ACCESS",
        "fieldName": "writeAccess",
        "fieldPath": "privileges$.writeAccess",
        "dataType": "TEXT",
        "maxLength": 1,
        "requiredField": "N",
        "listingAlias": "writeAccess",
        "label": "lbl.writeAccess",
        "description": "Grants write access to the module",
        "uiMetadata": "{\"renderAs\":\"bool-switch\", \"fieldWidth\":\"1\", \"columnWidth\":\"12ch\", \"allowSorting\":false}"
      },
      {
        "id": "ca9c238e-2e3c-452b-b7ac-b7cbea221602",
        "moduleId": "APP_ROLES",
        "tableId": "145",
        "fieldId": "145002",
        "columnName": "MODULE_ID",
        "fieldName": "moduleId",
        "fieldPath": "privileges$.moduleId",
        "dataType": "TEXT",
        "maxLength": 300,
        "requiredField": "Y",
        "listingAlias": "moduleId",
        "label": "lbl.moduleId",
        "description": "Module ID the privilege applies to (* = all modules)",
        "uiMetadata": "{\"renderAs\":\"text\",        \"fieldWidth\":\"1\", \"columnWidth\":\"24ch\", \"allowSorting\":true}"
      },
      {
        "id": "e95e2578-dab2-413e-9cf8-a1a3a9b6b7b1",
        "moduleId": "APP_ROLES",
        "tableId": "145",
        "fieldId": "145003",
        "columnName": "READ_ACCESS",
        "fieldName": "readAccess",
        "fieldPath": "privileges$.readAccess",
        "dataType": "TEXT",
        "maxLength": 1,
        "requiredField": "N",
        "listingAlias": "readAccess",
        "label": "lbl.readAccess",
        "description": "Grants read access to the module",
        "uiMetadata": "{\"renderAs\":\"bool-switch\", \"fieldWidth\":\"1\", \"columnWidth\":\"12ch\", \"allowSorting\":false}"
      },
      {
        "id": "eab9c003-f6d3-41c0-a3b9-7311461325ce",
        "moduleId": "APP_ROLES",
        "tableId": "145",
        "fieldId": "145001",
        "columnName": "ROLE_ID",
        "fieldName": "roleId",
        "fieldPath": "privileges$.roleId",
        "dataType": "TEXT",
        "maxLength": 300,
        "requiredField": "Y",
        "listingAlias": "roleId",
        "label": "lbl.roleId",
        "description": "Role this privilege row belongs to",
        "uiMetadata": "{\"renderAs\":\"text\",        \"fieldWidth\":\"1\", \"columnWidth\":\"16ch\", \"allowSorting\":true,  \"hidden\":true}"
      }
    ]

  }

})();
