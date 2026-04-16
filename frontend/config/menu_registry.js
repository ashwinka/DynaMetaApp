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
                    "moduleId": "APP_ROLES",
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
