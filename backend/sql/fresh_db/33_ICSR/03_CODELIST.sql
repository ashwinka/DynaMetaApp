-- ============================================================
-- MetaDyna API — ICSR Module
-- Script  : 03_CODELIST_ALL.sql
-- Purpose : Merged CODE_LIST_LIB + CODE_LIST_VALUES for all
--           ICSR codelists, ordered by table range.
-- ============================================================

-- ── 03_CODELIST_500.sql ──
-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 03_CODELIST_500.sql
-- Module  : ICSR — Table 500 codelists
-- Purpose : Codelist seed data for ICSR case header fields
--           TRANSLATIONS include en, fr, ja + r2 and r3 codes
--           where the codelist maps to ICH E2B elements.
-- ============================================================



INSERT INTO CODE_LIST_LIB (ID, CODE_LIST_ID, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR, 'ICSR_REPORT_TYPE',          'ICSR Report Type (C.1.3 / A.1.7)'),
(gen_random_uuid()::VARCHAR, 'ICSR_NULLIFICATION',        'ICSR Nullification / Amendment (C.1.12)'),
(gen_random_uuid()::VARCHAR, 'ICSR_INITIAL_SENDER',       'ICSR Initial Sender Type (C.1.4)'),
(gen_random_uuid()::VARCHAR, 'ICSR_LOCAL_CRITERIA',       'ICSR Local Criteria Report Type'),
(gen_random_uuid()::VARCHAR, 'ICSR_PRIORITY',             'ICSR Report Priority'),
(gen_random_uuid()::VARCHAR, 'ICSR_REPORT_CATEGORY',      'ICSR Report Category'),
(gen_random_uuid()::VARCHAR, 'ICSR_REPORT_CLASSIFICATION','ICSR Report Classification'),
(gen_random_uuid()::VARCHAR, 'ICSR_SAFETY_REPORT_TYPE',   'ICSR Safety Report Type'),
(gen_random_uuid()::VARCHAR, 'ICSR_SAFETY_CLASSIFICATION','ICSR Safety/Efficacy Classification'),
(gen_random_uuid()::VARCHAR, 'ICSR_CASE_TYPE',            'ICSR Case Type'),
(gen_random_uuid()::VARCHAR, 'ICSR_INITIAL_FOLLOWUP',     'ICSR Initial or Follow-Up'),
(gen_random_uuid()::VARCHAR, 'ICSR_FLAG',                 'ICSR Relevance Flag'),
(gen_random_uuid()::VARCHAR, 'ICSR_CASE_SIGNIFICANCE',    'ICSR Case Version Significance'),
(gen_random_uuid()::VARCHAR, 'ICSR_RECEIVE_MEDIUM',       'ICSR Report Receiving Medium'),
(gen_random_uuid()::VARCHAR, 'ICSR_RECEIVE_FORMAT',       'ICSR Report Receiving Format'),
(gen_random_uuid()::VARCHAR, 'ICSR_LINKED_REASON',        'ICSR Linked Case Reason'),
(gen_random_uuid()::VARCHAR, 'ICSR_NON_CASE_REASON',      'ICSR Non-Case Assessment Reason'),
(gen_random_uuid()::VARCHAR, 'ICSR_REMOVE_REASON',        'ICSR Remove Reason Code'),
(gen_random_uuid()::VARCHAR, 'ICSR_CLASSIFICATION_TYPE',  'ICSR Classification Type'),
(gen_random_uuid()::VARCHAR, 'ICSR_LATENESS_REASON',      'ICSR Overall Lateness Reason'),
(gen_random_uuid()::VARCHAR, 'ICSR_INBOUND_LATENESS',     'ICSR Inbound Lateness Reason'),
(gen_random_uuid()::VARCHAR, 'ICSR_CORRECTIVE_ACTION',    'ICSR Corrective Action Category'),
(gen_random_uuid()::VARCHAR, 'ICSR_DEVICE_LABELING',      'ICSR Device Problem Labeling'),
(gen_random_uuid()::VARCHAR, 'ICSR_DEVICE_OUTCOME',       'ICSR Device Problem Report Outcome')
ON CONFLICT (CODE_LIST_ID) DO NOTHING;

-- ── ICSR_REPORT_TYPE — R2:A.1.7 / R3:C.1.3 ──────────────────
-- R2 codes: 1=Spontaneous, 2=Report from study, 3=Other, 4=N/A
-- R3 codes: spontaneous, report from study, other, not-available-to-sender
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_REPORT_TYPE','1','Spontaneous',
    '{"en":"Spontaneous","fr":"Spontané","ja":"自発報告","r2":"1","r3":"spontaneous"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_REPORT_TYPE','2','Report from study',
    '{"en":"Report from study","fr":"Rapport d''étude","ja":"試験報告","r2":"2","r3":"report-from-study"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_REPORT_TYPE','3','Other',
    '{"en":"Other","fr":"Autre","ja":"その他","r2":"3","r3":"other"}',3),
(gen_random_uuid()::VARCHAR,'ICSR_REPORT_TYPE','4','Not available to sender',
    '{"en":"Not available to sender","fr":"Non disponible","ja":"送信者不明","r2":"4","r3":"not-available-to-sender"}',4)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── ICSR_NULLIFICATION — R2:A.1.11 / R3:C.1.12 ──────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_NULLIFICATION','1','Nullification',
    '{"en":"Nullification","fr":"Nullification","ja":"無効化","r2":"1","r3":"nullification"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_NULLIFICATION','2','Amendment',
    '{"en":"Amendment","fr":"Amendement","ja":"修正","r2":"2","r3":"amendment"}',2)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── ICSR_INITIAL_SENDER — R2:A.1.2 / R3:C.1.4 ───────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_INITIAL_SENDER','01','Regulator',
    '{"en":"Regulator","fr":"Autorité réglementaire","ja":"規制当局","r2":"01","r3":"regulator"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_INITIAL_SENDER','02','Other',
    '{"en":"Other","fr":"Autre","ja":"その他","r2":"02","r3":"other"}',2)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── ICSR_LOCAL_CRITERIA ───────────────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_LOCAL_CRITERIA','1','Expedited (15-Day)',
    '{"en":"Expedited (15-Day)","fr":"Accéléré (15 jours)","ja":"迅速報告（15日）"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_LOCAL_CRITERIA','2','Periodic',
    '{"en":"Periodic","fr":"Périodique","ja":"定期報告"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_LOCAL_CRITERIA','4','5-Day',
    '{"en":"5-Day","fr":"5 jours","ja":"5日報告"}',3),
(gen_random_uuid()::VARCHAR,'ICSR_LOCAL_CRITERIA','5','30-Day',
    '{"en":"30-Day","fr":"30 jours","ja":"30日報告"}',4),
(gen_random_uuid()::VARCHAR,'ICSR_LOCAL_CRITERIA','6','7-Day',
    '{"en":"7-Day","fr":"7 jours","ja":"7日報告"}',5)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── ICSR_PRIORITY → reuse existing PRIORITY codelist ─────────
-- PRIORITY codelist already defined in 05_seed_codelist.sql (High/Medium/Low)
-- ICSR_PRIORITY removed — use PRIORITY instead

-- ── ICSR_REPORT_CATEGORY ──────────────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_REPORT_CATEGORY','1','Adverse Event',
    '{"en":"Adverse Event","fr":"Événement indésirable","ja":"有害事象"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_REPORT_CATEGORY','3','Adverse event due to product problem',
    '{"en":"Adverse event due to product problem","fr":"EI dû à un problème produit","ja":"製品問題による有害事象"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_REPORT_CATEGORY','8','Product problem',
    '{"en":"Product problem","fr":"Problème produit","ja":"製品問題"}',3)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── ICSR_REPORT_CLASSIFICATION ────────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_REPORT_CLASSIFICATION','1','Invalid',
    '{"en":"Invalid","fr":"Invalide","ja":"無効"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_REPORT_CLASSIFICATION','2','Non-AE Case',
    '{"en":"Non-AE Case","fr":"Cas non EI","ja":"非有害事象ケース"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_REPORT_CLASSIFICATION','3','Non-Case',
    '{"en":"Non-Case","fr":"Non-cas","ja":"非ケース"}',3),
(gen_random_uuid()::VARCHAR,'ICSR_REPORT_CLASSIFICATION','4','Pregnancy-Mother',
    '{"en":"Pregnancy-Mother","fr":"Grossesse-Mère","ja":"妊娠-母親"}',4),
(gen_random_uuid()::VARCHAR,'ICSR_REPORT_CLASSIFICATION','5','Pregnancy-Father',
    '{"en":"Pregnancy-Father","fr":"Grossesse-Père","ja":"妊娠-父親"}',5),
(gen_random_uuid()::VARCHAR,'ICSR_REPORT_CLASSIFICATION','6','Pregnancy-Child',
    '{"en":"Pregnancy-Child","fr":"Grossesse-Enfant","ja":"妊娠-子供"}',6),
(gen_random_uuid()::VARCHAR,'ICSR_REPORT_CLASSIFICATION','5004','Global SUSAR',
    '{"en":"Global SUSAR","fr":"SUSAR Global","ja":"グローバルSUSAR"}',7),
(gen_random_uuid()::VARCHAR,'ICSR_REPORT_CLASSIFICATION','5005','Ex-US SUSAR',
    '{"en":"Ex-US SUSAR","fr":"SUSAR hors US","ja":"米国外SUSAR"}',8),
(gen_random_uuid()::VARCHAR,'ICSR_REPORT_CLASSIFICATION','5006','US Only SUSAR',
    '{"en":"US Only SUSAR","fr":"SUSAR US uniquement","ja":"米国のみSUSAR"}',9),
(gen_random_uuid()::VARCHAR,'ICSR_REPORT_CLASSIFICATION','5013','Literature',
    '{"en":"Literature","fr":"Littérature","ja":"文献"}',10),
(gen_random_uuid()::VARCHAR,'ICSR_REPORT_CLASSIFICATION','5017','IND Expedited',
    '{"en":"IND Expedited","fr":"IND accéléré","ja":"IND迅速報告"}',11)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── ICSR_SAFETY_REPORT_TYPE ───────────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_SAFETY_REPORT_TYPE','1','IND Safety Report',
    '{"en":"IND Safety Report","fr":"Rapport de sécurité IND","ja":"IND安全性報告"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_SAFETY_REPORT_TYPE','2','IND Exempt BA/BE Safety Report',
    '{"en":"IND Exempt BA/BE Safety Report","fr":"Rapport BA/BE exempté IND","ja":"IND免除BA/BE安全性報告"}',2)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── ICSR_SAFETY_CLASSIFICATION ────────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_SAFETY_CLASSIFICATION','1','Safety',
    '{"en":"Safety","fr":"Sécurité","ja":"安全性"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_SAFETY_CLASSIFICATION','2','Efficacy',
    '{"en":"Efficacy","fr":"Efficacité","ja":"有効性"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_SAFETY_CLASSIFICATION','3','Safety/Efficacy',
    '{"en":"Safety/Efficacy","fr":"Sécurité/Efficacité","ja":"安全性/有効性"}',3)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── ICSR_CASE_TYPE ────────────────────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_CASE_TYPE','1','Pre-Market',
    '{"en":"Pre-Market","fr":"Pré-commercialisation","ja":"市販前"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_CASE_TYPE','2','Post-Market',
    '{"en":"Post-Market","fr":"Post-commercialisation","ja":"市販後"}',2)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── ICSR_INITIAL_FOLLOWUP — R2:A.1 / R3:C.1 ─────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_INITIAL_FOLLOWUP','01','Initial',
    '{"en":"Initial","fr":"Initial","ja":"初回","r2":"01","r3":"initial"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_INITIAL_FOLLOWUP','02','Follow-Up',
    '{"en":"Follow-Up","fr":"Suivi","ja":"追跡","r2":"02","r3":"follow-up"}',2)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── ICSR_FLAG ─────────────────────────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_FLAG','01','Relevant',
    '{"en":"Relevant","fr":"Pertinent","ja":"関連あり"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_FLAG','02','Non-Relevant',
    '{"en":"Non-Relevant","fr":"Non pertinent","ja":"関連なし"}',2)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── ICSR_CASE_SIGNIFICANCE ────────────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_CASE_SIGNIFICANCE','2','Non-Significant (Not reportable)',
    '{"en":"Non-Significant (Not reportable)","fr":"Non significatif (non déclarable)","ja":"非重要（報告不要）"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_CASE_SIGNIFICANCE','3','Significant (Not reportable to HA)',
    '{"en":"Significant (Not reportable to HA)","fr":"Significatif (non déclarable à l''autorité)","ja":"重要（当局報告不要）"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_CASE_SIGNIFICANCE','4','Significant (Reportable)',
    '{"en":"Significant (Reportable)","fr":"Significatif (déclarable)","ja":"重要（報告必要）"}',3)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── ICSR_RECEIVE_MEDIUM ───────────────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_RECEIVE_MEDIUM','1','Fax',
    '{"en":"Fax","fr":"Fax","ja":"ファックス"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_RECEIVE_MEDIUM','2','Email',
    '{"en":"Email","fr":"E-mail","ja":"メール"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_RECEIVE_MEDIUM','3','Gateway',
    '{"en":"Gateway","fr":"Passerelle","ja":"ゲートウェイ"}',3),
(gen_random_uuid()::VARCHAR,'ICSR_RECEIVE_MEDIUM','8','Manual',
    '{"en":"Manual","fr":"Manuel","ja":"手動"}',4),
(gen_random_uuid()::VARCHAR,'ICSR_RECEIVE_MEDIUM','15','Portal',
    '{"en":"Portal","fr":"Portail","ja":"ポータル"}',5),
(gen_random_uuid()::VARCHAR,'ICSR_RECEIVE_MEDIUM','18','Letter',
    '{"en":"Letter","fr":"Courrier","ja":"郵便"}',6),
(gen_random_uuid()::VARCHAR,'ICSR_RECEIVE_MEDIUM','21','Literature',
    '{"en":"Literature","fr":"Littérature","ja":"文献"}',7),
(gen_random_uuid()::VARCHAR,'ICSR_RECEIVE_MEDIUM','12','Other',
    '{"en":"Other","fr":"Autre","ja":"その他"}',8)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── ICSR_RECEIVE_FORMAT ───────────────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_RECEIVE_FORMAT','16','E2B R2 XML',
    '{"en":"E2B R2 XML","fr":"E2B R2 XML","ja":"E2B R2 XML","r2":"16","r3":null}',1),
(gen_random_uuid()::VARCHAR,'ICSR_RECEIVE_FORMAT','17','E2B R3 XML',
    '{"en":"E2B R3 XML","fr":"E2B R3 XML","ja":"E2B R3 XML","r2":null,"r3":"17"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_RECEIVE_FORMAT','22','CIOMS',
    '{"en":"CIOMS","fr":"CIOMS","ja":"CIOMS"}',3),
(gen_random_uuid()::VARCHAR,'ICSR_RECEIVE_FORMAT','23','Company SAE Form',
    '{"en":"Company SAE Form","fr":"Formulaire EIG société","ja":"企業SAEフォーム"}',4),
(gen_random_uuid()::VARCHAR,'ICSR_RECEIVE_FORMAT','05','MedWatch 3500',
    '{"en":"MedWatch 3500","fr":"MedWatch 3500","ja":"MedWatch 3500"}',5),
(gen_random_uuid()::VARCHAR,'ICSR_RECEIVE_FORMAT','06','MedWatch 3500A',
    '{"en":"MedWatch 3500A","fr":"MedWatch 3500A","ja":"MedWatch 3500A"}',6),
(gen_random_uuid()::VARCHAR,'ICSR_RECEIVE_FORMAT','25','Excel Bulk Import',
    '{"en":"Excel Bulk Import","fr":"Import Excel en masse","ja":"Excelバルクインポート"}',7),
(gen_random_uuid()::VARCHAR,'ICSR_RECEIVE_FORMAT','12','Other',
    '{"en":"Other","fr":"Autre","ja":"その他"}',8)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── ICSR_LINKED_REASON ────────────────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_LINKED_REASON','1','Parent - Offspring',
    '{"en":"Parent - Offspring","fr":"Parent - Descendant","ja":"親子関係"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_LINKED_REASON','2','Same patient',
    '{"en":"Same patient","fr":"Même patient","ja":"同一患者"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_LINKED_REASON','4','Other',
    '{"en":"Other","fr":"Autre","ja":"その他"}',3),
(gen_random_uuid()::VARCHAR,'ICSR_LINKED_REASON','6','Aggregate/Summary',
    '{"en":"Aggregate/Summary","fr":"Agrégé/Résumé","ja":"集積/要約"}',4),
(gen_random_uuid()::VARCHAR,'ICSR_LINKED_REASON','5001','Parent - Parent',
    '{"en":"Parent - Parent","fr":"Parent - Parent","ja":"親-親関係"}',5),
(gen_random_uuid()::VARCHAR,'ICSR_LINKED_REASON','5002','Same Literature Article',
    '{"en":"Same Literature Article","fr":"Même article de littérature","ja":"同一文献"}',6),
(gen_random_uuid()::VARCHAR,'ICSR_LINKED_REASON','5003','Same Reporter',
    '{"en":"Same Reporter","fr":"Même déclarant","ja":"同一報告者"}',7)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── ICSR_NON_CASE_REASON ──────────────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_NON_CASE_REASON','5001','No identifiable patient',
    '{"en":"No identifiable patient","fr":"Pas de patient identifiable","ja":"患者特定不可"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_NON_CASE_REASON','5002','No suspect product',
    '{"en":"No suspect product","fr":"Pas de produit suspect","ja":"被疑薬なし"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_NON_CASE_REASON','5003','No reporter',
    '{"en":"No reporter","fr":"Pas de déclarant","ja":"報告者なし"}',3),
