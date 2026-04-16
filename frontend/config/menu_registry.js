/**
 * MetaDyna - Menu Registry
 *
 * Structure:
 *   MENU_REGISTRY.appName     — application display name
 *   MENU_REGISTRY.appIcon     — SVG path data for app brand icon
 *   MENU_REGISTRY.groups[]    — ordered list of menu groups
 *     group.groupId           — unique group identifier
 *     group.label             — group heading label
 *     group.icon              — SVG path data for group icon
 *     group.items[]
 *       item.itemId           — unique item identifier
 *       item.label            — display label
 *       item.moduleId         — maps to LISTING_METADATA_REGISTRY key
 *                               (also maps to METADATA_REGISTRY for form modules)
 *       item.view             — 'caseList' | 'listing' | 'form' | 'dashboard'
 *                               'listing'  → uses LISTING_METADATA_REGISTRY to render
 *                               'caseList' → uses the built-in PATIENT case-listing view
 *       item.icon             — SVG path data for item icon
 *       item.badge            — optional badge text (e.g. 'New', count)
 *       item.badgeColor       — 'primary' | 'success' | 'warning' | 'danger'
 *       item.description      — short subtitle shown in menu
 *       item.disabled         — boolean, greys out item
 */

var MENU_REGISTRY = {
    "appName": "MetaDyna",
    "appIcon": "M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5",
    "groups": [
        {
            "groupId": "safety",
            "label": "Safety Reporting",
            "icon": "M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z",
            "items": [
                {
                    "itemId": "icsr-cases",
                    "label": "ICSR Cases",
                    "moduleId": "ICSR",
                    "view": "listing",
                    "description": "Individual Case Safety Reports — ICH E2B(R2/R3) dual-compatible, EMA/FDA submissions",
                    "icon": "M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01",
                    "badge": null,
                    "badgeColor": null,
                    "disabled": false,
                    "privileges": {
                        "read": true,
                        "write": true
                    }
                },
                {
                    "itemId": "case-correspondence",
                    "label": "Correspondence",
                    "moduleId": "CORRESPONDENCE",
                    "view": "listing",
                    "description": "Correspondence emails per case between Patient, Investigators and Partners",
                    "icon": "M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z",
                    "badge": null,
                    "badgeColor": null,
                    "disabled": false,
                    "privileges": {
                        "read": true,
                        "write": true
                    }
                },
                {
                    "itemId": "email-cases",
                    "label": "Email Cases",
                    "moduleId": "EMAIL_CASES",
                    "view": "listing",
                    "description": "Adverse event cases received via email — triage and process into ICSRs",
                    "icon": "M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z",
                    "badge": null,
                    "badgeColor": null,
                    "disabled": false,
                    "privileges": {
                        "read": true,
                        "write": true
                    }
                },
                {
                    "itemId": "literature-cases",
                    "label": "Literature Cases",
                    "moduleId": "LITERATURE_CASES",
                    "view": "listing",
                    "description": "Adverse events identified from published scientific literature",
                    "icon": "M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253",
                    "badge": null,
                    "badgeColor": null,
                    "disabled": false,
                    "privileges": {
                        "read": true,
                        "write": true
                    }
                }
            ]
        },
        {
            "groupId": "regulatory",
            "label": "Regulatory",
            "icon": "M3 6l3 1m0 0l-3 9a5.002 5.002 0 006.001 0M6 7l3 9M6 7l6-2m6 2l3-1m-3 1l-3 9a5.002 5.002 0 006.001 0M18 7l3 9m-3-9l-6-2m0-2v2m0 16V5m0 16H9m3 0h3",
            "items": [
                {
                    "itemId": "submissions",
                    "label": "Regulatory Submissions",
                    "moduleId": "SUBMISSIONS",
                    "view": "listing",
                    "description": "Track regulatory submissions to health authorities",
                    "icon": "M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z",
                    "badge": null,
                    "badgeColor": null,
                    "disabled": false,
                    "privileges": {
                        "read": true,
                        "write": true
                    }
                },
                {
                    "itemId": "investigator-distributions",
                    "label": "Investigator Distributions",
                    "moduleId": "INVESTIGATOR_DISTRIBUTIONS",
                    "view": "listing",
                    "description": "Reports distributed to investigators",
                    "icon": "M8 7v8a2 2 0 002 2h6M8 7V5a2 2 0 012-2h4.586a1 1 0 01.707.293l4.414 4.414a1 1 0 01.293.707V15a2 2 0 01-2 2h-2M8 7H6a2 2 0 00-2 2v10a2 2 0 002 2h8a2 2 0 002-2v-2",
                    "badge": null,
                    "badgeColor": null,
                    "disabled": false,
                    "privileges": {
                        "read": true,
                        "write": true
                    }
                }
            ]
        },
        {
            "groupId": "dictionaries",
            "label": "Dictionaries",
            "icon": "M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253",
            "items": [
                {
                    "itemId": "company-units",
                    "label": "Accounts / Company Units",
                    "moduleId": "ACCOUNTS",
                    "view": "listing",
                    "description": "Dictionary of company units, subsidiaries and partner accounts",
                    "icon": "M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-2 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4",
                    "badge": null,
                    "badgeColor": null,
                    "disabled": false,
                    "privileges": {
                        "read": true,
                        "write": true
                    }
                },
                {
                    "itemId": "product-library",
                    "label": "Products",
                    "moduleId": "DRUG_PRODUCTS_LIB",
                    "view": "listing",
                    "description": "Drug and medicinal product library",
                    "icon": "M9 3a4 4 0 00-4 4v10a4 4 0 008 0V7a4 4 0 00-4-4zm0 2a2 2 0 012 2v4H7V7a2 2 0 012-2zm0 8v4a2 2 0 01-4 0v-4h4zM17.5 3.5l3 3-7 7-1.5-1.5 7-7zM15 13l1.5 1.5-1 1L14 14l1-1zM20 2l2 2-1 1-2-2 1-1z",
                    "badge": null,
                    "badgeColor": null,
                    "disabled": false,
                    "privileges": {
                        "read": true,
                        "write": true
                    }
                },
                {
                    "itemId": "study-library",
                    "label": "Study",
                    "moduleId": "STUDY_LIB",
                    "view": "listing",
                    "description": "Clinical study library and registration details",
                    "icon": "M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2",
                    "badge": null,
                    "badgeColor": null,
                    "disabled": false,
                    "privileges": {
                        "read": true,
                        "write": true
                    }
                },
                {
                    "itemId": "substance-library",
                    "label": "Substances",
                    "moduleId": "SUBSTANCE",
                    "view": "listing",
                    "description": "Active substances, INNs and pharmacological classification",
                    "icon": "M19.428 15.428a2 2 0 00-1.022-.547l-2.387-.477a6 6 0 00-3.86.517l-.318.158a6 6 0 01-3.86.517L6.05 15.21a2 2 0 00-1.806.547M8 4h8l-1 1v5.172a2 2 0 00.586 1.414l5 5c1.26 1.26.367 3.414-1.415 3.414H4.828c-1.782 0-2.674-2.154-1.414-3.414l5-5A2 2 0 009 10.172V5L8 4z",
                    "badge": null,
                    "badgeColor": null,
                    "disabled": false,
                    "privileges": {
                        "read": true,
                        "write": true
                    }
                },
                {
                    "itemId": "departments",
                    "label": "Departments",
                    "moduleId": "DEPARTMENTS",
                    "view": "listing",
                    "description": "Internal and partner department directory",
                    "icon": "M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-2 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4",
                    "badge": null,
                    "badgeColor": null,
                    "disabled": false,
                    "privileges": {
                        "read": true,
                        "write": true
                    }
                },
                {
                    "itemId": "contacts",
                    "label": "Contacts",
                    "moduleId": "CONTACTS",
                    "view": "listing",
                    "description": "Reporters, investigators, regulators and partner contacts",
                    "icon": "M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0z",
                    "badge": null,
                    "badgeColor": null,
                    "disabled": false,
                    "privileges": {
                        "read": true,
                        "write": true
                    }
                },
                {
                    "itemId": "corr-question-library",
                    "label": "Correspondence Question Library",
                    "moduleId": "CORR_QUESTION_LIB",
                    "view": "listing",
                    "description": "Standard follow-up questions for case correspondence",
                    "icon": "M8 10h.01M12 10h.01M16 10h.01M9 16H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-5l-5 5v-5z",
                    "badge": null,
                    "badgeColor": null,
                    "disabled": false,
                    "privileges": {
                        "read": true,
                        "write": true
                    }
                }
            ]
        },
        {
            "groupId": "admin",
            "label": "Administration",
            "icon": "M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z M15 12a3 3 0 11-6 0 3 3 0 016 0z",
            "items": [
                {
                    "itemId": "user-management",
                    "label": "User Management",
                    "moduleId": "USERS",
                    "view": "listing",
                    "description": "Manage users, roles and permissions",
                    "icon": "M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z",
                    "badge": null,
                    "badgeColor": null,
                    "disabled": false,
                    "privileges": {
                        "read": true,
                        "write": true
                    }
                },
                {
                    "itemId": "user-roles",
                    "label": "User Roles",
                    "moduleId": "USER_ROLES",
                    "view": "listing",
                    "description": "Manage roles and privileges",
                    "icon": "M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z",
                    "badge": null,
                    "badgeColor": null,
                    "disabled": false,
                    "privileges": {
                        "read": true,
                        "write": true
                    }
                },
                {
                    "itemId": "audit-trail",
                    "label": "Audit Trail",
                    "moduleId": "AUDIT_TRAIL",
                    "view": "listing",
                    "description": "View change history and access logs",
                    "icon": "M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-6 9l2 2 4-4",
                    "badge": null,
                    "badgeColor": null,
                    "disabled": false,
                    "privileges": {
                        "read": true,
                        "write": true
                    }
                },
                {
                    "itemId": "codelist",
                    "label": "Codelist",
                    "moduleId": "CODELIST_LIB",
                    "view": "listing",
                    "description": "Codelist / controlled vocabulary library",
                    "icon": "M4 6h16M4 10h16M4 14h16M4 18h16",
                    "badge": null,
                    "badgeColor": null,
                    "disabled": false,
                    "privileges": {
                        "read": true,
                        "write": true
                    }
                }
            ]
        }
    ]
};

/* Register with MetaDynaAPI so getRecords / getFormMetadata etc. work */
if (typeof MetaDynaAPI !== 'undefined') MetaDynaAPI.register('menu', MENU_REGISTRY);
