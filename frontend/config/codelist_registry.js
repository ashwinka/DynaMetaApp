/**
 * MetaDyna Forms - Centralized Codelist Registry
 *
 * All codelists are defined here, shared across all modules.
 * Structure: CODELIST_REGISTRY[codelistId] = [{ code, decode }]
 *
 * To reference a codelist in field metadata: renderAs:'combo', codelist:'SEX'
 */

const CODELIST_REGISTRY = {
  "ACCESS_LEVEL": [
    {
      "code": "FULL",
      "decode": "Full Access",
      "translations": {
        "en": "Full Access"
      }
    },
    {
      "code": "READONLY",
      "decode": "Read Only",
      "translations": {
        "en": "Read Only"
      }
    },
    {
      "code": "NONE",
      "decode": "No Access",
      "translations": {
        "en": "No Access"
      }
    }
  ],
  "ACCOUNT_TYPE": [
    {
      "code": "HEALTH_PROF",
      "decode": "Health Professional",
      "translations": {
        "en": "Health Professional",
        "fr": "Professionnel de santé",
        "ja": "医療専門家"
      }
    },
    {
      "code": "VET_HOSPITAL",
      "decode": "Veterinary Hospital",
      "translations": {
        "en": "Veterinary Hospital",
        "fr": "Hôpital vétérinaire",
        "ja": "動物病院"
      }
    },
    {
      "code": "PHARMA_CO",
      "decode": "Pharmaceutical Company",
      "translations": {
        "en": "Pharmaceutical Company",
        "fr": "Société pharmaceutique",
        "ja": "製薬会社"
      }
    },
    {
      "code": "REG_PV_CENTER",
      "decode": "Regional Pharmacovigilance Center",
      "translations": {
        "en": "Regional Pharmacovigilance Center",
        "fr": "Centre régional de pharmacovigilance",
        "ja": "地域ファーマコビジランスセンター"
      }
    },
    {
      "code": "VET_CENTER",
      "decode": "Veterinary Center",
      "translations": {
        "en": "Veterinary Center",
        "fr": "Centre vétérinaire",
        "ja": "獣医センター"
      }
    },
    {
      "code": "AGENT_DIST",
      "decode": "Agent / Distributor",
      "translations": {
        "en": "Agent / Distributor",
        "fr": "Agent / Distributeur",
        "ja": "代理店・販売店"
      }
    },
    {
      "code": "AUTH_REP_EEA",
      "decode": "Authorized Representative within EEA and Switzerland",
      "translations": {
        "en": "Authorized Representative within EEA and Switzerland",
        "fr": "Représentant autorisé dans l'EEE et Suisse",
        "ja": "EEA・スイス域内の認定代理人"
      }
    },
    {
      "code": "PATIENT",
      "decode": "Patient / Consumer",
      "translations": {
        "en": "Patient / Consumer",
        "fr": "Patient / Consommateur",
        "ja": "患者・消費者"
      }
    },
    {
      "code": "MED_INSTITUTION",
      "decode": "Medical Institution",
      "translations": {
        "en": "Medical Institution",
        "fr": "Établissement médical",
        "ja": "医療機関"
      }
    },
    {
      "code": "REG_AUTH",
      "decode": "Regulatory Authority",
      "translations": {
        "en": "Regulatory Authority",
        "fr": "Autorité réglementaire",
        "ja": "規制当局"
      }
    },
    {
      "code": "WHO_COLLAB",
      "decode": "WHO Collaborating Center for International Drug Monitoring",
      "translations": {
        "en": "WHO Collaborating Center for International Drug Monitoring",
        "fr": "Centre collaborateur OMS pour la surveillance internationale des médicaments",
        "ja": "WHO国際医薬品モニタリング協力センター"
      }
    },
    {
      "code": "CORP_CO",
      "decode": "Corporate Company",
      "translations": {
        "en": "Corporate Company",
        "fr": "Société commerciale",
        "ja": "企業"
      }
    },
    {
      "code": "CRO",
      "decode": "Contract Research Organisation",
      "translations": {
        "en": "Contract Research Organisation",
        "fr": "Organisation de recherche sous contrat",
        "ja": "受託研究機関"
      }
    },
    {
      "code": "OTHER",
      "decode": "Other",
      "translations": {
        "en": "Other",
        "fr": "Autre",
        "ja": "その他"
      }
    }
  ],
  "ADDRESS_TYPE": [
    {
      "code": "PERMANENT",
      "decode": "Permanent",
      "translations": {
        "en": "Permanent",
        "fr": "Permanent",
        "ja": "永住所"
      }
    },
    {
      "code": "CURRENT",
      "decode": "Current",
      "translations": {
        "en": "Current",
        "fr": "Actuel",
        "ja": "現住所"
      }
    },
    {
      "code": "OFFICE",
      "decode": "Office",
      "translations": {
        "en": "Office",
        "fr": "Bureau",
        "ja": "勤務先"
      }
    },
    {
      "code": "RESIDENTIAL",
      "decode": "Residential",
      "translations": {
        "en": "Residential",
        "fr": "Résidentiel",
        "ja": "居住地"
      }
    },
    {
      "code": "OTHER",
      "decode": "Other",
      "translations": {
        "en": "Other",
        "fr": "Autre",
        "ja": "その他"
      }
    }
  ],
  "APPROVAL_TYPE": [
    {
      "code": "FULL",
      "decode": "Full Approval",
      "translations": {
        "en": "Full Approval",
        "fr": "Approbation complète",
        "ja": "完全承認"
      }
    },
    {
      "code": "CONDITIONAL",
      "decode": "Conditional Approval",
      "translations": {
        "en": "Conditional Approval",
        "fr": "Approbation conditionnelle",
        "ja": "条件付き承認"
      }
    },
    {
      "code": "EXCEPTIONAL",
      "decode": "Exceptional Circumstances",
      "translations": {
        "en": "Exceptional Circumstances",
        "fr": "Circonstances exceptionnelles",
        "ja": "例外的状況"
      }
    },
    {
      "code": "ACCELERATED",
      "decode": "Accelerated Assessment",
      "translations": {
        "en": "Accelerated Assessment",
        "fr": "Évaluation accélérée",
        "ja": "迅速審査"
      }
    },
    {
      "code": "EMERGENCY",
      "decode": "Emergency Use",
      "translations": {
        "en": "Emergency Use",
        "fr": "Utilisation d'urgence",
        "ja": "緊急使用"
      }
    },
    {
      "code": "GENERIC",
      "decode": "Generic",
      "translations": {
        "en": "Generic",
        "fr": "Générique",
        "ja": "ジェネリック"
      }
    },
    {
      "code": "BIOSIMILAR",
      "decode": "Biosimilar",
      "translations": {
        "en": "Biosimilar",
        "fr": "Biosimilaire",
        "ja": "バイオシミラー"
      }
    },
    {
      "code": "OTHER",
      "decode": "Other",
      "translations": {
        "en": "Other",
        "fr": "Autre",
        "ja": "その他"
      }
    }
  ],
  "BLINDING_TECHNIQUE": [
    {
      "code": "DOUBLE_BLIND",
      "decode": "Double blind",
      "translations": {
        "en": "Double blind",
        "fr": "Double aveugle",
        "ja": "二重盲検"
      }
    },
    {
      "code": "OPEN_LABEL",
      "decode": "Open-label",
      "translations": {
        "en": "Open-label",
        "fr": "Ouvert",
        "ja": "非盲検"
      }
    },
    {
      "code": "SINGLE_BLIND",
      "decode": "Single blind",
      "translations": {
        "en": "Single blind",
        "fr": "Simple aveugle",
        "ja": "単盲検"
      }
    }
  ],
  "CODE_STATUS": [
    {
      "code": "CODE_BROKEN",
      "decode": "Code broken",
      "translations": {
        "en": "Code broken",
        "fr": "Code levé",
        "ja": "コード開封済み"
      }
    },
    {
      "code": "CODE_NOT_BROKEN",
      "decode": "Code not broken",
      "translations": {
        "en": "Code not broken",
        "fr": "Code non levé",
        "ja": "コード未開封"
      }
    },
    {
      "code": "NOT_APPLICABLE",
      "decode": "Not applicable",
      "translations": {
        "en": "Not applicable",
        "fr": "Non applicable",
        "ja": "該当なし"
      }
    }
  ],
  "CONTACT_CATEGORY": [
    {
      "code": "INT_HCP",
      "decode": "Internal Contact HCP",
      "translations": {
        "en": "Internal Contact HCP",
        "fr": "Contact interne PS",
        "ja": "社内医療従事者"
      }
    },
    {
      "code": "EXT_HCP",
      "decode": "External Contact HCP",
      "translations": {
        "en": "External Contact HCP",
        "fr": "Contact externe PS",
        "ja": "社外医療従事者"
      }
    },
    {
      "code": "INT_NON_HCP",
      "decode": "Internal Contact Non HCP",
      "translations": {
        "en": "Internal Contact Non HCP",
        "fr": "Contact interne non PS",
        "ja": "社内非医療従事者"
      }
    },
    {
      "code": "EXT_NON_HCP",
      "decode": "External Contact Non HCP",
      "translations": {
        "en": "External Contact Non HCP",
        "fr": "Contact externe non PS",
        "ja": "社外非医療従事者"
      }
    }
  ],
  "CONTACT_MEDIUM": [
    {
      "code": "EMAIL",
      "decode": "Email",
      "translations": {
        "en": "Email",
        "fr": "E-mail",
        "ja": "メール"
      }
    },
    {
      "code": "PHONE",
      "decode": "Phone",
      "translations": {
        "en": "Phone",
        "fr": "Téléphone",
        "ja": "電話"
      }
    },
    {
      "code": "FAX",
      "decode": "Fax",
      "translations": {
        "en": "Fax",
        "fr": "Fax",
        "ja": "ファックス"
      }
    },
    {
      "code": "POST",
      "decode": "Post",
      "translations": {
        "en": "Post",
        "fr": "Courrier",
        "ja": "郵便"
      }
    },
    {
      "code": "PORTAL",
      "decode": "Portal",
      "translations": {
        "en": "Portal",
        "fr": "Portail",
        "ja": "ポータル"
      }
    }
  ],
  "CONTACT_QUALIFICATION": [
    {
      "code": "MD",
      "decode": "MD (Medical Doctor)",
      "translations": {
        "en": "MD (Medical Doctor)",
        "fr": "Docteur en médecine",
        "ja": "医学博士"
      }
    },
    {
      "code": "PHARM",
      "decode": "PharmD / BPharm",
      "translations": {
        "en": "PharmD / BPharm",
        "fr": "Docteur en pharmacie",
        "ja": "薬学博士"
      }
    },
    {
      "code": "PHD",
      "decode": "PhD",
      "translations": {
        "en": "PhD",
        "fr": "Doctorat",
        "ja": "博士号"
      }
    },
    {
      "code": "RN",
      "decode": "RN (Registered Nurse)",
      "translations": {
        "en": "RN (Registered Nurse)",
        "fr": "Infirmier(ère) diplômé(e)",
        "ja": "登録看護師"
      }
    },
    {
      "code": "MSC",
      "decode": "MSc",
      "translations": {
        "en": "MSc",
        "fr": "Master",
        "ja": "修士"
      }
    },
    {
      "code": "BSC",
      "decode": "BSc",
      "translations": {
        "en": "BSc",
        "fr": "Licence",
        "ja": "学士"
      }
    },
    {
      "code": "OTHER",
      "decode": "Other",
      "translations": {
        "en": "Other",
        "fr": "Autre",
        "ja": "その他"
      }
    }
  ],
  "CONTACT_SPECIALIZATION": [
    {
      "code": "CARDIOLOGY",
      "decode": "Cardiology",
      "translations": {
        "en": "Cardiology",
        "fr": "Cardiologie",
        "ja": "循環器科"
      }
    },
    {
      "code": "ONCOLOGY",
      "decode": "Oncology",
      "translations": {
        "en": "Oncology",
        "fr": "Oncologie",
        "ja": "腫瘍科"
      }
    },
    {
      "code": "NEUROLOGY",
      "decode": "Neurology",
      "translations": {
        "en": "Neurology",
        "fr": "Neurologie",
        "ja": "神経科"
      }
    },
    {
      "code": "INTERNAL_MED",
      "decode": "Internal Medicine",
      "translations": {
        "en": "Internal Medicine",
        "fr": "Médecine interne",
        "ja": "内科"
      }
    },
    {
      "code": "ENDOCRINOLOGY",
      "decode": "Endocrinology",
      "translations": {
        "en": "Endocrinology",
        "fr": "Endocrinologie",
        "ja": "内分泌科"
      }
    },
    {
      "code": "GASTRO",
      "decode": "Gastroenterology",
      "translations": {
        "en": "Gastroenterology",
        "fr": "Gastroentérologie",
        "ja": "消化器科"
      }
    },
    {
      "code": "HAEMATOLOGY",
      "decode": "Haematology",
      "translations": {
        "en": "Haematology",
        "fr": "Hématologie",
        "ja": "血液科"
      }
    },
    {
      "code": "IMMUNOLOGY",
      "decode": "Immunology",
      "translations": {
        "en": "Immunology",
        "fr": "Immunologie",
        "ja": "免疫科"
      }
    },
    {
      "code": "NEPHROLOGY",
      "decode": "Nephrology",
      "translations": {
        "en": "Nephrology",
        "fr": "Néphrologie",
        "ja": "腎臓科"
      }
    },
    {
      "code": "RHEUMATOLOGY",
      "decode": "Rheumatology",
      "translations": {
        "en": "Rheumatology",
        "fr": "Rhumatologie",
        "ja": "リウマチ科"
      }
    },
    {
      "code": "DERMATOLOGY",
      "decode": "Dermatology",
      "translations": {
        "en": "Dermatology",
        "fr": "Dermatologie",
        "ja": "皮膚科"
      }
    },
    {
      "code": "RESPIRATORY",
      "decode": "Respiratory Medicine",
      "translations": {
        "en": "Respiratory Medicine",
        "fr": "Pneumologie",
        "ja": "呼吸器科"
      }
    },
    {
      "code": "CLIN_PHARM",
      "decode": "Clinical Pharmacology",
      "translations": {
        "en": "Clinical Pharmacology",
        "fr": "Pharmacologie clinique",
        "ja": "臨床薬理学"
      }
    },
    {
      "code": "PHARMACY",
      "decode": "Pharmacy",
      "translations": {
        "en": "Pharmacy",
        "fr": "Pharmacie",
        "ja": "薬学"
      }
    },
    {
      "code": "PHARMACOVIG",
      "decode": "Pharmacovigilance",
      "translations": {
        "en": "Pharmacovigilance",
        "fr": "Pharmacovigilance",
        "ja": "ファーマコビジランス"
      }
    },
    {
      "code": "MED_WRITING",
      "decode": "Medical Writing",
      "translations": {
        "en": "Medical Writing",
        "fr": "Rédaction médicale",
        "ja": "メディカルライティング"
      }
    },
    {
      "code": "OTHER",
      "decode": "Other",
      "translations": {
        "en": "Other",
        "fr": "Autre",
        "ja": "その他"
      }
    }
  ],
  "CONTACT_TITLE": [
    {
      "code": "DR",
      "decode": "Dr.",
      "translations": {
        "en": "Dr.",
        "fr": "Dr.",
        "ja": "博士"
      }
    },
    {
      "code": "PROF",
      "decode": "Prof.",
      "translations": {
        "en": "Prof.",
        "fr": "Prof.",
        "ja": "教授"
      }
    },
    {
      "code": "MR",
      "decode": "Mr.",
      "translations": {
        "en": "Mr.",
        "fr": "M.",
        "ja": "氏"
      }
    },
    {
      "code": "MS",
      "decode": "Ms.",
      "translations": {
        "en": "Ms.",
        "fr": "Mme.",
        "ja": "様"
      }
    },
    {
      "code": "MRS",
      "decode": "Mrs.",
      "translations": {
        "en": "Mrs.",
        "fr": "Mme.",
        "ja": "様"
      }
    },
    {
      "code": "MISS",
      "decode": "Miss",
      "translations": {
        "en": "Miss",
        "fr": "Mlle.",
        "ja": "様"
      }
    }
  ],
  "COUNTRY": [
    {
      "code": "US",
      "decode": "United States",
      "translations": {
        "en": "United States"
      }
    },
    {
      "code": "GB",
      "decode": "United Kingdom",
      "translations": {
        "en": "United Kingdom"
      }
    },
    {
      "code": "IN",
      "decode": "India",
      "translations": {
        "en": "India"
      }
    },
    {
      "code": "DE",
      "decode": "Germany",
      "translations": {
        "en": "Germany"
      }
    },
    {
      "code": "FR",
      "decode": "France",
      "translations": {
        "en": "France"
      }
    },
    {
      "code": "JP",
      "decode": "Japan",
      "translations": {
        "en": "Japan"
      }
    },
    {
      "code": "AU",
      "decode": "Australia",
      "translations": {
        "en": "Australia"
      }
    },
    {
      "code": "CA",
      "decode": "Canada",
      "translations": {
        "en": "Canada"
      }
    }
  ],
  "CQ_APPLICABLE_TO": [
    {
      "code": "ICSR",
      "decode": "ICSR Cases",
      "translations": {
        "en": "ICSR Cases",
        "fr": "Cas ICSR",
        "ja": "ICSRケース"
      }
    },
    {
      "code": "LITERATURE",
      "decode": "Literature Cases",
      "translations": {
        "en": "Literature Cases",
        "fr": "Cas de littérature",
        "ja": "文献ケース"
      }
    },
    {
      "code": "EMAIL",
      "decode": "Email Cases",
      "translations": {
        "en": "Email Cases",
        "fr": "Cas par email",
        "ja": "メールケース"
      }
    },
    {
      "code": "ALL",
      "decode": "All Cases",
      "translations": {
        "en": "All Cases",
        "fr": "Tous les cas",
        "ja": "全ケース"
      }
    }
  ],
  "CQ_CATEGORY": [
    {
      "code": "PATIENT_INFO",
      "decode": "Patient Information",
      "translations": {
        "en": "Patient Information",
        "fr": "Informations patient",
        "ja": "患者情報"
      }
    },
    {
      "code": "DRUG_INFO",
      "decode": "Drug Information",
      "translations": {
        "en": "Drug Information",
        "fr": "Informations médicament",
        "ja": "薬剤情報"
      }
    },
    {
      "code": "EVENT_INFO",
      "decode": "Event Information",
      "translations": {
        "en": "Event Information",
        "fr": "Informations événement",
        "ja": "事象情報"
      }
    },
    {
      "code": "REPORTER_INFO",
      "decode": "Reporter Information",
      "translations": {
        "en": "Reporter Information",
        "fr": "Informations déclarant",
        "ja": "報告者情報"
      }
    },
    {
      "code": "LITERATURE",
      "decode": "Literature",
      "translations": {
        "en": "Literature",
        "fr": "Littérature",
        "ja": "文献"
      }
    },
    {
      "code": "EMAIL_CASE",
      "decode": "Email Case",
      "translations": {
        "en": "Email Case",
        "fr": "Cas par email",
        "ja": "メールケース"
      }
    },
    {
      "code": "OTHER",
      "decode": "Other",
      "translations": {
        "en": "Other",
        "fr": "Autre",
        "ja": "その他"
      }
    }
  ],
  "CQ_CHANNEL": [
    {
      "code": "EMAIL",
      "decode": "Email",
      "translations": {
        "en": "Email",
        "fr": "E-mail",
        "ja": "メール"
      }
    },
    {
      "code": "PHONE",
      "decode": "Phone",
      "translations": {
        "en": "Phone",
        "fr": "Téléphone",
        "ja": "電話"
      }
    },
    {
      "code": "FAX",
      "decode": "Fax",
      "translations": {
        "en": "Fax",
        "fr": "Fax",
        "ja": "ファックス"
      }
    },
    {
      "code": "PORTAL",
      "decode": "Portal",
      "translations": {
        "en": "Portal",
        "fr": "Portail",
        "ja": "ポータル"
      }
    },
    {
      "code": "POST",
      "decode": "Post",
      "translations": {
        "en": "Post",
        "fr": "Courrier",
        "ja": "郵便"
      }
    }
  ],
  "CQ_RESPONSE_TYPE": [
    {
      "code": "FREE_TEXT",
      "decode": "Free Text",
      "translations": {
        "en": "Free Text",
        "fr": "Texte libre",
        "ja": "自由記述"
      }
    },
    {
      "code": "DATE",
      "decode": "Date",
      "translations": {
        "en": "Date",
        "fr": "Date",
        "ja": "日付"
      }
    },
    {
      "code": "YES_NO",
      "decode": "Yes / No",
      "translations": {
        "en": "Yes / No",
        "fr": "Oui / Non",
        "ja": "はい/いいえ"
      }
    },
    {
      "code": "CODELIST",
      "decode": "Codelist",
      "translations": {
        "en": "Codelist",
        "fr": "Liste de codes",
        "ja": "コードリスト"
      }
    }
  ],
  "CQ_SUB_CATEGORY": [
    {
      "code": "DEMOGRAPHICS",
      "decode": "Demographics",
      "translations": {
        "en": "Demographics",
        "fr": "Données démographiques",
        "ja": "人口統計"
      }
    },
    {
      "code": "MEDICAL_HISTORY",
      "decode": "Medical History",
      "translations": {
        "en": "Medical History",
        "fr": "Antécédents médicaux",
        "ja": "病歴"
      }
    },
    {
      "code": "DOSING",
      "decode": "Dosing",
      "translations": {
        "en": "Dosing",
        "fr": "Posologie",
        "ja": "用量"
      }
    },
    {
      "code": "INDICATION",
      "decode": "Indication",
      "translations": {
        "en": "Indication",
        "fr": "Indication",
        "ja": "適応症"
      }
    },
    {
      "code": "ACTION_TAKEN",
      "decode": "Action Taken",
      "translations": {
        "en": "Action Taken",
        "fr": "Mesure prise",
        "ja": "措置"
      }
    },
    {
      "code": "RECHALLENGE",
      "decode": "Rechallenge",
      "translations": {
        "en": "Rechallenge",
        "fr": "Réintroduction",
        "ja": "再投与"
      }
    },
    {
      "code": "DECHALLENGE",
      "decode": "Dechallenge",
      "translations": {
        "en": "Dechallenge",
        "fr": "Arrêt du traitement",
        "ja": "投与中止"
      }
    },
    {
      "code": "PRODUCT",
      "decode": "Product",
      "translations": {
        "en": "Product",
        "fr": "Produit",
        "ja": "製品"
      }
    },
    {
      "code": "TIMELINE",
      "decode": "Timeline",
      "translations": {
        "en": "Timeline",
        "fr": "Chronologie",
        "ja": "タイムライン"
      }
    },
    {
      "code": "OUTCOME",
      "decode": "Outcome",
      "translations": {
        "en": "Outcome",
        "fr": "Issue",
        "ja": "転帰"
      }
    },
    {
      "code": "SERIOUSNESS",
      "decode": "Seriousness",
      "translations": {
        "en": "Seriousness",
        "fr": "Gravité",
        "ja": "重篤性"
      }
    },
    {
      "code": "CLINICAL",
      "decode": "Clinical",
      "translations": {
        "en": "Clinical",
        "fr": "Clinique",
        "ja": "臨床"
      }
    },
    {
      "code": "QUALIFICATION",
      "decode": "Qualification",
      "translations": {
        "en": "Qualification",
        "fr": "Qualification",
        "ja": "資格"
      }
    },
    {
      "code": "CONTACT",
      "decode": "Contact",
      "translations": {
        "en": "Contact",
        "fr": "Contact",
        "ja": "連絡先"
      }
    },
    {
      "code": "REFERENCE",
      "decode": "Reference",
      "translations": {
        "en": "Reference",
        "fr": "Référence",
        "ja": "参考文献"
      }
    },
    {
      "code": "CONSENT",
      "decode": "Consent",
      "translations": {
        "en": "Consent",
        "fr": "Consentement",
        "ja": "同意"
      }
    }
  ],
  "CQL_APPLICABLE_TO": [
    {
      "code": "ICSR",
      "decode": "ICSR Cases",
      "translations": {
        "en": "ICSR Cases"
      }
    },
    {
      "code": "LITERATURE",
      "decode": "Literature Cases",
      "translations": {
        "en": "Literature Cases"
      }
    },
    {
      "code": "EMAIL",
      "decode": "Email Cases",
      "translations": {
        "en": "Email Cases"
      }
    },
    {
      "code": "ALL",
      "decode": "All",
      "translations": {
        "en": "All"
      }
    }
  ],
  "CQL_CATEGORY": [
    {
      "code": "CLINICAL",
      "decode": "Clinical",
      "translations": {
        "en": "Clinical"
      }
    },
    {
      "code": "REGULATORY",
      "decode": "Regulatory",
      "translations": {
        "en": "Regulatory"
      }
    },
    {
      "code": "PRODUCT",
      "decode": "Product",
      "translations": {
        "en": "Product"
      }
    },
    {
      "code": "PATIENT",
      "decode": "Patient",
      "translations": {
        "en": "Patient"
      }
    },
    {
      "code": "REPORTER",
      "decode": "Reporter",
      "translations": {
        "en": "Reporter"
      }
    },
    {
      "code": "OTHER",
      "decode": "Other",
      "translations": {
        "en": "Other"
      }
    }
  ],
  "CQL_RESPONSE_TYPE": [
    {
      "code": "FREE_TEXT",
      "decode": "Free Text",
      "translations": {
        "en": "Free Text"
      }
    },
    {
      "code": "DATE",
      "decode": "Date",
      "translations": {
        "en": "Date"
      }
    },
    {
      "code": "YES_NO",
      "decode": "Yes / No",
      "translations": {
        "en": "Yes / No"
      }
    },
    {
      "code": "CODELIST",
      "decode": "Codelist",
      "translations": {
        "en": "Codelist"
      }
    },
    {
      "code": "NUMBER",
      "decode": "Number",
      "translations": {
        "en": "Number"
      }
    }
  ],
  "DEPT_TYPE": [
    {
      "code": "SAFETY",
      "decode": "Drug Safety",
      "translations": {
        "en": "Drug Safety"
      }
    },
    {
      "code": "REGULATORY",
      "decode": "Regulatory Affairs",
      "translations": {
        "en": "Regulatory Affairs"
      }
    },
    {
      "code": "MEDICAL",
      "decode": "Medical Affairs",
      "translations": {
        "en": "Medical Affairs"
      }
    },
    {
      "code": "CLINICAL",
      "decode": "Clinical",
      "translations": {
        "en": "Clinical"
      }
    },
    {
      "code": "IT",
      "decode": "IT",
      "translations": {
        "en": "IT"
      }
    },
    {
      "code": "QUALITY",
      "decode": "Quality",
      "translations": {
        "en": "Quality"
      }
    },
    {
      "code": "OTHER",
      "decode": "Other",
      "translations": {
        "en": "Other"
      }
    }
  ],
  "EC_STATUS": [
    {
      "code": "NEW",
      "decode": "New",
      "translations": {
        "en": "New",
        "fr": "Nouveau",
        "ja": "新規"
      }
    },
    {
      "code": "IN_REVIEW",
      "decode": "In Review",
      "translations": {
        "en": "In Review",
        "fr": "En révision",
        "ja": "レビュー中"
      }
    },
    {
      "code": "TRIAGED",
      "decode": "Triaged",
      "translations": {
        "en": "Triaged",
        "fr": "Trié",
        "ja": "トリアージ済み"
      }
    },
    {
      "code": "CLOSED",
      "decode": "Closed",
      "translations": {
        "en": "Closed",
        "fr": "Fermé",
        "ja": "クローズ"
      }
    }
  ],
  "EC_TRIAGE_DECISION": [
    {
      "code": "CREATE_CASE",
      "decode": "Create ICSR Case",
      "translations": {
        "en": "Create ICSR Case",
        "fr": "Créer un cas ICSR",
        "ja": "ICSRケース作成"
      }
    },
    {
      "code": "NON_SAFETY",
      "decode": "Non-Safety",
      "translations": {
        "en": "Non-Safety",
        "fr": "Non lié à la sécurité",
        "ja": "非安全性"
      }
    },
    {
      "code": "PENDING_REVIEW",
      "decode": "Pending Review",
      "translations": {
        "en": "Pending Review",
        "fr": "En attente de révision",
        "ja": "レビュー待ち"
      }
    }
  ],
  "FILE_TYPE": [
    {
      "code": "PDF",
      "decode": "PDF",
      "translations": {
        "en": "PDF",
        "fr": "PDF",
        "ja": "PDF"
      }
    },
    {
      "code": "WORD",
      "decode": "Word Document",
      "translations": {
        "en": "Word Document",
        "fr": "Document Word",
        "ja": "Wordドキュメント"
      }
    },
    {
      "code": "EXCEL",
      "decode": "Excel Spreadsheet",
      "translations": {
        "en": "Excel Spreadsheet",
        "fr": "Feuille Excel",
        "ja": "Excelスプレッドシート"
      }
    },
    {
      "code": "IMAGE",
      "decode": "Image",
      "translations": {
        "en": "Image",
        "fr": "Image",
        "ja": "画像"
      }
    },
    {
      "code": "TEXT",
      "decode": "Text File",
      "translations": {
        "en": "Text File",
        "fr": "Fichier texte",
        "ja": "テキストファイル"
      }
    },
    {
      "code": "XML",
      "decode": "XML",
      "translations": {
        "en": "XML",
        "fr": "XML",
        "ja": "XML"
      }
    },
    {
      "code": "OTHER",
      "decode": "Other",
      "translations": {
        "en": "Other",
        "fr": "Autre",
        "ja": "その他"
      }
    }
  ],
  "FORM_OF_ADMIN": [
    {
      "code": "TABLET",
      "decode": "Tablet",
      "translations": {
        "en": "Tablet",
        "fr": "Comprimé",
        "ja": "錠剤"
      }
    },
    {
      "code": "CAPSULE",
      "decode": "Capsule",
      "translations": {
        "en": "Capsule",
        "fr": "Gélule",
        "ja": "カプセル"
      }
    },
    {
      "code": "SOLUTION",
      "decode": "Solution for injection",
      "translations": {
        "en": "Solution for injection",
        "fr": "Solution injectable",
        "ja": "注射液"
      }
    },
    {
      "code": "POWDER",
      "decode": "Powder for solution",
      "translations": {
        "en": "Powder for solution",
        "fr": "Poudre pour solution",
        "ja": "溶解用粉末"
      }
    },
    {
      "code": "SUSPENSION",
      "decode": "Suspension",
      "translations": {
        "en": "Suspension",
        "fr": "Suspension",
        "ja": "懸濁液"
      }
    },
    {
      "code": "CREAM",
      "decode": "Cream",
      "translations": {
        "en": "Cream",
        "fr": "Crème",
        "ja": "クリーム"
      }
    },
    {
      "code": "OINTMENT",
      "decode": "Ointment",
      "translations": {
        "en": "Ointment",
        "fr": "Pommade",
        "ja": "軟膏"
      }
    },
    {
      "code": "PATCH",
      "decode": "Transdermal patch",
      "translations": {
        "en": "Transdermal patch",
        "fr": "Patch transdermique",
        "ja": "経皮パッチ"
      }
    },
    {
      "code": "INHALER",
      "decode": "Inhalation solution",
      "translations": {
        "en": "Inhalation solution",
        "fr": "Solution pour inhalation",
        "ja": "吸入液"
      }
    },
    {
      "code": "DROPS",
      "decode": "Eye drops",
      "translations": {
        "en": "Eye drops",
        "fr": "Collyre",
        "ja": "点眼液"
      }
    },
    {
      "code": "SUPPOSITORY",
      "decode": "Suppository",
      "translations": {
        "en": "Suppository",
        "fr": "Suppositoire",
        "ja": "坐剤"
      }
    },
    {
      "code": "SYRUP",
      "decode": "Oral solution / Syrup",
      "translations": {
        "en": "Oral solution / Syrup",
        "fr": "Solution orale / Sirop",
        "ja": "内服液・シロップ"
      }
    },
    {
      "code": "OTHER",
      "decode": "Other",
      "translations": {
        "en": "Other",
        "fr": "Autre",
        "ja": "その他"
      }
    }
  ],
  "HEALTH_AUTHORITY": [
    {
      "code": "FDA",
      "decode": "FDA (USA)",
      "translations": {
        "en": "FDA (USA)",
        "fr": "FDA (États-Unis)",
        "ja": "FDA（米国）"
      }
    },
    {
      "code": "EMA",
      "decode": "EMA (European Union)",
      "translations": {
        "en": "EMA (European Union)",
        "fr": "EMA (Union européenne)",
        "ja": "EMA（欧州連合）"
      }
    },
    {
      "code": "MHRA",
      "decode": "MHRA (United Kingdom)",
      "translations": {
        "en": "MHRA (United Kingdom)",
        "fr": "MHRA (Royaume-Uni)",
        "ja": "MHRA（英国）"
      }
    },
    {
      "code": "PMDA",
      "decode": "PMDA (Japan)",
      "translations": {
        "en": "PMDA (Japan)",
        "fr": "PMDA (Japon)",
        "ja": "PMDA（日本）"
      }
    },
    {
      "code": "BFARM",
      "decode": "BfArM (Germany)",
      "translations": {
        "en": "BfArM (Germany)",
        "fr": "BfArM (Allemagne)",
        "ja": "BfArM（ドイツ）"
      }
    },
    {
      "code": "ANSM",
      "decode": "ANSM (France)",
      "translations": {
        "en": "ANSM (France)",
        "fr": "ANSM (France)",
        "ja": "ANSM（フランス）"
      }
    },
    {
      "code": "CDSCO",
      "decode": "CDSCO (India)",
      "translations": {
        "en": "CDSCO (India)",
        "fr": "CDSCO (Inde)",
        "ja": "CDSCO（インド）"
      }
    },
    {
      "code": "TGA",
      "decode": "TGA (Australia)",
      "translations": {
        "en": "TGA (Australia)",
        "fr": "TGA (Australie)",
        "ja": "TGA（オーストラリア）"
      }
    },
    {
      "code": "HEALTH_CA",
      "decode": "Health Canada",
      "translations": {
        "en": "Health Canada",
        "fr": "Santé Canada",
        "ja": "ヘルスカナダ"
      }
    },
    {
      "code": "SWISSMEDIC",
      "decode": "Swissmedic (Switzerland)",
      "translations": {
        "en": "Swissmedic (Switzerland)",
        "fr": "Swissmedic (Suisse)",
        "ja": "スイスメディック（スイス）"
      }
    },
    {
      "code": "ANVISA",
      "decode": "ANVISA (Brazil)",
      "translations": {
        "en": "ANVISA (Brazil)",
        "fr": "ANVISA (Brésil)",
        "ja": "ANVISA（ブラジル）"
      }
    },
    {
      "code": "HSA",
      "decode": "HSA (Singapore)",
      "translations": {
        "en": "HSA (Singapore)",
        "fr": "HSA (Singapour)",
        "ja": "HSA（シンガポール）"
      }
    },
    {
      "code": "OTHER",
      "decode": "Other",
      "translations": {
        "en": "Other",
        "fr": "Autre",
        "ja": "その他"
      }
    }
  ],
  "INGREDIENT_CLASS": [
    {
      "code": "CONSUMER",
      "decode": "Consumer",
      "translations": {
        "en": "Consumer",
        "fr": "Consommateur",
        "ja": "消費者"
      }
    },
    {
      "code": "NON_PHARMA",
      "decode": "Non-Pharmaceutical Product",
      "translations": {
        "en": "Non-Pharmaceutical Product",
        "fr": "Produit non pharmaceutique",
        "ja": "非医薬品"
      }
    },
    {
      "code": "PHARMA",
      "decode": "Pharmaceutical Product",
      "translations": {
        "en": "Pharmaceutical Product",
        "fr": "Produit pharmaceutique",
        "ja": "医薬品"
      }
    }
  ],
  "LANGUAGE": [
    {
      "code": "EN",
      "decode": "English",
      "translations": {
        "en": "English",
        "fr": "Anglais",
        "ja": "英語"
      }
    },
    {
      "code": "FR",
      "decode": "French",
      "translations": {
        "en": "French",
        "fr": "Français",
        "ja": "フランス語"
      }
    },
    {
      "code": "JA",
      "decode": "Japanese",
      "translations": {
        "en": "Japanese",
        "fr": "Japonais",
        "ja": "日本語"
      }
    },
    {
      "code": "DE",
      "decode": "German",
      "translations": {
        "en": "German",
        "fr": "Allemand",
        "ja": "ドイツ語"
      }
    },
    {
      "code": "ES",
      "decode": "Spanish",
      "translations": {
        "en": "Spanish",
        "fr": "Espagnol",
        "ja": "スペイン語"
      }
    },
    {
      "code": "IT",
      "decode": "Italian",
      "translations": {
        "en": "Italian",
        "fr": "Italien",
        "ja": "イタリア語"
      }
    },
    {
      "code": "PT",
      "decode": "Portuguese",
      "translations": {
        "en": "Portuguese",
        "fr": "Portugais",
        "ja": "ポルトガル語"
      }
    },
    {
      "code": "ZH",
      "decode": "Chinese",
      "translations": {
        "en": "Chinese",
        "fr": "Chinois",
        "ja": "中国語"
      }
    }
  ],
  "LIT_SEARCH_STRATEGY": [
    {
      "code": "WEEKLY",
      "decode": "Weekly",
      "translations": {
        "en": "Weekly",
        "fr": "Hebdomadaire",
        "ja": "週次"
      }
    },
    {
      "code": "MONTHLY",
      "decode": "Monthly",
      "translations": {
        "en": "Monthly",
        "fr": "Mensuel",
        "ja": "月次"
      }
    },
    {
      "code": "ADHOC",
      "decode": "Ad-hoc",
      "translations": {
        "en": "Ad-hoc",
        "fr": "Ponctuel",
        "ja": "随時"
      }
    }
  ],
  "LIT_SOURCE_TYPE": [
    {
      "code": "PUBMED",
      "decode": "PubMed",
      "translations": {
        "en": "PubMed",
        "fr": "PubMed",
        "ja": "PubMed"
      }
    },
    {
      "code": "EMBASE",
      "decode": "Embase",
      "translations": {
        "en": "Embase",
        "fr": "Embase",
        "ja": "Embase"
      }
    },
    {
      "code": "MANUAL",
      "decode": "Manual Entry",
      "translations": {
        "en": "Manual Entry",
        "fr": "Saisie manuelle",
        "ja": "手動入力"
      }
    },
    {
      "code": "OTHER",
      "decode": "Other",
      "translations": {
        "en": "Other",
        "fr": "Autre",
        "ja": "その他"
      }
    }
  ],
  "LIT_STATUS": [
    {
      "code": "NEW",
      "decode": "New",
      "translations": {
        "en": "New",
        "fr": "Nouveau",
        "ja": "新規"
      }
    },
    {
      "code": "IN_REVIEW",
      "decode": "In Review",
      "translations": {
        "en": "In Review",
        "fr": "En révision",
        "ja": "レビュー中"
      }
    },
    {
      "code": "ASSESSED",
      "decode": "Assessed",
      "translations": {
        "en": "Assessed",
        "fr": "Évalué",
        "ja": "評価済み"
      }
    },
    {
      "code": "CLOSED",
      "decode": "Closed",
      "translations": {
        "en": "Closed",
        "fr": "Fermé",
        "ja": "クローズ"
      }
    }
  ],
  "MADE_BY": [
    {
      "code": "COMPANY",
      "decode": "Company",
      "translations": {
        "en": "Company",
        "fr": "Société",
        "ja": "自社"
      }
    },
    {
      "code": "PARTNER",
      "decode": "Partner",
      "translations": {
        "en": "Partner",
        "fr": "Partenaire",
        "ja": "パートナー"
      }
    },
    {
      "code": "THIRD_PARTY",
      "decode": "Third Party",
      "translations": {
        "en": "Third Party",
        "fr": "Tiers",
        "ja": "第三者"
      }
    },
    {
      "code": "GENERIC",
      "decode": "Generic",
      "translations": {
        "en": "Generic",
        "fr": "Générique",
        "ja": "ジェネリック"
      }
    },
    {
      "code": "OTHER",
      "decode": "Other",
      "translations": {
        "en": "Other",
        "fr": "Autre",
        "ja": "その他"
      }
    }
  ],
  "PRIORITY": [
    {
      "code": "HIGH",
      "decode": "High",
      "translations": {
        "en": "High"
      }
    },
    {
      "code": "MEDIUM",
      "decode": "Medium",
      "translations": {
        "en": "Medium"
      }
    },
    {
      "code": "LOW",
      "decode": "Low",
      "translations": {
        "en": "Low"
      }
    }
  ],
  "PRODUCT_CLASS": [
    {
      "code": "CLASS_1",
      "decode": "Class 1",
      "translations": {
        "en": "Class 1",
        "fr": "Classe 1",
        "ja": "クラス1"
      }
    },
    {
      "code": "CLASS_2",
      "decode": "Class 2",
      "translations": {
        "en": "Class 2",
        "fr": "Classe 2",
        "ja": "クラス2"
      }
    },
    {
      "code": "CLASS_3",
      "decode": "Class 3",
      "translations": {
        "en": "Class 3",
        "fr": "Classe 3",
        "ja": "クラス3"
      }
    },
    {
      "code": "CLASS_4",
      "decode": "Class 4",
      "translations": {
        "en": "Class 4",
        "fr": "Classe 4",
        "ja": "クラス4"
      }
    },
    {
      "code": "CLASS_5",
      "decode": "Class 5",
      "translations": {
        "en": "Class 5",
        "fr": "Classe 5",
        "ja": "クラス5"
      }
    }
  ],
  "PRODUCT_FLAG": [
    {
      "code": "DRUG",
      "decode": "Drug",
      "translations": {
        "en": "Drug",
        "fr": "Médicament",
        "ja": "医薬品"
      }
    },
    {
      "code": "DEVICE",
      "decode": "Device",
      "translations": {
        "en": "Device",
        "fr": "Dispositif médical",
        "ja": "医療機器"
      }
    },
    {
      "code": "VACCINE",
      "decode": "Vaccine",
      "translations": {
        "en": "Vaccine",
        "fr": "Vaccin",
        "ja": "ワクチン"
      }
    },
    {
      "code": "BIOLOGIC",
      "decode": "Biologic",
      "translations": {
        "en": "Biologic",
        "fr": "Biologique",
        "ja": "生物製剤"
      }
    },
    {
      "code": "COMBINATION",
      "decode": "Combination Product",
      "translations": {
        "en": "Combination Product",
        "fr": "Produit combiné",
        "ja": "配合製品"
      }
    },
    {
      "code": "NUTRACEUTICAL",
      "decode": "Nutraceutical",
      "translations": {
        "en": "Nutraceutical",
        "fr": "Nutraceutique",
        "ja": "機能性食品"
      }
    },
    {
      "code": "OTHER",
      "decode": "Other",
      "translations": {
        "en": "Other",
        "fr": "Autre",
        "ja": "その他"
      }
    }
  ],
  "REG_AUTHORITY": [
    {
      "code": "FDA",
      "decode": "FDA",
      "translations": {
        "en": "FDA",
        "fr": "FDA",
        "ja": "FDA"
      }
    },
    {
      "code": "EMA",
      "decode": "EMA",
      "translations": {
        "en": "EMA",
        "fr": "EMA",
        "ja": "EMA"
      }
    },
    {
      "code": "EUDAMED",
      "decode": "EUDAMED",
      "translations": {
        "en": "EUDAMED",
        "fr": "EUDAMED",
        "ja": "EUDAMED"
      }
    },
    {
      "code": "MHRA",
      "decode": "MHRA",
      "translations": {
        "en": "MHRA",
        "fr": "MHRA",
        "ja": "MHRA"
      }
    },
    {
      "code": "PMDA",
      "decode": "PMDA",
      "translations": {
        "en": "PMDA",
        "fr": "PMDA",
        "ja": "PMDA"
      }
    },
    {
      "code": "BFARM",
      "decode": "BfArM",
      "translations": {
        "en": "BfArM",
        "fr": "BfArM",
        "ja": "BfArM"
      }
    },
    {
      "code": "ANSM",
      "decode": "ANSM",
      "translations": {
        "en": "ANSM",
        "fr": "ANSM",
        "ja": "ANSM"
      }
    },
    {
      "code": "HEALTH_CA",
      "decode": "Health Canada",
      "translations": {
        "en": "Health Canada",
        "fr": "Santé Canada",
        "ja": "ヘルスカナダ"
      }
    },
    {
      "code": "TGA",
      "decode": "TGA",
      "translations": {
        "en": "TGA",
        "fr": "TGA",
        "ja": "TGA"
      }
    },
    {
      "code": "SWISSMEDIC",
      "decode": "Swissmedic",
      "translations": {
        "en": "Swissmedic",
        "fr": "Swissmedic",
        "ja": "スイスメディック"
      }
    },
    {
      "code": "OTHER",
      "decode": "Other",
      "translations": {
        "en": "Other",
        "fr": "Autre",
        "ja": "その他"
      }
    }
  ],
  "ROUTE_OF_ADMIN": [
    {
      "code": "ORAL",
      "decode": "Oral",
      "translations": {
        "en": "Oral",
        "fr": "Oral",
        "ja": "経口"
      }
    },
    {
      "code": "IV",
      "decode": "Intravenous",
      "translations": {
        "en": "Intravenous",
        "fr": "Intraveineux",
        "ja": "静脈内"
      }
    },
    {
      "code": "IM",
      "decode": "Intramuscular",
      "translations": {
        "en": "Intramuscular",
        "fr": "Intramusculaire",
        "ja": "筋肉内"
      }
    },
    {
      "code": "SC",
      "decode": "Subcutaneous",
      "translations": {
        "en": "Subcutaneous",
        "fr": "Sous-cutané",
        "ja": "皮下"
      }
    },
    {
      "code": "TOPICAL",
      "decode": "Topical",
      "translations": {
        "en": "Topical",
        "fr": "Topique",
        "ja": "局所"
      }
    },
    {
      "code": "INHALED",
      "decode": "Inhalation",
      "translations": {
        "en": "Inhalation",
        "fr": "Inhalation",
        "ja": "吸入"
      }
    },
    {
      "code": "TRANSDERMAL",
      "decode": "Transdermal",
      "translations": {
        "en": "Transdermal",
        "fr": "Transdermique",
        "ja": "経皮"
      }
    },
    {
      "code": "OPHTHALMIC",
      "decode": "Ophthalmic",
      "translations": {
        "en": "Ophthalmic",
        "fr": "Ophtalmique",
        "ja": "眼科"
      }
    },
    {
      "code": "NASAL",
      "decode": "Nasal",
      "translations": {
        "en": "Nasal",
        "fr": "Nasal",
        "ja": "鼻腔内"
      }
    },
    {
      "code": "RECTAL",
      "decode": "Rectal",
      "translations": {
        "en": "Rectal",
        "fr": "Rectal",
        "ja": "直腸内"
      }
    },
    {
      "code": "VAGINAL",
      "decode": "Vaginal",
      "translations": {
        "en": "Vaginal",
        "fr": "Vaginal",
        "ja": "膣内"
      }
    },
    {
      "code": "INTRATHECAL",
      "decode": "Intrathecal",
      "translations": {
        "en": "Intrathecal",
        "fr": "Intrathécal",
        "ja": "髄腔内"
      }
    },
    {
      "code": "UNKNOWN",
      "decode": "Unknown",
      "translations": {
        "en": "Unknown",
        "fr": "Inconnu",
        "ja": "不明"
      }
    },
    {
      "code": "OTHER",
      "decode": "Other",
      "translations": {
        "en": "Other",
        "fr": "Autre",
        "ja": "その他"
      }
    }
  ],
  "SEX": [
    {
      "code": "M",
      "decode": "Male",
      "translations": {
        "en": "Male",
        "fr": "Masculin",
        "de": "Männlich"
      }
    },
    {
      "code": "F",
      "decode": "Female",
      "translations": {
        "en": "Female",
        "fr": "Féminin",
        "de": "Weiblich"
      }
    },
    {
      "code": "U",
      "decode": "Unknown",
      "translations": {
        "en": "Unknown",
        "fr": "Inconnu",
        "de": "Unbekannt"
      }
    }
  ],
  "SPONSOR_TYPE": [
    {
      "code": "COMPANY_SPONSORED",
      "decode": "Company Sponsored",
      "translations": {
        "en": "Company Sponsored",
        "fr": "Sponsorisé par la société",
        "ja": "企業スポンサー"
      }
    },
    {
      "code": "NON_COMPANY_SPONSORED",
      "decode": "Non-Company Sponsored",
      "translations": {
        "en": "Non-Company Sponsored",
        "fr": "Non sponsorisé",
        "ja": "非企業スポンサー"
      }
    },
    {
      "code": "CO_DEVELOPED",
      "decode": "Co-developed",
      "translations": {
        "en": "Co-developed",
        "fr": "Co-développé",
        "ja": "共同開発"
      }
    }
  ],
  "STUDY_DESIGN": [
    {
      "code": "COMPARATOR",
      "decode": "Comparator",
      "translations": {
        "en": "Comparator",
        "fr": "Comparateur",
        "ja": "比較試験"
      }
    },
    {
      "code": "CROSS_OVER",
      "decode": "Cross-over",
      "translations": {
        "en": "Cross-over",
        "fr": "Croisé",
        "ja": "クロスオーバー"
      }
    },
    {
      "code": "INTERVENTIONAL",
      "decode": "Interventional",
      "translations": {
        "en": "Interventional",
        "fr": "Interventionnel",
        "ja": "介入試験"
      }
    },
    {
      "code": "OBSERVATIONAL",
      "decode": "Observational",
      "translations": {
        "en": "Observational",
        "fr": "Observationnel",
        "ja": "観察試験"
      }
    },
    {
      "code": "OTHERS",
      "decode": "Others",
      "translations": {
        "en": "Others",
        "fr": "Autres",
        "ja": "その他"
      }
    }
  ],
  "STUDY_PHASE": [
    {
      "code": "MICRODOSE",
      "decode": "Microdose Study",
      "translations": {
        "en": "Microdose Study",
        "fr": "Étude microdose",
        "ja": "マイクロドーズ試験"
      }
    },
    {
      "code": "PHASE_I",
      "decode": "Phase I",
      "translations": {
        "en": "Phase I",
        "fr": "Phase I",
        "ja": "第I相"
      }
    },
    {
      "code": "PHASE_II",
      "decode": "Phase II",
      "translations": {
        "en": "Phase II",
        "fr": "Phase II",
        "ja": "第II相"
      }
    },
    {
      "code": "PHASE_III",
      "decode": "Phase III",
      "translations": {
        "en": "Phase III",
        "fr": "Phase III",
        "ja": "第III相"
      }
    },
    {
      "code": "PHASE_I_II",
      "decode": "Phase I/II",
      "translations": {
        "en": "Phase I/II",
        "fr": "Phase I/II",
        "ja": "第I/II相"
      }
    },
    {
      "code": "PHASE_II_III",
      "decode": "Phase II/III",
      "translations": {
        "en": "Phase II/III",
        "fr": "Phase II/III",
        "ja": "第II/III相"
      }
    },
    {
      "code": "PHASE_I_III",
      "decode": "Phase I/III",
      "translations": {
        "en": "Phase I/III",
        "fr": "Phase I/III",
        "ja": "第I/III相"
      }
    },
    {
      "code": "PHASE_IV",
      "decode": "Phase IV",
      "translations": {
        "en": "Phase IV",
        "fr": "Phase IV",
        "ja": "第IV相"
      }
    },
    {
      "code": "BIO_EQUIV",
      "decode": "Bio Equivalence Study",
      "translations": {
        "en": "Bio Equivalence Study",
        "fr": "Étude de bioéquivalence",
        "ja": "生物学的同等性試験"
      }
    },
    {
      "code": "CLIN_PHARM",
      "decode": "Clinical Pharmacology Test",
      "translations": {
        "en": "Clinical Pharmacology Test",
        "fr": "Test de pharmacologie clinique",
        "ja": "臨床薬理試験"
      }
    },
    {
      "code": "PREP_SUBMIT",
      "decode": "Under preparation for submission",
      "translations": {
        "en": "Under preparation for submission",
        "fr": "En préparation pour soumission",
        "ja": "申請準備中"
      }
    },
    {
      "code": "UNDER_APPLIC",
      "decode": "Under Application",
      "translations": {
        "en": "Under Application",
        "fr": "En cours de demande",
        "ja": "申請中"
      }
    },
    {
      "code": "OTHER",
      "decode": "Other",
      "translations": {
        "en": "Other",
        "fr": "Autre",
        "ja": "その他"
      }
    }
  ],
  "STUDY_PRIMARY_SOURCE": [
    {
      "code": "AFFILIATE",
      "decode": "Affiliate",
      "translations": {
        "en": "Affiliate",
        "fr": "Affilié",
        "ja": "関連会社"
      }
    },
    {
      "code": "BIOMEDICAL",
      "decode": "Biomedical",
      "translations": {
        "en": "Biomedical",
        "fr": "Biomédical",
        "ja": "生物医学"
      }
    },
    {
      "code": "CLINICAL_TRIAL",
      "decode": "Clinical Trial",
      "translations": {
        "en": "Clinical Trial",
        "fr": "Essai clinique",
        "ja": "臨床試験"
      }
    },
    {
      "code": "COMPANY_REP",
      "decode": "Company representative",
      "translations": {
        "en": "Company representative",
        "fr": "Représentant de la société",
        "ja": "会社代表者"
      }
    },
    {
      "code": "DISTRIBUTOR",
      "decode": "Distributor",
      "translations": {
        "en": "Distributor",
        "fr": "Distributeur",
        "ja": "販売店"
      }
    },
    {
      "code": "DRUG_MONITORING",
      "decode": "Drug Monitoring",
      "translations": {
        "en": "Drug Monitoring",
        "fr": "Surveillance des médicaments",
        "ja": "医薬品モニタリング"
      }
    },
    {
      "code": "FOREIGN",
      "decode": "Foreign",
      "translations": {
        "en": "Foreign",
        "fr": "Étranger",
        "ja": "外国"
      }
    },
    {
      "code": "HEALTH_AUTHORITY",
      "decode": "Health authority",
      "translations": {
        "en": "Health authority",
        "fr": "Autorité de santé",
        "ja": "保健当局"
      }
    },
    {
      "code": "OBSERVATIONAL_STUDY",
      "decode": "Observational study",
      "translations": {
        "en": "Observational study",
        "fr": "Étude observationnelle",
        "ja": "観察研究"
      }
    },
    {
      "code": "OTHER",
      "decode": "Other",
      "translations": {
        "en": "Other",
        "fr": "Autre",
        "ja": "その他"
      }
    },
    {
      "code": "PARTNER",
      "decode": "Partner",
      "translations": {
        "en": "Partner",
        "fr": "Partenaire",
        "ja": "パートナー"
      }
    },
    {
      "code": "PSP",
      "decode": "Patient Support Program",
      "translations": {
        "en": "Patient Support Program",
        "fr": "Programme de soutien aux patients",
        "ja": "患者支援プログラム"
      }
    },
    {
      "code": "PSUR_SPONTANEOUS",
      "decode": "Psur_spontaneous",
      "translations": {
        "en": "Psur_spontaneous",
        "fr": "PSUR spontané",
        "ja": "PSUR自発報告"
      }
    },
    {
      "code": "PSUR_STUDY",
      "decode": "Psur_study",
      "translations": {
        "en": "Psur_study",
        "fr": "PSUR étude",
        "ja": "PSUR試験"
      }
    },
    {
      "code": "USE_RESULT_SURV",
      "decode": "Use result Surveillance",
      "translations": {
        "en": "Use result Surveillance",
        "fr": "Surveillance des résultats",
        "ja": "使用結果調査"
      }
    },
    {
      "code": "USER_FACILITY",
      "decode": "User Facility",
      "translations": {
        "en": "User Facility",
        "fr": "Établissement utilisateur",
        "ja": "使用施設"
      }
    }
  ],
  "STUDY_PRODUCT_TYPE": [
    {
      "code": "AUXILIARY",
      "decode": "Auxiliary product",
      "translations": {
        "en": "Auxiliary product",
        "fr": "Produit auxiliaire",
        "ja": "補助製品"
      }
    },
    {
      "code": "BACKGROUND",
      "decode": "Background Product",
      "translations": {
        "en": "Background Product",
        "fr": "Produit de fond",
        "ja": "背景製品"
      }
    },
    {
      "code": "BLINDED",
      "decode": "Blinded",
      "translations": {
        "en": "Blinded",
        "fr": "En aveugle",
        "ja": "盲検"
      }
    },
    {
      "code": "COMPARATOR",
      "decode": "Comparator Product (Reference Drug)",
      "translations": {
        "en": "Comparator Product (Reference Drug)",
        "fr": "Produit comparateur (médicament de référence)",
        "ja": "比較薬（参照薬）"
      }
    },
    {
      "code": "NOT_ADMINISTERED",
      "decode": "Drug Not administered",
      "translations": {
        "en": "Drug Not administered",
        "fr": "Médicament non administré",
        "ja": "未投与薬"
      }
    },
    {
      "code": "PLACEBO",
      "decode": "Placebo/Vehicle",
      "translations": {
        "en": "Placebo/Vehicle",
        "fr": "Placebo/Véhicule",
        "ja": "プラセボ/媒体"
      }
    },
    {
      "code": "RUN_IN",
      "decode": "Run in Product",
      "translations": {
        "en": "Run in Product",
        "fr": "Produit de rodage",
        "ja": "導入製品"
      }
    },
    {
      "code": "STUDY_PRODUCT",
      "decode": "Study Product (Test Drug)",
      "translations": {
        "en": "Study Product (Test Drug)",
        "fr": "Produit d'étude (médicament test)",
        "ja": "試験製品（被験薬）"
      }
    },
    {
      "code": "CONTROL",
      "decode": "Control (Negative or Positive)",
      "translations": {
        "en": "Control (Negative or Positive)",
        "fr": "Contrôle (négatif ou positif)",
        "ja": "対照（陰性または陽性）"
      }
    },
    {
      "code": "DRUG_ADMIN",
      "decode": "Drug Administered",
      "translations": {
        "en": "Drug Administered",
        "fr": "Médicament administré",
        "ja": "投与薬"
      }
    },
    {
      "code": "OTHERS",
      "decode": "Others",
      "translations": {
        "en": "Others",
        "fr": "Autres",
        "ja": "その他"
      }
    }
  ],
  "STUDY_TYPE": [
    {
      "code": "CLINICAL_TRIAL",
      "decode": "Clinical Trials",
      "translations": {
        "en": "Clinical Trials",
        "fr": "Essais cliniques",
        "ja": "臨床試験"
      }
    },
    {
      "code": "INDIVIDUAL_USE",
      "decode": "Individual Patient Use",
      "translations": {
        "en": "Individual Patient Use",
        "fr": "Utilisation individuelle",
        "ja": "個別患者使用"
      }
    },
    {
      "code": "OTHER_STUDIES",
      "decode": "Other Studies",
      "translations": {
        "en": "Other Studies",
        "fr": "Autres études",
        "ja": "その他の試験"
      }
    },
    {
      "code": "IND_STUDY",
      "decode": "IND Study",
      "translations": {
        "en": "IND Study",
        "fr": "Étude IND",
        "ja": "IND試験"
      }
    },
    {
      "code": "NON_IND_STUDY",
      "decode": "Non IND Study",
      "translations": {
        "en": "Non IND Study",
        "fr": "Étude non IND",
        "ja": "非IND試験"
      }
    },
    {
      "code": "POST_MARKETING",
      "decode": "Post Marketing Study",
      "translations": {
        "en": "Post Marketing Study",
        "fr": "Étude post-commercialisation",
        "ja": "市販後試験"
      }
    },
    {
      "code": "PSP",
      "decode": "Patient Support Program",
      "translations": {
        "en": "Patient Support Program",
        "fr": "Programme de soutien patients",
        "ja": "患者支援プログラム"
      }
    },
    {
      "code": "AGGREGATE",
      "decode": "Aggregate",
      "translations": {
        "en": "Aggregate",
        "fr": "Agrégé",
        "ja": "集積"
      }
    }
  ],
  "SUBMISSION_TYPE": [
    {
      "code": "NDA",
      "decode": "NDA (New Drug Application)",
      "translations": {
        "en": "NDA (New Drug Application)",
        "fr": "NDA",
        "ja": "新薬承認申請"
      }
    },
    {
      "code": "BLA",
      "decode": "BLA (Biologics License Application)",
      "translations": {
        "en": "BLA (Biologics License Application)",
        "fr": "BLA",
        "ja": "生物製剤ライセンス申請"
      }
    },
    {
      "code": "MAA",
      "decode": "MAA (Marketing Authorisation Application)",
      "translations": {
        "en": "MAA (Marketing Authorisation Application)",
        "fr": "MAA",
        "ja": "販売承認申請"
      }
    },
    {
      "code": "ANDA",
      "decode": "ANDA (Abbreviated NDA)",
      "translations": {
        "en": "ANDA (Abbreviated NDA)",
        "fr": "ANDA",
        "ja": "簡略新薬承認申請"
      }
    },
    {
      "code": "IND",
      "decode": "IND (Investigational New Drug)",
      "translations": {
        "en": "IND (Investigational New Drug)",
        "fr": "IND",
        "ja": "治験薬申請"
      }
    },
    {
      "code": "VARIATION",
      "decode": "Variation",
      "translations": {
        "en": "Variation",
        "fr": "Variation",
        "ja": "変更申請"
      }
    },
    {
      "code": "RENEWAL",
      "decode": "Renewal",
      "translations": {
        "en": "Renewal",
        "fr": "Renouvellement",
        "ja": "更新申請"
      }
    },
    {
      "code": "OTHER",
      "decode": "Other",
      "translations": {
        "en": "Other",
        "fr": "Autre",
        "ja": "その他"
      }
    }
  ],
  "SUBSTANCE_ROLE": [
    {
      "code": "ACTIVE",
      "decode": "Active Substance",
      "translations": {
        "en": "Active Substance",
        "fr": "Substance active",
        "ja": "有効成分"
      }
    },
    {
      "code": "EXCIPIENT",
      "decode": "Excipient",
      "translations": {
        "en": "Excipient",
        "fr": "Excipient",
        "ja": "添加剤"
      }
    },
    {
      "code": "ADJUVANT",
      "decode": "Adjuvant",
      "translations": {
        "en": "Adjuvant",
        "fr": "Adjuvant",
        "ja": "アジュバント"
      }
    }
  ],
  "SUBSTANCE_UNIT": [
    {
      "code": "mg",
      "decode": "mg (milligram)",
      "translations": {
        "en": "mg (milligram)",
        "fr": "mg (milligramme)",
        "ja": "mg（ミリグラム）"
      }
    },
    {
      "code": "g",
      "decode": "g (gram)",
      "translations": {
        "en": "g (gram)",
        "fr": "g (gramme)",
        "ja": "g（グラム）"
      }
    },
    {
      "code": "mcg",
      "decode": "mcg (microgram)",
      "translations": {
        "en": "mcg (microgram)",
        "fr": "mcg (microgramme)",
        "ja": "mcg（マイクログラム）"
      }
    },
    {
      "code": "ng",
      "decode": "ng (nanogram)",
      "translations": {
        "en": "ng (nanogram)",
        "fr": "ng (nanogramme)",
        "ja": "ng（ナノグラム）"
      }
    },
    {
      "code": "mL",
      "decode": "mL (millilitre)",
      "translations": {
        "en": "mL (millilitre)",
        "fr": "mL (millilitre)",
        "ja": "mL（ミリリットル）"
      }
    },
    {
      "code": "L",
      "decode": "L (litre)",
      "translations": {
        "en": "L (litre)",
        "fr": "L (litre)",
        "ja": "L（リットル）"
      }
    },
    {
      "code": "IU",
      "decode": "IU (international unit)",
      "translations": {
        "en": "IU (international unit)",
        "fr": "UI (unité internationale)",
        "ja": "IU（国際単位）"
      }
    },
    {
      "code": "mIU",
      "decode": "mIU (milli-IU)",
      "translations": {
        "en": "mIU (milli-IU)",
        "fr": "mUI (milli-UI)",
        "ja": "mIU（ミリ国際単位）"
      }
    },
    {
      "code": "mmol",
      "decode": "mmol (millimole)",
      "translations": {
        "en": "mmol (millimole)",
        "fr": "mmol (millimole)",
        "ja": "mmol（ミリモル）"
      }
    },
    {
      "code": "meq",
      "decode": "mEq (milliequivalent)",
      "translations": {
        "en": "mEq (milliequivalent)",
        "fr": "mEq (milliéquivalent)",
        "ja": "mEq（ミリ当量）"
      }
    },
    {
      "code": "mg_mL",
      "decode": "mg/mL",
      "translations": {
        "en": "mg/mL",
        "fr": "mg/mL",
        "ja": "mg/mL"
      }
    },
    {
      "code": "mcg_mL",
      "decode": "mcg/mL",
      "translations": {
        "en": "mcg/mL",
        "fr": "mcg/mL",
        "ja": "mcg/mL"
      }
    },
    {
      "code": "mg_g",
      "decode": "mg/g",
      "translations": {
        "en": "mg/g",
        "fr": "mg/g",
        "ja": "mg/g"
      }
    },
    {
      "code": "percent",
      "decode": "% (percent)",
      "translations": {
        "en": "% (percent)",
        "fr": "% (pourcentage)",
        "ja": "%（パーセント）"
      }
    },
    {
      "code": "CFU",
      "decode": "CFU (colony forming unit)",
      "translations": {
        "en": "CFU (colony forming unit)",
        "fr": "UFC (unité formant colonie)",
        "ja": "CFU（コロニー形成単位）"
      }
    },
    {
      "code": "OTHER",
      "decode": "Other",
      "translations": {
        "en": "Other",
        "fr": "Autre",
        "ja": "その他"
      }
    }
  ],
  "TRIAL_STATUS": [
    {
      "code": "PLANNED",
      "decode": "Planned",
      "translations": {
        "en": "Planned",
        "fr": "Planifié",
        "ja": "計画中"
      }
    },
    {
      "code": "ONGOING",
      "decode": "Ongoing",
      "translations": {
        "en": "Ongoing",
        "fr": "En cours",
        "ja": "進行中"
      }
    },
    {
      "code": "FINALIZED",
      "decode": "Finalized",
      "translations": {
        "en": "Finalized",
        "fr": "Finalisé",
        "ja": "完了"
      }
    }
  ],
  "VACCINE_TYPE": [
    {
      "code": "LIVE_ATTENUATED",
      "decode": "Live Attenuated",
      "translations": {
        "en": "Live Attenuated",
        "fr": "Vivant atténué",
        "ja": "生弱毒化"
      }
    },
    {
      "code": "INACTIVATED",
      "decode": "Inactivated",
      "translations": {
        "en": "Inactivated",
        "fr": "Inactivé",
        "ja": "不活化"
      }
    },
    {
      "code": "SUBUNIT",
      "decode": "Subunit",
      "translations": {
        "en": "Subunit",
        "fr": "Sous-unité",
        "ja": "サブユニット"
      }
    },
    {
      "code": "MRNA",
      "decode": "mRNA",
      "translations": {
        "en": "mRNA",
        "fr": "ARNm",
        "ja": "mRNA"
      }
    },
    {
      "code": "VIRAL_VECTOR",
      "decode": "Viral Vector",
      "translations": {
        "en": "Viral Vector",
        "fr": "Vecteur viral",
        "ja": "ウイルスベクター"
      }
    },
    {
      "code": "TOXOID",
      "decode": "Toxoid",
      "translations": {
        "en": "Toxoid",
        "fr": "Anatoxine",
        "ja": "トキソイド"
      }
    },
    {
      "code": "OTHER",
      "decode": "Other",
      "translations": {
        "en": "Other",
        "fr": "Autre",
        "ja": "その他"
      }
    }
  ],
  "VIGILANCE_TYPE": [
    {
      "code": "PHARMACOVIG",
      "decode": "Pharmacovigilance",
      "translations": {
        "en": "Pharmacovigilance",
        "fr": "Pharmacovigilance",
        "ja": "ファーマコビジランス"
      }
    },
    {
      "code": "MATERIOVIG",
      "decode": "Materiovigilance",
      "translations": {
        "en": "Materiovigilance",
        "fr": "Matériovigilance",
        "ja": "マテリオビジランス"
      }
    },
    {
      "code": "COSMETOVIG",
      "decode": "Cosmetovigilance",
      "translations": {
        "en": "Cosmetovigilance",
        "fr": "Cosmétovigilance",
        "ja": "コスメトビジランス"
      }
    },
    {
      "code": "NUTRIVIG",
      "decode": "Nutrivigilance",
      "translations": {
        "en": "Nutrivigilance",
        "fr": "Nutrivigilance",
        "ja": "ニュートリビジランス"
      }
    },
    {
      "code": "OTHER",
      "decode": "Other",
      "translations": {
        "en": "Other",
        "fr": "Autre",
        "ja": "その他"
      }
    }
  ],
  "YES_NO": [
    {
      "code": "Y",
      "decode": "Yes",
      "translations": {
        "en": "Yes",
        "fr": "Oui",
        "de": "Ja"
      }
    },
    {
      "code": "N",
      "decode": "No",
      "translations": {
        "en": "No",
        "fr": "Non",
        "de": "Nein"
      }
    }
  ]
}

/* Register with MetaDynaAPI so getRecords / getFormMetadata etc. work */
if (typeof MetaDynaAPI !== 'undefined') MetaDynaAPI.register('codelists', CODELIST_REGISTRY);