(gen_random_uuid()::VARCHAR,'ICSR_NON_CASE_REASON','5004','PQC with no AE',
    '{"en":"PQC with no AE","fr":"PQC sans EI","ja":"AEなしのPQC"}',4),
(gen_random_uuid()::VARCHAR,'ICSR_NON_CASE_REASON','01','Not a Company product',
    '{"en":"Not a Company product","fr":"Pas un produit de la société","ja":"自社製品でない"}',5),
(gen_random_uuid()::VARCHAR,'ICSR_NON_CASE_REASON','02','No Adverse event reported',
    '{"en":"No Adverse event reported","fr":"Pas d''EI rapporté","ja":"有害事象報告なし"}',6),
(gen_random_uuid()::VARCHAR,'ICSR_NON_CASE_REASON','03','Other',
    '{"en":"Other","fr":"Autre","ja":"その他"}',7)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── ICSR_CLASSIFICATION_TYPE ──────────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_CLASSIFICATION_TYPE','1','New',
    '{"en":"New","fr":"Nouveau","ja":"新規"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_CLASSIFICATION_TYPE','2','Follow-up',
    '{"en":"Follow-up","fr":"Suivi","ja":"追跡"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_CLASSIFICATION_TYPE','4','Duplicate',
    '{"en":"Duplicate","fr":"Doublon","ja":"重複"}',3),
(gen_random_uuid()::VARCHAR,'ICSR_CLASSIFICATION_TYPE','6','Error',
    '{"en":"Error","fr":"Erreur","ja":"エラー"}',4)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── ICSR_LATENESS_REASON ──────────────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_LATENESS_REASON','01','Inbound Delay',
    '{"en":"Inbound Delay","fr":"Retard entrant","ja":"受信遅延"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_LATENESS_REASON','02','Case Processing Delay',
    '{"en":"Case Processing Delay","fr":"Retard de traitement","ja":"処理遅延"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_LATENESS_REASON','03','Outbound Delay',
    '{"en":"Outbound Delay","fr":"Retard sortant","ja":"送信遅延"}',3),
(gen_random_uuid()::VARCHAR,'ICSR_LATENESS_REASON','04','Other Delay',
    '{"en":"Other Delay","fr":"Autre retard","ja":"その他の遅延"}',4),
(gen_random_uuid()::VARCHAR,'ICSR_LATENESS_REASON','05','On time',
    '{"en":"On time","fr":"Dans les délais","ja":"期限内"}',5)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── ICSR_INBOUND_LATENESS ─────────────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_INBOUND_LATENESS','1','Late at license partner',
    '{"en":"Late at license partner","fr":"Retard chez le partenaire","ja":"ライセンスパートナーでの遅延"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_INBOUND_LATENESS','2','Late due to technical issue',
    '{"en":"Late due to technical issue","fr":"Retard technique","ja":"技術的問題による遅延"}',2)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── ICSR_CORRECTIVE_ACTION ────────────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_CORRECTIVE_ACTION','1','Recall (Repair)',
    '{"en":"Recall (Repair)","fr":"Rappel (Réparation)","ja":"回収（修理）"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_CORRECTIVE_ACTION','2','Notification',
    '{"en":"Notification","fr":"Notification","ja":"通知"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_CORRECTIVE_ACTION','3','Others',
    '{"en":"Others","fr":"Autres","ja":"その他"}',3)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── ICSR_DEVICE_LABELING ──────────────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_DEVICE_LABELING','1','Labeled',
    '{"en":"Labeled","fr":"Étiqueté","ja":"ラベルあり"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_DEVICE_LABELING','2','Unlabeled',
    '{"en":"Unlabeled","fr":"Non étiqueté","ja":"ラベルなし"}',2)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── ICSR_DEVICE_OUTCOME ───────────────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_DEVICE_OUTCOME','1','Fatal',
    '{"en":"Fatal","fr":"Fatal","ja":"死亡"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_DEVICE_OUTCOME','2','Not recovered',
    '{"en":"Not recovered","fr":"Non rétabli","ja":"未回復"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_DEVICE_OUTCOME','3','Recovered',
    '{"en":"Recovered","fr":"Rétabli","ja":"回復"}',3),
(gen_random_uuid()::VARCHAR,'ICSR_DEVICE_OUTCOME','4','Recovering',
    '{"en":"Recovering","fr":"En cours de rétablissement","ja":"回復中"}',4),
(gen_random_uuid()::VARCHAR,'ICSR_DEVICE_OUTCOME','5','Unknown',
    '{"en":"Unknown","fr":"Inconnu","ja":"不明"}',5)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── ICSR_REMOVE_REASON — no values in cl-data, using standard ─
INSERT INTO CODE_LIST_LIB (ID, CODE_LIST_ID, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR, 'ICSR_REMOVE_REASON', 'ICSR Remove Reason Code')
ON CONFLICT (CODE_LIST_ID) DO NOTHING;

INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_REMOVE_REASON','1','Duplicate',
    '{"en":"Duplicate","fr":"Doublon","ja":"重複"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_REMOVE_REASON','2','Non-case',
    '{"en":"Non-case","fr":"Non-cas","ja":"非ケース"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_REMOVE_REASON','3','Data entry error',
    '{"en":"Data entry error","fr":"Erreur de saisie","ja":"入力エラー"}',3),
(gen_random_uuid()::VARCHAR,'ICSR_REMOVE_REASON','4','Other',
    '{"en":"Other","fr":"Autre","ja":"その他"}',4)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;


-- ── 03_CODELIST_510.sql ──
-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 03_CODELIST_510.sql
-- Module  : ICSR — Table 510 codelists
-- Purpose : Codelist for case document fields
-- ============================================================



INSERT INTO CODE_LIST_LIB (ID, CODE_LIST_ID, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR, 'ICSR_DOC_INCLUDED', 'ICSR Document Included (C.1.11.2)')
ON CONFLICT (CODE_LIST_ID) DO NOTHING;

-- ── ICSR_DOC_INCLUDED — R3:C.1.11.2 ─────────────────────────
-- R3 values: true=included, false=not included
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_DOC_INCLUDED','true','Yes — Document Included',
    '{"en":"Yes — Document Included","fr":"Oui — Document inclus","ja":"はい — 文書含む","r3":"true"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_DOC_INCLUDED','false','No — Not Included',
    '{"en":"No — Not Included","fr":"Non — Non inclus","ja":"いいえ — 含まない","r3":"false"}',2)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;


-- ── 03_CODELIST_515.sql ──
-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 03_CODELIST_515.sql
-- Module  : ICSR — Table 515 codelists
-- Purpose : Codelists for reporter information fields
--           R2/R3 codes included in TRANSLATIONS where applicable
-- ============================================================



INSERT INTO CODE_LIST_LIB (ID, CODE_LIST_ID, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR, 'ICSR_REPORTER_INFORMED_AUTH','ICSR Reporter Informed Authority (A.2.1.3)'),
(gen_random_uuid()::VARCHAR, 'ICSR_PERSON_TYPE',           'ICSR Person Type (Reporter/Investigator/Author)'),
(gen_random_uuid()::VARCHAR, 'ICSR_REPORTER_OCCUPATION',   'ICSR Reporter Occupation'),
(gen_random_uuid()::VARCHAR, 'ICSR_HCP_CLASSIFICATION',    'ICSR HCP Detailed Classification'),
(gen_random_uuid()::VARCHAR, 'ICSR_OTHER_HCP',             'ICSR Other HCP Type')
-- ICSR_REPORTER_TITLE        → reuse existing CONTACT_TITLE (05_seed_codelist.sql)
-- ICSR_REPORTER_QUALIFICATION → reuse existing CONTACT_QUALIFICATION (05_seed_codelist.sql)
-- ICSR_REPORTER_SPECIALITY   → reuse existing CONTACT_SPECIALIZATION (05_seed_codelist.sql)
ON CONFLICT (CODE_LIST_ID) DO NOTHING;

-- ── ICSR_REPORTER_TITLE — R2:A.2.1.4 / R3:C.2.r.2.1 ─────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'CONTACT_TITLE','01','Mr.',
    '{"en":"Mr.","fr":"M.","ja":"氏","r2":"01","r3":"Mr."}',1),
(gen_random_uuid()::VARCHAR,'CONTACT_TITLE','02','Mrs.',
    '{"en":"Mrs.","fr":"Mme.","ja":"様","r2":"02","r3":"Mrs."}',2),
(gen_random_uuid()::VARCHAR,'CONTACT_TITLE','03','Miss.',
    '{"en":"Miss.","fr":"Mlle.","ja":"様","r2":"03","r3":"Miss."}',3),
(gen_random_uuid()::VARCHAR,'CONTACT_TITLE','04','Dr.',
    '{"en":"Dr.","fr":"Dr.","ja":"博士","r2":"04","r3":"Dr."}',4),
(gen_random_uuid()::VARCHAR,'CONTACT_TITLE','05','Ms.',
    '{"en":"Ms.","fr":"Mme.","ja":"様","r2":"05","r3":"Ms."}',5),
(gen_random_uuid()::VARCHAR,'CONTACT_TITLE','06','Prof.',
    '{"en":"Prof.","fr":"Prof.","ja":"教授","r2":"06","r3":"Prof."}',6)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── ICSR_REPORTER_QUALIFICATION — R2:A.2.1.2 / R3:C.2.r.4 ───
-- R2 codes: 1=Physician, 2=Pharmacist, 3=Other HCP, 4=Lawyer, 5=Consumer
-- R3 codes: physician, pharmacist, other-health-professional, lawyer, consumer-or-other-non-health-professional
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'CONTACT_QUALIFICATION','1','Physician',
    '{"en":"Physician","fr":"Médecin","ja":"医師","r2":"1","r3":"physician"}',1),
(gen_random_uuid()::VARCHAR,'CONTACT_QUALIFICATION','2','Pharmacist',
    '{"en":"Pharmacist","fr":"Pharmacien","ja":"薬剤師","r2":"2","r3":"pharmacist"}',2),
(gen_random_uuid()::VARCHAR,'CONTACT_QUALIFICATION','3','Other health professional',
    '{"en":"Other health professional","fr":"Autre professionnel de santé","ja":"その他医療専門家","r2":"3","r3":"other-health-professional"}',3),
(gen_random_uuid()::VARCHAR,'CONTACT_QUALIFICATION','4','Lawyer',
    '{"en":"Lawyer","fr":"Avocat","ja":"弁護士","r2":"4","r3":"lawyer"}',4),
(gen_random_uuid()::VARCHAR,'CONTACT_QUALIFICATION','5','Consumer or other non health professional',
    '{"en":"Consumer or other non health professional","fr":"Consommateur ou non-professionnel","ja":"消費者またはその他非医療専門家","r2":"5","r3":"consumer-or-other-non-health-professional"}',5),
(gen_random_uuid()::VARCHAR,'CONTACT_QUALIFICATION','6','Nurse Practitioner',
    '{"en":"Nurse Practitioner","fr":"Infirmier praticien","ja":"ナースプラクティショナー","r2":"6","r3":"nurse-practitioner"}',6),
(gen_random_uuid()::VARCHAR,'CONTACT_QUALIFICATION','7','Nurse',
    '{"en":"Nurse","fr":"Infirmier(ère)","ja":"看護師","r2":"7","r3":"nurse"}',7),
(gen_random_uuid()::VARCHAR,'CONTACT_QUALIFICATION','14','Patient',
    '{"en":"Patient","fr":"Patient","ja":"患者","r2":"14","r3":"patient"}',8),
(gen_random_uuid()::VARCHAR,'CONTACT_QUALIFICATION','15','Parent',
    '{"en":"Parent","fr":"Parent","ja":"保護者","r2":"15","r3":"parent"}',9)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── ICSR_REPORTER_INFORMED_AUTH — R2:A.2.1.3 ─────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_REPORTER_INFORMED_AUTH','1','Yes',
    '{"en":"Yes","fr":"Oui","ja":"はい","r2":"1"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_REPORTER_INFORMED_AUTH','2','No',
    '{"en":"No","fr":"Non","ja":"いいえ","r2":"2"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_REPORTER_INFORMED_AUTH','3','Unknown',
    '{"en":"Unknown","fr":"Inconnu","ja":"不明","r2":"3"}',3)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── ICSR_PERSON_TYPE ──────────────────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_PERSON_TYPE','01','Investigator',
    '{"en":"Investigator","fr":"Investigateur","ja":"治験責任医師","r2":"01","r3":"investigator"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_PERSON_TYPE','03','Author',
    '{"en":"Author","fr":"Auteur","ja":"著者","r2":"03","r3":"author"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_PERSON_TYPE','04','Patient',
    '{"en":"Patient","fr":"Patient","ja":"患者","r2":"04","r3":"patient"}',3)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── ICSR_REPORTER_OCCUPATION ──────────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_REPORTER_OCCUPATION','1','Patient',
    '{"en":"Patient","fr":"Patient","ja":"患者"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_REPORTER_OCCUPATION','2','Investigator',
    '{"en":"Investigator","fr":"Investigateur","ja":"治験責任医師"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_REPORTER_OCCUPATION','3','Medical Representative',
    '{"en":"Medical Representative","fr":"Représentant médical","ja":"MR"}',3),
(gen_random_uuid()::VARCHAR,'ICSR_REPORTER_OCCUPATION','4','Family Doctor',
    '{"en":"Family Doctor","fr":"Médecin de famille","ja":"かかりつけ医"}',4),
(gen_random_uuid()::VARCHAR,'ICSR_REPORTER_OCCUPATION','5','Literature Author',
    '{"en":"Literature Author","fr":"Auteur de littérature","ja":"文献著者"}',5),
(gen_random_uuid()::VARCHAR,'ICSR_REPORTER_OCCUPATION','6','Consumer / Other Non-health professional',
    '{"en":"Consumer / Other Non-health professional","fr":"Consommateur / Autre non-professionnel","ja":"消費者/その他非医療専門家"}',6),
(gen_random_uuid()::VARCHAR,'ICSR_REPORTER_OCCUPATION','11','Pharmacist',
    '{"en":"Pharmacist","fr":"Pharmacien","ja":"薬剤師"}',7),
(gen_random_uuid()::VARCHAR,'ICSR_REPORTER_OCCUPATION','12','Physician',
    '{"en":"Physician","fr":"Médecin","ja":"医師"}',8),
(gen_random_uuid()::VARCHAR,'ICSR_REPORTER_OCCUPATION','9','Nurse',
    '{"en":"Nurse","fr":"Infirmier(ère)","ja":"看護師"}',9),
(gen_random_uuid()::VARCHAR,'ICSR_REPORTER_OCCUPATION','15','Unknown',
    '{"en":"Unknown","fr":"Inconnu","ja":"不明"}',10)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── ICSR_REPORTER_SPECIALITY — R2:A.2.1.2b ───────────────────
-- Subset of key specialities (full list has 95 values — using most common)
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'CONTACT_SPECIALIZATION','39','Internal Medicine',
    '{"en":"Internal Medicine","fr":"Médecine interne","ja":"内科"}',1),
(gen_random_uuid()::VARCHAR,'CONTACT_SPECIALIZATION','10','Cardiovascular Diseases',
    '{"en":"Cardiovascular Diseases","fr":"Maladies cardiovasculaires","ja":"循環器疾患"}',2),
(gen_random_uuid()::VARCHAR,'CONTACT_SPECIALIZATION','103','Oncology',
    '{"en":"Oncology","fr":"Oncologie","ja":"腫瘍科"}',3),
(gen_random_uuid()::VARCHAR,'CONTACT_SPECIALIZATION','116','Neurology',
    '{"en":"Neurology","fr":"Neurologie","ja":"神経科"}',4),
(gen_random_uuid()::VARCHAR,'CONTACT_SPECIALIZATION','62','Pediatrics',
    '{"en":"Pediatrics","fr":"Pédiatrie","ja":"小児科"}',5),
(gen_random_uuid()::VARCHAR,'CONTACT_SPECIALIZATION','60','Psychiatry',
    '{"en":"Psychiatry","fr":"Psychiatrie","ja":"精神科"}',6),
(gen_random_uuid()::VARCHAR,'CONTACT_SPECIALIZATION','23','Endocrinology',
    '{"en":"Endocrinology","fr":"Endocrinologie","ja":"内分泌科"}',7),
(gen_random_uuid()::VARCHAR,'CONTACT_SPECIALIZATION','27','Gastroenterology',
    '{"en":"Gastroenterology","fr":"Gastroentérologie","ja":"消化器科"}',8),
(gen_random_uuid()::VARCHAR,'CONTACT_SPECIALIZATION','34','Hematology',
    '{"en":"Hematology","fr":"Hématologie","ja":"血液科"}',9),
(gen_random_uuid()::VARCHAR,'CONTACT_SPECIALIZATION','46','Nephrology',
    '{"en":"Nephrology","fr":"Néphrologie","ja":"腎臓科"}',10),
(gen_random_uuid()::VARCHAR,'CONTACT_SPECIALIZATION','79','Rheumatology',
    '{"en":"Rheumatology","fr":"Rhumatologie","ja":"リウマチ科"}',11),
(gen_random_uuid()::VARCHAR,'CONTACT_SPECIALIZATION','17','Dermatology',
    '{"en":"Dermatology","fr":"Dermatologie","ja":"皮膚科"}',12),
(gen_random_uuid()::VARCHAR,'CONTACT_SPECIALIZATION','61','Clinical Pharmacology',
    '{"en":"Clinical Pharmacology","fr":"Pharmacologie clinique","ja":"臨床薬理学"}',13),
