/**
 * AppI18n — lightweight helper loaded globally.
 * MetaDyna — App-level, module, and codelist i18n translations are handled.
 * App-level will be loaded once at startup; accessed via window.AppI18n.t(key).
 * Module level will be registered first on metadata load AppI18n.load(moduleId, transObj); and access via AppI18n.mT(key, modId)
 * Codelist level will be accessed via AppI18n.clT(clCode, clId, clDecode)
 */
 
(function (global) {
  console.log('Initializing App I18N')
  let _appLang = sessionStorage.getItem('md_lang') || 'en';
  let _module_trans = {};
  
  function _lang() {
    return _appLang;
  }
  function setAppLang(langCode){
	  _appLang = langCode;
	  sessionStorage.setItem('md_lang', langCode);
  }
  function loadModuleTrans(moduleId, transObj){
	  _module_trans[moduleId] = transObj;
	  
  }
  function t(key) {
    var map  = window.APP_I18N_TRANS;
    return (map[_appLang] && map[_appLang][key])
        || (map['en'] && map['en'][key])
        || key;
  }
  
  //Module translated labels
  function mT(key, moduleId) {
    return (_module_trans[moduleId] && _module_trans[moduleId][_appLang] && _module_trans[moduleId][_appLang][key])
        || (_module_trans[moduleId] && _module_trans[moduleId]['en'] && _module_trans[moduleId]['en'][key])
        || key;
  }
  
  //Codelist translated labels
  function clT(clCode, clId, decode) {
	let clCodeObj = AppCL.trans(clCode, clId);
    var lang = _lang();
    return (clCodeObj && clCodeObj[_appLang])
        || (clCodeObj && clCodeObj['en'])
        || clCodeObj.decode
		|| decode
		|| clCode;
  }

	
	function buildLoginPageLangDropdown() {
		let langHtml = [];
		for(code in LANG_META){
			langHtml.push(`
				<div class="lang-option ${_appLang == code ? ' active' : ''}" role="option" aria-selected="${_appLang}" langCode="${code}" onclick="selectAppLanguage(this)">
				  <span class="lang-flag">${LANG_META[code].flag}</span>
				  <span>${LANG_META[code].label}</span>
				</div>
			`);
		}
		return langHtml.join('');
	}

	function buildAppLangDropdown(){
		let langHtml = [];
		for(code in LANG_META){
			langHtml.push(`
				<div class="md-dropdown__menu__item ${_appLang == code ? ' active' : ''} role="option" aria-selected="${_appLang}" langCode="${code}">
				  <span style="font-weight:700;min-width:28px;display:inline-block">${LANG_META[code].short}</span>
				  <span>${LANG_META[code].label}</span>
				</div>
			`);
		}
		return langHtml.join('');
	}
	
	function getI18nLabel(transObj, fallBackLabel) {
		let transJson = {};
		try{
			transJson = typeof transObj === 'string' ? JSON.parse(transObj) : transObj;
		
		}catch(err){
			
		}
		transJson = !transJson ? {} : transJson;
		return transJson[_appLang] || transJson['en'] || fallBackLabel;
		
	}

  global.AppI18N = { t: t , mT:mT, clT:clT, trans:getI18nLabel, setAppLang:setAppLang, lang:_lang, moduleTrans:loadModuleTrans, loginI18nCombo:buildLoginPageLangDropdown, appI18nCombo:buildAppLangDropdown};
}(window));


 
