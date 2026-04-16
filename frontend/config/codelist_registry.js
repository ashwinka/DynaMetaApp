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
      "code": "MAH",
      "decode": "Marketing Authorisation Holder",
      "translations": {
        "en": "Marketing Authorisation Holder"
      }
    },
    {
      "code": "PARTNER",
      "decode": "Business Partner",
      "translations": {
        "en": "Business Partner"
      }
    },
    {
      "code": "CRO",
      "decode": "CRO",
      "translations": {
        "en": "CRO"
      }
    },
    {
      "code": "AUTHORITY",
      "decode": "Regulatory Authority",
      "translations": {
        "en": "Regulatory Authority"
      }
    },
    {
      "code": "HOSPITAL",
      "decode": "Hospital / HCP",
      "translations": {
        "en": "Hospital / HCP"
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
  "AUTHORITY": [
    {
      "code": "FDA",
      "decode": "FDA (US)",
      "translations": {
        "en": "FDA (US)"
      }
    },
    {
      "code": "EMA",
      "decode": "EMA (EU)",
      "translations": {
        "en": "EMA (EU)"
      }
    },
    {
      "code": "MHRA",
      "decode": "MHRA (UK)",
      "translations": {
        "en": "MHRA (UK)"
      }
    },
    {
      "code": "PMDA",
      "decode": "PMDA (Japan)",
      "translations": {
        "en": "PMDA (Japan)"
      }
    },
    {
      "code": "CDSCO",
      "decode": "CDSCO (India)",
      "translations": {
        "en": "CDSCO (India)"
      }
    },
    {
      "code": "TGA",
      "decode": "TGA (Australia)",
      "translations": {
        "en": "TGA (Australia)"
      }
    },
    {
      "code": "HC",
      "decode": "Health Canada",
      "translations": {
        "en": "Health Canada"
      }
    },
    {
      "code": "SWISSMEDIC",
      "decode": "Swissmedic",
      "translations": {
        "en": "Swissmedic"
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
  "CAUSALITY": [
    {
      "code": "CERT",
      "decode": "Certain",
      "translations": {
        "en": "Certain",
        "fr": "Certain",
        "de": "Sicher"
      }
    },
    {
      "code": "PROB",
      "decode": "Probable",
      "translations": {
        "en": "Probable",
        "fr": "Probable",
        "de": "Wahrscheinlich"
      }
    },
    {
      "code": "POSS",
      "decode": "Possible",
      "translations": {
        "en": "Possible",
        "fr": "Possible",
        "de": "Möglich"
      }
    },
    {
      "code": "UNLIKELY",
      "decode": "Unlikely",
      "translations": {
        "en": "Unlikely",
        "fr": "Improbable",
        "de": "Unwahrscheinlich"
      }
    }
  ],
  "CORR_STATUS": [
    {
      "code": "DRAFT",
      "decode": "Draft",
      "translations": {
        "en": "Draft"
      }
    },
    {
      "code": "PENDING",
      "decode": "Pending",
      "translations": {
        "en": "Pending"
      }
    },
    {
      "code": "SENT",
      "decode": "Sent",
      "translations": {
        "en": "Sent"
      }
    },
    {
      "code": "RECEIVED",
      "decode": "Received",
      "translations": {
        "en": "Received"
      }
    },
    {
      "code": "CLOSED",
      "decode": "Closed",
      "translations": {
        "en": "Closed"
      }
    }
  ],
  "CORR_TYPE": [
    {
      "code": "QUERY",
      "decode": "Query",
      "translations": {
        "en": "Query"
      }
    },
    {
      "code": "RESPONSE",
      "decode": "Response",
      "translations": {
        "en": "Response"
      }
    },
    {
      "code": "FOLLOWUP",
      "decode": "Follow-up",
      "translations": {
        "en": "Follow-up"
      }
    },
    {
      "code": "CLOSURE",
      "decode": "Closure",
      "translations": {
        "en": "Closure"
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
  "DIST_METHOD": [
    {
      "code": "EMAIL",
      "decode": "Email",
      "translations": {
        "en": "Email"
      }
    },
    {
      "code": "PORTAL",
      "decode": "Investigator Portal",
      "translations": {
        "en": "Investigator Portal"
      }
    },
    {
      "code": "FAX",
      "decode": "Fax",
      "translations": {
        "en": "Fax"
      }
    },
    {
      "code": "POST",
      "decode": "Post",
      "translations": {
        "en": "Post"
      }
    }
  ],
  "DIST_STATUS": [
    {
      "code": "PENDING",
      "decode": "Pending",
      "translations": {
        "en": "Pending"
      }
    },
    {
      "code": "SENT",
      "decode": "Sent",
      "translations": {
        "en": "Sent"
      }
    },
    {
      "code": "ACKNOWLEDGED",
      "decode": "Acknowledged",
      "translations": {
        "en": "Acknowledged"
      }
    },
    {
      "code": "FAILED",
      "decode": "Failed",
      "translations": {
        "en": "Failed"
      }
    }
  ],
  "DOSAGE_FORM": [
    {
      "code": "TABLET",
      "decode": "Tablet",
      "translations": {
        "en": "Tablet"
      }
    },
    {
      "code": "CAPSULE",
      "decode": "Capsule",
      "translations": {
        "en": "Capsule"
      }
    },
    {
      "code": "SOLUTION",
      "decode": "Solution for Injection",
      "translations": {
        "en": "Solution for Injection"
      }
    },
    {
      "code": "SUSPENSION",
      "decode": "Suspension",
      "translations": {
        "en": "Suspension"
      }
    },
    {
      "code": "PATCH",
      "decode": "Transdermal Patch",
      "translations": {
        "en": "Transdermal Patch"
      }
    },
    {
      "code": "INHALER",
      "decode": "Inhaler",
      "translations": {
        "en": "Inhaler"
      }
    },
    {
      "code": "CREAM",
      "decode": "Cream",
      "translations": {
        "en": "Cream"
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
  "DOSE_UNIT": [
    {
      "code": "MG",
      "decode": "mg",
      "translations": {
        "en": "mg"
      }
    },
    {
      "code": "G",
      "decode": "g",
      "translations": {
        "en": "g"
      }
    },
    {
      "code": "ML",
      "decode": "mL",
      "translations": {
        "en": "mL"
      }
    },
    {
      "code": "MCG",
      "decode": "mcg",
      "translations": {
        "en": "mcg"
      }
    }
  ],
  "DRUG_TYPE": [
    {
      "code": "SUS",
      "decode": "Suspect",
      "translations": {
        "en": "Suspect",
        "fr": "Suspect",
        "de": "Verdächtig"
      }
    },
    {
      "code": "CONV",
      "decode": "Concomitant",
      "translations": {
        "en": "Concomitant",
        "fr": "Concomitant",
        "de": "Begleitend"
      }
    },
    {
      "code": "INTER",
      "decode": "Interacting",
      "translations": {
        "en": "Interacting",
        "fr": "En interaction",
        "de": "Interagierend"
      }
    }
  ],
  "E2B_PROFILE": [
    {
      "code": "E2B_R2",
      "decode": "ICH E2B(R2)",
      "translations": {
        "en": "ICH E2B(R2)"
      }
    },
    {
      "code": "E2B_R3",
      "decode": "ICH E2B(R3)",
      "translations": {
        "en": "ICH E2B(R3)"
      }
    },
    {
      "code": "NONE",
      "decode": "None",
      "translations": {
        "en": "None"
      }
    }
  ],
  "EDI_METHOD": [
    {
      "code": "AS2",
      "decode": "AS2",
      "translations": {
        "en": "AS2"
      }
    },
    {
      "code": "SFTP",
      "decode": "SFTP",
      "translations": {
        "en": "SFTP"
      }
    },
    {
      "code": "EMAIL",
      "decode": "Email",
      "translations": {
        "en": "Email"
      }
    },
    {
      "code": "MANUAL",
      "decode": "Manual",
      "translations": {
        "en": "Manual"
      }
    }
  ],
  "FILE_TYPE": [
    {
      "code": "PDF",
      "decode": "PDF",
      "translations": {
        "en": "PDF"
      }
    },
    {
      "code": "DOCX",
      "decode": "Word Document",
      "translations": {
        "en": "Word Document"
      }
    },
    {
      "code": "XLSX",
      "decode": "Excel Spreadsheet",
      "translations": {
        "en": "Excel Spreadsheet"
      }
    },
    {
      "code": "XML",
      "decode": "XML",
      "translations": {
        "en": "XML"
      }
    },
    {
      "code": "TXT",
      "decode": "Text File",
      "translations": {
        "en": "Text File"
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
  "ICSR_ACTION_TAKEN": [
    {
      "code": "withdrawn",
      "decode": "Drug Withdrawn",
      "translations": {
        "r2": "1",
        "r3": "withdrawn",
        "label": "Drug Withdrawn",
        "fr": "Medicament arrete",
        "ja": "投与中止",
        "zh": "停药"
      }
    },
    {
      "code": "doseReduced",
      "decode": "Dose Reduced",
      "translations": {
        "r2": "2",
        "r3": "doseReduced",
        "label": "Dose Reduced",
        "fr": "Dose reduite",
        "ja": "減量",
        "zh": "减量"
      }
    },
    {
      "code": "doseIncreased",
      "decode": "Dose Increased",
      "translations": {
        "r2": "3",
        "r3": "doseIncreased",
        "label": "Dose Increased",
        "fr": "Dose augmentee",
        "ja": "増量",
        "zh": "增量"
      }
    },
    {
      "code": "notChanged",
      "decode": "Not Changed",
      "translations": {
        "r2": "4",
        "r3": "notChanged",
        "label": "Not Changed",
        "fr": "Non modifie",
        "ja": "変更なし",
        "zh": "未更改"
      }
    },
    {
      "code": "unknown",
      "decode": "Unknown",
      "translations": {
        "r2": "5",
        "r3": "unknown",
        "label": "Unknown",
        "fr": "Inconnu",
        "ja": "不明",
        "zh": "未知"
      }
    },
    {
      "code": "notApplicable",
      "decode": "Not Applicable",
      "translations": {
        "r2": "6",
        "r3": "notApplicable",
        "label": "Not Applicable",
        "fr": "Sans objet",
        "ja": "該当なし",
        "zh": "不适用"
      }
    }
  ],
  "ICSR_AGE_GROUP": [
    {
      "code": "neonate",
      "decode": "Neonate (0-27 days)",
      "translations": {
        "r2": "",
        "r3": "neonate",
        "label": "Neonate",
        "fr": "Nouveau-ne",
        "ja": "新生児",
        "zh": "新生儿"
      }
    },
    {
      "code": "infant",
      "decode": "Infant (28 days-23 mo)",
      "translations": {
        "r2": "",
        "r3": "infant",
        "label": "Infant",
        "fr": "Nourrisson",
        "ja": "乳児",
        "zh": "婴儿"
      }
    },
    {
      "code": "child",
      "decode": "Child (2-11 yr)",
      "translations": {
        "r2": "",
        "r3": "child",
        "label": "Child",
        "fr": "Enfant",
        "ja": "小児",
        "zh": "儿童"
      }
    },
    {
      "code": "adolescent",
      "decode": "Adolescent (12-17 yr)",
      "translations": {
        "r2": "",
        "r3": "adolescent",
        "label": "Adolescent",
        "fr": "Adolescent",
        "ja": "青少年",
        "zh": "青少年"
      }
    },
    {
      "code": "adult",
      "decode": "Adult (18-64 yr)",
      "translations": {
        "r2": "",
        "r3": "adult",
        "label": "Adult",
        "fr": "Adulte",
        "ja": "成人",
        "zh": "成人"
      }
    },
    {
      "code": "elderly",
      "decode": "Elderly (65+ yr)",
      "translations": {
        "r2": "",
        "r3": "elderly",
        "label": "Elderly",
        "fr": "Personne agee",
        "ja": "高齢者",
        "zh": "老年人"
      }
    }
  ],
  "ICSR_AGE_UNIT": [
    {
      "code": "yr",
      "decode": "Year",
      "translations": {
        "r2": "801",
        "r3": "a",
        "label": "Year",
        "fr": "Annee",
        "ja": "年",
        "zh": "年"
      }
    },
    {
      "code": "mo",
      "decode": "Month",
      "translations": {
        "r2": "802",
        "r3": "mo",
        "label": "Month",
        "fr": "Mois",
        "ja": "月",
        "zh": "月"
      }
    },
    {
      "code": "wk",
      "decode": "Week",
      "translations": {
        "r2": "803",
        "r3": "wk",
        "label": "Week",
        "fr": "Semaine",
        "ja": "週",
        "zh": "周"
      }
    },
    {
      "code": "dy",
      "decode": "Day",
      "translations": {
        "r2": "804",
        "r3": "d",
        "label": "Day",
        "fr": "Jour",
        "ja": "日",
        "zh": "天"
      }
    },
    {
      "code": "hr",
      "decode": "Hour",
      "translations": {
        "r2": "805",
        "r3": "h",
        "label": "Hour",
        "fr": "Heure",
        "ja": "時間",
        "zh": "小时"
      }
    }
  ],
  "ICSR_CAUSALITY": [
    {
      "code": "related",
      "decode": "Related",
      "translations": {
        "r2": "1",
        "r3": "related",
        "label": "Related",
        "fr": "Lie",
        "ja": "関連あり",
        "zh": "相关"
      }
    },
    {
      "code": "notRelated",
      "decode": "Not Related",
      "translations": {
        "r2": "2",
        "r3": "notRelated",
        "label": "Not Related",
        "fr": "Non lie",
        "ja": "関連なし",
        "zh": "不相关"
      }
    },
    {
      "code": "unassessable",
      "decode": "Unassessable",
      "translations": {
        "r2": "3",
        "r3": "unassessable",
        "label": "Unassessable",
        "fr": "Non evaluable",
        "ja": "評価不能",
        "zh": "无法评估"
      }
    }
  ],
  "ICSR_DOSE_UNIT": [
    {
      "code": "mg",
      "decode": "Milligram",
      "translations": {
        "r2": "mg",
        "r3": "mg",
        "label": "Milligram",
        "fr": "Milligramme",
        "ja": "ミリグラム",
        "zh": "毫克"
      }
    },
    {
      "code": "g",
      "decode": "Gram",
      "translations": {
        "r2": "g",
        "r3": "g",
        "label": "Gram",
        "fr": "Gramme",
        "ja": "グラム",
        "zh": "克"
      }
    },
    {
      "code": "mL",
      "decode": "Millilitre",
      "translations": {
        "r2": "mL",
        "r3": "mL",
        "label": "Millilitre",
        "fr": "Millilitre",
        "ja": "ミリリットル",
        "zh": "毫升"
      }
    },
    {
      "code": "IU",
      "decode": "Int. Units",
      "translations": {
        "r2": "IU",
        "r3": "[iU]",
        "label": "Int. Units",
        "fr": "UI",
        "ja": "国際単位",
        "zh": "国际单位"
      }
    },
    {
      "code": "mcg",
      "decode": "Microgram",
      "translations": {
        "r2": "mcg",
        "r3": "ug",
        "label": "Microgram",
        "fr": "Microgramme",
        "ja": "マイクログラム",
        "zh": "微克"
      }
    }
  ],
  "ICSR_DRUG_CHAR": [
    {
      "code": "suspect",
      "decode": "Suspect",
      "translations": {
        "r2": "1",
        "r3": "suspect",
        "label": "Suspect",
        "fr": "Suspect",
        "ja": "被疑薬",
        "zh": "可疑药物"
      }
    },
    {
      "code": "concomitant",
      "decode": "Concomitant",
      "translations": {
        "r2": "2",
        "r3": "concomitant",
        "label": "Concomitant",
        "fr": "Concomitant",
        "ja": "併用薬",
        "zh": "合并用药"
      }
    },
    {
      "code": "interacting",
      "decode": "Interacting",
      "translations": {
        "r2": "3",
        "r3": "interacting",
        "label": "Interacting",
        "fr": "En interaction",
        "ja": "相互作用薬",
        "zh": "相互作用药"
      }
    }
  ],
  "ICSR_ORG_TYPE": [
    {
      "code": "pharma",
      "decode": "Pharmaceutical Company",
      "translations": {
        "r2": "1",
        "r3": "pharmaceuticalCompany",
        "label": "Pharmaceutical Company",
        "fr": "Societe pharmaceutique",
        "ja": "製薬会社",
        "zh": "制药公司"
      }
    },
    {
      "code": "regulatory",
      "decode": "Regulatory Authority",
      "translations": {
        "r2": "2",
        "r3": "regulatoryAuthority",
        "label": "Regulatory Authority",
        "fr": "Autorite reglementaire",
        "ja": "規制当局",
        "zh": "监管机构"
      }
    },
    {
      "code": "other",
      "decode": "Other",
      "translations": {
        "r2": "3",
        "r3": "other",
        "label": "Other",
        "fr": "Autre",
        "ja": "その他",
        "zh": "其他"
      }
    }
  ],
  "ICSR_OUTCOME": [
    {
      "code": "recovered",
      "decode": "Recovered / Resolved",
      "translations": {
        "r2": "1",
        "r3": "recovered",
        "label": "Recovered / Resolved",
        "fr": "Gueri / Resolu",
        "ja": "回復",
        "zh": "已恢复"
      }
    },
    {
      "code": "recovering",
      "decode": "Recovering / Resolving",
      "translations": {
        "r2": "2",
        "r3": "recovering",
        "label": "Recovering / Resolving",
        "fr": "En cours de guerison",
        "ja": "回復中",
        "zh": "恢复中"
      }
    },
    {
      "code": "notRecovered",
      "decode": "Not Recovered / Not Resolved",
      "translations": {
        "r2": "3",
        "r3": "notRecovered",
        "label": "Not Recovered / Not Resolved",
        "fr": "Non gueri / Non resolu",
        "ja": "未回復",
        "zh": "未恢复"
      }
    },
    {
      "code": "fatal",
      "decode": "Fatal",
      "translations": {
        "r2": "4",
        "r3": "fatal",
        "label": "Fatal",
        "fr": "Fatal",
        "ja": "死亡",
        "zh": "死亡"
      }
    },
    {
      "code": "unknown",
      "decode": "Unknown",
      "translations": {
        "r2": "5",
        "r3": "unknown",
        "label": "Unknown",
        "fr": "Inconnu",
        "ja": "不明",
        "zh": "未知"
      }
    },
    {
      "code": "recoveredWithSequalae",
      "decode": "Recovered with Sequelae",
      "translations": {
        "r2": "6",
        "r3": "recoveredWithSequelae",
        "label": "Recovered with Sequelae",
        "fr": "Gueri avec sequelles",
        "ja": "後遺症あり回復",
        "zh": "有后遗症恢复"
      }
    }
  ],
  "ICSR_PRODUCT_TYPE": [
    {
      "code": "medicinal",
      "decode": "Medicinal Product",
      "translations": {
        "r2": "01",
        "r3": "medicinalProduct",
        "label": "Medicinal Product",
        "fr": "Medicament",
        "ja": "医薬品",
        "zh": "药品"
      }
    },
    {
      "code": "vaccine",
      "decode": "Vaccine",
      "translations": {
        "r2": "02",
        "r3": "vaccine",
        "label": "Vaccine",
        "fr": "Vaccin",
        "ja": "ワクチン",
        "zh": "疫苗"
      }
    },
    {
      "code": "biological",
      "decode": "Biological",
      "translations": {
        "r2": "03",
        "r3": "biological",
        "label": "Biological",
        "fr": "Biologique",
        "ja": "生物製剤",
        "zh": "生物制品"
      }
    }
  ],
  "ICSR_QUALIFICATION": [
    {
      "code": "physician",
      "decode": "Physician",
      "translations": {
        "r2": "1",
        "r3": "physician",
        "label": "Physician",
        "fr": "Medecin",
        "ja": "医師",
        "zh": "医生"
      }
    },
    {
      "code": "pharmacist",
      "decode": "Pharmacist",
      "translations": {
        "r2": "2",
        "r3": "pharmacist",
        "label": "Pharmacist",
        "fr": "Pharmacien",
        "ja": "薬剤師",
        "zh": "药剂师"
      }
    },
    {
      "code": "otherHcp",
      "decode": "Other Health Care Professional",
      "translations": {
        "r2": "3",
        "r3": "otherHealthcareProfessional",
        "label": "Other Health Care Professional",
        "fr": "Autre professionnel de sante",
        "ja": "その他の医療専門家",
        "zh": "其他医疗专业人员"
      }
    },
    {
      "code": "lawyer",
      "decode": "Lawyer",
      "translations": {
        "r2": "4",
        "r3": "lawyer",
        "label": "Lawyer",
        "fr": "Avocat",
        "ja": "弁護士",
        "zh": "律师"
      }
    },
    {
      "code": "consumer",
      "decode": "Consumer / Patient",
      "translations": {
        "r2": "5",
        "r3": "consumer",
        "label": "Consumer / Patient",
        "fr": "Consommateur / Patient",
        "ja": "消費者・患者",
        "zh": "消费者/患者"
      }
    }
  ],
  "ICSR_REPORT_TYPE": [
    {
      "code": "spontaneous",
      "decode": "Spontaneous Report",
      "translations": {
        "r2": "1",
        "r3": "spontaneous",
        "label": "Spontaneous Report",
        "fr": "Rapport spontane",
        "ja": "自発報告",
        "zh": "自发报告"
      }
    },
    {
      "code": "study",
      "decode": "Study Report",
      "translations": {
        "r2": "2",
        "r3": "study",
        "label": "Study Report",
        "fr": "Rapport d etude",
        "ja": "試験報告",
        "zh": "研究报告"
      }
    },
    {
      "code": "other",
      "decode": "Other",
      "translations": {
        "r2": "3",
        "r3": "other",
        "label": "Other",
        "fr": "Autre",
        "ja": "その他",
        "zh": "其他"
      }
    },
    {
      "code": "notAvailable",
      "decode": "Not Available",
      "translations": {
        "r2": "4",
        "r3": "notAvailable",
        "label": "Not Available",
        "fr": "Non disponible",
        "ja": "不明",
        "zh": "不可用"
      }
    }
  ],
  "ICSR_REPORTER_TYPE": [
    {
      "code": "spontaneous",
      "decode": "Spontaneous",
      "translations": {
        "r2": "1",
        "r3": "spontaneous",
        "label": "Spontaneous",
        "fr": "Spontane",
        "ja": "自発",
        "zh": "自发"
      }
    },
    {
      "code": "study",
      "decode": "Study",
      "translations": {
        "r2": "2",
        "r3": "study",
        "label": "Study",
        "fr": "Etude",
        "ja": "試験",
        "zh": "研究"
      }
    },
    {
      "code": "other",
      "decode": "Other",
      "translations": {
        "r2": "3",
        "r3": "other",
        "label": "Other",
        "fr": "Autre",
        "ja": "その他",
        "zh": "其他"
      }
    }
  ],
  "ICSR_ROUTE": [
    {
      "code": "oral",
      "decode": "Oral",
      "translations": {
        "r2": "001",
        "r3": "oralUse",
        "label": "Oral",
        "fr": "Oral",
        "ja": "経口",
        "zh": "口服"
      }
    },
    {
      "code": "iv",
      "decode": "Intravenous",
      "translations": {
        "r2": "002",
        "r3": "intravenousUse",
        "label": "Intravenous",
        "fr": "Intraveineux",
        "ja": "静脈内",
        "zh": "静脉注射"
      }
    },
    {
      "code": "im",
      "decode": "Intramuscular",
      "translations": {
        "r2": "003",
        "r3": "intramuscularUse",
        "label": "Intramuscular",
        "fr": "Intramusculaire",
        "ja": "筋肉内",
        "zh": "肌肉注射"
      }
    },
    {
      "code": "sc",
      "decode": "Subcutaneous",
      "translations": {
        "r2": "004",
        "r3": "subcutaneousUse",
        "label": "Subcutaneous",
        "fr": "Sous-cutane",
        "ja": "皮下",
        "zh": "皮下注射"
      }
    },
    {
      "code": "topical",
      "decode": "Topical",
      "translations": {
        "r2": "005",
        "r3": "cutaneousUse",
        "label": "Topical",
        "fr": "Topique",
        "ja": "局所",
        "zh": "局部"
      }
    },
    {
      "code": "inhalation",
      "decode": "Inhalation",
      "translations": {
        "r2": "006",
        "r3": "inhalationUse",
        "label": "Inhalation",
        "fr": "Inhalation",
        "ja": "吸入",
        "zh": "吸入"
      }
    },
    {
      "code": "unknown",
      "decode": "Unknown",
      "translations": {
        "r2": "999",
        "r3": "unknown",
        "label": "Unknown",
        "fr": "Inconnu",
        "ja": "不明",
        "zh": "未知"
      }
    }
  ],
  "ICSR_SEX": [
    {
      "code": "male",
      "decode": "Male",
      "translations": {
        "r2": "1",
        "r3": "male",
        "label": "Male",
        "fr": "Masculin",
        "ja": "男性",
        "zh": "男"
      }
    },
    {
      "code": "female",
      "decode": "Female",
      "translations": {
        "r2": "2",
        "r3": "female",
        "label": "Female",
        "fr": "Feminin",
        "ja": "女性",
        "zh": "女"
      }
    },
    {
      "code": "unknown",
      "decode": "Unknown",
      "translations": {
        "r2": "0",
        "r3": "unknown",
        "label": "Unknown",
        "fr": "Inconnu",
        "ja": "不明",
        "zh": "未知"
      }
    }
  ],
  "ICSR_STUDY_TYPE": [
    {
      "code": "phaseI",
      "decode": "Phase I",
      "translations": {
        "r2": "1",
        "r3": "phaseI",
        "label": "Phase I",
        "fr": "Phase I",
        "ja": "第I相",
        "zh": "I期"
      }
    },
    {
      "code": "phaseII",
      "decode": "Phase II",
      "translations": {
        "r2": "2",
        "r3": "phaseII",
        "label": "Phase II",
        "fr": "Phase II",
        "ja": "第II相",
        "zh": "II期"
      }
    },
    {
      "code": "phaseIII",
      "decode": "Phase III",
      "translations": {
        "r2": "3",
        "r3": "phaseIII",
        "label": "Phase III",
        "fr": "Phase III",
        "ja": "第III相",
        "zh": "III期"
      }
    },
    {
      "code": "phaseIV",
      "decode": "Phase IV",
      "translations": {
        "r2": "4",
        "r3": "phaseIV",
        "label": "Phase IV",
        "fr": "Phase IV",
        "ja": "第IV相",
        "zh": "IV期"
      }
    },
    {
      "code": "observational",
      "decode": "Observational",
      "translations": {
        "r2": "5",
        "r3": "observational",
        "label": "Observational",
        "fr": "Observationnelle",
        "ja": "観察研究",
        "zh": "观察性研究"
      }
    },
    {
      "code": "other",
      "decode": "Other",
      "translations": {
        "r2": "6",
        "r3": "other",
        "label": "Other",
        "fr": "Autre",
        "ja": "その他",
        "zh": "其他"
      }
    }
  ],
  "ICSR_YES_NO_UNK": [
    {
      "code": "yes",
      "decode": "Yes",
      "translations": {
        "r2": "1",
        "r3": "yes",
        "label": "Yes",
        "fr": "Oui",
        "ja": "はい",
        "zh": "是"
      }
    },
    {
      "code": "no",
      "decode": "No",
      "translations": {
        "r2": "2",
        "r3": "no",
        "label": "No",
        "fr": "Non",
        "ja": "いいえ",
        "zh": "否"
      }
    },
    {
      "code": "unknown",
      "decode": "Unknown",
      "translations": {
        "r2": "3",
        "r3": "unknown",
        "label": "Unknown",
        "fr": "Inconnu",
        "ja": "不明",
        "zh": "未知"
      }
    }
  ],
  "INGREDIENT_ROLE": [
    {
      "code": "ACTIVE",
      "decode": "Active Substance",
      "translations": {
        "en": "Active Substance"
      }
    },
    {
      "code": "EXCIPIENT",
      "decode": "Excipient",
      "translations": {
        "en": "Excipient"
      }
    },
    {
      "code": "ADJUVANT",
      "decode": "Adjuvant",
      "translations": {
        "en": "Adjuvant"
      }
    }
  ],
  "PRODUCT_TYPE": [
    {
      "code": "SMALL_MOL",
      "decode": "Small Molecule",
      "translations": {
        "en": "Small Molecule"
      }
    },
    {
      "code": "BIOLOGIC",
      "decode": "Biologic",
      "translations": {
        "en": "Biologic"
      }
    },
    {
      "code": "VACCINE",
      "decode": "Vaccine",
      "translations": {
        "en": "Vaccine"
      }
    },
    {
      "code": "DEVICE",
      "decode": "Medical Device",
      "translations": {
        "en": "Medical Device"
      }
    },
    {
      "code": "COMBO",
      "decode": "Combination Product",
      "translations": {
        "en": "Combination Product"
      }
    },
    {
      "code": "HERBAL",
      "decode": "Herbal / Traditional",
      "translations": {
        "en": "Herbal / Traditional"
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
  "RELATIONSHIP": [
    {
      "code": "PARENT",
      "decode": "Parent",
      "translations": {
        "en": "Parent"
      }
    },
    {
      "code": "GUARDIAN",
      "decode": "Legal Guardian",
      "translations": {
        "en": "Legal Guardian"
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
  "ROUTE": [
    {
      "code": "ORAL",
      "decode": "Oral",
      "translations": {
        "en": "Oral",
        "fr": "Oral",
        "de": "Oral"
      }
    },
    {
      "code": "IV",
      "decode": "Intravenous",
      "translations": {
        "en": "Intravenous",
        "fr": "Intraveineux",
        "de": "Intravenös"
      }
    },
    {
      "code": "SC",
      "decode": "Subcutaneous",
      "translations": {
        "en": "Subcutaneous",
        "fr": "Sous-cutané",
        "de": "Subkutan"
      }
    },
    {
      "code": "IM",
      "decode": "Intramuscular",
      "translations": {
        "en": "Intramuscular",
        "fr": "Intramusculaire",
        "de": "Intramuskulär"
      }
    }
  ],
  "SEVERITY": [
    {
      "code": "MILD",
      "decode": "Mild",
      "translations": {
        "en": "Mild",
        "fr": "Léger",
        "de": "Leicht"
      }
    },
    {
      "code": "MOD",
      "decode": "Moderate",
      "translations": {
        "en": "Moderate",
        "fr": "Modéré",
        "de": "Mäßig"
      }
    },
    {
      "code": "SEV",
      "decode": "Severe",
      "translations": {
        "en": "Severe",
        "fr": "Sévère",
        "de": "Schwer"
      }
    },
    {
      "code": "FATAL",
      "decode": "Fatal",
      "translations": {
        "en": "Fatal",
        "fr": "Fatal",
        "de": "Tödlich"
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
  "SITE_STATUS": [
    {
      "code": "PENDING",
      "decode": "Pending Activation",
      "translations": {
        "en": "Pending Activation"
      }
    },
    {
      "code": "ACTIVE",
      "decode": "Active",
      "translations": {
        "en": "Active"
      }
    },
    {
      "code": "SUSPENDED",
      "decode": "Suspended",
      "translations": {
        "en": "Suspended"
      }
    },
    {
      "code": "CLOSED",
      "decode": "Closed",
      "translations": {
        "en": "Closed"
      }
    }
  ],
  "STUDY_PRODUCT_ROLE": [
    {
      "code": "IMP",
      "decode": "Investigational Medicinal Product",
      "translations": {
        "en": "Investigational Medicinal Product"
      }
    },
    {
      "code": "COMPARATOR",
      "decode": "Comparator",
      "translations": {
        "en": "Comparator"
      }
    },
    {
      "code": "PLACEBO",
      "decode": "Placebo",
      "translations": {
        "en": "Placebo"
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
  "STUDY_STATUS": [
    {
      "code": "PLANNED",
      "decode": "Planned",
      "translations": {
        "en": "Planned"
      }
    },
    {
      "code": "ACTIVE",
      "decode": "Active",
      "translations": {
        "en": "Active"
      }
    },
    {
      "code": "SUSPENDED",
      "decode": "Suspended",
      "translations": {
        "en": "Suspended"
      }
    },
    {
      "code": "COMPLETED",
      "decode": "Completed",
      "translations": {
        "en": "Completed"
      }
    },
    {
      "code": "TERMINATED",
      "decode": "Terminated",
      "translations": {
        "en": "Terminated"
      }
    }
  ],
  "SUB_ACTION": [
    {
      "code": "CREATED",
      "decode": "Created",
      "translations": {
        "en": "Created"
      }
    },
    {
      "code": "EDITED",
      "decode": "Edited",
      "translations": {
        "en": "Edited"
      }
    },
    {
      "code": "SUBMITTED",
      "decode": "Submitted",
      "translations": {
        "en": "Submitted"
      }
    },
    {
      "code": "RECALLED",
      "decode": "Recalled",
      "translations": {
        "en": "Recalled"
      }
    },
    {
      "code": "CLOSED",
      "decode": "Closed",
      "translations": {
        "en": "Closed"
      }
    }
  ],
  "SUB_METHOD": [
    {
      "code": "GATEWAY",
      "decode": "Electronic Gateway",
      "translations": {
        "en": "Electronic Gateway"
      }
    },
    {
      "code": "PORTAL",
      "decode": "Regulatory Portal",
      "translations": {
        "en": "Regulatory Portal"
      }
    },
    {
      "code": "EMAIL",
      "decode": "Email",
      "translations": {
        "en": "Email"
      }
    },
    {
      "code": "FAX",
      "decode": "Fax",
      "translations": {
        "en": "Fax"
      }
    },
    {
      "code": "POST",
      "decode": "Post",
      "translations": {
        "en": "Post"
      }
    }
  ],
  "SUB_REPORT_TYPE": [
    {
      "code": "CIOMS",
      "decode": "CIOMS I",
      "translations": {
        "en": "CIOMS I"
      }
    },
    {
      "code": "MEDWATCH",
      "decode": "MedWatch 3500A",
      "translations": {
        "en": "MedWatch 3500A"
      }
    },
    {
      "code": "E2B_R2",
      "decode": "ICH E2B(R2)",
      "translations": {
        "en": "ICH E2B(R2)"
      }
    },
    {
      "code": "E2B_R3",
      "decode": "ICH E2B(R3)",
      "translations": {
        "en": "ICH E2B(R3)"
      }
    },
    {
      "code": "PSUR",
      "decode": "PSUR/PBRER",
      "translations": {
        "en": "PSUR/PBRER"
      }
    },
    {
      "code": "DSUR",
      "decode": "DSUR",
      "translations": {
        "en": "DSUR"
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
  "SUB_STATUS": [
    {
      "code": "PENDING",
      "decode": "Pending",
      "translations": {
        "en": "Pending"
      }
    },
    {
      "code": "SUBMITTED",
      "decode": "Submitted",
      "translations": {
        "en": "Submitted"
      }
    },
    {
      "code": "OVERDUE",
      "decode": "Overdue",
      "translations": {
        "en": "Overdue"
      }
    },
    {
      "code": "ACCEPTED",
      "decode": "Accepted",
      "translations": {
        "en": "Accepted"
      }
    },
    {
      "code": "REJECTED",
      "decode": "Rejected",
      "translations": {
        "en": "Rejected"
      }
    },
    {
      "code": "WITHDRAWN",
      "decode": "Withdrawn",
      "translations": {
        "en": "Withdrawn"
      }
    }
  ],
  "USER_ROLE": [
    {
      "code": "ADMIN",
      "decode": "Administrator",
      "translations": {
        "en": "Administrator"
      }
    },
    {
      "code": "CASE_MGR",
      "decode": "Case Manager",
      "translations": {
        "en": "Case Manager"
      }
    },
    {
      "code": "REVIEWER",
      "decode": "Medical Reviewer",
      "translations": {
        "en": "Medical Reviewer"
      }
    },
    {
      "code": "SUBMITTER",
      "decode": "Submission Officer",
      "translations": {
        "en": "Submission Officer"
      }
    },
    {
      "code": "READONLY",
      "decode": "Read Only",
      "translations": {
        "en": "Read Only"
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
  ],

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
      "code": "MAH",
      "decode": "Marketing Authorisation Holder",
      "translations": {
        "en": "Marketing Authorisation Holder"
      }
    },
    {
      "code": "PARTNER",
      "decode": "Business Partner",
      "translations": {
        "en": "Business Partner"
      }
    },
    {
      "code": "CRO",
      "decode": "CRO",
      "translations": {
        "en": "CRO"
      }
    },
    {
      "code": "AUTHORITY",
      "decode": "Regulatory Authority",
      "translations": {
        "en": "Regulatory Authority"
      }
    },
    {
      "code": "HOSPITAL",
      "decode": "Hospital / HCP",
      "translations": {
        "en": "Hospital / HCP"
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
  "AUTHORITY": [
    {
      "code": "FDA",
      "decode": "FDA (US)",
      "translations": {
        "en": "FDA (US)"
      }
    },
    {
      "code": "EMA",
      "decode": "EMA (EU)",
      "translations": {
        "en": "EMA (EU)"
      }
    },
    {
      "code": "MHRA",
      "decode": "MHRA (UK)",
      "translations": {
        "en": "MHRA (UK)"
      }
    },
    {
      "code": "PMDA",
      "decode": "PMDA (Japan)",
      "translations": {
        "en": "PMDA (Japan)"
      }
    },
    {
      "code": "CDSCO",
      "decode": "CDSCO (India)",
      "translations": {
        "en": "CDSCO (India)"
      }
    },
    {
      "code": "TGA",
      "decode": "TGA (Australia)",
      "translations": {
        "en": "TGA (Australia)"
      }
    },
    {
      "code": "HC",
      "decode": "Health Canada",
      "translations": {
        "en": "Health Canada"
      }
    },
    {
      "code": "SWISSMEDIC",
      "decode": "Swissmedic",
      "translations": {
        "en": "Swissmedic"
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
  "CAUSALITY": [
    {
      "code": "CERT",
      "decode": "Certain",
      "translations": {
        "en": "Certain",
        "fr": "Certain",
        "de": "Sicher"
      }
    },
    {
      "code": "PROB",
      "decode": "Probable",
      "translations": {
        "en": "Probable",
        "fr": "Probable",
        "de": "Wahrscheinlich"
      }
    },
    {
      "code": "POSS",
      "decode": "Possible",
      "translations": {
        "en": "Possible",
        "fr": "Possible",
        "de": "Möglich"
      }
    },
    {
      "code": "UNLIKELY",
      "decode": "Unlikely",
      "translations": {
        "en": "Unlikely",
        "fr": "Improbable",
        "de": "Unwahrscheinlich"
      }
    }
  ],
  "CORR_STATUS": [
    {
      "code": "DRAFT",
      "decode": "Draft",
      "translations": {
        "en": "Draft"
      }
    },
    {
      "code": "PENDING",
      "decode": "Pending",
      "translations": {
        "en": "Pending"
      }
    },
    {
      "code": "SENT",
      "decode": "Sent",
      "translations": {
        "en": "Sent"
      }
    },
    {
      "code": "RECEIVED",
      "decode": "Received",
      "translations": {
        "en": "Received"
      }
    },
    {
      "code": "CLOSED",
      "decode": "Closed",
      "translations": {
        "en": "Closed"
      }
    }
  ],
  "CORR_TYPE": [
    {
      "code": "QUERY",
      "decode": "Query",
      "translations": {
        "en": "Query"
      }
    },
    {
      "code": "RESPONSE",
      "decode": "Response",
      "translations": {
        "en": "Response"
      }
    },
    {
      "code": "FOLLOWUP",
      "decode": "Follow-up",
      "translations": {
        "en": "Follow-up"
      }
    },
    {
      "code": "CLOSURE",
      "decode": "Closure",
      "translations": {
        "en": "Closure"
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
  "DIST_METHOD": [
    {
      "code": "EMAIL",
      "decode": "Email",
      "translations": {
        "en": "Email"
      }
    },
    {
      "code": "PORTAL",
      "decode": "Investigator Portal",
      "translations": {
        "en": "Investigator Portal"
      }
    },
    {
      "code": "FAX",
      "decode": "Fax",
      "translations": {
        "en": "Fax"
      }
    },
    {
      "code": "POST",
      "decode": "Post",
      "translations": {
        "en": "Post"
      }
    }
  ],
  "DIST_STATUS": [
    {
      "code": "PENDING",
      "decode": "Pending",
      "translations": {
        "en": "Pending"
      }
    },
    {
      "code": "SENT",
      "decode": "Sent",
      "translations": {
        "en": "Sent"
      }
    },
    {
      "code": "ACKNOWLEDGED",
      "decode": "Acknowledged",
      "translations": {
        "en": "Acknowledged"
      }
    },
    {
      "code": "FAILED",
      "decode": "Failed",
      "translations": {
        "en": "Failed"
      }
    }
  ],
  "DOSAGE_FORM": [
    {
      "code": "TABLET",
      "decode": "Tablet",
      "translations": {
        "en": "Tablet"
      }
    },
    {
      "code": "CAPSULE",
      "decode": "Capsule",
      "translations": {
        "en": "Capsule"
      }
    },
    {
      "code": "SOLUTION",
      "decode": "Solution for Injection",
      "translations": {
        "en": "Solution for Injection"
      }
    },
    {
      "code": "SUSPENSION",
      "decode": "Suspension",
      "translations": {
        "en": "Suspension"
      }
    },
    {
      "code": "PATCH",
      "decode": "Transdermal Patch",
      "translations": {
        "en": "Transdermal Patch"
      }
    },
    {
      "code": "INHALER",
      "decode": "Inhaler",
      "translations": {
        "en": "Inhaler"
      }
    },
    {
      "code": "CREAM",
      "decode": "Cream",
      "translations": {
        "en": "Cream"
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
  "DOSE_UNIT": [
    {
      "code": "MG",
      "decode": "mg",
      "translations": {
        "en": "mg"
      }
    },
    {
      "code": "G",
      "decode": "g",
      "translations": {
        "en": "g"
      }
    },
    {
      "code": "ML",
      "decode": "mL",
      "translations": {
        "en": "mL"
      }
    },
    {
      "code": "MCG",
      "decode": "mcg",
      "translations": {
        "en": "mcg"
      }
    }
  ],
  "DRUG_TYPE": [
    {
      "code": "SUS",
      "decode": "Suspect",
      "translations": {
        "en": "Suspect",
        "fr": "Suspect",
        "de": "Verdächtig"
      }
    },
    {
      "code": "CONV",
      "decode": "Concomitant",
      "translations": {
        "en": "Concomitant",
        "fr": "Concomitant",
        "de": "Begleitend"
      }
    },
    {
      "code": "INTER",
      "decode": "Interacting",
      "translations": {
        "en": "Interacting",
        "fr": "En interaction",
        "de": "Interagierend"
      }
    }
  ],
  "E2B_PROFILE": [
    {
      "code": "E2B_R2",
      "decode": "ICH E2B(R2)",
      "translations": {
        "en": "ICH E2B(R2)"
      }
    },
    {
      "code": "E2B_R3",
      "decode": "ICH E2B(R3)",
      "translations": {
        "en": "ICH E2B(R3)"
      }
    },
    {
      "code": "NONE",
      "decode": "None",
      "translations": {
        "en": "None"
      }
    }
  ],
  "EDI_METHOD": [
    {
      "code": "AS2",
      "decode": "AS2",
      "translations": {
        "en": "AS2"
      }
    },
    {
      "code": "SFTP",
      "decode": "SFTP",
      "translations": {
        "en": "SFTP"
      }
    },
    {
      "code": "EMAIL",
      "decode": "Email",
      "translations": {
        "en": "Email"
      }
    },
    {
      "code": "MANUAL",
      "decode": "Manual",
      "translations": {
        "en": "Manual"
      }
    }
  ],
  "FILE_TYPE": [
    {
      "code": "PDF",
      "decode": "PDF",
      "translations": {
        "en": "PDF"
      }
    },
    {
      "code": "DOCX",
      "decode": "Word Document",
      "translations": {
        "en": "Word Document"
      }
    },
    {
      "code": "XLSX",
      "decode": "Excel Spreadsheet",
      "translations": {
        "en": "Excel Spreadsheet"
      }
    },
    {
      "code": "XML",
      "decode": "XML",
      "translations": {
        "en": "XML"
      }
    },
    {
      "code": "TXT",
      "decode": "Text File",
      "translations": {
        "en": "Text File"
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
  "ICSR_ACTION_TAKEN": [
    {
      "code": "withdrawn",
      "decode": "Drug Withdrawn",
      "translations": {
        "r2": "1",
        "r3": "withdrawn",
        "label": "Drug Withdrawn",
        "fr": "Medicament arrete",
        "ja": "投与中止",
        "zh": "停药"
      }
    },
    {
      "code": "doseReduced",
      "decode": "Dose Reduced",
      "translations": {
        "r2": "2",
        "r3": "doseReduced",
        "label": "Dose Reduced",
        "fr": "Dose reduite",
        "ja": "減量",
        "zh": "减量"
      }
    },
    {
      "code": "doseIncreased",
      "decode": "Dose Increased",
      "translations": {
        "r2": "3",
        "r3": "doseIncreased",
        "label": "Dose Increased",
        "fr": "Dose augmentee",
        "ja": "増量",
        "zh": "增量"
      }
    },
    {
      "code": "notChanged",
      "decode": "Not Changed",
      "translations": {
        "r2": "4",
        "r3": "notChanged",
        "label": "Not Changed",
        "fr": "Non modifie",
        "ja": "変更なし",
        "zh": "未更改"
      }
    },
    {
      "code": "unknown",
      "decode": "Unknown",
      "translations": {
        "r2": "5",
        "r3": "unknown",
        "label": "Unknown",
        "fr": "Inconnu",
        "ja": "不明",
        "zh": "未知"
      }
    },
    {
      "code": "notApplicable",
      "decode": "Not Applicable",
      "translations": {
        "r2": "6",
        "r3": "notApplicable",
        "label": "Not Applicable",
        "fr": "Sans objet",
        "ja": "該当なし",
        "zh": "不适用"
      }
    }
  ],
  "ICSR_AGE_GROUP": [
    {
      "code": "neonate",
      "decode": "Neonate (0-27 days)",
      "translations": {
        "r2": "",
        "r3": "neonate",
        "label": "Neonate",
        "fr": "Nouveau-ne",
        "ja": "新生児",
        "zh": "新生儿"
      }
    },
    {
      "code": "infant",
      "decode": "Infant (28 days-23 mo)",
      "translations": {
        "r2": "",
        "r3": "infant",
        "label": "Infant",
        "fr": "Nourrisson",
        "ja": "乳児",
        "zh": "婴儿"
      }
    },
    {
      "code": "child",
      "decode": "Child (2-11 yr)",
      "translations": {
        "r2": "",
        "r3": "child",
        "label": "Child",
        "fr": "Enfant",
        "ja": "小児",
        "zh": "儿童"
      }
    },
    {
      "code": "adolescent",
      "decode": "Adolescent (12-17 yr)",
      "translations": {
        "r2": "",
        "r3": "adolescent",
        "label": "Adolescent",
        "fr": "Adolescent",
        "ja": "青少年",
        "zh": "青少年"
      }
    },
    {
      "code": "adult",
      "decode": "Adult (18-64 yr)",
      "translations": {
        "r2": "",
        "r3": "adult",
        "label": "Adult",
        "fr": "Adulte",
        "ja": "成人",
        "zh": "成人"
      }
    },
    {
      "code": "elderly",
      "decode": "Elderly (65+ yr)",
      "translations": {
        "r2": "",
        "r3": "elderly",
        "label": "Elderly",
        "fr": "Personne agee",
        "ja": "高齢者",
        "zh": "老年人"
      }
    }
  ],
  "ICSR_AGE_UNIT": [
    {
      "code": "yr",
      "decode": "Year",
      "translations": {
        "r2": "801",
        "r3": "a",
        "label": "Year",
        "fr": "Annee",
        "ja": "年",
        "zh": "年"
      }
    },
    {
      "code": "mo",
      "decode": "Month",
      "translations": {
        "r2": "802",
        "r3": "mo",
        "label": "Month",
        "fr": "Mois",
        "ja": "月",
        "zh": "月"
      }
    },
    {
      "code": "wk",
      "decode": "Week",
      "translations": {
        "r2": "803",
        "r3": "wk",
        "label": "Week",
        "fr": "Semaine",
        "ja": "週",
        "zh": "周"
      }
    },
    {
      "code": "dy",
      "decode": "Day",
      "translations": {
        "r2": "804",
        "r3": "d",
        "label": "Day",
        "fr": "Jour",
        "ja": "日",
        "zh": "天"
      }
    },
    {
      "code": "hr",
      "decode": "Hour",
      "translations": {
        "r2": "805",
        "r3": "h",
        "label": "Hour",
        "fr": "Heure",
        "ja": "時間",
        "zh": "小时"
      }
    }
  ],
  "ICSR_CAUSALITY": [
    {
      "code": "related",
      "decode": "Related",
      "translations": {
        "r2": "1",
        "r3": "related",
        "label": "Related",
        "fr": "Lie",
        "ja": "関連あり",
        "zh": "相关"
      }
    },
    {
      "code": "notRelated",
      "decode": "Not Related",
      "translations": {
        "r2": "2",
        "r3": "notRelated",
        "label": "Not Related",
        "fr": "Non lie",
        "ja": "関連なし",
        "zh": "不相关"
      }
    },
    {
      "code": "unassessable",
      "decode": "Unassessable",
      "translations": {
        "r2": "3",
        "r3": "unassessable",
        "label": "Unassessable",
        "fr": "Non evaluable",
        "ja": "評価不能",
        "zh": "无法评估"
      }
    }
  ],
  "ICSR_DOSE_UNIT": [
    {
      "code": "mg",
      "decode": "Milligram",
      "translations": {
        "r2": "mg",
        "r3": "mg",
        "label": "Milligram",
        "fr": "Milligramme",
        "ja": "ミリグラム",
        "zh": "毫克"
      }
    },
    {
      "code": "g",
      "decode": "Gram",
      "translations": {
        "r2": "g",
        "r3": "g",
        "label": "Gram",
        "fr": "Gramme",
        "ja": "グラム",
        "zh": "克"
      }
    },
    {
      "code": "mL",
      "decode": "Millilitre",
      "translations": {
        "r2": "mL",
        "r3": "mL",
        "label": "Millilitre",
        "fr": "Millilitre",
        "ja": "ミリリットル",
        "zh": "毫升"
      }
    },
    {
      "code": "IU",
      "decode": "Int. Units",
      "translations": {
        "r2": "IU",
        "r3": "[iU]",
        "label": "Int. Units",
        "fr": "UI",
        "ja": "国際単位",
        "zh": "国际单位"
      }
    },
    {
      "code": "mcg",
      "decode": "Microgram",
      "translations": {
        "r2": "mcg",
        "r3": "ug",
        "label": "Microgram",
        "fr": "Microgramme",
        "ja": "マイクログラム",
        "zh": "微克"
      }
    }
  ],
  "ICSR_DRUG_CHAR": [
    {
      "code": "suspect",
      "decode": "Suspect",
      "translations": {
        "r2": "1",
        "r3": "suspect",
        "label": "Suspect",
        "fr": "Suspect",
        "ja": "被疑薬",
        "zh": "可疑药物"
      }
    },
    {
      "code": "concomitant",
      "decode": "Concomitant",
      "translations": {
        "r2": "2",
        "r3": "concomitant",
        "label": "Concomitant",
        "fr": "Concomitant",
        "ja": "併用薬",
        "zh": "合并用药"
      }
    },
    {
      "code": "interacting",
      "decode": "Interacting",
      "translations": {
        "r2": "3",
        "r3": "interacting",
        "label": "Interacting",
        "fr": "En interaction",
        "ja": "相互作用薬",
        "zh": "相互作用药"
      }
    }
  ],
  "ICSR_ORG_TYPE": [
    {
      "code": "pharma",
      "decode": "Pharmaceutical Company",
      "translations": {
        "r2": "1",
        "r3": "pharmaceuticalCompany",
        "label": "Pharmaceutical Company",
        "fr": "Societe pharmaceutique",
        "ja": "製薬会社",
        "zh": "制药公司"
      }
    },
    {
      "code": "regulatory",
      "decode": "Regulatory Authority",
      "translations": {
        "r2": "2",
        "r3": "regulatoryAuthority",
        "label": "Regulatory Authority",
        "fr": "Autorite reglementaire",
        "ja": "規制当局",
        "zh": "监管机构"
      }
    },
    {
      "code": "other",
      "decode": "Other",
      "translations": {
        "r2": "3",
        "r3": "other",
        "label": "Other",
        "fr": "Autre",
        "ja": "その他",
        "zh": "其他"
      }
    }
  ],
  "ICSR_OUTCOME": [
    {
      "code": "recovered",
      "decode": "Recovered / Resolved",
      "translations": {
        "r2": "1",
        "r3": "recovered",
        "label": "Recovered / Resolved",
        "fr": "Gueri / Resolu",
        "ja": "回復",
        "zh": "已恢复"
      }
    },
    {
      "code": "recovering",
      "decode": "Recovering / Resolving",
      "translations": {
        "r2": "2",
        "r3": "recovering",
        "label": "Recovering / Resolving",
        "fr": "En cours de guerison",
        "ja": "回復中",
        "zh": "恢复中"
      }
    },
    {
      "code": "notRecovered",
      "decode": "Not Recovered / Not Resolved",
      "translations": {
        "r2": "3",
        "r3": "notRecovered",
        "label": "Not Recovered / Not Resolved",
        "fr": "Non gueri / Non resolu",
        "ja": "未回復",
        "zh": "未恢复"
      }
    },
    {
      "code": "fatal",
      "decode": "Fatal",
      "translations": {
        "r2": "4",
        "r3": "fatal",
        "label": "Fatal",
        "fr": "Fatal",
        "ja": "死亡",
        "zh": "死亡"
      }
    },
    {
      "code": "unknown",
      "decode": "Unknown",
      "translations": {
        "r2": "5",
        "r3": "unknown",
        "label": "Unknown",
        "fr": "Inconnu",
        "ja": "不明",
        "zh": "未知"
      }
    },
    {
      "code": "recoveredWithSequalae",
      "decode": "Recovered with Sequelae",
      "translations": {
        "r2": "6",
        "r3": "recoveredWithSequelae",
        "label": "Recovered with Sequelae",
        "fr": "Gueri avec sequelles",
        "ja": "後遺症あり回復",
        "zh": "有后遗症恢复"
      }
    }
  ],
  "ICSR_PRODUCT_TYPE": [
    {
      "code": "medicinal",
      "decode": "Medicinal Product",
      "translations": {
        "r2": "01",
        "r3": "medicinalProduct",
        "label": "Medicinal Product",
        "fr": "Medicament",
        "ja": "医薬品",
        "zh": "药品"
      }
    },
    {
      "code": "vaccine",
      "decode": "Vaccine",
      "translations": {
        "r2": "02",
        "r3": "vaccine",
        "label": "Vaccine",
        "fr": "Vaccin",
        "ja": "ワクチン",
        "zh": "疫苗"
      }
    },
    {
      "code": "biological",
      "decode": "Biological",
      "translations": {
        "r2": "03",
        "r3": "biological",
        "label": "Biological",
        "fr": "Biologique",
        "ja": "生物製剤",
        "zh": "生物制品"
      }
    }
  ],
  "ICSR_QUALIFICATION": [
    {
      "code": "physician",
      "decode": "Physician",
      "translations": {
        "r2": "1",
        "r3": "physician",
        "label": "Physician",
        "fr": "Medecin",
        "ja": "医師",
        "zh": "医生"
      }
    },
    {
      "code": "pharmacist",
      "decode": "Pharmacist",
      "translations": {
        "r2": "2",
        "r3": "pharmacist",
        "label": "Pharmacist",
        "fr": "Pharmacien",
        "ja": "薬剤師",
        "zh": "药剂师"
      }
    },
    {
      "code": "otherHcp",
      "decode": "Other Health Care Professional",
      "translations": {
        "r2": "3",
        "r3": "otherHealthcareProfessional",
        "label": "Other Health Care Professional",
        "fr": "Autre professionnel de sante",
        "ja": "その他の医療専門家",
        "zh": "其他医疗专业人员"
      }
    },
    {
      "code": "lawyer",
      "decode": "Lawyer",
      "translations": {
        "r2": "4",
        "r3": "lawyer",
        "label": "Lawyer",
        "fr": "Avocat",
        "ja": "弁護士",
        "zh": "律师"
      }
    },
    {
      "code": "consumer",
      "decode": "Consumer / Patient",
      "translations": {
        "r2": "5",
        "r3": "consumer",
        "label": "Consumer / Patient",
        "fr": "Consommateur / Patient",
        "ja": "消費者・患者",
        "zh": "消费者/患者"
      }
    }
  ],
  "ICSR_REPORT_TYPE": [
    {
      "code": "spontaneous",
      "decode": "Spontaneous Report",
      "translations": {
        "r2": "1",
        "r3": "spontaneous",
        "label": "Spontaneous Report",
        "fr": "Rapport spontane",
        "ja": "自発報告",
        "zh": "自发报告"
      }
    },
    {
      "code": "study",
      "decode": "Study Report",
      "translations": {
        "r2": "2",
        "r3": "study",
        "label": "Study Report",
        "fr": "Rapport d etude",
        "ja": "試験報告",
        "zh": "研究报告"
      }
    },
    {
      "code": "other",
      "decode": "Other",
      "translations": {
        "r2": "3",
        "r3": "other",
        "label": "Other",
        "fr": "Autre",
        "ja": "その他",
        "zh": "其他"
      }
    },
    {
      "code": "notAvailable",
      "decode": "Not Available",
      "translations": {
        "r2": "4",
        "r3": "notAvailable",
        "label": "Not Available",
        "fr": "Non disponible",
        "ja": "不明",
        "zh": "不可用"
      }
    }
  ],
  "ICSR_REPORTER_TYPE": [
    {
      "code": "spontaneous",
      "decode": "Spontaneous",
      "translations": {
        "r2": "1",
        "r3": "spontaneous",
        "label": "Spontaneous",
        "fr": "Spontane",
        "ja": "自発",
        "zh": "自发"
      }
    },
    {
      "code": "study",
      "decode": "Study",
      "translations": {
        "r2": "2",
        "r3": "study",
        "label": "Study",
        "fr": "Etude",
        "ja": "試験",
        "zh": "研究"
      }
    },
    {
      "code": "other",
      "decode": "Other",
      "translations": {
        "r2": "3",
        "r3": "other",
        "label": "Other",
        "fr": "Autre",
        "ja": "その他",
        "zh": "其他"
      }
    }
  ],
  "ICSR_ROUTE": [
    {
      "code": "oral",
      "decode": "Oral",
      "translations": {
        "r2": "001",
        "r3": "oralUse",
        "label": "Oral",
        "fr": "Oral",
        "ja": "経口",
        "zh": "口服"
      }
    },
    {
      "code": "iv",
      "decode": "Intravenous",
      "translations": {
        "r2": "002",
        "r3": "intravenousUse",
        "label": "Intravenous",
        "fr": "Intraveineux",
        "ja": "静脈内",
        "zh": "静脉注射"
      }
    },
    {
      "code": "im",
      "decode": "Intramuscular",
      "translations": {
        "r2": "003",
        "r3": "intramuscularUse",
        "label": "Intramuscular",
        "fr": "Intramusculaire",
        "ja": "筋肉内",
        "zh": "肌肉注射"
      }
    },
    {
      "code": "sc",
      "decode": "Subcutaneous",
      "translations": {
        "r2": "004",
        "r3": "subcutaneousUse",
        "label": "Subcutaneous",
        "fr": "Sous-cutane",
        "ja": "皮下",
        "zh": "皮下注射"
      }
    },
    {
      "code": "topical",
      "decode": "Topical",
      "translations": {
        "r2": "005",
        "r3": "cutaneousUse",
        "label": "Topical",
        "fr": "Topique",
        "ja": "局所",
        "zh": "局部"
      }
    },
    {
      "code": "inhalation",
      "decode": "Inhalation",
      "translations": {
        "r2": "006",
        "r3": "inhalationUse",
        "label": "Inhalation",
        "fr": "Inhalation",
        "ja": "吸入",
        "zh": "吸入"
      }
    },
    {
      "code": "unknown",
      "decode": "Unknown",
      "translations": {
        "r2": "999",
        "r3": "unknown",
        "label": "Unknown",
        "fr": "Inconnu",
        "ja": "不明",
        "zh": "未知"
      }
    }
  ],
  "ICSR_SEX": [
    {
      "code": "male",
      "decode": "Male",
      "translations": {
        "r2": "1",
        "r3": "male",
        "label": "Male",
        "fr": "Masculin",
        "ja": "男性",
        "zh": "男"
      }
    },
    {
      "code": "female",
      "decode": "Female",
      "translations": {
        "r2": "2",
        "r3": "female",
        "label": "Female",
        "fr": "Feminin",
        "ja": "女性",
        "zh": "女"
      }
    },
    {
      "code": "unknown",
      "decode": "Unknown",
      "translations": {
        "r2": "0",
        "r3": "unknown",
        "label": "Unknown",
        "fr": "Inconnu",
        "ja": "不明",
        "zh": "未知"
      }
    }
  ],
  "ICSR_STUDY_TYPE": [
    {
      "code": "phaseI",
      "decode": "Phase I",
      "translations": {
        "r2": "1",
        "r3": "phaseI",
        "label": "Phase I",
        "fr": "Phase I",
        "ja": "第I相",
        "zh": "I期"
      }
    },
    {
      "code": "phaseII",
      "decode": "Phase II",
      "translations": {
        "r2": "2",
        "r3": "phaseII",
        "label": "Phase II",
        "fr": "Phase II",
        "ja": "第II相",
        "zh": "II期"
      }
    },
    {
      "code": "phaseIII",
      "decode": "Phase III",
      "translations": {
        "r2": "3",
        "r3": "phaseIII",
        "label": "Phase III",
        "fr": "Phase III",
        "ja": "第III相",
        "zh": "III期"
      }
    },
    {
      "code": "phaseIV",
      "decode": "Phase IV",
      "translations": {
        "r2": "4",
        "r3": "phaseIV",
        "label": "Phase IV",
        "fr": "Phase IV",
        "ja": "第IV相",
        "zh": "IV期"
      }
    },
    {
      "code": "observational",
      "decode": "Observational",
      "translations": {
        "r2": "5",
        "r3": "observational",
        "label": "Observational",
        "fr": "Observationnelle",
        "ja": "観察研究",
        "zh": "观察性研究"
      }
    },
    {
      "code": "other",
      "decode": "Other",
      "translations": {
        "r2": "6",
        "r3": "other",
        "label": "Other",
        "fr": "Autre",
        "ja": "その他",
        "zh": "其他"
      }
    }
  ],
  "ICSR_YES_NO_UNK": [
    {
      "code": "yes",
      "decode": "Yes",
      "translations": {
        "r2": "1",
        "r3": "yes",
        "label": "Yes",
        "fr": "Oui",
        "ja": "はい",
        "zh": "是"
      }
    },
    {
      "code": "no",
      "decode": "No",
      "translations": {
        "r2": "2",
        "r3": "no",
        "label": "No",
        "fr": "Non",
        "ja": "いいえ",
        "zh": "否"
      }
    },
    {
      "code": "unknown",
      "decode": "Unknown",
      "translations": {
        "r2": "3",
        "r3": "unknown",
        "label": "Unknown",
        "fr": "Inconnu",
        "ja": "不明",
        "zh": "未知"
      }
    }
  ],
  "INGREDIENT_ROLE": [
    {
      "code": "ACTIVE",
      "decode": "Active Substance",
      "translations": {
        "en": "Active Substance"
      }
    },
    {
      "code": "EXCIPIENT",
      "decode": "Excipient",
      "translations": {
        "en": "Excipient"
      }
    },
    {
      "code": "ADJUVANT",
      "decode": "Adjuvant",
      "translations": {
        "en": "Adjuvant"
      }
    }
  ],
  "PRODUCT_TYPE": [
    {
      "code": "SMALL_MOL",
      "decode": "Small Molecule",
      "translations": {
        "en": "Small Molecule"
      }
    },
    {
      "code": "BIOLOGIC",
      "decode": "Biologic",
      "translations": {
        "en": "Biologic"
      }
    },
    {
      "code": "VACCINE",
      "decode": "Vaccine",
      "translations": {
        "en": "Vaccine"
      }
    },
    {
      "code": "DEVICE",
      "decode": "Medical Device",
      "translations": {
        "en": "Medical Device"
      }
    },
    {
      "code": "COMBO",
      "decode": "Combination Product",
      "translations": {
        "en": "Combination Product"
      }
    },
    {
      "code": "HERBAL",
      "decode": "Herbal / Traditional",
      "translations": {
        "en": "Herbal / Traditional"
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
  "RELATIONSHIP": [
    {
      "code": "PARENT",
      "decode": "Parent",
      "translations": {
        "en": "Parent"
      }
    },
    {
      "code": "GUARDIAN",
      "decode": "Legal Guardian",
      "translations": {
        "en": "Legal Guardian"
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
  "ROUTE": [
    {
      "code": "ORAL",
      "decode": "Oral",
      "translations": {
        "en": "Oral",
        "fr": "Oral",
        "de": "Oral"
      }
    },
    {
      "code": "IV",
      "decode": "Intravenous",
      "translations": {
        "en": "Intravenous",
        "fr": "Intraveineux",
        "de": "Intravenös"
      }
    },
    {
      "code": "SC",
      "decode": "Subcutaneous",
      "translations": {
        "en": "Subcutaneous",
        "fr": "Sous-cutané",
        "de": "Subkutan"
      }
    },
    {
      "code": "IM",
      "decode": "Intramuscular",
      "translations": {
        "en": "Intramuscular",
        "fr": "Intramusculaire",
        "de": "Intramuskulär"
      }
    }
  ],
  "SEVERITY": [
    {
      "code": "MILD",
      "decode": "Mild",
      "translations": {
        "en": "Mild",
        "fr": "Léger",
        "de": "Leicht"
      }
    },
    {
      "code": "MOD",
      "decode": "Moderate",
      "translations": {
        "en": "Moderate",
        "fr": "Modéré",
        "de": "Mäßig"
      }
    },
    {
      "code": "SEV",
      "decode": "Severe",
      "translations": {
        "en": "Severe",
        "fr": "Sévère",
        "de": "Schwer"
      }
    },
    {
      "code": "FATAL",
      "decode": "Fatal",
      "translations": {
        "en": "Fatal",
        "fr": "Fatal",
        "de": "Tödlich"
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
  "SITE_STATUS": [
    {
      "code": "PENDING",
      "decode": "Pending Activation",
      "translations": {
        "en": "Pending Activation"
      }
    },
    {
      "code": "ACTIVE",
      "decode": "Active",
      "translations": {
        "en": "Active"
      }
    },
    {
      "code": "SUSPENDED",
      "decode": "Suspended",
      "translations": {
        "en": "Suspended"
      }
    },
    {
      "code": "CLOSED",
      "decode": "Closed",
      "translations": {
        "en": "Closed"
      }
    }
  ],
  "STUDY_PRODUCT_ROLE": [
    {
      "code": "IMP",
      "decode": "Investigational Medicinal Product",
      "translations": {
        "en": "Investigational Medicinal Product"
      }
    },
    {
      "code": "COMPARATOR",
      "decode": "Comparator",
      "translations": {
        "en": "Comparator"
      }
    },
    {
      "code": "PLACEBO",
      "decode": "Placebo",
      "translations": {
        "en": "Placebo"
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
  "STUDY_STATUS": [
    {
      "code": "PLANNED",
      "decode": "Planned",
      "translations": {
        "en": "Planned"
      }
    },
    {
      "code": "ACTIVE",
      "decode": "Active",
      "translations": {
        "en": "Active"
      }
    },
    {
      "code": "SUSPENDED",
      "decode": "Suspended",
      "translations": {
        "en": "Suspended"
      }
    },
    {
      "code": "COMPLETED",
      "decode": "Completed",
      "translations": {
        "en": "Completed"
      }
    },
    {
      "code": "TERMINATED",
      "decode": "Terminated",
      "translations": {
        "en": "Terminated"
      }
    }
  ],
  "SUB_ACTION": [
    {
      "code": "CREATED",
      "decode": "Created",
      "translations": {
        "en": "Created"
      }
    },
    {
      "code": "EDITED",
      "decode": "Edited",
      "translations": {
        "en": "Edited"
      }
    },
    {
      "code": "SUBMITTED",
      "decode": "Submitted",
      "translations": {
        "en": "Submitted"
      }
    },
    {
      "code": "RECALLED",
      "decode": "Recalled",
      "translations": {
        "en": "Recalled"
      }
    },
    {
      "code": "CLOSED",
      "decode": "Closed",
      "translations": {
        "en": "Closed"
      }
    }
  ],
  "SUB_METHOD": [
    {
      "code": "GATEWAY",
      "decode": "Electronic Gateway",
      "translations": {
        "en": "Electronic Gateway"
      }
    },
    {
      "code": "PORTAL",
      "decode": "Regulatory Portal",
      "translations": {
        "en": "Regulatory Portal"
      }
    },
    {
      "code": "EMAIL",
      "decode": "Email",
      "translations": {
        "en": "Email"
      }
    },
    {
      "code": "FAX",
      "decode": "Fax",
      "translations": {
        "en": "Fax"
      }
    },
    {
      "code": "POST",
      "decode": "Post",
      "translations": {
        "en": "Post"
      }
    }
  ],
  "SUB_REPORT_TYPE": [
    {
      "code": "CIOMS",
      "decode": "CIOMS I",
      "translations": {
        "en": "CIOMS I"
      }
    },
    {
      "code": "MEDWATCH",
      "decode": "MedWatch 3500A",
      "translations": {
        "en": "MedWatch 3500A"
      }
    },
    {
      "code": "E2B_R2",
      "decode": "ICH E2B(R2)",
      "translations": {
        "en": "ICH E2B(R2)"
      }
    },
    {
      "code": "E2B_R3",
      "decode": "ICH E2B(R3)",
      "translations": {
        "en": "ICH E2B(R3)"
      }
    },
    {
      "code": "PSUR",
      "decode": "PSUR/PBRER",
      "translations": {
        "en": "PSUR/PBRER"
      }
    },
    {
      "code": "DSUR",
      "decode": "DSUR",
      "translations": {
        "en": "DSUR"
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
  "SUB_STATUS": [
    {
      "code": "PENDING",
      "decode": "Pending",
      "translations": {
        "en": "Pending"
      }
    },
    {
      "code": "SUBMITTED",
      "decode": "Submitted",
      "translations": {
        "en": "Submitted"
      }
    },
    {
      "code": "OVERDUE",
      "decode": "Overdue",
      "translations": {
        "en": "Overdue"
      }
    },
    {
      "code": "ACCEPTED",
      "decode": "Accepted",
      "translations": {
        "en": "Accepted"
      }
    },
    {
      "code": "REJECTED",
      "decode": "Rejected",
      "translations": {
        "en": "Rejected"
      }
    },
    {
      "code": "WITHDRAWN",
      "decode": "Withdrawn",
      "translations": {
        "en": "Withdrawn"
      }
    }
  ],
  "USER_ROLE": [
    {
      "code": "ADMIN",
      "decode": "Administrator",
      "translations": {
        "en": "Administrator"
      }
    },
    {
      "code": "CASE_MGR",
      "decode": "Case Manager",
      "translations": {
        "en": "Case Manager"
      }
    },
    {
      "code": "REVIEWER",
      "decode": "Medical Reviewer",
      "translations": {
        "en": "Medical Reviewer"
      }
    },
    {
      "code": "SUBMITTER",
      "decode": "Submission Officer",
      "translations": {
        "en": "Submission Officer"
      }
    },
    {
      "code": "READONLY",
      "decode": "Read Only",
      "translations": {
        "en": "Read Only"
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