(gen_random_uuid()::VARCHAR,'CONTACT_SPECIALIZATION','30','General Practice',
    '{"en":"General Practice","fr":"Médecine générale","ja":"一般診療"}',14),
(gen_random_uuid()::VARCHAR,'CONTACT_SPECIALIZATION','58','Other',
    '{"en":"Other","fr":"Autre","ja":"その他"}',15)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── ICSR_HCP_CLASSIFICATION ───────────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_HCP_CLASSIFICATION','1','Clinic',
    '{"en":"Clinic","fr":"Clinique","ja":"クリニック"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_HCP_CLASSIFICATION','2','Pharmacy',
    '{"en":"Pharmacy","fr":"Pharmacie","ja":"薬局"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_HCP_CLASSIFICATION','3','Public Health Center',
    '{"en":"Public Health Center","fr":"Centre de santé publique","ja":"保健センター"}',3),
(gen_random_uuid()::VARCHAR,'ICSR_HCP_CLASSIFICATION','4','Other',
    '{"en":"Other","fr":"Autre","ja":"その他"}',4)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── ICSR_OTHER_HCP ────────────────────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_OTHER_HCP','1','Nurse',
    '{"en":"Nurse","fr":"Infirmier(ère)","ja":"看護師"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_OTHER_HCP','2','Other',
    '{"en":"Other","fr":"Autre","ja":"その他"}',2)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;



-- ── 03_CODELIST_520.sql ──
-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 03_CODELIST_520.sql
-- Module  : ICSR — Table 520 codelists
-- Purpose : Codelists for source information fields
-- ============================================================



INSERT INTO CODE_LIST_LIB (ID, CODE_LIST_ID, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR, 'ICSR_SOURCE_TYPE',      'ICSR Source Type'),
(gen_random_uuid()::VARCHAR, 'ICSR_SOURCE_REF_TYPE',  'ICSR Source Reference Type'),
(gen_random_uuid()::VARCHAR, 'ICSR_SENDER_ORG_TYPE',  'ICSR Sender Organisation Type (R3:C.1.6.1)')
ON CONFLICT (CODE_LIST_ID) DO NOTHING;

-- ── ICSR_SOURCE_TYPE ──────────────────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_SOURCE_TYPE','1','Spontaneous',
    '{"en":"Spontaneous","fr":"Spontané","ja":"自発報告","r2":"1","r3":"spontaneous"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_SOURCE_TYPE','03','Literature',
    '{"en":"Literature","fr":"Littérature","ja":"文献","r2":"03","r3":"literature"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_SOURCE_TYPE','25','Report from study',
    '{"en":"Report from study","fr":"Rapport d''étude","ja":"試験報告","r2":"25","r3":"report-from-study"}',3),
(gen_random_uuid()::VARCHAR,'ICSR_SOURCE_TYPE','06','Health authority',
    '{"en":"Health authority","fr":"Autorité de santé","ja":"保健当局","r2":"06","r3":"health-authority"}',4),
(gen_random_uuid()::VARCHAR,'ICSR_SOURCE_TYPE','14','Company representative',
    '{"en":"Company representative","fr":"Représentant de la société","ja":"会社代表者","r2":"14","r3":"company-representative"}',5),
(gen_random_uuid()::VARCHAR,'ICSR_SOURCE_TYPE','07','Patient/Consumer',
    '{"en":"Patient/Consumer","fr":"Patient/Consommateur","ja":"患者/消費者","r2":"07","r3":"patient-consumer"}',6),
(gen_random_uuid()::VARCHAR,'ICSR_SOURCE_TYPE','23','Affiliate',
    '{"en":"Affiliate","fr":"Affilié","ja":"関連会社","r2":"23","r3":"affiliate"}',7),
(gen_random_uuid()::VARCHAR,'ICSR_SOURCE_TYPE','24','Partner',
    '{"en":"Partner","fr":"Partenaire","ja":"パートナー","r2":"24","r3":"partner"}',8),
(gen_random_uuid()::VARCHAR,'ICSR_SOURCE_TYPE','21','Solicited',
    '{"en":"Solicited","fr":"Sollicité","ja":"依頼報告","r2":"21","r3":"solicited"}',9),
(gen_random_uuid()::VARCHAR,'ICSR_SOURCE_TYPE','102','Observational study',
    '{"en":"Observational study","fr":"Étude observationnelle","ja":"観察研究","r2":"102","r3":"observational-study"}',10),
(gen_random_uuid()::VARCHAR,'ICSR_SOURCE_TYPE','120','Patient Support Program',
    '{"en":"Patient Support Program","fr":"Programme de soutien patients","ja":"患者支援プログラム","r2":"120","r3":"patient-support-program"}',11),
(gen_random_uuid()::VARCHAR,'ICSR_SOURCE_TYPE','99','Other',
    '{"en":"Other","fr":"Autre","ja":"その他","r2":"99","r3":"other"}',12)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── ICSR_SOURCE_REF_TYPE ──────────────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_SOURCE_REF_TYPE','09','Regulatory Authority Reference Number',
    '{"en":"Regulatory Authority Reference Number","fr":"Numéro de référence autorité","ja":"規制当局参照番号"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_SOURCE_REF_TYPE','10','Other Manufacturer Number',
    '{"en":"Other Manufacturer Number","fr":"Autre numéro fabricant","ja":"その他製造業者番号"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_SOURCE_REF_TYPE','11','Sales Force Reference Number',
    '{"en":"Sales Force Reference Number","fr":"Numéro référence force de vente","ja":"営業参照番号"}',3),
(gen_random_uuid()::VARCHAR,'ICSR_SOURCE_REF_TYPE','14','Complaint Ref#',
    '{"en":"Complaint Ref#","fr":"Référence réclamation","ja":"苦情参照番号"}',4),
(gen_random_uuid()::VARCHAR,'ICSR_SOURCE_REF_TYPE','17','Regulatory Ref#',
    '{"en":"Regulatory Ref#","fr":"Référence réglementaire","ja":"規制参照番号"}',5),
(gen_random_uuid()::VARCHAR,'ICSR_SOURCE_REF_TYPE','19','Local Tracking Number',
    '{"en":"Local Tracking Number","fr":"Numéro de suivi local","ja":"ローカル追跡番号"}',6),
(gen_random_uuid()::VARCHAR,'ICSR_SOURCE_REF_TYPE','20','Global Safety Database',
    '{"en":"Global Safety Database","fr":"Base de données sécurité globale","ja":"グローバル安全性データベース"}',7),
(gen_random_uuid()::VARCHAR,'ICSR_SOURCE_REF_TYPE','5001','PQC Number',
    '{"en":"PQC Number","fr":"Numéro PQC","ja":"PQC番号"}',8),
(gen_random_uuid()::VARCHAR,'ICSR_SOURCE_REF_TYPE','29','Other Reference Number',
    '{"en":"Other Reference Number","fr":"Autre numéro de référence","ja":"その他参照番号"}',9)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── ICSR_SENDER_ORG_TYPE — R3:C.1.6.1 ────────────────────────
-- R3 sender organisation types per ICH E2B(R3)
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_SENDER_ORG_TYPE','1','Pharmaceutical Company',
    '{"en":"Pharmaceutical Company","fr":"Société pharmaceutique","ja":"製薬会社","r3":"pharmaceutical-company"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_SENDER_ORG_TYPE','2','Regulatory Authority',
    '{"en":"Regulatory Authority","fr":"Autorité réglementaire","ja":"規制当局","r3":"regulatory-authority"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_SENDER_ORG_TYPE','3','Health Professional',
    '{"en":"Health Professional","fr":"Professionnel de santé","ja":"医療専門家","r3":"health-professional"}',3),
(gen_random_uuid()::VARCHAR,'ICSR_SENDER_ORG_TYPE','4','Regional Pharmacovigilance Centre',
    '{"en":"Regional Pharmacovigilance Centre","fr":"Centre régional de pharmacovigilance","ja":"地域ファーマコビジランスセンター","r3":"regional-pharmacovigilance-centre"}',4),
(gen_random_uuid()::VARCHAR,'ICSR_SENDER_ORG_TYPE','5','WHO Collaborating Centre',
    '{"en":"WHO Collaborating Centre","fr":"Centre collaborateur OMS","ja":"WHO協力センター","r3":"who-collaborating-centre"}',5),
(gen_random_uuid()::VARCHAR,'ICSR_SENDER_ORG_TYPE','6','Other',
    '{"en":"Other","fr":"Autre","ja":"その他","r3":"other"}',6)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;


-- ── 03_CODELIST_530.sql ──
-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 03_CODELIST_530.sql
-- Module  : ICSR — Table 530 codelists
-- Purpose : Codelists for patient characteristics fields
--           R2/R3 codes in TRANSLATIONS where applicable
-- ============================================================



INSERT INTO CODE_LIST_LIB (ID, CODE_LIST_ID, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR, 'ICSR_PAT_GENDER',    'ICSR Patient Gender Identity (R3:D.5.1)'),
(gen_random_uuid()::VARCHAR, 'ICSR_AGE_GROUP',     'ICSR Patient Age Group (R2:B.1.5 / R3:D.2.3)'),
(gen_random_uuid()::VARCHAR, 'ICSR_AGE_UNIT',      'ICSR Age Unit (R2:B.1.4 / R3:D.2.2b)'),
(gen_random_uuid()::VARCHAR, 'ICSR_WEIGHT_UNIT',   'ICSR Weight Unit (R2:B.1.6 / R3:D.3)'),
(gen_random_uuid()::VARCHAR, 'ICSR_HEIGHT_UNIT',   'ICSR Height Unit (R2:B.1.7 / R3:D.4)'),
(gen_random_uuid()::VARCHAR, 'ICSR_GESTATION_UNIT','ICSR Gestational Age Unit (R2:B.1.10 / R3:D.10)'),
(gen_random_uuid()::VARCHAR, 'ICSR_PAT_RACE',      'ICSR Patient Race (R3:D.7)'),
(gen_random_uuid()::VARCHAR, 'ICSR_PAT_ETHNICITY', 'ICSR Patient Ethnicity (R3:D.8)'),
(gen_random_uuid()::VARCHAR, 'ICSR_CONSENT',       'ICSR Consent to Contact'),
(gen_random_uuid()::VARCHAR, 'ICSR_YES_NO_UNK',    'ICSR Yes No Unknown codelist'),
-- ICSR_PAT_SEX    → reuse existing SEX codelist (03_seed_framework_data.sql)
-- ICSR_YES_NO_UNK → reuse existing YES_NO codelist (03_seed_framework_data.sql)
-- ICSR_HEALTH_DAMAGE → reuse existing YES_NO codelist
-- ICSR_MILITARY_STATUS kept as ICSR-specific
(gen_random_uuid()::VARCHAR, 'ICSR_MILITARY_STATUS','ICSR Patient Military Status')
ON CONFLICT (CODE_LIST_ID) DO NOTHING;

-- ── ICSR_PAT_SEX — now references existing SEX codelist ─────
-- SEX codelist already defined in 03_seed_framework_data.sql
-- ICSR_PAT_SEX removed — use SEX instead

-- ── ICSR_PAT_GENDER — R3:D.5.1 ───────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_PAT_GENDER','1','Cisgender man/boy',
    '{"en":"Cisgender man/boy","fr":"Homme cisgenre","ja":"シスジェンダー男性","r3":"cisgender-man-boy"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_PAT_GENDER','2','Cisgender woman/girl',
    '{"en":"Cisgender woman/girl","fr":"Femme cisgenre","ja":"シスジェンダー女性","r3":"cisgender-woman-girl"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_PAT_GENDER','3','Transgender man',
    '{"en":"Transgender man","fr":"Homme transgenre","ja":"トランスジェンダー男性","r3":"transgender-man"}',3),
(gen_random_uuid()::VARCHAR,'ICSR_PAT_GENDER','4','Transgender woman',
    '{"en":"Transgender woman","fr":"Femme transgenre","ja":"トランスジェンダー女性","r3":"transgender-woman"}',4),
(gen_random_uuid()::VARCHAR,'ICSR_PAT_GENDER','5','Other Gender category',
    '{"en":"Other Gender category","fr":"Autre catégorie de genre","ja":"その他の性別","r3":"other-gender-category"}',5),
(gen_random_uuid()::VARCHAR,'ICSR_PAT_GENDER','6','Decline to answer',
    '{"en":"Decline to answer","fr":"Refus de répondre","ja":"回答拒否","r3":"decline-to-answer"}',6)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── ICSR_AGE_GROUP — R2:B.1.5 / R3:D.2.3 ────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_AGE_GROUP','0','Foetus',
    '{"en":"Foetus","fr":"Fœtus","ja":"胎児","r2":"0","r3":"foetus"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_AGE_GROUP','1','Neonate',
    '{"en":"Neonate","fr":"Nouveau-né","ja":"新生児","r2":"1","r3":"neonate"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_AGE_GROUP','2','Infant',
    '{"en":"Infant","fr":"Nourrisson","ja":"乳児","r2":"2","r3":"infant"}',3),
(gen_random_uuid()::VARCHAR,'ICSR_AGE_GROUP','3','Child',
    '{"en":"Child","fr":"Enfant","ja":"小児","r2":"3","r3":"child"}',4),
(gen_random_uuid()::VARCHAR,'ICSR_AGE_GROUP','4','Adolescent',
    '{"en":"Adolescent","fr":"Adolescent","ja":"青少年","r2":"4","r3":"adolescent"}',5),
(gen_random_uuid()::VARCHAR,'ICSR_AGE_GROUP','5','Adult',
    '{"en":"Adult","fr":"Adulte","ja":"成人","r2":"5","r3":"adult"}',6),
(gen_random_uuid()::VARCHAR,'ICSR_AGE_GROUP','6','Elderly',
    '{"en":"Elderly","fr":"Personne âgée","ja":"高齢者","r2":"6","r3":"elderly"}',7)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── ICSR_AGE_UNIT — R2:B.1.4 / R3:D.2.2b ────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_AGE_UNIT','801','Year(s)',
    '{"en":"Year(s)","fr":"Année(s)","ja":"年","r2":"801","r3":"year"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_AGE_UNIT','802','Month(s)',
    '{"en":"Month(s)","fr":"Mois","ja":"月","r2":"802","r3":"month"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_AGE_UNIT','803','Week(s)',
    '{"en":"Week(s)","fr":"Semaine(s)","ja":"週","r2":"803","r3":"week"}',3),
(gen_random_uuid()::VARCHAR,'ICSR_AGE_UNIT','804','Day(s)',
    '{"en":"Day(s)","fr":"Jour(s)","ja":"日","r2":"804","r3":"day"}',4),
(gen_random_uuid()::VARCHAR,'ICSR_AGE_UNIT','805','Hour(s)',
    '{"en":"Hour(s)","fr":"Heure(s)","ja":"時間","r2":"805","r3":"hour"}',5),
(gen_random_uuid()::VARCHAR,'ICSR_AGE_UNIT','800','Decade(s)',
    '{"en":"Decade(s)","fr":"Décennie(s)","ja":"十年","r2":"800","r3":"decade"}',6)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── ICSR_WEIGHT_UNIT — R2:B.1.6 / R3:D.3 ────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_WEIGHT_UNIT','1','Kilograms',
    '{"en":"Kilograms","fr":"Kilogrammes","ja":"キログラム","r2":"1","r3":"kilogram"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_WEIGHT_UNIT','2','Pounds',
    '{"en":"Pounds","fr":"Livres","ja":"ポンド","r2":"2","r3":"pound"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_WEIGHT_UNIT','3','Ounce',
    '{"en":"Ounce","fr":"Once","ja":"オンス","r2":"3","r3":"ounce"}',3)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── ICSR_HEIGHT_UNIT — R2:B.1.7 / R3:D.4 ────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_HEIGHT_UNIT','1','Centimeters',
    '{"en":"Centimeters","fr":"Centimètres","ja":"センチメートル","r2":"1","r3":"centimeter"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_HEIGHT_UNIT','2','Inches',
    '{"en":"Inches","fr":"Pouces","ja":"インチ","r2":"2","r3":"inch"}',2)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── ICSR_GESTATION_UNIT — R2:B.1.10 / R3:D.10 ───────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_GESTATION_UNIT','802','Months',
    '{"en":"Months","fr":"Mois","ja":"月","r2":"802","r3":"month"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_GESTATION_UNIT','803','Weeks',
    '{"en":"Weeks","fr":"Semaines","ja":"週","r2":"803","r3":"week"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_GESTATION_UNIT','804','Days',
    '{"en":"Days","fr":"Jours","ja":"日","r2":"804","r3":"day"}',3),
(gen_random_uuid()::VARCHAR,'ICSR_GESTATION_UNIT','810','Trimester',
    '{"en":"Trimester","fr":"Trimestre","ja":"三半期","r2":"810","r3":"trimester"}',4)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── ICSR_PAT_RACE — R3:D.7 ───────────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_PAT_RACE','1','Asian',
    '{"en":"Asian","fr":"Asiatique","ja":"アジア系","r3":"asian"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_PAT_RACE','2','American Indian or Alaska Native',
    '{"en":"American Indian or Alaska Native","fr":"Amérindien ou natif d''Alaska","ja":"アメリカインディアンまたはアラスカ先住民","r3":"american-indian-alaska-native"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_PAT_RACE','3','Black or African American',
    '{"en":"Black or African American","fr":"Noir ou Afro-Américain","ja":"黒人またはアフリカ系アメリカ人","r3":"black-african-american"}',3),
(gen_random_uuid()::VARCHAR,'ICSR_PAT_RACE','4','White',
    '{"en":"White","fr":"Blanc","ja":"白人","r3":"white"}',4),
