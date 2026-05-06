
var _activeModuleId = sessionStorage.getItem('md_active_module') || null;   /* tracks the currently displayed module */

function initMetadaDynaApp(){
	//Load the cached menu registry from sessionStore
	
	AppMenuHeader.build();	
	AppMenuHeader.navigate();
}

let typingDelay;
let msComboSeaching = false;

function registerAppClickEvents(){
	//Closing Menu-drawer on outside panel click
	document.addEventListener('click', function(e) {
		let currMenuWrap = $(e.target).parents('.menu-wrapper').find('.md-dropdown__menu');
		$('.md-dropdown__menu').not(currMenuWrap).removeClass('open');
		
		let currMsCombo = $(e.target).parents('.md-msc').find('.md-msc__panel');
		$('.md-msc__panel').not(currMsCombo).removeClass('open');
		
		//Toggle Generic Menu drawer open/close
		//MS-Combo option drawer
		if($(e.target).parents('.md-ms-combo-down')[0] || $(e.target).hasClass('md-ms-combo-down') || $(e.target).hasClass('md-msc__tags') || $(e.target).hasClass('md-msc__control')){
			$(currMsCombo).toggleClass('open');
			if($(currMsCombo).hasClass('open')){
				//If the previous search has some text then clear it while opening combo option drawer
				$(currMsCombo).find('.md-ms-combo-search').val('')					
				AppFORM.msComboSearch($(currMsCombo).find('.md-ms-combo-search')[0]);
				
				$(currMsCombo).find('.md-ms-combo-search').focus();
			}
			
		}
		//Menu drawer 
		if($('.menu-btn-cmp').has(e.target)[0] || $(e.target).hasClass('menu-btn-cmp')){
			$(currMenuWrap).toggleClass('open');
		}
		
		//Handle Generic Menu item click handlers
		if($('.md-dropdown__menu__item').has(e.target)[0] || $(e.target).hasClass('md-dropdown__menu__item')){
			currMenuWrap = $(currMenuWrap[0]).parents('.menu-wrapper')[0];
			let menuHandler = currMenuWrap.getAttribute('menu-handler');
			if(currMenuWrap && menuHandler){
				let menuItemCmp = $(e.target).hasClass('md-dropdown__menu__item') ? e.target : $(e.target).parents('.md-dropdown__menu__item')[0];
				
				if(menuItemCmp){
					
					if(menuHandler.indexOf('.') > 0){
						let handlerSplit = menuHandler.split('.');
						if(handlerSplit.length > 1 && window[handlerSplit[0]] && typeof window[handlerSplit[0]][handlerSplit[1]] === 'function' ){
							menuHandler = window[handlerSplit[0]][handlerSplit[1]];
						}
					} else if(window[menuHandler] === "function"){
						menuHandler = window[menuHandler];
					}
					if (typeof menuHandler === "function") {
						menuHandler(menuItemCmp); // Call the function dynamically
					}
				}
			}
		}
		
		//Handle Generic multi-select combo option select handler [md-msc__option]
		if($(e.target).parents('.md-msc__option')[0] || $(e.target).hasClass('md-msc__option')){
			let mscOptCmp = $(e.target).hasClass('md-msc__option') ? e.target : $(e.target).parents('.md-msc__option')[0];
			AppFORM.msComboSel(mscOptCmp);
			$(e.target).parents('.md-msc').find('.md-ms-combo-search').focus();
		}
		
		//Handle Multi-select combo selcted value clear [md-ms-combo-clear]
		if($(e.target).parents('.md-ms-combo-clear')[0] || $(e.target).hasClass('md-ms-combo-clear')){
			let mscOptCmp = $(e.target).parents('.md-msc__tag')[0];
			AppFORM.msComboSel(mscOptCmp);
		}
		
		
		/******** APP Menu handlers ***********/
		//Register onclick event for the menu item.
		if($(e.target).parents('.menu-item')[0] || $(e.target).hasClass('menu-item')){
			
			let menuCmp = $(e.target).hasClass('menu-item') ? e.target : $(e.target).parents('.menu-item')[0];
			AppMenuHeader.setMenu(menuCmp);
		}
		
		if($(e.target).parents('.menu-drawer__close')[0] || $(e.target).hasClass('menu-drawer__close')){			
			AppMenuHeader.toggle(e.target);
		}
		
		
		/********** Data Listing Page handlers ******/
		//Clear Filter handler [ls-filter-clear]
		if($('.ls-filter-clear').has(e.target)[0] || $(e.target).hasClass('ls-filter-clear')){
			AppListScreen.clearFilter(e.target);
		}
		
		//New Record handler [ls-btn-new]
		if($('.listing-container .ls-btn-new').has(e.target)[0] || $(e.target).hasClass('ls-btn-new')){
			AppFORM.open(null);			
		}
		
		//RecordEdit handler [ls-btn-edit]
		if($('.listing-container .ls-btn-edit').has(e.target)[0] || $(e.target).hasClass('ls-btn-edit')){
			let dataRecId = $('.listing-container .ls-data-rec').has(e.target).attr('id');
			AppFORM.open(dataRecId);
		}
		
		//Column Sorting handler [ls-table-field']
		if($('.ls-table-field').has(e.target)[0] || $(e.target).hasClass('ls-table-field')){
			//ls-table-field
			let tdCmp = $(e.target).hasClass('ls-table-field') ? e.target : $('.ls-table-field').has(e.target)[0];
			if($(tdCmp).find('.ls-sort-icon')[0]){
				AppListScreen.sort(tdCmp);
			}
		}
		
		//Pagination Button handler [ls-pg-btn] : page prev page/indexed button/last page 
		if($('.ls-pagination-bar .ls-pg-btn').has(e.target)[0] || $(e.target).hasClass('ls-pg-btn')){
			//ls-table-field
			let pageBtn = $(e.target).hasClass('ls-pg-btn') ? e.target : $('.ls-pg-btn').has(e.target)[0];
			AppListScreen.pagination(pageBtn);
			
		}
		
		//Pagination Button handler [ls-pg-btn] : page prev page/indexed button/last page 
		if($('.lookup-container .ls-row-chk').has(e.target)[0] || $(e.target).hasClass('ls-row-chk')){
			//ls-table-field
			let chkCmp = $(e.target).hasClass('ls-row-chk') ? e.target : $('.ls-row-chk').has(e.target)[0];
			AppListScreen.selectRec(chkCmp);
			
		}
		
		
		
		/******* Data Edit Forms handlers ********/		
		//Form Action buttons handler [md-form-btns]
		if($('.case-edit-app .md-form-btns').has(e.target)[0] || $(e.target).hasClass('md-form-btns')){
			//ls-table-field
			let actionBtn = $(e.target).hasClass('md-form-btns') ? e.target : $('.md-form-btns').has(e.target)[0];
			AppFORM.action(actionBtn);
			
		}
		
		//Form Left navigation handler collapse handler [md-nav__collapse-btn]
		if($(e.target).parents('.case-edit-app .md-nav .md-nav__collapse-btn')[0] || $(e.target).hasClass('md-nav__collapse-btn')){
			//ls-table-field
			let navHideBtn = $(e.target).hasClass('md-nav__collapse-btn') ? e.target : $('.md-nav__collapse-btn').has(e.target)[0];
			AppFORM.toggleNav(navHideBtn);
			
		}
		
		//Form Left navigation handler [md-nav__item]
		if($('.case-edit-app .md-nav__item').has(e.target)[0] || $(e.target).hasClass('md-nav__item')){
			//ls-table-field
			let secItem = $(e.target).hasClass('md-nav__item') ? e.target : $('.md-nav__item').has(e.target)[0];
			AppFORM.navigate(secItem);
			
		}
		
		//Form Tab click handler [.md-tab]
		if($('.case-edit-app .md-tabbar .md-tab').has(e.target)[0] || $(e.target).hasClass('md-tab')){
			//ls-table-field
			let tabCmp = $(e.target).hasClass('md-tab') ? e.target : $('.md-tab').has(e.target)[0];
			AppFORM.tab(tabCmp);
			
		}
		
		//Section Panel collapse handler [md-panel__header]
		if($('.case-edit-app .md-panel__header').has(e.target)[0] || $(e.target).hasClass('md-panel__header')){
			//ls-table-field
			let panelHeadCMp = $(e.target).hasClass('md-panel__header') ? e.target : $('.md-panel__header').has(e.target)[0];
			AppFORM.togglePanel(panelHeadCMp);
			
		}
		//Section Grid Panel collapse handler [md-grid__toolbar-left]
		if($('.case-edit-app .md-grid__toolbar-left').has(e.target)[0] || $(e.target).hasClass('md-grid__toolbar-left')){
			//ls-table-field
			let panelHeadCMp = $(e.target).hasClass('md-grid__toolbar-left') ? e.target : $('.md-grid__toolbar-left').has(e.target)[0];
			AppFORM.togglePanel(panelHeadCMp);
			
		}
		
		//Multi-Ctx grid Rec row checkbox click handler [multi-ctx-rec-wraper]
		if($('.multi-ctx-rec-wraper').has(e.target)[0]){			
			AppFORM.mcRecChk(e.target);
		}
		
		//Form Multi-Ctx grid sort click handler [md-grid-col-sort]
		if($('.case-edit-app .md-grid .md-grid-col-sort').has(e.target)[0] || $(e.target).hasClass('md-grid-col-sort')){
			//ls-table-field
			let sortCol = $(e.target).hasClass('md-grid-col-sort') ? e.target : $('.md-grid-col-sort').has(e.target)[0];
			AppFORM.sort(sortCol);
			
		}
		
		//Form Multi-Ctx grid add click handler [mc-sec-add]
		if($('.case-edit-app .mc-sec-add').has(e.target)[0] || $(e.target).hasClass('mc-sec-add')){
			//ls-table-field
			let addBtnCmp = $(e.target).hasClass('mc-sec-add') ? e.target : $('.mc-sec-add').has(e.target)[0];
			AppFORM.insert(addBtnCmp);
			
		}
		
		//Form Multi-Ctx grid add click handler [mc-sec-copy]
		if($('.case-edit-app .mc-sec-copy').has(e.target)[0] || $(e.target).hasClass('mc-sec-copy')){
			//ls-table-field
			let addBtnCmp = $(e.target).hasClass('mc-sec-copy') ? e.target : $('.mc-sec-copy').has(e.target)[0];
			AppFORM.copy(addBtnCmp);
			
		}
		
		//Form Multi-Ctx grid delete click handler [mc-sec-delete]
		if($('.case-edit-app .mc-sec-delete').has(e.target)[0] || $(e.target).hasClass('mc-sec-delete')){
			//ls-table-field
			let delBtnCmp = $(e.target).hasClass('mc-sec-delete') ? e.target : $('.mc-sec-delete').has(e.target)[0];
			AppFORM.delete(delBtnCmp);
			
		}
		
		//Form Multi-Ctx grid pagination [md-grid__page-btn]
		if($('.case-edit-app .md-grid__page-btn').has(e.target)[0] || $(e.target).hasClass('md-grid__page-btn')){
			//ls-table-field
			let delBtnCmp = $(e.target).hasClass('md-grid__page-btn') ? e.target : $('.md-grid__page-btn').has(e.target)[0];
			AppFORM.pager(delBtnCmp);
			
		}
	
		//Handle Form Multi-context record edit operation [md-mc-rec-edit]
		if($('.case-edit-app .md-grid .md-mc-rec-edit').has(e.target)[0] || $(e.target).hasClass('md-mc-rec-edit')){
			//ls-table-field
			let editBtn = $(e.target).hasClass('md-mc-rec-edit') ? e.target : $('.md-mc-rec-edit').has(e.target)[0];
			AppFORM.mcRecEdit(editBtn);
			
		}
		
		//Handle Form Breadcrum back navigation on multi-context sections [mc-nav-back]
		if($('.case-edit-app .mc-nav-back').has(e.target)[0] || $(e.target).hasClass('mc-nav-back')){
			//ls-table-field
			let editBtn = $(e.target).hasClass('mc-nav-back') ? e.target : $('.mc-nav-back').has(e.target)[0];
			AppFORM.mcCtxback(editBtn);
			
		}
		
		//Handle Form Lookup click [md-lookup__lens]
		if($(e.target).parents('.md-lookup__lens')[0] || $(e.target).hasClass('md-lookup__lens')  || $(e.target).hasClass('md-lkp__tags') || $(e.target).hasClass('md-lkp__control')){
			//ls-table-field
			let lkpBtn = $(e.target).hasClass('md-lookup__lens') ? e.target : $(e.target).parents('.md-lookup').find('.md-lookup__lens')[0];
			AppFORM.lookup(lkpBtn);
			
		}
		
		//Handle Form Lookup data selection clear [md-lookup__clear]
		if($(e.target).parents('.case-edit-app')[0] && ($(e.target).parents('.md-lookup-clear')[0] || $(e.target).hasClass('md-lookup-clear'))){
			//ls-table-field
			let lkpBtn = $(e.target).hasClass('md-lookup-clear') ? e.target : $('.md-lookup-clear').has(e.target)[0];
			AppFORM.clearLookup(lkpBtn);
			
		}
		
		//Handle switch input component changes [md-switch__track]
		if($(e.target).parents('.case-edit-app')[0] && ($(e.target).parents('.md-switch__track')[0] || $(e.target).hasClass('md-switch__track'))){
			//ls-table-field
			let switchCmp = $(e.target).hasClass('md-switch__track') ? e.target : $('.md-switch__track').has(e.target)[0];
			AppFORM.valSwitch(switchCmp);
			
		}
		
		//Open the form Error popup [app-bar__err-btn]
		if($(e.target).parents('.case-edit-app')[0] && ($(e.target).parents('.app-bar__err-btn')[0] || $(e.target).hasClass('app-bar__err-btn'))){
			//ls-table-field
			let errBtn = $(e.target).hasClass('app-bar__err-btn') ? e.target : $('.app-bar__err-btn').has(e.target)[0];
			AppFORM.errorWin(errBtn);
			
		}
	});
	
	document.addEventListener('input', function(e) {
		
		if(e.target.className === 'md-msc__search md-ms-combo-search'){
			const value = event.target.value;

			clearTimeout(typingDelay);

			typingDelay = setTimeout(() => {
				msComboSeaching = true;
				AppFORM.comboSearch(e.target);
				msComboSeaching = false;
			}, msComboSeaching ? 1000 : 500);	
			
		}		
		
	});
	
	document.addEventListener('change', function(e) {
				
		//Handle the Data Listing filters
		if($('.ls-filter-panel').has(e.target)[0]){
			//console.log('Data Listing filter changes: ' + e.target.value);
			AppListScreen.filter(e.target);
		}
		
		//Handle the Data Listing Page size
		if($('.listing-container .ls-pagination-bar').has(e.target)[0]){
			//console.log('Data Listing filter changes: ' + e.target.value);
			AppListScreen.pageSize(e.target);
		}
		
		//Handle the Form Grid Page size
		if($('.case-edit-app .md-grid__pagination').has(e.target)[0]){
			//console.log('Data Listing filter changes: ' + e.target.value);
			AppFORM.pageSize(e.target);
		}
		
		
		//Handle Main Form data fields changes
		if($('.case-edit-app').has(e.target)[0]){
			//console.log('Data Record field changes: ' + e.target.value);
			AppFORM.editField(e.target);
		}
		
		//Handle Linked Modules data fields changes
	});	
}

