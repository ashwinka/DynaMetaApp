(()=>{	
	window.offline_metadata = {
	  "formMetadata": {
	  "module": "USERS",
		  "FORMS": {
			"SIMPLE_FORM": {
			  "formID": "SIMPLE_FORM",
			  "formName": "User Account",
			  "version": "1.0",
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
			  "formHeaderActions": [
				{
				  "actionId": "save",
				  "label": "Save",
				  "icon": "save",
				  "type": "standard"
				},
				{
				  "actionId": "cancel",
				  "label": "Cancel",
				  "icon": "close"
				},
				{
				  "actionId": "formSummary",
				  "label": "Form Summary",
				  "icon": "summary",
				  "type": "moreAction"
				}
			  ],
			  "sections": [
				{
				  "sectionId": "usr_1",
				  "title": "User",
				  "sequence": 1,
				  "multiContext": false,
				  "sections": [
					{
					  "sectionId": "usr_1_1",
					  "title": "User Details",
					  "sequence": 1,
					  "multiContext": false,
					  "tabPanel": true,
					  "fields": [
						{
						  "fieldId": "usr_f01",
						  "label": "User ID",
						  "fieldPath": "userId",
						  "dataType": "text",
						  "renderAs": "text",
						  "fieldWidth": 1
						},
						{
						  "fieldId": "usr_f02",
						  "label": "Full Name",
						  "fieldPath": "fullName",
						  "dataType": "text",
						  "renderAs": "text",
						  "fieldWidth": 2
						},
						{
						  "fieldId": "usr_f03",
						  "label": "User Name (Login)",
						  "fieldPath": "userName",
						  "dataType": "text",
						  "renderAs": "text",
						  "fieldWidth": 1
						},
						{
						  "fieldId": "usr_f04",
						  "label": "Email",
						  "fieldPath": "email",
						  "dataType": "text",
						  "renderAs": "text",
						  "fieldWidth": 1
						},
						{
						  "fieldId": "usr_f05",
						  "label": "Phone",
						  "fieldPath": "phone",
						  "dataType": "text",
						  "renderAs": "text",
						  "fieldWidth": 1
						},
						{
						  "fieldId": "usr_f06",
						  "label": "Role",
						  "fieldPath": "role",
						  "dataType": "text",
						  "renderAs": "combo",
						  "fieldWidth": 1,
						  "codelist": "USER_ROLE"
						},
						{
						  "fieldId": "usr_f07",
						  "label": "Department",
						  "fieldPath": "department",
						  "dataType": "text",
						  "renderAs": "text",
						  "fieldWidth": 1
						},
						{
						  "fieldId": "usr_f08",
						  "label": "Active",
						  "fieldPath": "isActive",
						  "dataType": "text",
						  "renderAs": "radio",
						  "fieldWidth": 1,
						  "codelist": "YES_NO"
						},
						{
						  "fieldId": "usr_f09",
						  "label": "Last Login",
						  "fieldPath": "lastLogin",
						  "dataType": "date",
						  "renderAs": "text",
						  "fieldWidth": 1
						},
						{
						  "fieldId": "usr_f10",
						  "label": "Account Locked",
						  "fieldPath": "isLocked",
						  "dataType": "text",
						  "renderAs": "radio",
						  "fieldWidth": 1,
						  "codelist": "YES_NO"
						}
					  ]
					},
					{
					  "sectionId": "usr_1_2",
					  "title": "Permissions",
					  "sequence": 2,
					  "multiContext": false,
					  "tabPanel": true,
					  "fields": [
						{
						  "fieldId": "usr_f11",
						  "label": "Can Create Cases",
						  "fieldPath": "perm.canCreateCases",
						  "dataType": "text",
						  "renderAs": "radio",
						  "fieldWidth": 1,
						  "codelist": "YES_NO"
						},
						{
						  "fieldId": "usr_f12",
						  "label": "Can Edit Cases",
						  "fieldPath": "perm.canEditCases",
						  "dataType": "text",
						  "renderAs": "radio",
						  "fieldWidth": 1,
						  "codelist": "YES_NO"
						},
						{
						  "fieldId": "usr_f13",
						  "label": "Can Delete Cases",
						  "fieldPath": "perm.canDeleteCases",
						  "dataType": "text",
						  "renderAs": "radio",
						  "fieldWidth": 1,
						  "codelist": "YES_NO"
						},
						{
						  "fieldId": "usr_f14",
						  "label": "Can Submit Reports",
						  "fieldPath": "perm.canSubmitReports",
						  "dataType": "text",
						  "renderAs": "radio",
						  "fieldWidth": 1,
						  "codelist": "YES_NO"
						},
						{
						  "fieldId": "usr_f15",
						  "label": "Can Manage Users",
						  "fieldPath": "perm.canManageUsers",
						  "dataType": "text",
						  "renderAs": "radio",
						  "fieldWidth": 1,
						  "codelist": "YES_NO"
						},
						{
						  "fieldId": "usr_f16",
						  "label": "Can View Audit Trail",
						  "fieldPath": "perm.canViewAudit",
						  "dataType": "text",
						  "renderAs": "radio",
						  "fieldWidth": 1,
						  "codelist": "YES_NO"
						},
						{
						  "fieldId": "usr_f17",
						  "label": "Notes",
						  "fieldPath": "notes",
						  "dataType": "text",
						  "renderAs": "textarea",
						  "fieldWidth": 3,
						  "maxLen": 1000
						}
					  ]
					},
					{
					  "sectionId": "usr_1_3",
					  "title": "Assigned Accounts",
					  "sequence": 3,
					  "multiContext": true,
					  "contextPath": "assignedAccounts$",
					  "editableGrid": true,
					  "tabPanel": true,
					  "dataGridConfig": {
						"allowAdd": true,
						"allowDelete": true,
						"allowCopy": false,
						"pagination": true,
						"pageSizeOptions": [
						  5,
						  10,
						  25
						]
					  },
					  "fields": [
						{
						  "fieldId": "usr_f20",
						  "label": "Account Code",
						  "fieldPath": "assignedAccounts$.accountCode",
						  "dataType": "text",
						  "renderAs": "text",
						  "fieldWidth": 1,
						  "allowSorting": true,
						  "columnSize": "14ch"
						},
						{
						  "fieldId": "usr_f21",
						  "label": "Account Name",
						  "fieldPath": "assignedAccounts$.accountName",
						  "dataType": "text",
						  "renderAs": "text",
						  "fieldWidth": 2,
						  "allowSorting": true,
						  "columnSize": "24ch"
						},
						{
						  "fieldId": "usr_f22",
						  "label": "Access Level",
						  "fieldPath": "assignedAccounts$.accessLevel",
						  "dataType": "text",
						  "renderAs": "combo",
						  "fieldWidth": 1,
						  "allowSorting": true,
						  "columnSize": "14ch",
						  "codelist": "ACCESS_LEVEL"
						}
					  ],
					  "gridFields": [
						{
						  "fieldId": "usr_f20",
						  "label": "Account Code",
						  "fieldPath": "assignedAccounts$.accountCode",
						  "dataType": "text",
						  "renderAs": "text",
						  "allowSorting": true,
						  "columnSize": "14ch"
						},
						{
						  "fieldId": "usr_f21",
						  "label": "Account Name",
						  "fieldPath": "assignedAccounts$.accountName",
						  "dataType": "text",
						  "renderAs": "text",
						  "allowSorting": true,
						  "columnSize": "24ch"
						},
						{
						  "fieldId": "usr_f22",
						  "label": "Access Level",
						  "fieldPath": "assignedAccounts$.accessLevel",
						  "dataType": "text",
						  "renderAs": "combo",
						  "allowSorting": true,
						  "columnSize": "14ch",
						  "codelist": "ACCESS_LEVEL"
						}
					  ]
					}
				  ]
				}
			  ]
			}
		  }
		},
	  "listingMetadata": {
		"module": "USERS",
		"title": "User Management",
		"FILTERS_FIELDS": [
		  {
			"fieldId": "usr_name",
			"label": "User Name",
			"fieldPath": "userName",
			"renderAs": "text",
			"fieldWidth": 1
		  },
		  {
			"fieldId": "usr_email",
			"label": "Email",
			"fieldPath": "email",
			"renderAs": "text",
			"fieldWidth": 1
		  },
		  {
			"fieldId": "usr_role",
			"label": "Role",
			"fieldPath": "role",
			"renderAs": "combo",
			"codelist": "USER_ROLE",
			"fieldWidth": 1
		  },
		  {
			"fieldId": "usr_active",
			"label": "Active",
			"fieldPath": "isActive",
			"renderAs": "combo",
			"codelist": "YES_NO",
			"fieldWidth": 1
		  }
		],
		"GRID_FIELDS": [
		  {
			"fieldId": "usr_id",
			"label": "User ID",
			"fieldPath": "userId",
			"renderAs": "text",
			"allowSorting": true,
			"width": "12ch",
			"primaryKey": true
		  },
		  {
			"fieldId": "usr_name",
			"label": "Full Name",
			"fieldPath": "fullName",
			"renderAs": "text",
			"allowSorting": true,
			"width": "20ch"
		  },
		  {
			"fieldId": "usr_email",
			"label": "Email",
			"fieldPath": "email",
			"renderAs": "text",
			"allowSorting": true,
			"width": "24ch"
		  },
		  {
			"fieldId": "usr_role",
			"label": "Role",
			"fieldPath": "role",
			"renderAs": "badge",
			"codelist": "USER_ROLE",
			"allowSorting": true,
			"width": "12ch"
		  },
		  {
			"fieldId": "usr_lastLogin",
			"label": "Last Login",
			"fieldPath": "lastLogin",
			"renderAs": "date",
			"allowSorting": true,
			"width": "14ch"
		  },
		  {
			"fieldId": "usr_active",
			"label": "Active",
			"fieldPath": "isActive",
			"renderAs": "yesno",
			"allowSorting": true,
			"width": "8ch",
			"align": "center"
		  }
		],
		"DASHBOARD_WIDGETS": [
		  {
			"widgetId": "totalUsers",
			"label": "Total Users",
			"iconColor": "blue",
			"icon": "M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z",
			"filters": []
		  },
		  {
			"widgetId": "activeUsers",
			"label": "Active Users",
			"iconColor": "green",
			"icon": "M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z",
			"filters": [
			  {
				"field": "isActive",
				"operator": "eq",
				"value": "true"
			  }
			]
		  },
		  {
			"widgetId": "adminUsers",
			"label": "Admins",
			"iconColor": "amber",
			"icon": "M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z M15 12a3 3 0 11-6 0 3 3 0 016 0z",
			"filters": [
			  {
				"field": "role",
				"operator": "eq",
				"value": "ADMIN"
			  }
			]
		  }
		]
	  },
	  "lookupMetadata": {
		"module": "USERS",
		"title": "User Management",
		"FILTERS_FIELDS": [
		  {
			"fieldId": "usr_name",
			"label": "User Name",
			"fieldPath": "userName",
			"renderAs": "text",
			"fieldWidth": 1
		  },
		  {
			"fieldId": "usr_email",
			"label": "Email",
			"fieldPath": "email",
			"renderAs": "text",
			"fieldWidth": 1
		  },
		  {
			"fieldId": "usr_role",
			"label": "Role",
			"fieldPath": "role",
			"renderAs": "combo",
			"codelist": "USER_ROLE",
			"fieldWidth": 1
		  },
		  {
			"fieldId": "usr_active",
			"label": "Active",
			"fieldPath": "isActive",
			"renderAs": "combo",
			"codelist": "YES_NO",
			"fieldWidth": 1
		  }
		],
		"GRID_FIELDS": [
		  {
			"fieldId": "usr_id",
			"label": "User ID",
			"fieldPath": "userId",
			"renderAs": "text",
			"allowSorting": true,
			"width": "12ch",
			"primaryKey": true
		  },
		  {
			"fieldId": "usr_name",
			"label": "Full Name",
			"fieldPath": "fullName",
			"renderAs": "text",
			"allowSorting": true,
			"width": "20ch"
		  },
		  {
			"fieldId": "usr_email",
			"label": "Email",
			"fieldPath": "email",
			"renderAs": "text",
			"allowSorting": true,
			"width": "24ch"
		  },
		  {
			"fieldId": "usr_role",
			"label": "Role",
			"fieldPath": "role",
			"renderAs": "badge",
			"codelist": "USER_ROLE",
			"allowSorting": true,
			"width": "12ch"
		  },
		  {
			"fieldId": "usr_lastLogin",
			"label": "Last Login",
			"fieldPath": "lastLogin",
			"renderAs": "date",
			"allowSorting": true,
			"width": "14ch"
		  },
		  {
			"fieldId": "usr_active",
			"label": "Active",
			"fieldPath": "isActive",
			"renderAs": "yesno",
			"allowSorting": true,
			"width": "8ch",
			"align": "center"
		  }
		]
	  },
	  "i18nTrans": {
		"en": {}
	  }
	}
})();