(gen_random_uuid()::VARCHAR,'ICSR_PAT_RACE','5','Native Hawaiian or Other Pacific Islander',
    '{"en":"Native Hawaiian or Other Pacific Islander","fr":"Hawaïen natif ou autre insulaire du Pacifique","ja":"ネイティブハワイアンまたは太平洋諸島系","r3":"native-hawaiian-pacific-islander"}',5)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── ICSR_PAT_ETHNICITY — R3:D.8 ──────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_PAT_ETHNICITY','1','Hispanic/Latino',
    '{"en":"Hispanic/Latino","fr":"Hispanique/Latino","ja":"ヒスパニック/ラテン系","r3":"hispanic-latino"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_PAT_ETHNICITY','2','Not Hispanic/Latino',
    '{"en":"Not Hispanic/Latino","fr":"Non hispanique/Latino","ja":"非ヒスパニック/ラテン系","r3":"not-hispanic-latino"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_PAT_ETHNICITY','3','Aboriginal',
    '{"en":"Aboriginal","fr":"Autochtone","ja":"先住民族","r3":"aboriginal"}',3)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── ICSR_CONSENT ──────────────────────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_CONSENT','1','Yes',
    '{"en":"Yes","fr":"Oui","ja":"はい"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_CONSENT','2','No',
    '{"en":"No","fr":"Non","ja":"いいえ"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_CONSENT','3','Not Applicable',
    '{"en":"Not Applicable","fr":"Non applicable","ja":"該当なし"}',3)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── ICSR_YES_NO_UNK ───────────────────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_YES_NO_UNK','1','Yes',
    '{"en":"Yes","fr":"Oui","ja":"はい","r2":"1","r3":"yes"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_YES_NO_UNK','2','No',
    '{"en":"No","fr":"Non","ja":"いいえ","r2":"2","r3":"no"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_YES_NO_UNK','3','Unknown',
    '{"en":"Unknown","fr":"Inconnu","ja":"不明","r2":"3","r3":"unknown"}',3)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── ICSR_MILITARY_STATUS ──────────────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_MILITARY_STATUS','1','Active Duty',
    '{"en":"Active Duty","fr":"Service actif","ja":"現役"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_MILITARY_STATUS','2','Reserve',
    '{"en":"Reserve","fr":"Réserve","ja":"予備役"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_MILITARY_STATUS','3','Veteran',
    '{"en":"Veteran","fr":"Vétéran","ja":"退役軍人"}',3),
(gen_random_uuid()::VARCHAR,'ICSR_MILITARY_STATUS','4','Civilian',
    '{"en":"Civilian","fr":"Civil","ja":"民間人"}',4)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;


-- ── 03_CODELIST_540.sql ──
-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 03_CODELIST_540.sql
-- Module  : ICSR — Table 540 codelists
-- Purpose : Codelists for patient medical history fields
-- ============================================================



INSERT INTO CODE_LIST_LIB (ID, CODE_LIST_ID, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR, 'ICSR_MED_HIST_TYPE', 'ICSR Medical History Disease Type'),
(gen_random_uuid()::VARCHAR, 'ICSR_DURATION_UNIT', 'ICSR Duration Unit'),
(gen_random_uuid()::VARCHAR, 'ICSR_CODING_TYPE',   'ICSR MedDRA Coding Type')
ON CONFLICT (CODE_LIST_ID) DO NOTHING;

-- ── ICSR_MED_HIST_TYPE ────────────────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_MED_HIST_TYPE','5001','Current Condition',
    '{"en":"Current Condition","fr":"Condition actuelle","ja":"現在の状態"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_MED_HIST_TYPE','5002','Historical Condition',
    '{"en":"Historical Condition","fr":"Condition historique","ja":"既往症"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_MED_HIST_TYPE','5003','Historical Procedure',
    '{"en":"Historical Procedure","fr":"Procédure historique","ja":"既往処置"}',3),
(gen_random_uuid()::VARCHAR,'ICSR_MED_HIST_TYPE','5004','Current Procedure',
    '{"en":"Current Procedure","fr":"Procédure actuelle","ja":"現在の処置"}',4)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── ICSR_DURATION_UNIT ────────────────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_DURATION_UNIT','801','Year',
    '{"en":"Year","fr":"Année","ja":"年","r2":"801","r3":"year"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_DURATION_UNIT','802','Month',
    '{"en":"Month","fr":"Mois","ja":"月","r2":"802","r3":"month"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_DURATION_UNIT','803','Week',
    '{"en":"Week","fr":"Semaine","ja":"週","r2":"803","r3":"week"}',3),
(gen_random_uuid()::VARCHAR,'ICSR_DURATION_UNIT','804','Day',
    '{"en":"Day","fr":"Jour","ja":"日","r2":"804","r3":"day"}',4),
(gen_random_uuid()::VARCHAR,'ICSR_DURATION_UNIT','805','Hour',
    '{"en":"Hour","fr":"Heure","ja":"時間","r2":"805","r3":"hour"}',5),
(gen_random_uuid()::VARCHAR,'ICSR_DURATION_UNIT','806','Minute',
    '{"en":"Minute","fr":"Minute","ja":"分","r2":"806","r3":"minute"}',6)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── ICSR_CODING_TYPE ──────────────────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_CODING_TYPE','A','Dictionary',
    '{"en":"Dictionary","fr":"Dictionnaire","ja":"辞書"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_CODING_TYPE','M','Manual Coding',
    '{"en":"Manual Coding","fr":"Codage manuel","ja":"手動コーディング"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_CODING_TYPE','V','VTA',
    '{"en":"VTA","fr":"VTA","ja":"VTA"}',3),
(gen_random_uuid()::VARCHAR,'ICSR_CODING_TYPE','I','Intelligent',
    '{"en":"Intelligent","fr":"Intelligent","ja":"インテリジェント"}',4),
(gen_random_uuid()::VARCHAR,'ICSR_CODING_TYPE','R','Rejected with Comments',
    '{"en":"Rejected with Comments","fr":"Rejeté avec commentaires","ja":"コメント付き却下"}',5)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;


-- ── 03_CODELIST_545.sql ──
-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 03_CODELIST_545.sql
-- Module  : ICSR — Tables 545/546 codelists
-- Purpose : Codelists for past drug therapy fields
--           ICSR_AGE_UNIT already created in 03_CODELIST_530.sql
--           ICSR_SUBSTANCE_STRENGTH_UNIT — key EDQM units from cl_9070
-- ============================================================



INSERT INTO CODE_LIST_LIB (ID, CODE_LIST_ID, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR, 'ICSR_SUBSTANCE_STRENGTH_UNIT', 'ICSR Substance Strength Unit (EDQM / R3:D.8.r.6.5)')
ON CONFLICT (CODE_LIST_ID) DO NOTHING;

-- ── ICSR_SUBSTANCE_STRENGTH_UNIT — R3:D.8.r.6.5 ─────────────
-- Key EDQM units from cl_9070 (most commonly used in PV)
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_SUBSTANCE_STRENGTH_UNIT','003','milligram(s)',
    '{"en":"milligram(s)","fr":"milligramme(s)","ja":"ミリグラム","r3":"003"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_SUBSTANCE_STRENGTH_UNIT','002','gram(s)',
    '{"en":"gram(s)","fr":"gramme(s)","ja":"グラム","r3":"002"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_SUBSTANCE_STRENGTH_UNIT','004','microgram(s)',
    '{"en":"microgram(s)","fr":"microgramme(s)","ja":"マイクログラム","r3":"004"}',3),
(gen_random_uuid()::VARCHAR,'ICSR_SUBSTANCE_STRENGTH_UNIT','005','nanogram(s)',
    '{"en":"nanogram(s)","fr":"nanogramme(s)","ja":"ナノグラム","r3":"005"}',4),
(gen_random_uuid()::VARCHAR,'ICSR_SUBSTANCE_STRENGTH_UNIT','006','picogram(s)',
    '{"en":"picogram(s)","fr":"picogramme(s)","ja":"ピコグラム","r3":"006"}',5),
(gen_random_uuid()::VARCHAR,'ICSR_SUBSTANCE_STRENGTH_UNIT','012','millilitre(s)',
    '{"en":"millilitre(s)","fr":"millilitre(s)","ja":"ミリリットル","r3":"012"}',6),
(gen_random_uuid()::VARCHAR,'ICSR_SUBSTANCE_STRENGTH_UNIT','011','litre(s)',
    '{"en":"litre(s)","fr":"litre(s)","ja":"リットル","r3":"011"}',7),
(gen_random_uuid()::VARCHAR,'ICSR_SUBSTANCE_STRENGTH_UNIT','025','international unit(s)',
    '{"en":"international unit(s)","fr":"unité(s) internationale(s)","ja":"国際単位","r3":"025"}',8),
(gen_random_uuid()::VARCHAR,'ICSR_SUBSTANCE_STRENGTH_UNIT','029','milliequivalent(s)',
    '{"en":"milliequivalent(s)","fr":"milliéquivalent(s)","ja":"ミリ当量","r3":"029"}',9),
(gen_random_uuid()::VARCHAR,'ICSR_SUBSTANCE_STRENGTH_UNIT','023','millimole(s)',
    '{"en":"millimole(s)","fr":"millimole(s)","ja":"ミリモル","r3":"023"}',10),
(gen_random_uuid()::VARCHAR,'ICSR_SUBSTANCE_STRENGTH_UNIT','030','percent',
    '{"en":"percent","fr":"pourcentage","ja":"パーセント","r3":"030"}',11),
(gen_random_uuid()::VARCHAR,'ICSR_SUBSTANCE_STRENGTH_UNIT','068','dosage form',
    '{"en":"dosage form","fr":"forme pharmaceutique","ja":"剤形","r3":"068"}',12),
(gen_random_uuid()::VARCHAR,'ICSR_SUBSTANCE_STRENGTH_UNIT','001','kilogram(s)',
    '{"en":"kilogram(s)","fr":"kilogramme(s)","ja":"キログラム","r3":"001"}',13),
(gen_random_uuid()::VARCHAR,'ICSR_SUBSTANCE_STRENGTH_UNIT','007','milligram(s)/kilogram',
    '{"en":"milligram(s)/kilogram","fr":"milligramme(s)/kilogramme","ja":"mg/kg","r3":"007"}',14),
(gen_random_uuid()::VARCHAR,'ICSR_SUBSTANCE_STRENGTH_UNIT','008','microgram(s)/kilogram',
    '{"en":"microgram(s)/kilogram","fr":"microgramme(s)/kilogramme","ja":"mcg/kg","r3":"008"}',15),
(gen_random_uuid()::VARCHAR,'ICSR_SUBSTANCE_STRENGTH_UNIT','122','milli-international unit',
    '{"en":"milli-international unit","fr":"milli-unité internationale","ja":"ミリ国際単位","r3":"122"}',16)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;


-- ── 03_CODELIST_550.sql ──
-- ============================================================
-- Script  : 03_CODELIST_550.sql — Pregnancy section codelists
-- Reused: ICSR_WEIGHT_UNIT (530), ICSR_GESTATION_UNIT (530),
--         ICSR_HEIGHT_UNIT (530), ICSR_DURATION_UNIT (540), SEX (framework)
-- ============================================================


