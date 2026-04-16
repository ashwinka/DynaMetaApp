(() => {
  window.offline_metadata = {
    "formMetadata": {
      "module": "APP_USERS",
      "FORMS": {
        "USERS_FULL_FORM": {
          "formID": "FULL_FORM",
          "formName": "User Management",
          "version": "2.0",
          "layout": {
            "recordTitleField": "fullName",
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
              "actionId": "resetPassword",
              "label": "app.resetPassword",
              "icon": "key",
              "type": "moreAction"
            },
            {
              "actionId": "cancel",
              "label": "app.cancel",
              "icon": "close"
            }
          ],
          "sections": [{
            "sectionId": "130",
            "title": "lbl.sec_userDetails",
            "sequence": 1,
            "multiContext": false,
            "fields": [{
                "fieldId": "130001"
              },
              {
                "fieldId": "130002"
              },
              {
                "fieldId": "130003"
              },
              {
                "fieldId": "130007"
              },
              {
                "fieldId": "130005"
              }
            ]
          }]
        }
      }
    },
    "listingMetadata": {
      "module": "APP_USERS",
      "title": "User Management",
      "FILTERS_FIELDS": [{
          "fieldId": "130001"
        },
        {
          "fieldId": "130002"
        },
        {
          "fieldId": "130003"
        },
        {
          "fieldId": "130007",
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
          "fieldId": "130001"
        },
        {
          "fieldId": "130002"
        },
        {
          "fieldId": "130003"
        },
        {
          "fieldId": "130005"
        },
        {
          "fieldId": "130006"
        },
        {
          "fieldId": "130007"
        }
      ],
      "DASHBOARD_WIDGETS": [{
          "widgetId": "totalUsers",
          "label": "lbl.widget_totalUsers",
          "iconColor": "blue",
          "icon": "M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z",
          "filters": []
        },
        {
          "widgetId": "activeUsers",
          "label": "lbl.widget_activeUsers",
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
      "module": "APP_USERS",
      "title": "Users",
      "FILTERS_FIELDS": [{
          "fieldId": "130001"
        },
        {
          "fieldId": "130002"
        }
      ],
      "GRID_FIELDS": [{
          "fieldId": "130001"
        },
        {
          "fieldId": "130002"
        },
        {
          "fieldId": "130003"
        }
      ]
    },
    "i18nTrans": {
      "en": {
        "lbl.userName": "Username",
        "lbl.fullName": "Full Name",
        "lbl.emailId": "Email",
        "lbl.passwordHash": "Password",
        "lbl.roles": "Roles",
        "lbl.lastLogin": "Last Login",
        "lbl.active": "Active",
        "lbl.sec_userDetails": "User Details",
        "lbl.widget_totalUsers": "Total Users",
        "lbl.widget_activeUsers": "Active"
      },
      "fr": {
        "lbl.userName": "Nom d'utilisateur",
        "lbl.fullName": "Nom complet",
        "lbl.emailId": "Email",
        "lbl.passwordHash": "Mot de passe",
        "lbl.roles": "Rôles",
        "lbl.lastLogin": "Dernière connexion",
        "lbl.active": "Actif",
        "lbl.sec_userDetails": "Détails de l'utilisateur",
        "lbl.widget_totalUsers": "Total utilisateurs",
        "lbl.widget_activeUsers": "Actif"
      },
      "ja": {
        "lbl.userName": "ユーザー名",
        "lbl.fullName": "氏名",
        "lbl.emailId": "メールアドレス",
        "lbl.passwordHash": "パスワード",
        "lbl.roles": "ロール",
        "lbl.lastLogin": "最終ログイン",
        "lbl.active": "有効",
        "lbl.sec_userDetails": "ユーザー詳細",
        "lbl.widget_totalUsers": "ユーザー合計",
        "lbl.widget_activeUsers": "有効"
      }
    },
    "fields": [{
        "id": "4bf0c675-f01d-4c19-b784-5d200144ea9f",
        "moduleId": "APP_USERS",
        "tableId": "130",
        "fieldId": "130001",
        "columnName": "USER_NAME",
        "fieldName": "userName",
        "fieldPath": "userName",
        "dataType": "TEXT",
        "maxLength": 300,
        "requiredField": "Y",
        "listingAlias": "userName",
        "label": "lbl.userName",
        "description": "Unique login username for the user",
        "uiMetadata": "{\"renderAs\":\"text\",        \"fieldWidth\":\"1\", \"columnWidth\":\"16ch\", \"allowSorting\":true,  \"primaryKey\":true}"
      },
      {
        "id": "9e2dee99-1f08-4f06-aefd-b4536e59697d",
        "moduleId": "APP_USERS",
        "tableId": "130",
        "fieldId": "130007",
        "columnName": "IS_ACTIVE",
        "fieldName": "isActive",
        "fieldPath": "isActive",
        "dataType": "TEXT",
        "maxLength": 1,
        "requiredField": "N",
        "listingAlias": "isActive",
        "label": "lbl.active",
        "description": "Indicates whether the user account is active",
        "uiMetadata": "{\"renderAs\":\"bool-switch\", \"fieldWidth\":\"1\", \"columnWidth\":\"8ch\",  \"allowSorting\":true,  \"align\":\"center\"}"
      },
      {
        "id": "ba57bdf8-e585-4acc-8ea4-8f6b32c2078d",
        "moduleId": "APP_USERS",
        "tableId": "130",
        "fieldId": "130002",
        "columnName": "FULL_NAME",
        "fieldName": "fullName",
        "fieldPath": "fullName",
        "dataType": "TEXT",
        "maxLength": 300,
        "requiredField": "Y",
        "listingAlias": "fullName",
        "label": "lbl.fullName",
        "description": "Full display name of the user",
        "uiMetadata": "{\"renderAs\":\"text\",        \"fieldWidth\":\"2\", \"columnWidth\":\"24ch\", \"allowSorting\":true}"
      },
      {
        "id": "cb2fc8ee-3ecc-4e33-abfd-35d57fdce43b",
        "moduleId": "APP_USERS",
        "tableId": "130",
        "fieldId": "130003",
        "columnName": "EMAIL_ID",
        "fieldName": "emailId",
        "fieldPath": "emailId",
        "dataType": "TEXT",
        "maxLength": 300,
        "requiredField": "Y",
        "listingAlias": "emailId",
        "label": "lbl.emailId",
        "description": "Email address used for login and notifications",
        "uiMetadata": "{\"renderAs\":\"text\",        \"fieldWidth\":\"2\", \"columnWidth\":\"28ch\", \"allowSorting\":true}"
      },
      {
        "id": "f0a8fcaf-8a88-4dea-9f62-1ea99979c3db",
        "moduleId": "APP_USERS",
        "tableId": "130",
        "fieldId": "130004",
        "columnName": "PASSWORD_HASH",
        "fieldName": "passwordHash",
        "fieldPath": "passwordHash",
        "dataType": "TEXT",
        "maxLength": 1000,
        "requiredField": "N",
        "listingAlias": "passwordHash",
        "label": "lbl.passwordHash",
        "description": "BCrypt hashed password — never displayed in UI",
        "uiMetadata": "{\"renderAs\":\"password\",    \"fieldWidth\":\"2\", \"columnWidth\":\"0\",    \"allowSorting\":false, \"hidden\":true}"
      },
      {
        "id": "f29384ea-ceaa-4ff6-be25-c9709d84960b",
        "moduleId": "APP_USERS",
        "tableId": "130",
        "fieldId": "130005",
        "columnName": "ROLES",
        "fieldName": "roles",
        "fieldPath": "roles",
        "dataType": "TEXT",
        "maxLength": 0,
        "requiredField": "N",
        "listingAlias": "roles",
        "label": "lbl.roles",
        "description": "JSON array of ROLE_IDs assigned to this user",
        "uiMetadata": "{\"renderAs\":\"ms-lookup\",\"fieldWidth\":\"3\", \"columnWidth\":\"20ch\", \"allowSorting\":false, \"lookupModule\":\"APP_ROLES\", \"storeFormat\":\"JSON\", \"lkpStoreValField\":\"roleId\"}"
      },
      {
        "id": "fbaa7306-b555-4956-bc08-b8f0ab348f8c",
        "moduleId": "APP_USERS",
        "tableId": "130",
        "fieldId": "130006",
        "columnName": "LAST_LOGIN",
        "fieldName": "lastLogin",
        "fieldPath": "lastLogin",
        "dataType": "DATETIME",
        "maxLength": 0,
        "requiredField": "N",
        "listingAlias": "lastLogin",
        "label": "lbl.lastLogin",
        "description": "Timestamp of the user's most recent successful login",
        "uiMetadata": "{\"renderAs\":\"datetime\",    \"fieldWidth\":\"1\", \"columnWidth\":\"16ch\", \"allowSorting\":true,  \"readOnly\":true}"
      }
    ]
  }
})();