function selectLookup(){
	AppListScreen.select();
}

function closeLookup(){
	$('.module-lookup').hide();
}

function selectAppLanguage(currCmp) {
	let langCode = currCmp.getAttribute('langCode');
	langCode = langCode ? langCode : 'en';
	
	AppI18N.setAppLang(langCode);
	$('#appBarLangCode').text(LANG_META[langCode].short);
	
	$('#appBarLangMenu').removeClass('open');
	$('#langBtn').attr('aria-expanded', 'false');
	initMetadaDynaApp();	
}
	
/* -------------------- Utils Functions ----------------------------*/

/* ── Generate a negative timestamp-based ID for new (unsaved) records ─── */
function generateUUID() {
  return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
    const r = Math.random() * 16 | 0;
    const v = c === 'x' ? r : (r & 0x3 | 0x8);
    return v.toString(16);
  });
}

function getCtxByPath(ctxPath, jsonObj, ctxIds, initMcObject){
	let pathArr = (ctxPath && ctxPath.split('.')) || [];
	let ctxObj = jsonObj;
	let idMap = ctxIds || {};
	
	for(let p of pathArr){
		let currCtx = p.replace('$', '');
		if(!ctxObj){
			break;
		}
		
		
		if(!ctxObj[currCtx]){
			if(p.indexOf('$') > 0){
				//Multi-ctx Section
				ctxObj[currCtx] = [];
			} else {
				ctxObj[currCtx] = {};
			}
			
		}
		
		if( (p.indexOf('$') < 0 && Array.isArray(ctxObj[currCtx])) || 
			(p.indexOf('$') > 0 && !Array.isArray(ctxObj[currCtx]))){
				
			//Break on all invalid multi-context context structure
			ctxObj = null;
			break;				
		}
		
		if(Array.isArray(ctxObj[currCtx]) && idMap[p]){
			if(initMcObject) {
				if(!ctxObj[currCtx].filter(r=>r.id == idMap[p])[0]){
					let newObj = {id:idMap[p]};
					ctxObj[currCtx].push(newObj);
				}
			}
			ctxObj = ctxObj[currCtx].filter(r=>r.id == idMap[p])[0];			
		} else {
			ctxObj = ctxObj[currCtx];
		}
	}
	
	return ctxObj;
}

function _getFieldValue(fMd, jsonObj, ctxIds){
	let flPath = fMd.fieldPath;
	if(!flPath){
		//return empty if the flPath is ivalid or no ctxIds for multi context paths
		return '';
	}
	
	let parentCtxPath = flPath.indexOf('.') > 0 ? flPath.substr(0, flPath.lastIndexOf('.')) : null;
	let flName = flPath.indexOf('.') > 0 ? flPath.substr(flPath.lastIndexOf('.')+1) : flPath;
	
	let ctxObj = getCtxByPath(parentCtxPath, jsonObj, ctxIds) || {};
	
	if(Array.isArray(ctxObj) || !ctxObj[flName] || typeof (ctxObj[flName]) === 'object'){
		return '';
	}
	
	return ctxObj[flName];	
}