INSERT INTO CODE_LIST_LIB (ID, CODE_LIST_ID, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_PREGNANCY_TYPE',          'ICSR Pregnancy Type (Prospective/Retrospective)'),
(gen_random_uuid()::VARCHAR,'ICSR_TRIMESTER',               'ICSR Trimester of Exposure'),
(gen_random_uuid()::VARCHAR,'ICSR_PREGNANCY_CONFIRM_MODE',  'ICSR Pregnancy Confirmation Mode'),
(gen_random_uuid()::VARCHAR,'ICSR_DELIVERY_METHOD',         'ICSR Method of Delivery'),
(gen_random_uuid()::VARCHAR,'ICSR_PREGNANCY_OUTCOME',       'ICSR Pregnancy Outcome'),
(gen_random_uuid()::VARCHAR,'ICSR_LIVE_BIRTH_COMPLICATIONS','ICSR Live Birth Complications'),
(gen_random_uuid()::VARCHAR,'ICSR_BIRTH_OUTCOME',           'ICSR Birth Outcome (Neonate)'),
(gen_random_uuid()::VARCHAR,'ICSR_CONGENITAL_ANOMALY_TYPE', 'ICSR Congenital Anomaly Type'),
(gen_random_uuid()::VARCHAR,'ICSR_WHICH_PREGNANCY',         'ICSR Which Pregnancy Number')
ON CONFLICT (CODE_LIST_ID) DO NOTHING;

-- ── ICSR_PREGNANCY_TYPE ───────────────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_PREGNANCY_TYPE','01','Prospective',  '{"en":"Prospective","fr":"Prospectif","ja":"前向き"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_PREGNANCY_TYPE','02','Retrospective','{"en":"Retrospective","fr":"Rétrospectif","ja":"後向き"}',2)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── ICSR_TRIMESTER ────────────────────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_TRIMESTER','01','Trimester 1',  '{"en":"Trimester 1","fr":"Trimestre 1","ja":"第1三半期"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_TRIMESTER','02','Trimester 2',  '{"en":"Trimester 2","fr":"Trimestre 2","ja":"第2三半期"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_TRIMESTER','03','Trimester 3',  '{"en":"Trimester 3","fr":"Trimestre 3","ja":"第3三半期"}',3),
(gen_random_uuid()::VARCHAR,'ICSR_TRIMESTER','04','Trimester 1-2','{"en":"Trimester 1-2","fr":"Trimestres 1-2","ja":"第1-2三半期"}',4),
(gen_random_uuid()::VARCHAR,'ICSR_TRIMESTER','05','Trimester 2-3','{"en":"Trimester 2-3","fr":"Trimestres 2-3","ja":"第2-3三半期"}',5),
(gen_random_uuid()::VARCHAR,'ICSR_TRIMESTER','06','Trimester 1-3','{"en":"Trimester 1-3","fr":"Trimestres 1-3","ja":"第1-3三半期"}',6)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── ICSR_PREGNANCY_CONFIRM_MODE ───────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_PREGNANCY_CONFIRM_MODE','1','LMP',             '{"en":"LMP","fr":"DDR","ja":"最終月経"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_PREGNANCY_CONFIRM_MODE','2','Fetal ultrasound','{"en":"Fetal ultrasound","fr":"Échographie fœtale","ja":"胎児超音波"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_PREGNANCY_CONFIRM_MODE','3','Urine test',      '{"en":"Urine test","fr":"Test urinaire","ja":"尿検査"}',3),
(gen_random_uuid()::VARCHAR,'ICSR_PREGNANCY_CONFIRM_MODE','4','Others',          '{"en":"Others","fr":"Autres","ja":"その他"}',4)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── ICSR_DELIVERY_METHOD ──────────────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_DELIVERY_METHOD','1','Normal Delivery',   '{"en":"Normal Delivery","fr":"Accouchement normal","ja":"正常分娩"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_DELIVERY_METHOD','2','Medicated Birth',   '{"en":"Medicated Birth","fr":"Accouchement médicalisé","ja":"薬物分娩"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_DELIVERY_METHOD','3','Caesarean section', '{"en":"Caesarean section","fr":"Césarienne","ja":"帝王切開"}',3),
(gen_random_uuid()::VARCHAR,'ICSR_DELIVERY_METHOD','4','Other',             '{"en":"Other","fr":"Autre","ja":"その他"}',4),
(gen_random_uuid()::VARCHAR,'ICSR_DELIVERY_METHOD','5','Unknown',           '{"en":"Unknown","fr":"Inconnu","ja":"不明"}',5)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── ICSR_PREGNANCY_OUTCOME — key values ───────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_PREGNANCY_OUTCOME','1', 'Normal New born',       '{"en":"Normal New born","fr":"Nouveau-né normal","ja":"正常新生児"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_PREGNANCY_OUTCOME','2', 'Live Birth',            '{"en":"Live Birth","fr":"Naissance vivante","ja":"生産"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_PREGNANCY_OUTCOME','3', 'Termination',           '{"en":"Termination","fr":"Interruption","ja":"中絶"}',3),
(gen_random_uuid()::VARCHAR,'ICSR_PREGNANCY_OUTCOME','4', 'Elective Abortion',     '{"en":"Elective Abortion","fr":"Avortement électif","ja":"選択的中絶"}',4),
(gen_random_uuid()::VARCHAR,'ICSR_PREGNANCY_OUTCOME','5', 'Spontaneous Abortion',  '{"en":"Spontaneous Abortion","fr":"Avortement spontané","ja":"自然流産"}',5),
(gen_random_uuid()::VARCHAR,'ICSR_PREGNANCY_OUTCOME','7', 'Pre-term Delivery',     '{"en":"Pre-term Delivery","fr":"Accouchement prématuré","ja":"早産"}',6),
(gen_random_uuid()::VARCHAR,'ICSR_PREGNANCY_OUTCOME','8', 'Ectopic Pregnancy',     '{"en":"Ectopic Pregnancy","fr":"Grossesse ectopique","ja":"子宮外妊娠"}',7),
(gen_random_uuid()::VARCHAR,'ICSR_PREGNANCY_OUTCOME','9', 'Fetal Death',           '{"en":"Fetal Death","fr":"Mort fœtale","ja":"胎児死亡"}',8),
(gen_random_uuid()::VARCHAR,'ICSR_PREGNANCY_OUTCOME','10','Still Birth',           '{"en":"Still Birth","fr":"Mort-né","ja":"死産"}',9),
(gen_random_uuid()::VARCHAR,'ICSR_PREGNANCY_OUTCOME','11','Congenital Anomaly',    '{"en":"Congenital Anomaly","fr":"Anomalie congénitale","ja":"先天性異常"}',10),
(gen_random_uuid()::VARCHAR,'ICSR_PREGNANCY_OUTCOME','13','Unknown',               '{"en":"Unknown","fr":"Inconnu","ja":"不明"}',11),
(gen_random_uuid()::VARCHAR,'ICSR_PREGNANCY_OUTCOME','14','Not Reported',          '{"en":"Not Reported","fr":"Non rapporté","ja":"未報告"}',12)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── ICSR_LIVE_BIRTH_COMPLICATIONS ─────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_LIVE_BIRTH_COMPLICATIONS','01','Mother',          '{"en":"Mother","fr":"Mère","ja":"母親"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_LIVE_BIRTH_COMPLICATIONS','02','Baby',            '{"en":"Baby","fr":"Bébé","ja":"赤ちゃん"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_LIVE_BIRTH_COMPLICATIONS','03','Mother and Baby', '{"en":"Mother and Baby","fr":"Mère et bébé","ja":"母親と赤ちゃん"}',3)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── ICSR_BIRTH_OUTCOME — key values ──────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_BIRTH_OUTCOME','01','Normal',              '{"en":"Normal","fr":"Normal","ja":"正常"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_BIRTH_OUTCOME','02','Abnormal',            '{"en":"Abnormal","fr":"Anormal","ja":"異常"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_BIRTH_OUTCOME','03','Unknown',             '{"en":"Unknown","fr":"Inconnu","ja":"不明"}',3),
(gen_random_uuid()::VARCHAR,'ICSR_BIRTH_OUTCOME','04','Elective abortion',   '{"en":"Elective abortion","fr":"Avortement électif","ja":"選択的中絶"}',4),
(gen_random_uuid()::VARCHAR,'ICSR_BIRTH_OUTCOME','05','Spontaneous abortion','{"en":"Spontaneous abortion","fr":"Avortement spontané","ja":"自然流産"}',5),
(gen_random_uuid()::VARCHAR,'ICSR_BIRTH_OUTCOME','06','Fetal Death',         '{"en":"Fetal Death","fr":"Mort fœtale","ja":"胎児死亡"}',6),
(gen_random_uuid()::VARCHAR,'ICSR_BIRTH_OUTCOME','07','Live birth with AE',  '{"en":"Live birth with AE","fr":"Naissance vivante avec EI","ja":"有害事象を伴う生産"}',7),
(gen_random_uuid()::VARCHAR,'ICSR_BIRTH_OUTCOME','5007','Live Birth',        '{"en":"Live Birth","fr":"Naissance vivante","ja":"生産"}',8),
(gen_random_uuid()::VARCHAR,'ICSR_BIRTH_OUTCOME','5003','Still birth',       '{"en":"Still birth","fr":"Mort-né","ja":"死産"}',9),
(gen_random_uuid()::VARCHAR,'ICSR_BIRTH_OUTCOME','5002','Pre-mature',        '{"en":"Pre-mature","fr":"Prématuré","ja":"早産"}',10)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── ICSR_CONGENITAL_ANOMALY_TYPE — key values ─────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_CONGENITAL_ANOMALY_TYPE','3', 'Cardiovascular abnormalities',    '{"en":"Cardiovascular abnormalities","fr":"Anomalies cardiovasculaires","ja":"心血管異常"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_CONGENITAL_ANOMALY_TYPE','41','CNS abnormality',                 '{"en":"CNS abnormality","fr":"Anomalie du SNC","ja":"中枢神経系異常"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_CONGENITAL_ANOMALY_TYPE','32','Cleft palate',                    '{"en":"Cleft palate","fr":"Fente palatine","ja":"口蓋裂"}',3),
(gen_random_uuid()::VARCHAR,'ICSR_CONGENITAL_ANOMALY_TYPE','33','Cleft lip',                       '{"en":"Cleft lip","fr":"Fente labiale","ja":"口唇裂"}',4),
(gen_random_uuid()::VARCHAR,'ICSR_CONGENITAL_ANOMALY_TYPE','51','Chromosome disorder',             '{"en":"Chromosome disorder","fr":"Anomalie chromosomique","ja":"染色体異常"}',5),
(gen_random_uuid()::VARCHAR,'ICSR_CONGENITAL_ANOMALY_TYPE','52','Downs syndrome',                  '{"en":"Downs syndrome","fr":"Syndrome de Down","ja":"ダウン症候群"}',6),
(gen_random_uuid()::VARCHAR,'ICSR_CONGENITAL_ANOMALY_TYPE','60','Musculoskeletal abnormality',     '{"en":"Musculoskeletal abnormality","fr":"Anomalie musculo-squelettique","ja":"筋骨格系異常"}',7),
(gen_random_uuid()::VARCHAR,'ICSR_CONGENITAL_ANOMALY_TYPE','70','Gastrointestinal abnormality',    '{"en":"Gastrointestinal abnormality","fr":"Anomalie gastro-intestinale","ja":"消化器系異常"}',8),
(gen_random_uuid()::VARCHAR,'ICSR_CONGENITAL_ANOMALY_TYPE','71','Malformation urogenital',         '{"en":"Malformation urogenital","fr":"Malformation urogénitale","ja":"泌尿生殖器奇形"}',9),
(gen_random_uuid()::VARCHAR,'ICSR_CONGENITAL_ANOMALY_TYPE','74','Other disorder',                  '{"en":"Other disorder","fr":"Autre trouble","ja":"その他の障害"}',10)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── ICSR_WHICH_PREGNANCY ──────────────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_WHICH_PREGNANCY','1','1st',  '{"en":"1st","fr":"1ère","ja":"第1"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_WHICH_PREGNANCY','2','2nd',  '{"en":"2nd","fr":"2ème","ja":"第2"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_WHICH_PREGNANCY','3','3rd',  '{"en":"3rd","fr":"3ème","ja":"第3"}',3),
(gen_random_uuid()::VARCHAR,'ICSR_WHICH_PREGNANCY','4','4th',  '{"en":"4th","fr":"4ème","ja":"第4"}',4),
(gen_random_uuid()::VARCHAR,'ICSR_WHICH_PREGNANCY','5','5th',  '{"en":"5th","fr":"5ème","ja":"第5"}',5),
(gen_random_uuid()::VARCHAR,'ICSR_WHICH_PREGNANCY','6','6th',  '{"en":"6th","fr":"6ème","ja":"第6"}',6),
(gen_random_uuid()::VARCHAR,'ICSR_WHICH_PREGNANCY','7','7th',  '{"en":"7th","fr":"7ème","ja":"第7"}',7),
(gen_random_uuid()::VARCHAR,'ICSR_WHICH_PREGNANCY','8','8th',  '{"en":"8th","fr":"8ème","ja":"第8"}',8),
(gen_random_uuid()::VARCHAR,'ICSR_WHICH_PREGNANCY','9','9th',  '{"en":"9th","fr":"9ème","ja":"第9"}',9),
(gen_random_uuid()::VARCHAR,'ICSR_WHICH_PREGNANCY','10','10th','{"en":"10th","fr":"10ème","ja":"第10"}',10)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;


-- ── 03_CODELIST_580.sql ──
-- ============================================================
-- Script  : 03_CODELIST_580.sql â€” Study section codelists
-- Reused: BLINDING_TECHNIQUE, CODE_STATUS, STUDY_DESIGN,
--         STUDY_PHASE, STUDY_TYPE (from 25_STUDY / 05_seed_codelist.sql)
--         COUNTRY, YES_NO (framework)
-- New: ICSR_ENROLMENT_STATUS, ICSR_STUDY_COMPLETION_STATUS,
--      ICSR_STUDY_DISCONT_REASON, ICSR_SAFETY_REPORTING,
--      ICSR_OTHER_STUDY
-- ============================================================


INSERT INTO CODE_LIST_LIB (ID, CODE_LIST_ID, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_ENROLMENT_STATUS',        'ICSR Patient Enrolment Status'),
(gen_random_uuid()::VARCHAR,'ICSR_STUDY_COMPLETION_STATUS', 'ICSR Study Completion Status'),
(gen_random_uuid()::VARCHAR,'ICSR_STUDY_DISCONT_REASON',    'ICSR Study Discontinuation Reason'),
(gen_random_uuid()::VARCHAR,'ICSR_SAFETY_REPORTING',        'ICSR Safety Reporting Responsibility'),
(gen_random_uuid()::VARCHAR,'ICSR_OTHER_STUDY',             'ICSR Other Examination / Study Type')
ON CONFLICT (CODE_LIST_ID) DO NOTHING;

-- â”€â”€ ICSR_ENROLMENT_STATUS â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_ENROLMENT_STATUS','1','Enrolled',
    '{"en":"Enrolled","fr":"Inscrit","ja":"ç™»éŒ²æ¸ˆã¿"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_ENROLMENT_STATUS','2','Withdrawn',
    '{"en":"Withdrawn","fr":"RetirÃ©","ja":"ä¸­æ­¢"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_ENROLMENT_STATUS','3','Completed',
    '{"en":"Completed","fr":"TerminÃ©","ja":"å®Œäº†"}',3),
(gen_random_uuid()::VARCHAR,'ICSR_ENROLMENT_STATUS','4','Screening',
    '{"en":"Screening","fr":"SÃ©lection","ja":"ã‚¹ã‚¯ãƒªãƒ¼ãƒ‹ãƒ³ã‚°"}',4),
(gen_random_uuid()::VARCHAR,'ICSR_ENROLMENT_STATUS','5','Not Enrolled',
    '{"en":"Not Enrolled","fr":"Non inscrit","ja":"æœªç™»éŒ²"}',5)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- â”€â”€ ICSR_STUDY_COMPLETION_STATUS â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_STUDY_COMPLETION_STATUS','1','Ongoing',
    '{"en":"Ongoing","fr":"En cours","ja":"é€²è¡Œä¸­","r2":"1","r3":"ongoing"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_STUDY_COMPLETION_STATUS','2','Completed',
    '{"en":"Completed","fr":"TerminÃ©","ja":"å®Œäº†","r2":"2","r3":"completed"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_STUDY_COMPLETION_STATUS','3','Prematurely ended',
    '{"en":"Prematurely ended","fr":"TerminÃ© prÃ©maturÃ©ment","ja":"æ—©æœŸçµ‚äº†","r2":"3","r3":"prematurely-ended"}',3),
(gen_random_uuid()::VARCHAR,'ICSR_STUDY_COMPLETION_STATUS','4','Temporarily halted',
    '{"en":"Temporarily halted","fr":"Temporairement suspendu","ja":"ä¸€æ™‚åœæ­¢","r2":"4","r3":"temporarily-halted"}',4),
(gen_random_uuid()::VARCHAR,'ICSR_STUDY_COMPLETION_STATUS','5','Not yet started',
    '{"en":"Not yet started","fr":"Pas encore commencÃ©","ja":"æœªé–‹å§‹","r2":"5","r3":"not-yet-started"}',5)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- â”€â”€ ICSR_STUDY_DISCONT_REASON â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_STUDY_DISCONT_REASON','1','Adverse Event',
    '{"en":"Adverse Event","fr":"Ã‰vÃ©nement indÃ©sirable","ja":"æœ‰å®³äº‹è±¡","r2":"1","r3":"adverse-event"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_STUDY_DISCONT_REASON','2','Lack of Efficacy',
    '{"en":"Lack of Efficacy","fr":"Manque d''efficacitÃ©","ja":"æœ‰åŠ¹æ€§ã®æ¬ å¦‚","r2":"2","r3":"lack-of-efficacy"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_STUDY_DISCONT_REASON','3','Protocol Deviation',
    '{"en":"Protocol Deviation","fr":"DÃ©viation de protocole","ja":"ãƒ—ãƒ­ãƒˆã‚³ãƒ«é€¸è„±","r2":"3","r3":"protocol-deviation"}',3),
(gen_random_uuid()::VARCHAR,'ICSR_STUDY_DISCONT_REASON','4','Withdrawal of Consent',
    '{"en":"Withdrawal of Consent","fr":"Retrait du consentement","ja":"åŒæ„æ’¤å›ž","r2":"4","r3":"withdrawal-of-consent"}',4),
(gen_random_uuid()::VARCHAR,'ICSR_STUDY_DISCONT_REASON','5','Lost to Follow-up',
    '{"en":"Lost to Follow-up","fr":"Perdu de vue","ja":"è¿½è·¡ä¸èƒ½","r2":"5","r3":"lost-to-follow-up"}',5),
(gen_random_uuid()::VARCHAR,'ICSR_STUDY_DISCONT_REASON','6','Death',
    '{"en":"Death","fr":"DÃ©cÃ¨s","ja":"æ­»äº¡","r2":"6","r3":"death"}',6),
(gen_random_uuid()::VARCHAR,'ICSR_STUDY_DISCONT_REASON','7','Other',
    '{"en":"Other","fr":"Autre","ja":"ãã®ä»–","r2":"7","r3":"other"}',7)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- â”€â”€ ICSR_SAFETY_REPORTING â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_SAFETY_REPORTING','1','Sponsor',
    '{"en":"Sponsor","fr":"Promoteur","ja":"ã‚¹ãƒãƒ³ã‚µãƒ¼"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_SAFETY_REPORTING','2','Investigator',
    '{"en":"Investigator","fr":"Investigateur","ja":"æ²»é¨“è²¬ä»»åŒ»å¸«"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_SAFETY_REPORTING','3','Sponsor and Investigator',
    '{"en":"Sponsor and Investigator","fr":"Promoteur et investigateur","ja":"ã‚¹ãƒãƒ³ã‚µãƒ¼ã¨æ²»é¨“è²¬ä»»åŒ»å¸«"}',3),
(gen_random_uuid()::VARCHAR,'ICSR_SAFETY_REPORTING','4','Not Applicable',
    '{"en":"Not Applicable","fr":"Non applicable","ja":"è©²å½“ãªã—"}',4)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- â”€â”€ ICSR_OTHER_STUDY â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_OTHER_STUDY','1','Compassionate Use',
    '{"en":"Compassionate Use","fr":"Usage compassionnel","ja":"äººé“çš„ä½¿ç”¨"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_OTHER_STUDY','2','Named Patient',
    '{"en":"Named Patient","fr":"Patient nommÃ©","ja":"æŒ‡åæ‚£è€…"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_OTHER_STUDY','3','Other',
    '{"en":"Other","fr":"Autre","ja":"ãã®ä»–"}',3)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;


-- ── 03_CODELIST_600.sql ──
-- ============================================================
-- Script  : 03_CODELIST_600.sql â€” Event Reactions codelists
-- Reused (values verified):
--   ICSR_DURATION_UNIT  â€” Year/Month/Week/Day/Hour/Minute (03_CODELIST_540.sql)
--   ICSR_CODING_TYPE    â€” Dictionary/Manual/VTA/Intelligent/Rejected (03_CODELIST_540.sql)
--   COUNTRY             â€” ISO country list (03_seed_framework_data.sql)
--   YES_NO              â€” Y/N (03_seed_framework_data.sql)
-- New codelists (not found in any existing file):
--   ICSR_REACT_OUTCOME, ICSR_SEVERITY, ICSR_TERM_HIGHLIGHTED,
--   ICSR_EVENT_TYPE, ICSR_REACTION_SITE, ICSR_CAUSE_AE,
--   ICSR_TREATMENT_PERFORMED, ICSR_REACT_CONDITION,
--   ICSR_DEVICE_EVENT_SEVERITY, ICSR_EVENT_OCCUR_LOCATION,
--   ICSR_INCIDENT_OCCURRED_DURING, ICSR_LOCATION,
--   ICSR_EVENTS_DURING_INCIDENT, ICSR_SIMILAR_INCIDENT_BASIS,
--   ICSR_DEVICE_MARKET_CRITERIA, ICSR_NATIVE_LANGUAGE
-- ============================================================


INSERT INTO CODE_LIST_LIB (ID, CODE_LIST_ID, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_REACT_OUTCOME',           'ICSR Reaction Outcome (R2:B.2.7 / R3:E.i.7)'),
(gen_random_uuid()::VARCHAR,'ICSR_SEVERITY',                'ICSR Reaction Severity'),
(gen_random_uuid()::VARCHAR,'ICSR_TERM_HIGHLIGHTED',        'ICSR Term Highlighted (R2:B.2.2 / R3:E.i.2)'),
(gen_random_uuid()::VARCHAR,'ICSR_EVENT_TYPE',              'ICSR Event Type'),
(gen_random_uuid()::VARCHAR,'ICSR_REACTION_SITE',           'ICSR Reaction Site'),
(gen_random_uuid()::VARCHAR,'ICSR_CAUSE_AE',                'ICSR Cause of Adverse Event'),
(gen_random_uuid()::VARCHAR,'ICSR_TREATMENT_PERFORMED',     'ICSR Treatment Performed'),
(gen_random_uuid()::VARCHAR,'ICSR_REACT_CONDITION',         'ICSR Reaction Condition'),
(gen_random_uuid()::VARCHAR,'ICSR_DEVICE_EVENT_SEVERITY',   'ICSR Device Event Severity'),
(gen_random_uuid()::VARCHAR,'ICSR_EVENT_OCCUR_LOCATION',    'ICSR Location Where Event Occurred'),
(gen_random_uuid()::VARCHAR,'ICSR_INCIDENT_OCCURRED_DURING','ICSR Incident Occurred During'),
(gen_random_uuid()::VARCHAR,'ICSR_LOCATION',                'ICSR Location Type'),
(gen_random_uuid()::VARCHAR,'ICSR_EVENTS_DURING_INCIDENT',  'ICSR Events Occurred During Incident'),
(gen_random_uuid()::VARCHAR,'ICSR_SIMILAR_INCIDENT_BASIS',  'ICSR Basis of Similar Incident Identification'),
(gen_random_uuid()::VARCHAR,'ICSR_DEVICE_MARKET_CRITERIA',  'ICSR Criteria for Devices in Market'),
(gen_random_uuid()::VARCHAR,'ICSR_NATIVE_LANGUAGE',         'ICSR Native Language of Primary Source')
ON CONFLICT (CODE_LIST_ID) DO NOTHING;

-- â”€â”€ ICSR_REACT_OUTCOME â€” R2:B.2.7 / R3:E.i.7 â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_REACT_OUTCOME','1','Recovered/Resolved',
    '{"en":"Recovered/Resolved","fr":"RÃ©tabli/RÃ©solu","ja":"å›žå¾©/æ¶ˆå¤±","r2":"1","r3":"recovered-resolved"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_REACT_OUTCOME','2','Recovering/Resolving',
    '{"en":"Recovering/Resolving","fr":"En cours de rÃ©tablissement","ja":"å›žå¾©ä¸­","r2":"2","r3":"recovering-resolving"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_REACT_OUTCOME','3','Not Recovered/Not Resolved',
    '{"en":"Not Recovered/Not Resolved","fr":"Non rÃ©tabli/Non rÃ©solu","ja":"æœªå›žå¾©","r2":"3","r3":"not-recovered-not-resolved"}',3),
(gen_random_uuid()::VARCHAR,'ICSR_REACT_OUTCOME','4','Recovered/Resolved with Sequelae',
    '{"en":"Recovered/Resolved with Sequelae","fr":"RÃ©tabli avec sÃ©quelles","ja":"å¾Œéºç—‡ã‚ã‚Šå›žå¾©","r2":"4","r3":"recovered-resolved-with-sequelae"}',4),
(gen_random_uuid()::VARCHAR,'ICSR_REACT_OUTCOME','5','Fatal',
    '{"en":"Fatal","fr":"Fatal","ja":"æ­»äº¡","r2":"5","r3":"fatal"}',5),
(gen_random_uuid()::VARCHAR,'ICSR_REACT_OUTCOME','6','Unknown',
    '{"en":"Unknown","fr":"Inconnu","ja":"ä¸æ˜Ž","r2":"6","r3":"unknown"}',6)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- â”€â”€ ICSR_SEVERITY â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_SEVERITY','1','Mild',
    '{"en":"Mild","fr":"LÃ©gÃ¨re","ja":"è»½åº¦","r2":"1","r3":"mild"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_SEVERITY','2','Moderate',
    '{"en":"Moderate","fr":"ModÃ©rÃ©e","ja":"ä¸­ç­‰åº¦","r2":"2","r3":"moderate"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_SEVERITY','3','Severe',
    '{"en":"Severe","fr":"SÃ©vÃ¨re","ja":"é‡åº¦","r2":"3","r3":"severe"}',3),
(gen_random_uuid()::VARCHAR,'ICSR_SEVERITY','4','Life Threatening',
    '{"en":"Life Threatening","fr":"Mettant en jeu le pronostic vital","ja":"ç”Ÿå‘½ã‚’è„…ã‹ã™","r2":"4","r3":"life-threatening"}',4),
(gen_random_uuid()::VARCHAR,'ICSR_SEVERITY','5','Fatal',
    '{"en":"Fatal","fr":"Fatal","ja":"æ­»äº¡","r2":"5","r3":"fatal"}',5)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- â”€â”€ ICSR_TERM_HIGHLIGHTED â€” R2:B.2.2 / R3:E.i.2 â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_TERM_HIGHLIGHTED','1','Yes',
    '{"en":"Yes","fr":"Oui","ja":"ã¯ã„","r2":"1","r3":"yes"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_TERM_HIGHLIGHTED','2','No',
    '{"en":"No","fr":"Non","ja":"ã„ã„ãˆ","r2":"2","r3":"no"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_TERM_HIGHLIGHTED','3','Unknown',
    '{"en":"Unknown","fr":"Inconnu","ja":"ä¸æ˜Ž","r2":"3","r3":"unknown"}',3)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- â”€â”€ ICSR_EVENT_TYPE â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_EVENT_TYPE','1','Adverse Event',
    '{"en":"Adverse Event","fr":"Ã‰vÃ©nement indÃ©sirable","ja":"æœ‰å®³äº‹è±¡"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_EVENT_TYPE','2','Adverse Drug Reaction',
    '{"en":"Adverse Drug Reaction","fr":"RÃ©action indÃ©sirable mÃ©dicamenteuse","ja":"å‰¯ä½œç”¨"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_EVENT_TYPE','3','Adverse Device Effect',
    '{"en":"Adverse Device Effect","fr":"Effet indÃ©sirable du dispositif","ja":"æ©Ÿå™¨æœ‰å®³äº‹è±¡"}',3),
(gen_random_uuid()::VARCHAR,'ICSR_EVENT_TYPE','4','Serious Adverse Event',
    '{"en":"Serious Adverse Event","fr":"Ã‰vÃ©nement indÃ©sirable grave","ja":"é‡ç¯¤ãªæœ‰å®³äº‹è±¡"}',4),
(gen_random_uuid()::VARCHAR,'ICSR_EVENT_TYPE','5','Unexpected Adverse Drug Reaction',
    '{"en":"Unexpected Adverse Drug Reaction","fr":"RÃ©action inattendue","ja":"äºˆæœŸã—ãªã„å‰¯ä½œç”¨"}',5)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- â”€â”€ ICSR_REACTION_SITE â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_REACTION_SITE','1','Injection site',
    '{"en":"Injection site","fr":"Site d''injection","ja":"æ³¨å°„éƒ¨ä½"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_REACTION_SITE','2','Infusion site',
    '{"en":"Infusion site","fr":"Site de perfusion","ja":"ç‚¹æ»´éƒ¨ä½"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_REACTION_SITE','3','Application site',
    '{"en":"Application site","fr":"Site d''application","ja":"é©ç”¨éƒ¨ä½"}',3),
(gen_random_uuid()::VARCHAR,'ICSR_REACTION_SITE','4','Other',
    '{"en":"Other","fr":"Autre","ja":"ãã®ä»–"}',4)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- â”€â”€ ICSR_CAUSE_AE â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_CAUSE_AE','1','Drug',
    '{"en":"Drug","fr":"MÃ©dicament","ja":"è–¬å‰¤"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_CAUSE_AE','2','Device',
    '{"en":"Device","fr":"Dispositif","ja":"æ©Ÿå™¨"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_CAUSE_AE','3','Drug Interaction',
    '{"en":"Drug Interaction","fr":"Interaction mÃ©dicamenteuse","ja":"è–¬ç‰©ç›¸äº’ä½œç”¨"}',3),
(gen_random_uuid()::VARCHAR,'ICSR_CAUSE_AE','4','Lack of Effect',
    '{"en":"Lack of Effect","fr":"Manque d''efficacitÃ©","ja":"åŠ¹æžœä¸è¶³"}',4),
(gen_random_uuid()::VARCHAR,'ICSR_CAUSE_AE','5','Other',
    '{"en":"Other","fr":"Autre","ja":"ãã®ä»–"}',5)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- â”€â”€ ICSR_TREATMENT_PERFORMED â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_TREATMENT_PERFORMED','1','Yes',
    '{"en":"Yes","fr":"Oui","ja":"ã¯ã„","r2":"1","r3":"yes"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_TREATMENT_PERFORMED','2','No',
    '{"en":"No","fr":"Non","ja":"ã„ã„ãˆ","r2":"2","r3":"no"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_TREATMENT_PERFORMED','3','Unknown',
    '{"en":"Unknown","fr":"Inconnu","ja":"ä¸æ˜Ž","r2":"3","r3":"unknown"}',3)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- â”€â”€ ICSR_REACT_CONDITION â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_REACT_CONDITION','1','Ongoing',
    '{"en":"Ongoing","fr":"En cours","ja":"ç¶™ç¶šä¸­"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_REACT_CONDITION','2','Resolved',
    '{"en":"Resolved","fr":"RÃ©solu","ja":"æ¶ˆå¤±"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_REACT_CONDITION','3','Resolved with Sequelae',
    '{"en":"Resolved with Sequelae","fr":"RÃ©solu avec sÃ©quelles","ja":"å¾Œéºç—‡ã‚ã‚Šæ¶ˆå¤±"}',3),
(gen_random_uuid()::VARCHAR,'ICSR_REACT_CONDITION','4','Unknown',
    '{"en":"Unknown","fr":"Inconnu","ja":"ä¸æ˜Ž"}',4)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- â”€â”€ ICSR_DEVICE_EVENT_SEVERITY â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_DEVICE_EVENT_SEVERITY','1','Death',
    '{"en":"Death","fr":"DÃ©cÃ¨s","ja":"æ­»äº¡"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_DEVICE_EVENT_SEVERITY','2','Life-threatening',
    '{"en":"Life-threatening","fr":"Mettant en jeu le pronostic vital","ja":"ç”Ÿå‘½ã‚’è„…ã‹ã™"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_DEVICE_EVENT_SEVERITY','3','Serious injury',
    '{"en":"Serious injury","fr":"Blessure grave","ja":"é‡ç¯¤ãªå‚·å®³"}',3),
