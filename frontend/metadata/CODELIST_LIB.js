(() => {
  window.offline_metadata = {
    "formMetadata": {
      "module": "USERS",
      "FORMS": {
        "CODELIST_LIB_FULL_FORM": {
          "formID": "FULL_FORM",
          "formName": "Codelist Library",
          "version": "1.0",
          "layout": {
            "recordTitleField": "codeListId",
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
            "sectionId": "150",
            "title": "Codelist",
            "sequence": 1,
            "multiContext": false,
            "sections": [{
                "sectionId": "150_001",
                "title": "lbl.cl_details",
                "sequence": 1,
                "multiContext": false,
                "tabPanel": true,
                "fields": [{
                    "fieldId": "150001"
                  },
                  {
                    "fieldId": "150003"
                  },
                  {
                    "fieldId": "150002"
                  }
                ]
              },
              {
                "sectionId": "155_001",
                "title": "lbl.cl_vals",
                "sequence": 2,
                "multiContext": true,
                "contextPath": "values$",
                "tabPanel": true,
                "dataGridConfig": {
                  "disableDelete": true
                },
                "fields": [{
                    "fieldId": "155001"
                  },
                  {
                    "fieldId": "155002"
                  },
                  {
                    "fieldId": "155004"
                  },
                  {
                    "fieldId": "155005"
                  },
                  {
                    "fieldId": "155003"
                  }
                ],
                "gridFields": [{
                    "fieldId": "155001"
                  },
                  {
                    "fieldId": "155002"
                  },
                  {
                    "fieldId": "155004"
                  },
                  {
                    "fieldId": "155005"
                  }
                ]
              }
            ]
          }]
        }
      }
    },
    "listingMetadata": {
      "module": "CODELIST_LIB",
      "title": "Codelist Library",
      "FILTERS_FIELDS": [{
          "fieldId": "150001"
        },
        {
          "fieldId": "150002",
          "renderAs": "text"
        },
        {
          "fieldId": "150003",
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
          "fieldId": "150001"
        },
        {
          "fieldId": "150003"
        },
        {
          "fieldId": "150002"
        }
      ],
      "DASHBOARD_WIDGETS": [{
          "widgetId": "totalCodelists",
          "label": "Total Codelists",
          "iconColor": "blue",
          "icon": "M4 6h16M4 10h16M4 14h16M4 18h16",
          "filters": []
        },
        {
          "widgetId": "activeCodelists",
          "label": "Active",
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
      "module": "CODELIST_LIB",
      "title": "Codelist Library",
      "FILTERS_FIELDS": [{
          "fieldId": "150001"
        },
        {
          "fieldId": "150002",
          "renderAs": "text"
        },
        {
          "fieldId": "150003",
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
          "fieldId": "150001"
        },
        {
          "fieldId": "150003"
        },
        {
          "fieldId": "150002"
        }
      ],
      "DASHBOARD_WIDGETS": [{
          "widgetId": "totalCodelists",
          "label": "Total Codelists",
          "iconColor": "blue",
          "icon": "M4 6h16M4 10h16M4 14h16M4 18h16",
          "filters": []
        },
        {
          "widgetId": "activeCodelists",
          "label": "Active",
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
    "i18nTrans": {
      "en": {
        "lbl.codeListId": "Codelist ID",
        "lbl.description": "Description",
        "lbl.active": "Active",
        "lbl.cl_details": "Codelist Details",
        "lbl.cl_vals": "Codelist Values",
        "lbl.code": "Code",
        "lbl.decode": "Decode",
        "lbl.translations": "Translations (JSON)",
        "lbl.sequence": "Sequence",
        "sec.details": "Codelist Details",
        "sec.values": "Codelist Values"
      }
    },
    "fields": [{
        "id": "49110fcd-5b21-438d-a529-16c5e57ebdd1",
        "moduleId": "CODELIST_LIB",
        "tableId": "150",
        "fieldId": "150002",
        "columnName": "DESCRIPTION",
        "fieldName": "description",
        "fieldPath": "description",
        "dataType": "TEXT",
        "maxLength": 300,
        "requiredField": "Y",
        "listingAlias": "description",
        "label": "lbl.description",
        "description": "",
        "labelInfo": "",
        "uiMetadata": "{\"renderAs\":\"textarea\",\t\"fieldWidth\":\"3\", \"columnWidth\":\"40ch\", \"allowSorting\":false}"
      },
      {
        "id": "a468e50b-d729-4ae8-861a-49ee3ea83666",
        "moduleId": "CODELIST_LIB",
        "tableId": "150",
        "fieldId": "150001",
        "columnName": "CODE_LIST_ID",
        "fieldName": "codeListId",
        "fieldPath": "codeListId",
        "dataType": "TEXT",
        "maxLength": 300,
        "requiredField": "Y",
        "listingAlias": "codeListId",
        "label": "lbl.codeListId",
        "description": "",
        "labelInfo": "",
        "uiMetadata": "{\"renderAs\":\"text\", \t\t\"fieldWidth\":\"2\", \"columnWidth\":\"20ch\", \"allowSorting\":true}"
      },
      {
        "id": "b461b1d3-997b-43e3-9af7-2a1255028688",
        "moduleId": "CODELIST_LIB",
        "tableId": "150",
        "fieldId": "150003",
        "columnName": "IS_ACTIVE",
        "fieldName": "isActive",
        "fieldPath": "isActive",
        "dataType": "TEXT",
        "maxLength": 1,
        "requiredField": "N",
        "listingAlias": "isActive",
        "label": "lbl.active",
        "description": "",
        "labelInfo": "",
        "uiMetadata": "{\"renderAs\":\"bool-switch\",\t\"fieldWidth\":\"1\", \"columnWidth\":\"10ch\", \"allowSorting\":true}"
      },
      {
        "id": "664d8a6a-1d21-4706-9eee-a62b6e5486a6",
        "moduleId": "CODELIST_LIB",
        "tableId": "155",
        "fieldId": "155004",
        "columnName": "SEQUENCE",
        "fieldName": "sequence",
        "fieldPath": "values$.sequence",
        "dataType": "NUMBER",
        "maxLength": 0,
        "requiredField": "N",
        "listingAlias": "sequence",
        "label": "lbl.sequence",
        "description": "",
        "labelInfo": "",
        "uiMetadata": "{\"renderAs\":\"numeric\", \t\"fieldWidth\":\"1\", \"columnWidth\":\"10ch\", \"allowSorting\":true}"
      },
      {
        "id": "6d0bf20c-a322-476e-a3c9-2f0454372d03",
        "moduleId": "CODELIST_LIB",
        "tableId": "155",
        "fieldId": "155001",
        "columnName": "CODE",
        "fieldName": "code",
        "fieldPath": "values$.code",
        "dataType": "TEXT",
        "maxLength": 100,
        "requiredField": "Y",
        "listingAlias": "code",
        "label": "lbl.code",
        "description": "",
        "labelInfo": "",
        "uiMetadata": "{\"renderAs\":\"text\", \t\t\"fieldWidth\":\"1\", \"columnWidth\":\"20ch\", \"allowSorting\":true}"
      },
      {
        "id": "af1b4df5-c944-4edf-913d-cc1dc6a7cac3",
        "moduleId": "CODELIST_LIB",
        "tableId": "155",
        "fieldId": "155002",
        "columnName": "DECODE",
        "fieldName": "decode",
        "fieldPath": "values$.decode",
        "dataType": "TEXT",
        "maxLength": 300,
        "requiredField": "Y",
        "listingAlias": "decode",
        "label": "lbl.decode",
        "description": "",
        "labelInfo": "",
        "uiMetadata": "{\"renderAs\":\"text\", \t\t\"fieldWidth\":\"2\", \"columnWidth\":\"20ch\", \"allowSorting\":true}"
      },
      {
        "id": "b67d170e-9b12-44dd-8769-546a2059e836",
        "moduleId": "CODELIST_LIB",
        "tableId": "155",
        "fieldId": "155005",
        "columnName": "IS_ACTIVE",
        "fieldName": "isActive",
        "fieldPath": "values$.isActive",
        "dataType": "TEXT",
        "maxLength": 1,
        "requiredField": "N",
        "listingAlias": "isActive",
        "label": "lbl.active",
        "description": "",
        "labelInfo": "",
        "uiMetadata": "{\"renderAs\":\"bool-switch\",\t\"fieldWidth\":\"1\", \"columnWidth\":\"10ch\", \"allowSorting\":true}"
      },
      {
        "id": "f86f828f-6506-4a51-8c24-d9ca5e135ae1",
        "moduleId": "CODELIST_LIB",
        "tableId": "155",
        "fieldId": "155003",
        "columnName": "TRANSLATIONS",
        "fieldName": "translations",
        "fieldPath": "values$.translations",
        "dataType": "TEXT",
        "maxLength": 0,
        "requiredField": "N",
        "listingAlias": "translations",
        "label": "lbl.translations",
        "description": "",
        "labelInfo": "",
        "uiMetadata": "{\"renderAs\":\"textarea\",\t\"fieldWidth\":\"3\", \"columnWidth\":\"40ch\", \"allowSorting\":false}"
      }
    ]
  }
})();