(gen_random_uuid()::VARCHAR,'ICSR_DEVICE_EVENT_SEVERITY','4','Requires intervention',
    '{"en":"Requires intervention","fr":"NÃ©cessite une intervention","ja":"ä»‹å…¥ãŒå¿…è¦"}',4),
(gen_random_uuid()::VARCHAR,'ICSR_DEVICE_EVENT_SEVERITY','5','Other',
    '{"en":"Other","fr":"Autre","ja":"ãã®ä»–"}',5)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- â”€â”€ ICSR_EVENT_OCCUR_LOCATION â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_EVENT_OCCUR_LOCATION','1','Home',
    '{"en":"Home","fr":"Domicile","ja":"è‡ªå®…"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_EVENT_OCCUR_LOCATION','2','Hospital',
    '{"en":"Hospital","fr":"HÃ´pital","ja":"ç—…é™¢"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_EVENT_OCCUR_LOCATION','3','Outpatient clinic',
    '{"en":"Outpatient clinic","fr":"Clinique ambulatoire","ja":"å¤–æ¥ã‚¯ãƒªãƒ‹ãƒƒã‚¯"}',3),
(gen_random_uuid()::VARCHAR,'ICSR_EVENT_OCCUR_LOCATION','4','Nursing home',
    '{"en":"Nursing home","fr":"Maison de retraite","ja":"ä»‹è­·æ–½è¨­"}',4),
(gen_random_uuid()::VARCHAR,'ICSR_EVENT_OCCUR_LOCATION','5','Other',
    '{"en":"Other","fr":"Autre","ja":"ãã®ä»–"}',5),
(gen_random_uuid()::VARCHAR,'ICSR_EVENT_OCCUR_LOCATION','6','Unknown',
    '{"en":"Unknown","fr":"Inconnu","ja":"ä¸æ˜Ž"}',6)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- â”€â”€ ICSR_INCIDENT_OCCURRED_DURING â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_INCIDENT_OCCURRED_DURING','1','Use',
    '{"en":"Use","fr":"Utilisation","ja":"ä½¿ç”¨ä¸­"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_INCIDENT_OCCURRED_DURING','2','Maintenance',
    '{"en":"Maintenance","fr":"Maintenance","ja":"ãƒ¡ãƒ³ãƒ†ãƒŠãƒ³ã‚¹ä¸­"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_INCIDENT_OCCURRED_DURING','3','Installation',
    '{"en":"Installation","fr":"Installation","ja":"è¨­ç½®ä¸­"}',3),
(gen_random_uuid()::VARCHAR,'ICSR_INCIDENT_OCCURRED_DURING','4','Other',
    '{"en":"Other","fr":"Autre","ja":"ãã®ä»–"}',4)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- â”€â”€ ICSR_LOCATION â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_LOCATION','1','Healthcare facility',
    '{"en":"Healthcare facility","fr":"Ã‰tablissement de santÃ©","ja":"åŒ»ç™‚æ–½è¨­"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_LOCATION','2','Home',
    '{"en":"Home","fr":"Domicile","ja":"è‡ªå®…"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_LOCATION','3','Other',
    '{"en":"Other","fr":"Autre","ja":"ãã®ä»–"}',3)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- â”€â”€ ICSR_EVENTS_DURING_INCIDENT â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_EVENTS_DURING_INCIDENT','1','Death',
    '{"en":"Death","fr":"DÃ©cÃ¨s","ja":"æ­»äº¡"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_EVENTS_DURING_INCIDENT','2','Serious injury',
    '{"en":"Serious injury","fr":"Blessure grave","ja":"é‡ç¯¤ãªå‚·å®³"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_EVENTS_DURING_INCIDENT','3','Near incident',
    '{"en":"Near incident","fr":"Quasi-incident","ja":"ãƒ‹ã‚¢ãƒŸã‚¹"}',3),
(gen_random_uuid()::VARCHAR,'ICSR_EVENTS_DURING_INCIDENT','4','Other',
    '{"en":"Other","fr":"Autre","ja":"ãã®ä»–"}',4)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- â”€â”€ ICSR_SIMILAR_INCIDENT_BASIS â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_SIMILAR_INCIDENT_BASIS','1','IMDRF codes',
    '{"en":"IMDRF codes","fr":"Codes IMDRF","ja":"IMDRFã‚³ãƒ¼ãƒ‰"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_SIMILAR_INCIDENT_BASIS','2','In-house codes',
    '{"en":"In-house codes","fr":"Codes internes","ja":"ç¤¾å†…ã‚³ãƒ¼ãƒ‰"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_SIMILAR_INCIDENT_BASIS','3','Other criteria',
    '{"en":"Other criteria","fr":"Autres critÃ¨res","ja":"ãã®ä»–ã®åŸºæº–"}',3)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- â”€â”€ ICSR_DEVICE_MARKET_CRITERIA â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_DEVICE_MARKET_CRITERIA','1','Same model',
    '{"en":"Same model","fr":"MÃªme modÃ¨le","ja":"åŒä¸€ãƒ¢ãƒ‡ãƒ«"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_DEVICE_MARKET_CRITERIA','2','Same device type',
    '{"en":"Same device type","fr":"MÃªme type de dispositif","ja":"åŒä¸€æ©Ÿå™¨ç¨®åˆ¥"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_DEVICE_MARKET_CRITERIA','3','Other',
    '{"en":"Other","fr":"Autre","ja":"ãã®ä»–"}',3)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- â”€â”€ ICSR_NATIVE_LANGUAGE â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_NATIVE_LANGUAGE','en','English',
    '{"en":"English","fr":"Anglais","ja":"è‹±èªž"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_NATIVE_LANGUAGE','fr','French',
    '{"en":"French","fr":"FranÃ§ais","ja":"ãƒ•ãƒ©ãƒ³ã‚¹èªž"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_NATIVE_LANGUAGE','de','German',
    '{"en":"German","fr":"Allemand","ja":"ãƒ‰ã‚¤ãƒ„èªž"}',3),
(gen_random_uuid()::VARCHAR,'ICSR_NATIVE_LANGUAGE','es','Spanish',
    '{"en":"Spanish","fr":"Espagnol","ja":"ã‚¹ãƒšã‚¤ãƒ³èªž"}',4),
(gen_random_uuid()::VARCHAR,'ICSR_NATIVE_LANGUAGE','it','Italian',
    '{"en":"Italian","fr":"Italien","ja":"ã‚¤ã‚¿ãƒªã‚¢èªž"}',5),
(gen_random_uuid()::VARCHAR,'ICSR_NATIVE_LANGUAGE','ja','Japanese',
    '{"en":"Japanese","fr":"Japonais","ja":"æ—¥æœ¬èªž"}',6),
(gen_random_uuid()::VARCHAR,'ICSR_NATIVE_LANGUAGE','zh','Chinese',
    '{"en":"Chinese","fr":"Chinois","ja":"ä¸­å›½èªž"}',7),
(gen_random_uuid()::VARCHAR,'ICSR_NATIVE_LANGUAGE','pt','Portuguese',
    '{"en":"Portuguese","fr":"Portugais","ja":"ãƒãƒ«ãƒˆã‚¬ãƒ«èªž"}',8),
(gen_random_uuid()::VARCHAR,'ICSR_NATIVE_LANGUAGE','nl','Dutch',
    '{"en":"Dutch","fr":"NÃ©erlandais","ja":"ã‚ªãƒ©ãƒ³ãƒ€èªž"}',9),
(gen_random_uuid()::VARCHAR,'ICSR_NATIVE_LANGUAGE','other','Other',
    '{"en":"Other","fr":"Autre","ja":"ãã®ä»–"}',10)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;


-- ── 03_CODELIST_610.sql ──
-- ============================================================
-- Script  : 03_CODELIST_610.sql â€” Drug Products codelists
-- Reused (values verified):
--   ROUTE_OF_ADMIN  â€” ORAL/IV/IM/SC/TOPICAL/INHALED etc. (05_seed_codelist.sql)
--   FORM_OF_ADMIN   â€” TABLET/CAPSULE/SOLUTION etc. (05_seed_codelist.sql)
--   PRODUCT_FLAG    â€” DRUG/DEVICE/VACCINE/BIOLOGIC etc. (05_seed_codelist.sql)
--   STUDY_PRODUCT_TYPE â€” AUXILIARY/BLINDED/COMPARATOR etc. (05_seed_codelist.sql)
--   ICSR_DURATION_UNIT â€” Year/Month/Week/Day/Hour/Minute (03_CODELIST_540.sql)
--   COUNTRY         â€” ISO country list (03_seed_framework_data.sql)
-- New codelists (not found in any existing file):
--   ICSR_SUBSTANCE_STRENGTH_UNIT, ICSR_DOSAGE_UNIT,
--   ICSR_DRUG_CHAR, ICSR_ACTION_DRUG,
--   ICSR_DECHALLENGE, ICSR_RECHALLENGE,
--   ICSR_CAUSALITY, ICSR_LABELLING,
--   ICSR_DEVICE_LOCATION, ICSR_DEVICE_EVALUATED,
--   ICSR_DEVICE_EVAL_NOT_PROVIDED, ICSR_REMEDIAL_ACTION,
--   ICSR_DEVICE_USAGE, ICSR_DEVICE_OPERATOR,
--   ICSR_DEVICE_REPROCESSED, ICSR_APPROVAL_TYPE,
--   ICSR_DEVICE_CLASS, ICSR_DEVICE_DEMOGRAPHIC,
--   ICSR_FREQ_TIME_UNIT, ICSR_VACC_FACILITY_TYPE,
--   ICSR_VACC_ANAT_SITE, ICSR_THERAPY_SITE
-- ============================================================


INSERT INTO CODE_LIST_LIB (ID, CODE_LIST_ID, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_SUBSTANCE_STRENGTH_UNIT','ICSR Substance Strength Unit (R3:G.k.2.3.3)'),
(gen_random_uuid()::VARCHAR,'ICSR_DOSAGE_UNIT',            'ICSR Dosage / Dose Unit'),
(gen_random_uuid()::VARCHAR,'ICSR_DRUG_CHAR',              'ICSR Drug/Product Characterization (R2:B.4.k.1 / R3:G.k.1)'),
(gen_random_uuid()::VARCHAR,'ICSR_ACTION_DRUG',            'ICSR Action Taken With Drug (R2:B.4.k.7 / R3:G.k.8)'),
(gen_random_uuid()::VARCHAR,'ICSR_DECHALLENGE',            'ICSR Dechallenge Result (R2:B.4.k.15 / R3:G.k.9.i.3)'),
(gen_random_uuid()::VARCHAR,'ICSR_RECHALLENGE',            'ICSR Rechallenge Result (R2:B.4.k.16 / R3:G.k.9.i.4)'),
(gen_random_uuid()::VARCHAR,'ICSR_CAUSALITY',              'ICSR Causality Assessment'),
(gen_random_uuid()::VARCHAR,'ICSR_LABELLING',              'ICSR Labelling Status (Listed/Unlisted)'),
(gen_random_uuid()::VARCHAR,'ICSR_DEVICE_LOCATION',        'ICSR Current Device Location'),
(gen_random_uuid()::VARCHAR,'ICSR_DEVICE_EVALUATED',       'ICSR Device Evaluated by Manufacturer'),
(gen_random_uuid()::VARCHAR,'ICSR_DEVICE_EVAL_NOT_PROVIDED','ICSR Reason Device Not Evaluated'),
(gen_random_uuid()::VARCHAR,'ICSR_REMEDIAL_ACTION',        'ICSR Remedial Action Initiated'),
(gen_random_uuid()::VARCHAR,'ICSR_DEVICE_USAGE',           'ICSR Device Usage'),
(gen_random_uuid()::VARCHAR,'ICSR_DEVICE_OPERATOR',        'ICSR Operator of Device'),
(gen_random_uuid()::VARCHAR,'ICSR_DEVICE_REPROCESSED',     'ICSR Device Reprocessed and Reused'),
(gen_random_uuid()::VARCHAR,'ICSR_APPROVAL_TYPE',          'ICSR Drug Authorization Type'),
(gen_random_uuid()::VARCHAR,'ICSR_DEVICE_CLASS',           'ICSR Device Class'),
(gen_random_uuid()::VARCHAR,'ICSR_DEVICE_DEMOGRAPHIC',     'ICSR Device Demographic'),
(gen_random_uuid()::VARCHAR,'ICSR_FREQ_TIME_UNIT',         'ICSR Frequency Time Unit'),
(gen_random_uuid()::VARCHAR,'ICSR_VACC_FACILITY_TYPE',     'ICSR Vaccination Facility Type'),
(gen_random_uuid()::VARCHAR,'ICSR_VACC_ANAT_SITE',         'ICSR Vaccine Anatomical Approach Site'),
(gen_random_uuid()::VARCHAR,'ICSR_THERAPY_SITE',           'ICSR Therapy Site')
ON CONFLICT (CODE_LIST_ID) DO NOTHING;

-- â”€â”€ ICSR_SUBSTANCE_STRENGTH_UNIT â€” R3:G.k.2.3.3 â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_SUBSTANCE_STRENGTH_UNIT','mg',   'mg',    '{"en":"mg","fr":"mg","ja":"mg","r3":"mg"}',   1),
(gen_random_uuid()::VARCHAR,'ICSR_SUBSTANCE_STRENGTH_UNIT','g',    'g',     '{"en":"g","fr":"g","ja":"g","r3":"g"}',       2),
(gen_random_uuid()::VARCHAR,'ICSR_SUBSTANCE_STRENGTH_UNIT','mcg',  'mcg',   '{"en":"mcg","fr":"mcg","ja":"mcg","r3":"mcg"}',3),
(gen_random_uuid()::VARCHAR,'ICSR_SUBSTANCE_STRENGTH_UNIT','IU',   'IU',    '{"en":"IU","fr":"UI","ja":"IU","r3":"IU"}',   4),
(gen_random_uuid()::VARCHAR,'ICSR_SUBSTANCE_STRENGTH_UNIT','mL',   'mL',    '{"en":"mL","fr":"mL","ja":"mL","r3":"mL"}',   5),
(gen_random_uuid()::VARCHAR,'ICSR_SUBSTANCE_STRENGTH_UNIT','%',    '%',     '{"en":"%","fr":"%","ja":"%","r3":"%"}',       6),
(gen_random_uuid()::VARCHAR,'ICSR_SUBSTANCE_STRENGTH_UNIT','other','Other', '{"en":"Other","fr":"Autre","ja":"ãã®ä»–"}',   7)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- â”€â”€ ICSR_DOSAGE_UNIT â€” R2:B.4.k.6 / R3:G.k.4.3 â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_DOSAGE_UNIT','mg',    'mg',          '{"en":"mg","fr":"mg","ja":"mg","r2":"mg","r3":"mg"}',          1),
(gen_random_uuid()::VARCHAR,'ICSR_DOSAGE_UNIT','g',     'g',           '{"en":"g","fr":"g","ja":"g","r2":"g","r3":"g"}',               2),
(gen_random_uuid()::VARCHAR,'ICSR_DOSAGE_UNIT','mcg',   'mcg',         '{"en":"mcg","fr":"mcg","ja":"mcg","r2":"mcg","r3":"mcg"}',     3),
(gen_random_uuid()::VARCHAR,'ICSR_DOSAGE_UNIT','IU',    'IU',          '{"en":"IU","fr":"UI","ja":"IU","r2":"IU","r3":"IU"}',          4),
(gen_random_uuid()::VARCHAR,'ICSR_DOSAGE_UNIT','mL',    'mL',          '{"en":"mL","fr":"mL","ja":"mL","r2":"mL","r3":"mL"}',          5),
(gen_random_uuid()::VARCHAR,'ICSR_DOSAGE_UNIT','mg/kg', 'mg/kg',       '{"en":"mg/kg","fr":"mg/kg","ja":"mg/kg","r3":"mg/kg"}',        6),
(gen_random_uuid()::VARCHAR,'ICSR_DOSAGE_UNIT','mg/m2', 'mg/mÂ²',       '{"en":"mg/mÂ²","fr":"mg/mÂ²","ja":"mg/mÂ²","r3":"mg/m2"}',       7),
(gen_random_uuid()::VARCHAR,'ICSR_DOSAGE_UNIT','other', 'Other',       '{"en":"Other","fr":"Autre","ja":"ãã®ä»–"}',                   8)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- â”€â”€ ICSR_DRUG_CHAR â€” R2:B.4.k.1 / R3:G.k.1 â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_DRUG_CHAR','1','Suspect',          '{"en":"Suspect","fr":"Suspect","ja":"è¢«ç–‘è–¬","r2":"1","r3":"suspect"}',                    1),
(gen_random_uuid()::VARCHAR,'ICSR_DRUG_CHAR','2','Concomitant',      '{"en":"Concomitant","fr":"Concomitant","ja":"ä½µç”¨è–¬","r2":"2","r3":"concomitant"}',        2),
(gen_random_uuid()::VARCHAR,'ICSR_DRUG_CHAR','3','Interacting',      '{"en":"Interacting","fr":"Interagissant","ja":"ç›¸äº’ä½œç”¨è–¬","r2":"3","r3":"interacting"}',  3),
(gen_random_uuid()::VARCHAR,'ICSR_DRUG_CHAR','4','Drug Not Administered','{"en":"Drug Not Administered","fr":"MÃ©dicament non administrÃ©","ja":"æœªæŠ•ä¸Žè–¬","r2":"4","r3":"drug-not-administered"}',4)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- â”€â”€ ICSR_ACTION_DRUG â€” R2:B.4.k.7 / R3:G.k.8 â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_ACTION_DRUG','1','Drug withdrawn',       '{"en":"Drug withdrawn","fr":"MÃ©dicament arrÃªtÃ©","ja":"æŠ•ä¸Žä¸­æ­¢","r2":"1","r3":"drug-withdrawn"}',                1),
(gen_random_uuid()::VARCHAR,'ICSR_ACTION_DRUG','2','Dose reduced',         '{"en":"Dose reduced","fr":"Dose rÃ©duite","ja":"æ¸›é‡","r2":"2","r3":"dose-reduced"}',                            2),
(gen_random_uuid()::VARCHAR,'ICSR_ACTION_DRUG','3','Dose increased',       '{"en":"Dose increased","fr":"Dose augmentÃ©e","ja":"å¢—é‡","r2":"3","r3":"dose-increased"}',                      3),
(gen_random_uuid()::VARCHAR,'ICSR_ACTION_DRUG','4','Dose not changed',     '{"en":"Dose not changed","fr":"Dose inchangÃ©e","ja":"ç”¨é‡å¤‰æ›´ãªã—","r2":"4","r3":"dose-not-changed"}',          4),
(gen_random_uuid()::VARCHAR,'ICSR_ACTION_DRUG','5','Unknown',              '{"en":"Unknown","fr":"Inconnu","ja":"ä¸æ˜Ž","r2":"5","r3":"unknown"}',                                           5),
(gen_random_uuid()::VARCHAR,'ICSR_ACTION_DRUG','6','Not applicable',       '{"en":"Not applicable","fr":"Non applicable","ja":"è©²å½“ãªã—","r2":"6","r3":"not-applicable"}',                  6)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- â”€â”€ ICSR_DECHALLENGE â€” R2:B.4.k.15 / R3:G.k.9.i.3 â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_DECHALLENGE','1','Yes â€” abated',         '{"en":"Yes â€” abated","fr":"Oui â€” attÃ©nuÃ©","ja":"ã¯ã„ â€” è»½å¿«","r2":"1","r3":"yes-abated"}',                    1),
(gen_random_uuid()::VARCHAR,'ICSR_DECHALLENGE','2','Yes â€” not abated',     '{"en":"Yes â€” not abated","fr":"Oui â€” non attÃ©nuÃ©","ja":"ã¯ã„ â€” è»½å¿«ã›ãš","r2":"2","r3":"yes-not-abated"}',    2),
(gen_random_uuid()::VARCHAR,'ICSR_DECHALLENGE','3','Unknown',              '{"en":"Unknown","fr":"Inconnu","ja":"ä¸æ˜Ž","r2":"3","r3":"unknown"}',                                           3),
(gen_random_uuid()::VARCHAR,'ICSR_DECHALLENGE','4','Not applicable',       '{"en":"Not applicable","fr":"Non applicable","ja":"è©²å½“ãªã—","r2":"4","r3":"not-applicable"}',                  4)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- â”€â”€ ICSR_RECHALLENGE â€” R2:B.4.k.16 / R3:G.k.9.i.4 â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_RECHALLENGE','1','Yes â€” reappeared',     '{"en":"Yes â€” reappeared","fr":"Oui â€” rÃ©apparu","ja":"ã¯ã„ â€” å†ç™º","r2":"1","r3":"yes-reappeared"}',            1),
(gen_random_uuid()::VARCHAR,'ICSR_RECHALLENGE','2','Yes â€” not reappeared', '{"en":"Yes â€” not reappeared","fr":"Oui â€” non rÃ©apparu","ja":"ã¯ã„ â€” å†ç™ºã›ãš","r2":"2","r3":"yes-not-reappeared"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_RECHALLENGE','3','Unknown',              '{"en":"Unknown","fr":"Inconnu","ja":"ä¸æ˜Ž","r2":"3","r3":"unknown"}',                                           3),
(gen_random_uuid()::VARCHAR,'ICSR_RECHALLENGE','4','Not applicable',       '{"en":"Not applicable","fr":"Non applicable","ja":"è©²å½“ãªã—","r2":"4","r3":"not-applicable"}',                  4)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- â”€â”€ ICSR_CAUSALITY â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_CAUSALITY','1','Certain',               '{"en":"Certain","fr":"Certain","ja":"ç¢ºå®Ÿ","r2":"1","r3":"certain"}',                                           1),
(gen_random_uuid()::VARCHAR,'ICSR_CAUSALITY','2','Probable/Likely',       '{"en":"Probable/Likely","fr":"Probable","ja":"ã»ã¼ç¢ºå®Ÿ","r2":"2","r3":"probable-likely"}',                      2),
(gen_random_uuid()::VARCHAR,'ICSR_CAUSALITY','3','Possible',              '{"en":"Possible","fr":"Possible","ja":"å¯èƒ½æ€§ã‚ã‚Š","r2":"3","r3":"possible"}',                                  3),
(gen_random_uuid()::VARCHAR,'ICSR_CAUSALITY','4','Unlikely',              '{"en":"Unlikely","fr":"Peu probable","ja":"å¯èƒ½æ€§ä½Žã„","r2":"4","r3":"unlikely"}',                              4),
(gen_random_uuid()::VARCHAR,'ICSR_CAUSALITY','5','Conditional/Unclassified','{"en":"Conditional/Unclassified","fr":"Conditionnel/Non classÃ©","ja":"æ¡ä»¶ä»˜ã/æœªåˆ†é¡ž","r2":"5","r3":"conditional-unclassified"}',5),
(gen_random_uuid()::VARCHAR,'ICSR_CAUSALITY','6','Unassessable/Unclassifiable','{"en":"Unassessable/Unclassifiable","fr":"Non Ã©valuable","ja":"è©•ä¾¡ä¸èƒ½","r2":"6","r3":"unassessable-unclassifiable"}',6),
(gen_random_uuid()::VARCHAR,'ICSR_CAUSALITY','7','Not Related',           '{"en":"Not Related","fr":"Non liÃ©","ja":"é–¢é€£ãªã—","r2":"7","r3":"not-related"}',                               7),
(gen_random_uuid()::VARCHAR,'ICSR_CAUSALITY','8','Related',               '{"en":"Related","fr":"LiÃ©","ja":"é–¢é€£ã‚ã‚Š","r2":"8","r3":"related"}',                                           8)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- â”€â”€ ICSR_LABELLING â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_LABELLING','1','Listed',                '{"en":"Listed","fr":"ListÃ©","ja":"è¨˜è¼‰ã‚ã‚Š","r2":"1","r3":"listed"}',                                           1),
(gen_random_uuid()::VARCHAR,'ICSR_LABELLING','2','Unlisted',              '{"en":"Unlisted","fr":"Non listÃ©","ja":"è¨˜è¼‰ãªã—","r2":"2","r3":"unlisted"}',                                   2),
(gen_random_uuid()::VARCHAR,'ICSR_LABELLING','3','Unknown',               '{"en":"Unknown","fr":"Inconnu","ja":"ä¸æ˜Ž","r2":"3","r3":"unknown"}',                                           3)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- â”€â”€ ICSR_DEVICE_LOCATION â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_DEVICE_LOCATION','1','Returned to manufacturer','{"en":"Returned to manufacturer","fr":"RetournÃ© au fabricant","ja":"è£½é€ æ¥­è€…ã«è¿”å´"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_DEVICE_LOCATION','2','Retained by patient',     '{"en":"Retained by patient","fr":"ConservÃ© par le patient","ja":"æ‚£è€…ãŒä¿æŒ"}',       2),
(gen_random_uuid()::VARCHAR,'ICSR_DEVICE_LOCATION','3','Retained by facility',    '{"en":"Retained by facility","fr":"ConservÃ© par l''Ã©tablissement","ja":"æ–½è¨­ãŒä¿æŒ"}', 3),
(gen_random_uuid()::VARCHAR,'ICSR_DEVICE_LOCATION','4','Disposed of',             '{"en":"Disposed of","fr":"Ã‰liminÃ©","ja":"å»ƒæ£„"}',                                      4),
(gen_random_uuid()::VARCHAR,'ICSR_DEVICE_LOCATION','5','Unknown',                 '{"en":"Unknown","fr":"Inconnu","ja":"ä¸æ˜Ž"}',                                          5)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- â”€â”€ ICSR_DEVICE_EVALUATED â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_DEVICE_EVALUATED','1','Yes',     '{"en":"Yes","fr":"Oui","ja":"ã¯ã„"}',     1),
(gen_random_uuid()::VARCHAR,'ICSR_DEVICE_EVALUATED','2','No',      '{"en":"No","fr":"Non","ja":"ã„ã„ãˆ"}',    2),
(gen_random_uuid()::VARCHAR,'ICSR_DEVICE_EVALUATED','3','Unknown', '{"en":"Unknown","fr":"Inconnu","ja":"ä¸æ˜Ž"}',3)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- â”€â”€ ICSR_DEVICE_EVAL_NOT_PROVIDED â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_DEVICE_EVAL_NOT_PROVIDED','1','Device not returned',  '{"en":"Device not returned","fr":"Dispositif non retournÃ©","ja":"æ©Ÿå™¨æœªè¿”å´"}',  1),
(gen_random_uuid()::VARCHAR,'ICSR_DEVICE_EVAL_NOT_PROVIDED','2','Device not available', '{"en":"Device not available","fr":"Dispositif non disponible","ja":"æ©Ÿå™¨ä¸åœ¨"}', 2),
(gen_random_uuid()::VARCHAR,'ICSR_DEVICE_EVAL_NOT_PROVIDED','3','Other',                '{"en":"Other","fr":"Autre","ja":"ãã®ä»–"}',                                      3)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- â”€â”€ ICSR_REMEDIAL_ACTION â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_REMEDIAL_ACTION','1','Recall',          '{"en":"Recall","fr":"Rappel","ja":"å›žåŽ"}',                                1),
(gen_random_uuid()::VARCHAR,'ICSR_REMEDIAL_ACTION','2','Correction',      '{"en":"Correction","fr":"Correction","ja":"ä¿®æ­£"}',                        2),
(gen_random_uuid()::VARCHAR,'ICSR_REMEDIAL_ACTION','3','Notification',    '{"en":"Notification","fr":"Notification","ja":"é€šçŸ¥"}',                    3),
(gen_random_uuid()::VARCHAR,'ICSR_REMEDIAL_ACTION','4','Inspection',      '{"en":"Inspection","fr":"Inspection","ja":"æ¤œæŸ»"}',                        4),
(gen_random_uuid()::VARCHAR,'ICSR_REMEDIAL_ACTION','5','Other',           '{"en":"Other","fr":"Autre","ja":"ãã®ä»–"}',                                5),
(gen_random_uuid()::VARCHAR,'ICSR_REMEDIAL_ACTION','6','None',            '{"en":"None","fr":"Aucune","ja":"ãªã—"}',                                  6)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- â”€â”€ ICSR_DEVICE_USAGE â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_DEVICE_USAGE','1','Initial use',        '{"en":"Initial use","fr":"PremiÃ¨re utilisation","ja":"åˆå›žä½¿ç”¨"}',         1),
(gen_random_uuid()::VARCHAR,'ICSR_DEVICE_USAGE','2','Reuse',              '{"en":"Reuse","fr":"RÃ©utilisation","ja":"å†ä½¿ç”¨"}',                        2),
(gen_random_uuid()::VARCHAR,'ICSR_DEVICE_USAGE','3','Unknown',            '{"en":"Unknown","fr":"Inconnu","ja":"ä¸æ˜Ž"}',                              3)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- â”€â”€ ICSR_DEVICE_OPERATOR â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_DEVICE_OPERATOR','1','Healthcare professional','{"en":"Healthcare professional","fr":"Professionnel de santÃ©","ja":"åŒ»ç™‚å°‚é–€å®¶"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_DEVICE_OPERATOR','2','Patient/User',           '{"en":"Patient/User","fr":"Patient/Utilisateur","ja":"æ‚£è€…/ä½¿ç”¨è€…"}',             2),
(gen_random_uuid()::VARCHAR,'ICSR_DEVICE_OPERATOR','3','Lay person',             '{"en":"Lay person","fr":"Non professionnel","ja":"ä¸€èˆ¬äºº"}',                      3),
(gen_random_uuid()::VARCHAR,'ICSR_DEVICE_OPERATOR','4','Unknown',                '{"en":"Unknown","fr":"Inconnu","ja":"ä¸æ˜Ž"}',                                     4)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- â”€â”€ ICSR_DEVICE_REPROCESSED â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_DEVICE_REPROCESSED','Y','Yes',     '{"en":"Yes","fr":"Oui","ja":"ã¯ã„"}',     1),
(gen_random_uuid()::VARCHAR,'ICSR_DEVICE_REPROCESSED','N','No',      '{"en":"No","fr":"Non","ja":"ã„ã„ãˆ"}',    2),
(gen_random_uuid()::VARCHAR,'ICSR_DEVICE_REPROCESSED','U','Unknown', '{"en":"Unknown","fr":"Inconnu","ja":"ä¸æ˜Ž"}',3)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- â”€â”€ ICSR_APPROVAL_TYPE â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_APPROVAL_TYPE','1','Marketing Authorization',  '{"en":"Marketing Authorization","fr":"Autorisation de mise sur le marchÃ©","ja":"è²©å£²æ‰¿èª","r2":"1","r3":"marketing-authorization"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_APPROVAL_TYPE','2','Compassionate Use',        '{"en":"Compassionate Use","fr":"Usage compassionnel","ja":"äººé“çš„ä½¿ç”¨","r2":"2","r3":"compassionate-use"}',                        2),
(gen_random_uuid()::VARCHAR,'ICSR_APPROVAL_TYPE','3','IND',                      '{"en":"IND","fr":"IND","ja":"IND","r2":"3","r3":"ind"}',                                                                          3),
(gen_random_uuid()::VARCHAR,'ICSR_APPROVAL_TYPE','4','Other',                    '{"en":"Other","fr":"Autre","ja":"ãã®ä»–","r2":"4","r3":"other"}',                                                                  4)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- â”€â”€ ICSR_DEVICE_CLASS â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_DEVICE_CLASS','I',   'Class I',   '{"en":"Class I","fr":"Classe I","ja":"ã‚¯ãƒ©ã‚¹I"}',     1),
(gen_random_uuid()::VARCHAR,'ICSR_DEVICE_CLASS','II',  'Class II',  '{"en":"Class II","fr":"Classe II","ja":"ã‚¯ãƒ©ã‚¹II"}',  2),
(gen_random_uuid()::VARCHAR,'ICSR_DEVICE_CLASS','III', 'Class III', '{"en":"Class III","fr":"Classe III","ja":"ã‚¯ãƒ©ã‚¹III"}',3),
(gen_random_uuid()::VARCHAR,'ICSR_DEVICE_CLASS','IIa', 'Class IIa', '{"en":"Class IIa","fr":"Classe IIa","ja":"ã‚¯ãƒ©ã‚¹IIa"}',4),
(gen_random_uuid()::VARCHAR,'ICSR_DEVICE_CLASS','IIb', 'Class IIb', '{"en":"Class IIb","fr":"Classe IIb","ja":"ã‚¯ãƒ©ã‚¹IIb"}',5)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- â”€â”€ ICSR_DEVICE_DEMOGRAPHIC â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_DEVICE_DEMOGRAPHIC','1','Adult',      '{"en":"Adult","fr":"Adulte","ja":"æˆäºº"}',         1),
(gen_random_uuid()::VARCHAR,'ICSR_DEVICE_DEMOGRAPHIC','2','Pediatric',  '{"en":"Pediatric","fr":"PÃ©diatrique","ja":"å°å…"}', 2),
(gen_random_uuid()::VARCHAR,'ICSR_DEVICE_DEMOGRAPHIC','3','Neonatal',   '{"en":"Neonatal","fr":"NÃ©onatal","ja":"æ–°ç”Ÿå…"}',   3),
(gen_random_uuid()::VARCHAR,'ICSR_DEVICE_DEMOGRAPHIC','4','All',        '{"en":"All","fr":"Tous","ja":"å…¨ã¦"}',              4)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- â”€â”€ ICSR_FREQ_TIME_UNIT â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_FREQ_TIME_UNIT','801','Year',   '{"en":"Year","fr":"AnnÃ©e","ja":"å¹´","r2":"801","r3":"year"}',   1),
(gen_random_uuid()::VARCHAR,'ICSR_FREQ_TIME_UNIT','802','Month',  '{"en":"Month","fr":"Mois","ja":"æœˆ","r2":"802","r3":"month"}',  2),
(gen_random_uuid()::VARCHAR,'ICSR_FREQ_TIME_UNIT','803','Week',   '{"en":"Week","fr":"Semaine","ja":"é€±","r2":"803","r3":"week"}', 3),
(gen_random_uuid()::VARCHAR,'ICSR_FREQ_TIME_UNIT','804','Day',    '{"en":"Day","fr":"Jour","ja":"æ—¥","r2":"804","r3":"day"}',      4),
(gen_random_uuid()::VARCHAR,'ICSR_FREQ_TIME_UNIT','805','Hour',   '{"en":"Hour","fr":"Heure","ja":"æ™‚é–“","r2":"805","r3":"hour"}', 5),
(gen_random_uuid()::VARCHAR,'ICSR_FREQ_TIME_UNIT','806','Minute', '{"en":"Minute","fr":"Minute","ja":"åˆ†","r2":"806","r3":"minute"}',6)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- â”€â”€ ICSR_VACC_FACILITY_TYPE â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_VACC_FACILITY_TYPE','1','Hospital',          '{"en":"Hospital","fr":"HÃ´pital","ja":"ç—…é™¢"}',                         1),
(gen_random_uuid()::VARCHAR,'ICSR_VACC_FACILITY_TYPE','2','Clinic',            '{"en":"Clinic","fr":"Clinique","ja":"ã‚¯ãƒªãƒ‹ãƒƒã‚¯"}',                    2),
(gen_random_uuid()::VARCHAR,'ICSR_VACC_FACILITY_TYPE','3','Pharmacy',          '{"en":"Pharmacy","fr":"Pharmacie","ja":"è–¬å±€"}',                       3),
(gen_random_uuid()::VARCHAR,'ICSR_VACC_FACILITY_TYPE','4','Public health',     '{"en":"Public health","fr":"SantÃ© publique","ja":"å…¬è¡†è¡›ç”Ÿ"}',          4),
(gen_random_uuid()::VARCHAR,'ICSR_VACC_FACILITY_TYPE','5','Military',          '{"en":"Military","fr":"Militaire","ja":"è»"}',                         5),
(gen_random_uuid()::VARCHAR,'ICSR_VACC_FACILITY_TYPE','6','Other',             '{"en":"Other","fr":"Autre","ja":"ãã®ä»–"}',                            6)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- â”€â”€ ICSR_VACC_ANAT_SITE â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_VACC_ANAT_SITE','1','Left arm',          '{"en":"Left arm","fr":"Bras gauche","ja":"å·¦è…•"}',                         1),
(gen_random_uuid()::VARCHAR,'ICSR_VACC_ANAT_SITE','2','Right arm',         '{"en":"Right arm","fr":"Bras droit","ja":"å³è…•"}',                         2),
(gen_random_uuid()::VARCHAR,'ICSR_VACC_ANAT_SITE','3','Left thigh',        '{"en":"Left thigh","fr":"Cuisse gauche","ja":"å·¦å¤§è…¿"}',                   3),
(gen_random_uuid()::VARCHAR,'ICSR_VACC_ANAT_SITE','4','Right thigh',       '{"en":"Right thigh","fr":"Cuisse droite","ja":"å³å¤§è…¿"}',                  4),
(gen_random_uuid()::VARCHAR,'ICSR_VACC_ANAT_SITE','5','Other',             '{"en":"Other","fr":"Autre","ja":"ãã®ä»–"}',                                5)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- â”€â”€ ICSR_THERAPY_SITE â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_THERAPY_SITE','1','Left arm',            '{"en":"Left arm","fr":"Bras gauche","ja":"å·¦è…•"}',                         1),
(gen_random_uuid()::VARCHAR,'ICSR_THERAPY_SITE','2','Right arm',           '{"en":"Right arm","fr":"Bras droit","ja":"å³è…•"}',                         2),
(gen_random_uuid()::VARCHAR,'ICSR_THERAPY_SITE','3','Left thigh',          '{"en":"Left thigh","fr":"Cuisse gauche","ja":"å·¦å¤§è…¿"}',                   3),
(gen_random_uuid()::VARCHAR,'ICSR_THERAPY_SITE','4','Right thigh',         '{"en":"Right thigh","fr":"Cuisse droite","ja":"å³å¤§è…¿"}',                  4),
(gen_random_uuid()::VARCHAR,'ICSR_THERAPY_SITE','5','Abdomen',             '{"en":"Abdomen","fr":"Abdomen","ja":"è…¹éƒ¨"}',                              5),
(gen_random_uuid()::VARCHAR,'ICSR_THERAPY_SITE','6','Other',               '{"en":"Other","fr":"Autre","ja":"ãã®ä»–"}',                                6)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;


-- ── 03_CODELIST_640.sql ──
-- ============================================================
-- Script  : 03_CODELIST_640.sql â€” Lab Tests + Literature codelists
-- Reused (values verified):
--   ICSR_CODING_TYPE â€” Dictionary/Manual/VTA/Intelligent/Rejected
--                      (03_CODELIST_540.sql) âœ“
-- New codelists:
--   ICSR_LAB_RESULT_CODE â€” structured test result qualifier
--   ICSR_LAB_UNIT        â€” common lab test units
-- ============================================================


INSERT INTO CODE_LIST_LIB (ID, CODE_LIST_ID, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_LAB_RESULT_CODE','ICSR Lab Test Result Code (R2:B.3.1.e / R3:F.r.3.2)'),
(gen_random_uuid()::VARCHAR,'ICSR_LAB_UNIT',       'ICSR Lab Test Result Unit (R2:B.3.1.d / R3:F.r.3.1)')
ON CONFLICT (CODE_LIST_ID) DO NOTHING;

-- â”€â”€ ICSR_LAB_RESULT_CODE â€” R2:B.3.1.e / R3:F.r.3.2 â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_LAB_RESULT_CODE','1','Positive',
    '{"en":"Positive","fr":"Positif","ja":"é™½æ€§","r2":"1","r3":"positive"}',1),
(gen_random_uuid()::VARCHAR,'ICSR_LAB_RESULT_CODE','2','Negative',
    '{"en":"Negative","fr":"NÃ©gatif","ja":"é™°æ€§","r2":"2","r3":"negative"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_LAB_RESULT_CODE','3','Borderline',
    '{"en":"Borderline","fr":"Limite","ja":"å¢ƒç•Œå€¤","r2":"3","r3":"borderline"}',3),
(gen_random_uuid()::VARCHAR,'ICSR_LAB_RESULT_CODE','4','Inconclusive',
    '{"en":"Inconclusive","fr":"Non concluant","ja":"ä¸ç¢ºå®š","r2":"4","r3":"inconclusive"}',4),
(gen_random_uuid()::VARCHAR,'ICSR_LAB_RESULT_CODE','5','Not done',
    '{"en":"Not done","fr":"Non effectuÃ©","ja":"æœªå®Ÿæ–½","r2":"5","r3":"not-done"}',5),
(gen_random_uuid()::VARCHAR,'ICSR_LAB_RESULT_CODE','6','Unknown',
    '{"en":"Unknown","fr":"Inconnu","ja":"ä¸æ˜Ž","r2":"6","r3":"unknown"}',6)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- â”€â”€ ICSR_LAB_UNIT â€” R2:B.3.1.d / R3:F.r.3.1 â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR,'ICSR_LAB_UNIT','mg/dL',  'mg/dL',   '{"en":"mg/dL","fr":"mg/dL","ja":"mg/dL"}',   1),
(gen_random_uuid()::VARCHAR,'ICSR_LAB_UNIT','mmol/L', 'mmol/L',  '{"en":"mmol/L","fr":"mmol/L","ja":"mmol/L"}',2),
(gen_random_uuid()::VARCHAR,'ICSR_LAB_UNIT','g/dL',   'g/dL',    '{"en":"g/dL","fr":"g/dL","ja":"g/dL"}',      3),
(gen_random_uuid()::VARCHAR,'ICSR_LAB_UNIT','IU/L',   'IU/L',    '{"en":"IU/L","fr":"IU/L","ja":"IU/L"}',      4),
(gen_random_uuid()::VARCHAR,'ICSR_LAB_UNIT','U/L',    'U/L',     '{"en":"U/L","fr":"U/L","ja":"U/L"}',         5),
(gen_random_uuid()::VARCHAR,'ICSR_LAB_UNIT','mcg/L',  'mcg/L',   '{"en":"mcg/L","fr":"mcg/L","ja":"mcg/L"}',   6),
(gen_random_uuid()::VARCHAR,'ICSR_LAB_UNIT','ng/mL',  'ng/mL',   '{"en":"ng/mL","fr":"ng/mL","ja":"ng/mL"}',   7),
(gen_random_uuid()::VARCHAR,'ICSR_LAB_UNIT','pg/mL',  'pg/mL',   '{"en":"pg/mL","fr":"pg/mL","ja":"pg/mL"}',   8),
(gen_random_uuid()::VARCHAR,'ICSR_LAB_UNIT','mEq/L',  'mEq/L',   '{"en":"mEq/L","fr":"mEq/L","ja":"mEq/L"}',   9),
(gen_random_uuid()::VARCHAR,'ICSR_LAB_UNIT','%',      '%',       '{"en":"%","fr":"%","ja":"%"}',               10),
(gen_random_uuid()::VARCHAR,'ICSR_LAB_UNIT','x10^9/L','x10â¹/L',  '{"en":"x10â¹/L","fr":"x10â¹/L","ja":"x10â¹/L"}',11),
(gen_random_uuid()::VARCHAR,'ICSR_LAB_UNIT','other',  'Other',   '{"en":"Other","fr":"Autre","ja":"ãã®ä»–"}',   12)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

