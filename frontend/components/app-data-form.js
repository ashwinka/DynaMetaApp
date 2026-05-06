(function(global){
	let _isNew    	= false;
	let _recId 		= null;
	let _dataJson 	= {};
	let _editJson 	= {};
	let _delRecJson = {};
	let _errors = [];
	
	let _moduleId = null;
	let _formMD = {};
	let _activeForm = null;
	let _sectionCache = {};
	let _fieldsCache = {};
	let _renderRulesComutations = {};
	 
	 
	/*navStack maintains the section navigation flows and multi-context data record ids*/
	let _navStack 	= []; //sectionId, tabSecId, mcRecId, ctxIds:{}
	let _mcGridState	= {}; //Multi-context grid state like page index, sorting info, selected record ids.
	
	function _getRecordTitle(form) {
		const titlePath = _activeForm?.layout?.recordTitleField;
		if (!titlePath || !_dataJson) return null;
		const parts = titlePath.split('.');
		let cur = _dataJson;
		for (const p of parts) {
		  if (cur === null || cur === undefined || typeof cur !== 'object') return null;
		  cur = cur[p];
		}
		return (cur !== null && cur !== undefined && String(cur).trim() !== '') ? String(cur) : null;
	}
	
	function icon(name, extraClass = '') {
		const svg = ICONS[name] || ICONS.info;
		if (extraClass) {
			return svg.replace('<svg', `<svg class="${extraClass}"`);
		}
		return svg;
	}
	
	function showErrorPopup(){
		let errorJson = _errors;
		if (!errorJson || errorJson.length === 0) return;

		const ERR_TYPE = {
			ERROR: {
				rowClass:    'err-row--error',
				label: AppI18N.t('Errors'),
				iconColor:   'var(--md-error)',
				icon: `<svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/></svg>`
			},
			WARNING: {
				rowClass:    'err-row--warning',
				label: AppI18N.t('Warnings'),
				iconColor:   'var(--md-warning)',
				icon: `<svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z"/><line x1="12" y1="9" x2="12" y2="13"/><line x1="12" y1="17" x2="12.01" y2="17"/></svg>`
			},
			INFO: {
				rowClass:    'err-row--info',
				label: AppI18N.t('Infos'),
				iconColor:   'var(--md-primary)',
				icon: `<svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><line x1="12" y1="16" x2="12" y2="12"/><line x1="12" y1="8" x2="12.01" y2="8"/></svg>`
			}
		};
		
		const priority = { ERROR: 1, WARNING: 2, INFO: 3 };

		// Count by type
		const counts = { ERROR: 0, WARNING: 0, INFO: 0 };
		errorJson.forEach(e => { const t = e.severity || 'ERROR'; if (counts[t] !== undefined) counts[t]++; });
		const total = counts.ERROR + counts.WARNING + counts.INFO;

		// Build rows grouped by type order: error → warning → info
		sorted = errorJson.sort((a, b) => priority[a.severity] - priority[b.severity]);
		
		const rows = sorted.map(e => {
			const cfg = ERR_TYPE[e.severity || 'ERROR'];
			const ctxParts = 'CTX'
			return `
			<div class="err-row ${cfg.rowClass}">
				<div class="err-row__icon" style="color:${cfg.iconColor}">${cfg.icon}</div>
				<div class="err-row__body">
					<div class="err-row__message">
					  <span class="err-type-badge err-type-badge--${e.severity || 'ERROR'}">${(e.severity || 'ERROR').toUpperCase()}</span>
					  <span>${e.message}</span>
					</div>
					<div class="err-row__meta">						
						${e.ruleId ? `<span class="err-rule">Rule: ${e.ruleId}</span>` : ''}
						${ctxParts ? `<span class="err-ctx-label">Context:</span>${ctxParts}` : ''}
						<span class="err-field-id">Field: ${_activeForm.fieldsCache[e.fieldId] ?AppI18N.mT(_activeForm.fieldsCache[_errors[0].fieldId].label, _moduleId) : 'e.fieldId'}</span>
						
					</div>
				</div>
				<button class="err-nav-btn" title="Go to field"
					onclick="navigateToField('${e.fieldId}', ${JSON.stringify(e.ctxIds || {})})">
					<svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
						<polyline points="9 18 15 12 9 6"/>
					</svg>
					Go to field
				</button>
			</div>`;
		}).join('');

		// Header: show highest severity present
		const headerType = counts.ERROR > 0 ? 'ERROR' : counts.warning > 0 ? 'WARNING' : 'INFO';
		const headerCfg  = ERR_TYPE[headerType];
		const headerTitle = counts.ERROR > 0 ? 'Validation Errors' : counts.warning > 0 ? 'Validation Warnings' : 'Validation Info';
		const summaryMsg  = 'Please review the below errors:'

		// Count badges in header
		let countBadges = [];
		for(let sev in counts){
			if(counts[sev] > 0){
				countBadges.push(`<span class="err-count-badge err-count-badge--${sev}">${ERR_TYPE[sev]?.label} ${counts[sev]}</span>`)
			}
		}
	
		
		$('#errorPopupBackdrop #errPopupTitle').html(`<span>${headerCfg.icon}</span>${headerTitle}<span style="display:flex; gap:4px; margin-left:4px;    align-items: center;flex-direction: row;">${countBadges.join('')}</span>`);
		$('#errorPopupBackdrop .err-summary').html(summaryMsg)
		$('#errorPopupBackdrop .err-list').html(rows)
		
		$('#errorPopupBackdrop').show();
	}
	
	
	function _buildBreadcrumb(secMd){
		let bc = [];
		
		if(_navStack.length > 1){
			bc.push(`<button class="md-btn md-btn--primary mc-nav-back" style="height:20px;">${icon('back')}</button>`);
		}
		for(let sec of _navStack){
			let secMd = _sectionCache[sec.sectionId];
			if(secMd){
				bc.push(`<span class="md-breadcrumb__item">${AppI18N.mT(secMd.title, _moduleId)}</span>`);
			}
		}
		return bc.join(' / ');
	}
	
	function _getGridState(ctxPath){
		if(!ctxPath)return {};
		if(!_mcGridState[ctxPath]){_mcGridState[ctxPath] = {sortFieldId:'id', sortDir:'ASC', pageSize:5, pageInd:1, selctions:{}}}
		return _mcGridState[ctxPath];
	}
	
	function toggleNavPanel(currCmp){
		$(currCmp).parents('.md-nav').toggleClass('hide')
		$(currCmp).toggleClass('hide')
	}
	
		
	function msComboSearchHandler(srchCmp){
		let fieldId = $(srchCmp).parents('.md-msc').attr('fieldId');
		let flMd = fieldId && _fieldsCache[fieldId];
		let optVal = $(srchCmp).attr('value');
		if(!fieldId || !flMd || !flMd.fieldPath){
			return;
		}
		let flPath = flMd?.fieldPath;
		let flName = flPath && flPath.indexOf('.') > 0 ? flPath.substr(flPath.lastIndexOf('.')+1) : flPath;
		
		//Set data to the _dataJson and _editJson
		let navObj = _navStack.at(-1);
		let ctxIds = navObj?.ctxIds || {};		
		let secPath = flPath.indexOf('.') > 0 ? flPath.substr(0, flPath.lastIndexOf('.')) : null;
		let ctxObj = getCtxByPath(secPath, _dataJson, ctxIds);
		
		let currSelVals = (flName && ctxObj[flName]) || ''
		let currValArr = currSelVals ? currSelVals.split('|') : [];
				
		let storeFormat = flMd.storeFormat === 'FIELDS' ? 'FIELDS' : 'TEXT'
		let storeFlMapping = storeFormat === 'FIELDS' && flMd.storeFieldMappings;
		let storeFlName = null;
		
		if(typeof storeFlMapping === 'object'){
			storeFlName = storeFlMapping[optVal];
			currValArr = [];
			for(let code in storeFlMapping){
				let fl = storeFlMapping[code];
				if(fl && ctxObj[fl] == 'Y'){
					currValArr.push(code);
				}
			}			
		}
		let selVals = currValArr.reduce((acc, key) => {
			  acc[key] = "Y";
			  return acc;
		}, {});
		
		let clValues = (flMd.codelist && AppCL.values(flMd.codelist)) || [];
		if(clValues.length == 0 && Array.isArray(flMd.codelistVal)){
			clValues = flMd.codelistVal;
		}
		
		//Perform Search
		
		let searchStr = srchCmp.value;
		if(searchStr){
			searchStr = searchStr.toLowerCase().trim();
			clValues = clValues.filter(o=>o.decode.toLowerCase().indexOf(searchStr)>=0);
		}
		let opt = '<div style="text-align:center;">No Data</span>'
		if(clValues.length > 0){
			opt = _getMsComboOptions(clValues, selVals, flMd);
		}
		
		$(srchCmp).parents('.md-msc').find('.md-msc__options').html(opt);
	}
	
	function msComboSelectHandler(mscOpt){
		let fieldId = $(mscOpt).parents('.md-msc').attr('fieldId');
		let flMd = fieldId && _fieldsCache[fieldId];
		let optVal = $(mscOpt).attr('value');
		if(!fieldId || !flMd || !flMd.fieldPath){
			return;
		}
		
		let flPath = flMd?.fieldPath;
		let flName = flPath && flPath.indexOf('.') > 0 ? flPath.substr(flPath.lastIndexOf('.')+1) : flPath;
		
		//Set data to the _dataJson and _editJson
		let navObj = _navStack.at(-1);
		let ctxIds = navObj?.ctxIds || {};		
		let secPath = flPath.indexOf('.') > 0 ? flPath.substr(0, flPath.lastIndexOf('.')) : null;
		let ctxObj = getCtxByPath(secPath, _dataJson, ctxIds);
		let editCtxObj = getCtxByPath(secPath, _editJson, ctxIds, true) || {};
		
		let currSelVals = (flName && ctxObj[flName]) || ''
		let currValArr = currSelVals ? currSelVals.split('|') : [];
		
		
		let storeFormat = flMd.storeFormat === 'FIELDS' ? 'FIELDS' : 'TEXT'
		let storeFlMapping = storeFormat === 'FIELDS' && flMd.storeFieldMappings;
		let storeFlName = null;
		
		if(typeof storeFlMapping === 'object'){
			storeFlName = storeFlMapping[optVal];
			currValArr = [];
			for(let code in storeFlMapping){
				let fl = storeFlMapping[code];
				if(fl && ctxObj[fl] == 'Y'){
					currValArr.push(code);
				}
			}			
		}
		
		if(currValArr.find(v=>v==optVal)){
			//If the current selection is already selected
			let valInd = currValArr.findIndex(v=>v==optVal);
			currValArr.splice(valInd, 1);
			if(storeFlName){
				ctxObj[storeFlName] = 'N';
				editCtxObj[storeFlName] = 'N';
			}
			
			
			if(currValArr.length == 0){
				$(mscOpt).parents('.md-msc').find('.md-msc__tags').html(AppI18N.t('Select...'))
			} else {
				$(mscOpt).parents('.md-msc').find('.md-msc__options .md-msc__option[value="'+optVal+'"] svg').remove()
				$(mscOpt).parents('.md-msc').find('.md-msc__tags .md-msc__tag[value="'+optVal+'"]').remove();	
			}
		} else {
			if(currValArr.length == 0){
				$(mscOpt).parents('.md-msc').find('.md-msc__tags').html('')
			}
		
		
			//if the current selection is new
			currValArr.push(optVal);
			if(storeFlName){
				ctxObj[storeFlName] = 'Y';
				editCtxObj[storeFlName] = 'Y';
			}
			
			$(mscOpt).parents('.md-msc').find('.md-msc__tags').append(`<div class="md-msc__tag" value="${optVal}">${AppI18N.clT(optVal, flMd.codelist)}<span class="md-msc__tag-remove md-ms-combo-clear">${MDUtils.icon('close')}</span></div>`);
			$(mscOpt).parents('.md-msc').find('.md-msc__options .md-msc__option[value="'+optVal+'"] .md-msc__chk').html(MDUtils.icon('select'));
		}
		
		if(flName){
			ctxObj[flName] = currValArr.join('|');
			editCtxObj[flName] = currValArr.join('|');
		}
		
	}
	
	function handleFieldEditImpacts(fieldId, inpCmp){
		
		console.log(_renderRulesComutations);
		let fieldMd = _fieldsCache[fieldId];
		let fieldImpacts = _activeForm.triggerFieldImpacts[fieldId];
		if(!fieldImpacts){
			return
		}
		
		let currSecIdMap = _navStack.at(-1).ctxIds || {};
		let renderRules = _activeForm.renderRules;
		let impactRules = fieldImpacts.impactedRules;
		let renderRuleResCache = _renderRulesComutations;
		
		for(let ruleId in impactRules){
			let flPath = fieldMd.fieldPath
			let ruleObj = renderRules[ruleId];
			let computationCache = renderRuleResCache[ruleId];
			if(!computationCache || computationCache.length == 0){
				continue;
			}
			
			ctxIdsToReEval = [];
			if(flPath.indexOf('$') > 0){
				//pick all the ctxIds matched ones and udate the result.
				let repPathArr = getMultiCtxPathArr(flPath);
				let currFlCtxIdMap = getMultiCtxIdStr(repPathArr, currSecIdMap);
				
				for(let cacheRes of computationCache){
					let resCtxIds = cacheRes.ctxPaths;
					let matchedCtx = true;
					for(let p of repPathArr){
						if(!resCtxIds[p] || !currSecIdMap[p] || currSecIdMap[p] != resCtxIds[p]){
							matchedCtx = false;
							break;
						}
					}
					if(matchedCtx){
						ctxIdsToReEval.push(cacheRes);
					}
				}
			} else {
				//iterate all the idPaths and update the result
				ctxIdsToReEval = computationCache;
			}
			
			let ruleExp = ruleObj.ruleExpression;
			for(let cacheRes of ctxIdsToReEval){
				let ruleRes = evaluateRuleExpression(ruleExp, _dataJson, cacheRes.ctxPaths, _fieldsCache);
				if(cacheRes.result != ruleRes){
					cacheRes.result = ruleRes;
					
					//toggle all the impacted fields and sections
					let parentCmp = $('.md-section-content')[0]
					if(inpCmp && $(inpCmp).parents('.multi-ctx-rec-wraper')[0]){
						//toggle only fields which are part of multi-ctx row
						parentCmp = $(inpCmp).parents('.multi-ctx-rec-wraper');
					}
					
					let impactedFields = fieldImpacts.impactedFieldsRender;
					let impactedSecs = fieldImpacts.impactedSectionsRender;
					let impactClFields = fieldImpacts.impactedFieldCodelist;
					let impactLkpFields = fieldImpacts.impactedFieldLookup;
					let impactReadonlyFields = fieldImpacts.impactedFieldReadonly;
					let impactGridActions = fieldImpacts.impactedGridActions;

					if(impactedFields){
						for(let flId in impactedFields){
							$(parentCmp).find('.md-field-wrapper[field-id="'+flId+'"]').toggle();
						}
					}
					
					for(let secId in impactedSecs || {}){
						$('.md-panel[section-id="'+secId+'"]').toggle();
						$('.md-grid[section-id="'+secId+'"]').toggle();
						$('.md-tab[data-tab-id="'+secId+'"]').toggle();
						$('.md-nav__item[data-section-id="'+secId+'"]').toggle();
					}
					
				}
				
			}
		}
		
		
	}
	
	function switchInputHandler(switchCmp){
		let fieldId = $(switchCmp).parents('.md-switch').attr('fieldId');
		let flMd = _fieldsCache[fieldId];
		let flPath = flMd?.fieldPath;
		
		if(!flMd || !flPath){
			return;
		}
		
		
		let navObj = _navStack.at(-1);
		let ctxIds = navObj?.ctxIds || {};
		let secPath = flPath.indexOf('.') > 0 ? flPath.substr(0, flPath.lastIndexOf('.')) : null;
		let flName = flPath.indexOf('.') > 0 ? flPath.substr(flPath.lastIndexOf('.')+1) : flPath;
		let ctxObj = getCtxByPath(secPath, _dataJson, ctxIds);
		let editCtxObj = getCtxByPath(secPath, _editJson, ctxIds, true) || {};
		
		if($(switchCmp).hasClass('on')){
			ctxObj[flName] = 'N';
			editCtxObj[flName] = 'N';
		} else {			
			ctxObj[flName] = 'Y';
			editCtxObj[flName] = 'Y';
		}
		$(switchCmp).toggleClass('on');
		
		
		handleFieldEditImpacts(fieldId, switchCmp)
	}
	
	function formFieldChangeHandler(inpCmp){
		let fieldId = $(inpCmp).parents('.md-field-wrapper').attr('field-id');
		let flMd = fieldId && _fieldsCache[fieldId];
		
		if(!fieldId || !flMd){
			return;
		}
		
		let flPath = flMd.fieldPath;
		let navObj = _navStack.at(-1);
		let ctxIds = navObj?.ctxIds || {};
			
		
		//Set data to the _dataJson and _editJson
		let secPath = flPath.indexOf('.') > 0 ? flPath.substr(0, flPath.lastIndexOf('.')) : null;
		let flName = flPath.indexOf('.') > 0 ? flPath.substr(flPath.lastIndexOf('.')+1) : flPath;
		let ctxObj = getCtxByPath(secPath, _dataJson, ctxIds);
		let editCtxObj = getCtxByPath(secPath, _editJson, ctxIds, true) || {};
		
		let inpVal = inpCmp.value;
		if(ctxObj){
			let dispVal = '';
			if(inpCmp.type === 'date'){
				if(inpVal){
					inpVal = _getDateInDDMMMYYYY(inpVal);
					dispVal = inpVal;
				} else {
					inpVal = '';
					dispVal = AppI18N.t('Select Date');
				}
				
				$(inpCmp).parents('.md-date-wrapper').find('.md-date-text').text(dispVal);
			}
			ctxObj[flName] = inpVal;
		}
		editCtxObj[flName] = inpVal;		
		
		
		handleFieldEditImpacts(fieldId, inpCmp)
	}
	
	function clearLookupValue(clrBtn){
		let fieldId = $(clrBtn).parents('.md-lookup').attr('fieldId');
		let flMd = _fieldsCache[fieldId];
		let lkpModule = flMd?.lookupModule
		let flPath = flMd?.fieldPath;
		let lookupKeyField = flMd?.lookupKeyField;
		
		if(!flMd || !lkpModule || !flPath){
			return;
		}
		
		let allowMultiSel = flMd.renderAs === 'ms-lookup' ? true : false;
		let storeFormat = flMd.storeFormat === 'JSON' ? 'JSON' : 'TEXT';
		let flName = flPath.indexOf('.') > 0 ? flPath.substr(flPath.lastIndexOf('.')+1) : flPath;
		let storeValField = flMd.storeValField;
			
		//get the ctx object from _dataJson and _editJson
		let navObj = _navStack.at(-1);
		let ctxIds = navObj?.ctxIds || {};
		let secPath = flPath.indexOf('.') > 0 ? flPath.substr(0, flPath.lastIndexOf('.')) : null;
		let ctxObj = getCtxByPath(secPath, _dataJson, ctxIds);
		let editCtxObj = getCtxByPath(secPath, _editJson, ctxIds, true) || {};		
		
		if(allowMultiSel){
			let valInd = $(clrBtn).parents('.md-lkp__tag').attr('value-index');
			let selStoreVals = [];
			let selDisplVals = [];
			let jsonArr = []; 
			
			if(storeFormat === 'JSON'){
				try{
					let jsonArr = JSON.parse(ctxObj[flName]);
					if(Array.isArray(jsonArr) && jsonArr.length > 0){
						for(let o of jsonArr){
							selDisplVals.push(o.dispVal)
							selStoreVals.push(o.storeVal)
						}
					}
				} catch(err){
					selStoreVals = ctxObj[flName].split('|')
					selDisplVals = ctxObj[flName].split('|')
				}
			} else {
				selStoreVals = ctxObj[flName].split('|')
				selDisplVals = ctxObj[flName].split('|')
				
				if(storeValField){
					selStoreVals = ctxObj[storeValField].split('|')
				}
			}
			
			if(valInd && !isNaN(valInd) && valInd <= selStoreVals.length){
				valInd = parseInt(valInd);
				selStoreVals.splice(valInd, 1);
				selDisplVals.splice(valInd, 1)
				jsonArr.splice(valInd, 1)
				if(storeFormat === 'JSON'){
					ctxObj[flName] = JSON.stringify(jsonArr);
				} else {
					ctxObj[flName] = selStoreVals.join('|');				
					if(storeValField){
						ctxObj[flName] = selDisplVals.join('|')
						ctxObj[storeValField] = selStoreVals.join('|')
					}
				}				
			}
			$(clrBtn).parents('.md-lookup').find('.md-lkp__tags').html(_getLkpSelValTags(selStoreVals, selDisplVals));		
		} else {
			ctxObj[flName] = '';
			editCtxObj[flName] = '';
			
			if(storeValField){
				ctxObj[storeValField] = '';
				editCtxObj[storeValField] = '';
			}
			$(clrBtn).parents('.md-lookup').find('.md-lkp__tags').html(_getLkpSelValTags([], []));		
		}
		
		
		handleFieldEditImpacts(fieldId, clrBtn);
	}
	
	function openLookupModule(lkpBtn){
		let fieldId = $(lkpBtn).parents('.md-lookup').attr('fieldId');
		let flMd = _fieldsCache[fieldId];
		let flPath = flMd?.fieldPath;		
		let lkpModule = flMd?.lookupModule
		
		if(!flMd || !lkpModule || !flPath){
			return;
		}
		
		//TO-DO for multi-select data store to a collection
		
		/* Lookup data will be copied to main form data with the below config.
			lookupModule - 		Reference Module ID
			storeFormat - 		TEXT/JSON, JSON is applicable only for multiSelect.
			multiSelect - 		Y/N
			storeValField - 	field name of data json to which selected lookup record(s) id or key data is copied. 
								if not configured then id will be copied directly to form lkp field instead of key/display data
			lkpStoreValField -	Field name of lookup record to refer key data or default to ID field.
			lkpDispValField -	Field name of lookup record to refer display data or default to lkpStoreValField.
								lkpDispValField will be applicable or copied only if storeValField is configured.
			
			
		  lookupKeyField is recomended to configure else id will be copied as storeValue.
		  Single Select:
			copy form field data from lookup rec-ID.	
			storeValField --> 		copy lookup rec-id to form storeValField
			lkpStoreValField* --> 	copy lkpStoreValField data of lkp rec to form field and storeValField if configured.
			lkpDispValField --> 	copy lkpDispValField data of lkp rec to form lookup field only if storeValField is configured.else id which is copied initially
			lookupFieldMapper --> 	Data from lookup will be copied to one or multiple Field based on f2f mapping.
			
			  
		  Multi Select:
		    storeFormat:
				TEXT:
					formLookup Field -->Copy id with pipe separated or lkpStoreValField data.
					storeValField -->	Copy lookup recs id or lkpStoreValField data with pipe separated
					lkpStoreValField -->pipe separated Prod1|Prod2
					lkpDispValField
				JSON:
					[{storeVal:id, dispValue:lookupKeyField/lkpDispValField}]
				collection: TO-DO
					contextPath and lookupFieldMapper are required for this format
		*/
		AppListScreen.lookup(lkpModule, (selRecs)=>{
			console.log(fieldId);
			console.log(selRecs);
			let allowMultiSel = flMd.renderAs === 'ms-lookup' ? true : false;
			let storeFormat = flMd.storeFormat === 'JSON' ? 'JSON' : 'TEXT';
			
			if(!selRecs || !Array.isArray(selRecs) || selRecs.length == 0 || (!allowMultiSel && selRecs.length > 1)){
				window.MDUtils.toast(allowMultiSel ? AppI18N.t('Select a record(s)') : AppI18N.t('Select a record'), 'error');
				return;
			}			
			
			let flName = flPath.indexOf('.') > 0 ? flPath.substr(flPath.lastIndexOf('.')+1) : flPath;
			let dispValField = flMd.dispValField;
			let lkpStoreValField = flMd.lkpStoreValField || 'id';
			let lkpDispValField = flMd.lkpDispValField || lkpStoreValField;
			
			let lkpFlMapping = flMd.lookupFieldMapper;	//This is only for additioanal fields other that storeValueField and main field.		
			
			//Set data to the _dataJson and _editJson
			let navObj = _navStack.at(-1);
			let ctxIds = navObj?.ctxIds || {};		
			let secPath = flPath.indexOf('.') > 0 ? flPath.substr(0, flPath.lastIndexOf('.')) : null;
			let ctxObj = getCtxByPath(secPath, _dataJson, ctxIds);
			let editCtxObj = getCtxByPath(secPath, _editJson, ctxIds, true) || {};
			
			let inpCmpDispVal = [];
			if(!allowMultiSel){
				
				let selRec = selRecs[0];
				let keyDataStr = selRec[lkpStoreValField];
									
				ctxObj[flName] = keyDataStr;
				editCtxObj[flName] = keyDataStr;
				
				if(dispValField && lkpDispValField != lkpStoreValField){
					//If the dispValField is configured then copy display data to dispValField
					let dispDataStr = selRec[lkpDispValField];
					ctxObj[dispValField] = dispDataStr;
					editCtxObj[dispValField] = dispDataStr;
				}
				
				$(lkpBtn).parents('.md-lookup').find('.md-lkp__tags').html(
					`<div class="md-lkp__tag" value-index="1" title="${keyDataStr}"><label>${keyDataStr}</label><span class="md-lkp__tag-remove md-ms-combo-clear">${MDUtils.icon('close')}</span></div>`);
								
			} else {
				//For multi select, supported f2f with pipe separated, jsonArray format and collection
				let selStoreVals = [];
				let selDisplVals = [];
				let selStoreValArr = [];
				let jsonArr = [];
				
				for(let r of selRecs){
					//TO-DO check if the selcted record is already selected previously.
					
					selStoreVals.push(r[lkpStoreValField]);
					selDisplVals.push(r[lkpDispValField]);
					jsonArr.push({storeVal: r[lkpStoreValField], dispVal: r[lkpDispValField]});
					selStoreValArr.push(r[lkpStoreValField]);
				}
				
				if('JSON' === storeFormat){
					//dispValField will be ignored for the multi sel json format
					if(lkpDispValField != lkpStoreValField){
						//if the lkpDispValField is configured then store the key val pair json data 
						ctxObj[flName] = JSON.stringify(jsonArr);
						editCtxObj[flName] = ctxObj[flName];
					} else {
						//copy the store value 
						ctxObj[flName] = JSON.stringify(selStoreValArr);
						editCtxObj[flName] = ctxObj[flName];
					}
					
					
				} else if('COLLECTION' === storeFormat){
					//TO-DO
				} else {
					let keyDataStr = selStoreVals.join('|');
					let dispDataStr = selDisplVals.join('|');
					
					ctxObj[flName] = keyDataStr;
					editCtxObj[flName] = keyDataStr;	
					
					if(dispValField && lkpDispValField != lkpStoreValField){
						//If the dispValField is configured then copy display data to dispValField
						ctxObj[dispValField] = dispDataStr;
						editCtxObj[dispValField] = dispDataStr;	
					}									
				}
				$(lkpBtn).parents('.md-lookup').find('.md-lkp__tags').html(_getLkpSelValTags(selStoreVals, selDisplVals));			
			}
				
			closeLookup();
			
			
			handleFieldEditImpacts(fieldId, lkpBtn);
		});
	}
	
	
	function toggleSectionPanel(panelHeadCmp){
		if($(panelHeadCmp).hasClass('md-panel__header')){
			//$(panelHeadCmp).parents('.md-panel').find('.md-panel__body:first').toggle();
			$(panelHeadCmp).parents('.md-panel').toggleClass('collapsed')
		}
		if($(panelHeadCmp).hasClass('md-grid__toolbar-left')){
			//$(panelHeadCmp).parents('.md-grid').find('.md-grid__body:first').toggle();
			$(panelHeadCmp).parents('.md-grid').toggleClass('collapsed')
		}		
	}
	
	function copyMcRecord(cpyBtn){
		let mdGridCmp = $(cpyBtn).parents('.md-grid')[0];
		let secId = mdGridCmp?.getAttribute('section-id');
		let md = _sectionCache[secId];
		let ctxPath = md.contextPath;
		let gridState = _getGridState(ctxPath);
		
		
		if(!mdGridCmp || !gridState || !md || !gridState.selctions || Object.values(gridState.selctions).length == 0){
			return;
		}
		
		let gridRecs = _getMultiCtxRecs(md) || [];
		let selRecs = gridState.selctions;
		let navObj = _navStack.at(-1);
		let ctxIds = navObj?.ctxIds || {};
		let parentCtxPath = ctxPath.indexOf('.') > 0 ? ctxPath.substr(0, ctxPath.lastIndexOf('.')) : null;
		let ctxName = ctxPath.indexOf('.') > 0 ? ctxPath.substr(ctxPath.lastIndexOf('.')+1) : ctxPath;
		ctxName = ctxName.replace('$', '');
		
		let editCtxObj = getCtxByPath(parentCtxPath, _editJson, ctxIds, true);		
		
		for(let recId in selRecs){
			let secRecObj = gridRecs.find(r=>r.id==recId);
			if(!secRecObj){
				continue;
			}
			
			let newRec = JSON.stringify(secRecObj);
			newRec = JSON.parse(newRec);
			newRec.id = generateUUID();
			
			gridRecs.push(newRec);
			
			if(editCtxObj){
				let newEditRec = JSON.stringify(newRec);
				newEditRec = JSON.parse(newEditRec);
				
				if(!editCtxObj[ctxName]){
					editCtxObj[ctxName] = [];
				}
				if(Array.isArray(editCtxObj[ctxName])){
					editCtxObj[ctxName].push(newEditRec);
				}			
			}
		}
		_reRenderFormGridRecs(md);	
	}
	
	function deleteMcRecord(delBtn){
		let mdGridCmp = $(delBtn).parents('.md-grid')[0];
		let secId = mdGridCmp?.getAttribute('section-id');
		let md = _sectionCache[secId];
		let ctxPath = md.contextPath;
		let gridState = _getGridState(ctxPath);
		
		
		if(!mdGridCmp || !gridState || !md || !gridState.selctions || Object.values(gridState.selctions).length == 0){
			return;
		}
		
		let gridRecs = _getMultiCtxRecs(md) || [];
		let selRecs = gridState.selctions;
		let navObj = _navStack.at(-1);
		let ctxIds = navObj?.ctxIds || {};
		let parentCtxPath = ctxPath.indexOf('.') > 0 ? ctxPath.substr(0, ctxPath.lastIndexOf('.')) : null;
		let ctxName = ctxPath.indexOf('.') > 0 ? ctxPath.substr(ctxPath.lastIndexOf('.')+1) : ctxPath;
		ctxName = ctxName.replace('$', '');
		
		let delCtxObj = getCtxByPath(parentCtxPath, _delRecJson, ctxIds, true);		
		
		for(let recId in selRecs){
			let selRecInd = gridRecs.findIndex(r=>r.id==recId);
			if(selRecInd < 0){
				continue;
			}
			
			if(Array.isArray(gridRecs)){
				gridRecs.splice(selRecInd, 1);		
			}
			
			if(delCtxObj){
				let newEditRec = {id:recId}
				if(!delCtxObj[ctxName]){
					delCtxObj[ctxName] = [];
				}
				if(Array.isArray(delCtxObj[ctxName])){
					delCtxObj[ctxName].push(newEditRec);
				}			
			}
		}
		
		//Disable the delete button
		$(delBtn).parents('.md-grid').find('.mc-sec-delete').attr('disabled',true);
		
		_reRenderFormGridRecs(md);	
	}
	
	function mcNavBackHandler(backBtn){
		_navStack.pop();		
		renderSectionDetailsPanel();
	}
	
	function mcRecEditHandler(editBtn){
		let mcRecId = $(editBtn).parents('.multi-ctx-rec-wraper').attr('rec-id');
		let secId = $(editBtn).parents('.multi-ctx-section').attr('section-id');
		if(!mcRecId || !secId || !_sectionCache[secId]){
			return;
		}
		
		let md = _sectionCache[secId];
		let prevNavObj = _navStack.at(-1);
		let ctxPath = md?.contextPath;
		let ctxName = ctxPath.indexOf('.') > 0 ? ctxPath.substr(ctxPath.lastIndexOf('.')+1) : ctxPath;
		
		_navStack.push({sectionId:md.sectionId, tabSecId:null, mcRecId:mcRecId, ctxIds:{...prevNavObj.ctxIds, ctxName:mcRecId}});
		
		renderSectionDetailsPanel();
	}
	
	function gridPaginationHandler(pagerBtn){
		let mdGridCmp = $(pagerBtn).parents('.md-grid')[0];
		
		let secId = mdGridCmp?.getAttribute('section-id');
		let md = _sectionCache[secId];
		
		let ctxPath = md?.contextPath;
		let gridState = _getGridState(ctxPath);
		
		if(!mdGridCmp || !md){
			return;
		}
		
		let pageInd = pagerBtn.getAttribute('index');
		gridState.pageInd = isNaN(pageInd) ? 1 : parseInt(pageInd);
		
		_reRenderFormGridRecs(md);
	}
	
	function gridPageSizeHandler(pageCombo){
		let mdGridCmp = $(pageCombo).parents('.md-grid')[0];

		let secId = mdGridCmp?.getAttribute('section-id');
		let md = _sectionCache[secId];
		
		let ctxPath = md.contextPath;
		let gridState = _getGridState(ctxPath);
		
		if(!mdGridCmp || !md){
			return;
		}
		
		let pageSize = pageCombo.value;
		gridState.pageSize = isNaN(pageSize) ? 5 : parseInt(pageSize);
		gridState.pageInd = 1;
		
		_reRenderFormGridRecs(md);
	}
	
	function insertMcRecord(addBtnCmp){
		let mdGridCmp = $(addBtnCmp).parents('.md-grid')[0];
		let secId = mdGridCmp?.getAttribute('section-id');
		let md = _sectionCache[secId];
		let ctxPath = md.contextPath;
		let gridState = _getGridState(ctxPath);
		
		if(!mdGridCmp || !gridState || !md){
			return;
		}
		
		let navObj = _navStack.at(-1);
		let ctxIds = navObj?.ctxIds || {};
		let parentCtxPath = ctxPath.indexOf('.') > 0 ? ctxPath.substr(0, ctxPath.lastIndexOf('.')) : null;
		let ctxName = ctxPath.indexOf('.') > 0 ? ctxPath.substr(ctxPath.lastIndexOf('.')+1) : ctxPath;
		ctxName = ctxName.replace('$', '');
		
		let ctxObj = getCtxByPath(parentCtxPath, _dataJson, ctxIds);
		let editCtxObj = getCtxByPath(parentCtxPath, _editJson, ctxIds, true);		
		
		let newRec = {id:generateUUID()}
		if(ctxObj){
			if(!ctxObj[ctxName]){
				ctxObj[ctxName] = [];
			}
			if(Array.isArray(ctxObj[ctxName])){
				ctxObj[ctxName].push(newRec);
			}			
		}
		
		if(editCtxObj){
			let newEditRec = {id:newRec.id};
			if(!editCtxObj[ctxName]){
				editCtxObj[ctxName] = [];
			}
			if(Array.isArray(editCtxObj[ctxName])){
				editCtxObj[ctxName].push(newEditRec);
			}			
		}
		
		_reRenderFormGridRecs(md);		
	}
	
	function sortMcGridRecs(sortCol){
		let mdGridCmp = $(sortCol).parents('.md-grid')[0];
		let secId = mdGridCmp?.getAttribute('section-id');
		let md = _sectionCache[secId];
		let gridState = _getGridState(md.contextPath);
		let fieldId = sortCol.getAttribute('field-id');
		
		
		if(!mdGridCmp || !gridState || !fieldId || !md){
			return;
		}
		
		if(gridState.sortFieldId == fieldId){
			gridState.sortDir = gridState.sortDir == 'ASC' ? 'DESC' : 'ASC';
		} else {
			gridState.sortFieldId = fieldId;
			gridState.sortDir = 'ASC';
		}
		
		$(sortCol).parents('.md-grid').find('.sort-icon.active').html(icon('sortNone'))
		$(sortCol).parents('.md-grid').find('.sort-icon.active').removeClass('active')
		
		let _icon = gridState.sortDir == 'ASC' ? icon('sortAsc') : icon('sortDesc');
		$(sortCol).find('.sort-icon').html(_icon);
		$(sortCol).find('.sort-icon').addClass('active');
		
		_reRenderFormGridRecs(md);		
	}
	
	function multiCtxRecSelect(cmp){
		let mcRecPanel = $(cmp).parents('.multi-ctx-rec-wraper')[0];
		let mcSecPanel = mcRecPanel && $(cmp).parents('.multi-ctx-section')[0];
		
		let recId = mcRecPanel?.getAttribute('rec-id');		
		let secMd = _sectionCache[mcSecPanel?.getAttribute('section-id')];		
		let ctxPath =  secMd?.contextPath;
		
		if(!recId || !mcSecPanel || !ctxPath){
			return;
		}
		
		let recSelections = _getGridState(ctxPath).selctions;
		
		if($(cmp).hasClass('mc-row-chk')){
			console.log(cmp.checked);
			if(cmp.checked){
				recSelections[recId] = true
			} else {
				delete recSelections[recId];
			}
			 
		} else {
			let ctxName = ctxPath.substr(ctxPath.lastIndexOf('.')+1);
			let navObj = _navStack.at(-1);
			navObj.ctxIds = navObj.ctxIds ? navObj.ctxIds : {};
			navObj.ctxIds[ctxName] = recId;
		}			
		
		if($(mcRecPanel).parents('.md-grid')){
			$(mcRecPanel).parents('.md-grid').find('.multi-ctx-rec-wraper').removeClass('selected');
			$(mcRecPanel).addClass('selected');
			
			//Enable the grid delete button
			if(Object.values(recSelections).length > 0){
				$(mcRecPanel).parents('.md-grid').find('.mc-sec-delete').removeAttr('disabled');
			} else {
				$(mcRecPanel).parents('.md-grid').find('.mc-sec-delete').attr('disabled',true);
			}			
		}		
	}
	
	function _renderSectionTab(secMd, mcRecId){
		let tb = [];
		
		if(secMd.multiContext && !mcRecId){
			return '';
		}
		const tabSections = (secMd.sections || []).filter(s => s.tabPanel);
		const nonTabSections = (secMd.sections || []).filter(s => !s.tabPanel);
		const ownFields = secMd.fields || [];
		const tabs = [];
		
		if (tabSections.length > 0) {			
			// Default "Details" tab if section has its own fields
			if (ownFields.length > 0 || nonTabSections.length > 0) {
				tabs.push({ id: secMd.sectionId, label: AppI18N.mT(secMd.title, _moduleId) || AppI18N.t('Details')});
			}

			// Tab sections
			for (const ts of tabSections) {
				_sectionCache[ts.sectionId] = ts;
				tabs.push({ id: ts.sectionId, label: AppI18N.mT(ts.title, _moduleId) || ts.sectionId, renderCondition:ts.renderCondition});
			}
		}
		
		if (tabs.length > 0) {
			
			
			
			
			//Setting first as active
			if(!_navStack.at(-1).tabSecId){
				_navStack.at(-1).tabSecId = tabs[0].id;		
				tabs[0].activeTab = true;				
			} else {
				let actTab = tabs.find(t=>t.id == _navStack.at(-1).tabSecId)
				if(actTab){actTab.activeTab = true;}
			}
			
			for (const tab of tabs) {
				let hideTab = false;
				if(tab.renderCondition){
					let renderRules = _activeForm.renderRules;
					
					if(renderRules[tab.renderCondition]){
						let navObj = _navStack.at(-1);
						let ctxIds = navObj.ctxIds || {};
			
						let renderRule = renderRules[tab.renderCondition];
						let rulePassed = evaluateRenderRules(renderRule, _dataJson, ctxIds, _renderRulesComutations, _fieldsCache);			
						if(!rulePassed){
							hideTab = true;
						}						
					}
				}
			
				tb.push('<div class="md-tab '+(tab.activeTab ? 'active':'')+'" data-tab-id="'+tab.id+'" style="display:'+(hideTab?'none':'')+'">'+tab.label+'</div>');				  
			}
												
		}
		return tb.join('');
		
	}
	
	function handleFormActions(actionCmp){
		console.log(actionCmp?.getAttribute('action'));
		let action = actionCmp?.getAttribute('action')
		if(action === 'save'){
			_doSave()
		} else if(action === 'cancel') {
			if (confirm(AppI18N.t('Discard changes and return to case listing?'))) {
				_editJson = {};
				_delRecJson = {};
				_navStack = [];
				_sectionCache = {};
				
				$('.case-edit-overlay').removeClass('active');
				$('.case-edit-app').html('');
			}
		}
	}
	
	async function _doSave(){
		const errors = [];//state.validate(allFields);
		if (errors.length > 0) {
		  _showValidationBanner(errors);
		  return;
		}

		if (!_moduleId) {
		  window.MDUtils.toast('Cannot save — module context missing.', 'error');
		  return;
		}

		window.MDUtils.toast('Saving…', 'info');

		let respJson = {};
		if (_isNew) {
		  // New record — POST full payload
			respJson = await AppAPI.update(_moduleId, _dataJson);
			
		} else {
		  respJson = await AppAPI.patch(_moduleId, _editJson, _delRecJson);
		  _editJson = respJson.data.editDataRecord;
		  
		}
		//_dataJson = respJson.data.dataRecord;
		_errors = respJson.data.errors || [];
		if(_errors?.length > 0){
			window.MDUtils.toast('Saved successfully partially with the errors.', 'warning', 'Saved');
			showErrorPopup();
		} else {
			window.MDUtils.toast('Saved successfully.', 'success', 'Saved');
		}
		
		
	}
	
	function formNavigate(secCmp){
		let secId = secCmp?.getAttribute('data-section-id');
		
		if(!secId || !_activeForm?.sections?.find(sec=>secId==sec.sectionId)){	
			//Set first section as defult to navStack
			const firstSection = _activeForm?.sections?.[0];
			secId = firstSection.sectionId;			
		}
		
		if (secId) {
			_navStack = [];
			_navStack.push({sectionId:secId, tabSecId:null});
			renderSectionDetailsPanel();
		}
		
	}
	
	function formTabHandler(tabCmp){
		let tabId = tabCmp.getAttribute('data-tab-id');
		if(tabId){
			$('.case-edit-app .md-tab').removeClass('active');
			$('.case-edit-app .md-tab[data-tab-id="'+tabId+'"]').addClass('active')
			_navStack.at(-1).tabSecId = tabId;
			_renderTabForm();
		}	
	}
	
	function _renderTabForm(){
		let navEntry = _navStack.at(-1);
		if(!navEntry){
			return;
		}
		
		let mainSecMd = _sectionCache[navEntry.sectionId];
		let tabSec = (navEntry.tabSecId && _sectionCache[navEntry.tabSecId]) || mainSecMd;
		let ctxLevel = mainSecMd.sectionId == tabSec.sectionId ? 0 : 1;
		
		if(!tabSec){
			return;
		}
		$('.md-section-content').html('');
		let tabPnCmp = $('.md-section-content')[0];
		let tf = [];
		if(tabSec.multiContext && (!navEntry.mcRecId || mainSecMd.sectionId !== tabSec.sectionId)){			
			_renderMultiCtxGrid(tabSec, tabPnCmp);
		} else {
			_renderSectionForm(tabSec, tabPnCmp, ctxLevel);
		}
		
	}
	
	function _renderSectionForm(secMd, tabPnCmp, ctxLevel){
		
		let fields = secMd.fields;
			
		//Render section field panel
		if(fields && fields.length > 0){
			
			let hideSec = false;
			if(secMd.renderCondition){
				let renderRules = _activeForm.renderRules;				
				if(renderRules[secMd.renderCondition]){
					let renderRule = renderRules[secMd.renderCondition];
					let navObj = _navStack.at(-1);
					let ctxIds = navObj.ctxIds || {};
						
					let rulePassed = evaluateRenderRules(renderRule, _dataJson, ctxIds, _renderRulesComutations, _fieldsCache);			
					if(!rulePassed){
						hideSec = true;
					}
					
				}
			}
			
			let currSp = [];
			currSp.push('<div class="md-panel" section-id="'+secMd.sectionId+'" style="display:'+(hideSec?'none':'')+'">');
			//Panel Header
			currSp.push('	<div class="md-panel__header">');
			currSp.push('	  <span class="md-panel__chevron">' + icon('chevronDown') + '</span>');
			currSp.push('	  <span class="md-panel__title">'+AppI18N.mT(secMd.title, _moduleId)+'</span>'); 
			currSp.push('	</div>');
			
			//Panel Body
			currSp.push('	<div class="md-panel__body md-fields-grid">');
			
			//Section Fields
			let fls = [];
			for(let fl of fields){
				fls.push(_renderFormField(fl));
			}
			currSp.push(fls.join(''));	
			
			currSp.push('	</div>');
			currSp.push('</div>');			
			
			$(tabPnCmp).append(currSp.join(''));	
		}
		
		
		for(let child of (secMd.sections || [])){
			_sectionCache[child.sectionId] = child;
			if(ctxLevel == 0 && child.tabPanel){
				continue;
			}
			if(child.multiContext){
				_renderMultiCtxGrid(child, tabPnCmp);
			} else {
				_renderSectionForm(child, tabPnCmp, (ctxLevel+1))
			}
		}				
		
	}
	
	function _renderFormField(field){
		let fl = [];
		if (field.dataType === 'line-separator') {
			fl.push('<div class="md-field-separator"></div>');
			
		} else {
			//Cache the field
			//_fieldsCache[field.fieldId] = field;
			
			//Get the multi-ctx id map from _navStack[ctxIds]
			let navObj = _navStack.at(-1);
			navObj.ctxIds = navObj.ctxIds ? navObj.ctxIds : {};
			let ctxIds = navObj.ctxIds;

			//Evaluate renderConditions
			let renderRules = _activeForm.renderRules;
			let hideField = false;
			if(field.renderCondition && renderRules[field.renderCondition]){
				let renderRule = renderRules[field.renderCondition];
				let rulePassed = evaluateRenderRules(renderRule, _dataJson, ctxIds, _renderRulesComutations, _fieldsCache);			
				if(!rulePassed){
					hideField = true;
				}
				
			}
			
			const w = field.fieldWidth;
			const label = AppI18N.mT(field.label, _moduleId);
			
			fl.push('<div class="md-field md-field-wrapper '+ ((w==3&&'md-field--full') || (w==2&&'md-field--half')) +'" field-id="'+field.fieldId+'" style="display:'+(hideField ? 'none' : '')+'">')
			
			
			//Field label
			fl.push('	<div class="md-field__label-row">');
			fl.push('		<label class="md-field__label">'+label+'</label>');
			if(field.required){
				fl.push('		<span class="md-field__required">*</span>');
			}
			if (field.multiLingualField) {
				fl.push('		<span class="md-multilingual-badge">'+icon('globe')+' ML</span>');
			}
			if (field.helpTip) {
				fl.push('		<span class="md-field__help" data-tip="'+field.helpTip+'">?</span>');
			}
			fl.push('	</div>');
			
			//Field input
			fl.push(_buildInput(field, _dataJson, ctxIds));
			
			fl.push('</div>')
	
		}
		return fl.join('');

	}
	
	
	
	function buildFormGridToolbar(md){
		let tb = `
			<div class="md-grid__toolbar" style="position: relative;">
			  <div class="md-grid__toolbar-left">
				 <button class="md-icon-btn dark md-grid__collapse-btn" data-collapse="1" title="${AppI18N.t('Collapse/Expand')}">
					${icon('chevronDown')}
				 </button>
				 <span class="md-grid__title">${AppI18N.mT(md.title, _moduleId)}</span>
			  </div>
			  <div class="md-grid__toolbar-right">
				 <div class="md-grid__search">
					${icon('search')}
					<input placeholder="${AppI18N.t('Search...')}">
				 </div>
				 <button class="md-btn md-btn--ghost md-btn--sm md-btn--delete-toolbar mc-sec-delete" title="${AppI18N.t('Delete selected record(s)')}" disabled="">
					${icon('delete')}
					${AppI18N.t('Delete')}
				 </button>
				 <button class="md-btn md-btn--primary md-btn--sm mc-sec-add">
					${icon('add')}
					${AppI18N.t('Add')}
				 </button>
				 <button class="md-btn md-btn--primary md-btn--sm  mc-sec-copy" title="${AppI18N.t('Copy selected record(s)')} disabled">
					${icon('copy')}
					${AppI18N.t('Copy')}
				 </button>
			  </div>
		   </div>
		`;
	
		return tb;
		
	}

	function buildFormGrid(md, recs, gridState){
		let gf = md.gridFields || [];
		let gb = [];
		
		let ctxPath = md.contextPath;
		if(!ctxPath){			
			gb.push('<div class="md-grid__body">'+AppI18N.t('Invalid multi-context configurations')+'</div>');
			return;
		}
		
		gb.push('<div class="md-grid__body">');
		gb.push('	<table class="md-grid__table">');
		
		//Grid Header
		gb.push('		<thead>');
		gb.push('			<tr>');
		gb.push('				<th style="width: 20px;"><input type="checkbox" title="Select all on this page"></th>');
		gb.push('				<th style="width: 30px;"></th>');
		for(let fl of gf){
			gb.push(`
								<th class="${fl.enableSort ? 'md-grid-col-sort' : ''}" style="width: ${fl.columnSize || '22ch'};" field-id="${fl.fieldId}"> ${AppI18N.mT(fl.label, _moduleId)}
									<span class="sort-icon">
										${fl.enableSort ? gridState.sortFieldId == fl.fieldId ? gridState.sortDir == 'ASC' ? icon('sortAsc') : icon('sortDesc') : icon('sortNone') : ''}								  
									</span>
							   </th>`);			
		}		
		gb.push('			</tr>');
		gb.push('		</thead>');
		
		//Grid recs
		gb.push('		<tbody>');
		gb.push(_renderFormGridRecs(recs, md))
				
		gb.push('		</tbody>');
		gb.push('	</table>');
		gb.push('</div>');
		
		return gb.join('')
	}
	
	function _reRenderFormGridRecs(md){
		let mdGridCmp = $('.md-grid[section-id="'+md.sectionId+'"]')[0];
		let gridState = _getGridState(md.contextPath);
		let gridRecs = _getMultiCtxRecs(md) || [];
		let gridRecHtml = _renderFormGridRecs(gridRecs, md, gridState);
		$(mdGridCmp).find('tbody').html(gridRecHtml);
		
		//Rebuild the pagination bar
		$(mdGridCmp).find('.md-grid__pagination').html(buildFormGridPager(md, gridRecs, gridState));
		
	}

	function _renderFormGridRecs(gridRecs, md, gridState){
		let gb = [];
		let gf = md.gridFields || [];
		let recs = gridRecs || [];
		let ctxPath = md.contextPath;
		let ctxName = ctxPath.indexOf('.') > 0 ? ctxPath.substr(ctxPath.lastIndexOf('.')+1) : ctxPath;
		let renderRules = _activeForm.renderRules;
		
		if(recs.length === 0){
			gb.push('<tr><td style="text-align:center" colspan="'+(gf.length+2)+'"><span>No records to display</span></td></tr>')
			return gb.join('')
		}
		
		
		let navObj = _navStack.at(-1);
		navObj.ctxIds = navObj.ctxIds ? navObj.ctxIds : {};
		
		let _gridState = gridState || _getGridState(ctxPath);
		let sortFl = gf.find(f=>f.fieldId == _gridState.sortFieldId) || {fieldPath:'id'};
		sortFl = sortFl.fieldPath;
		sortFl = sortFl.indexOf('.') > 0 ? sortFl.substr(sortFl.lastIndexOf('.')+1) : sortFl;
		
		let dir = _gridState.sortDir;
		
		recs.sort((o1, o2)=>{
			let cmpRes = 0;
			if(!o1[sortFl]){
				cmpRes = -1;
			}else if(!o2[sortFl]){
				cmpRes = 1;
			} else {
				cmpRes = o1[sortFl].localeCompare(o2[sortFl]);
			}
			return dir === 'ASC' ? cmpRes : -cmpRes;
		});
		
		
		//sortFieldId:'id', sortDir:'ASC', pageSize:5, pageInd
		let pageInd = isNaN(_gridState.pageInd) ? 1 : parseInt(_gridState.pageInd);
		let pageLimit = isNaN(_gridState.pageSize) ? 5 : parseInt(_gridState.pageSize);
		
		let totalPages  = Math.max(1, Math.ceil(recs.length / pageLimit));
		if (pageInd > totalPages) pageInd = totalPages;

		var start   = (pageInd-1) * pageLimit;
		var pageRecs = recs.slice(start, start + pageLimit);		
		
		for(let rec of pageRecs){
			navObj.ctxIds[ctxName] = rec.id;
			
			
			gb.push('		<tr class="multi-ctx-rec-wraper" rec-id="'+rec.id+'">');
			gb.push('			<td><input class="mc-row-chk" type="checkbox"></td>');
			gb.push('			<td>');
			gb.push('				<button class="md-btn md-btn--icon-sm md-btn--outlined md-mc-rec-edit" title="'+AppI18N.t('Edit Record')+'">' + icon('edit') + '</button>');
			gb.push('			</td>');
			
			for(let fl of gf){
				//Cache fields
				//_fieldsCache[fl.fieldId] = fl;
				
				gb.push('		<td class="md-field-col" style="width: '+(fl.columnSize || '22ch')+';" field-id="'+fl.fieldId+'" >');
				
				
				//Evaluate if the field is having renderCondition
				let hideField = false;
				if(fl.renderCondition && renderRules[fl.renderCondition]){
					let renderRule = renderRules[fl.renderCondition];
					let rulePassed = evaluateRenderRules(renderRule, _dataJson, navObj.ctxIds, _renderRulesComutations, _fieldsCache);			
					if(!rulePassed){
						hideField = true;
					}					
				}
				gb.push('		  <div class="md-field-wrapper" field-id="'+fl.fieldId+'" style="display:'+(hideField ? 'none':'')+'">');				
				gb.push(			_buildInput(fl, _dataJson, navObj.ctxIds));	
				gb.push('		  </div>');
				gb.push('		</td>');
			}			
			gb.push('		</tr>');
			
			delete navObj.ctxIds[ctxName];
		}	
		
		return gb.join('')
	}
	
	function _getPageRange(current, total) {
		if (total <= 5) return Array.from({ length: total }, (_, i) => i + 1);
		const pages = [1];
		if (current > 3) pages.push('...');
		for (let i = Math.max(2, current - 1); i <= Math.min(total - 1, current + 1); i++) pages.push(i);
		if (current < total - 2) pages.push('...');
		pages.push(total);
		return pages;
	}
   
	const mdPagerOpt = [5, 10, 25];
	
	function buildFormGridPager(md, recs, gridState){
		const total = recs.length;
		const pageSize = isNaN(gridState.pageSize) ? 5 : parseInt(gridState.pageSize);
		const pageInd = isNaN(gridState.pageInd) ? 1 : parseInt(gridState.pageInd);
		const totalPages = Math.max(1, Math.ceil(total / pageSize));
		const start = (pageInd - 1) * pageSize + 1;
		const end = Math.min(pageInd * pageSize, total);
		const pageRange = _getPageRange(pageInd, totalPages);
	
		let pg = [];
		
		
		pg.push(`	<div class="md-grid__pagination-info">Showing ${start}–${end} of ${total} records</div>`);	

		pg.push('<span class="ls-pg-size-label">'+AppI18N.t('Rows')+':</span>');
		pg.push('<select class="ls-pg-size-select">');
		for(let o of mdPagerOpt)
		pg.push(`	<option value="${o}" ${pageSize==o && 'selected'}>${o}</option>`);
		pg.push('</select>');
		
		pg.push('	<div class="md-grid__pagination-controls">');
		pg.push('		<button class="md-grid__page-btn" '+(gridState.pageInd == 1 ? 'disabled' : '')+' index="'+(pageInd == 1 ? 1 : pageInd-1)+'" >'+icon('chevronLeft') + '</button>');
		
		for (const p of pageRange) {
		  if (p === '...') {
			  pg.push('		<span>...</span>');
		  } else {
			  pg.push(`<button class="md-grid__page-btn${p === gridState.pageInd ? ' active' : ''}" index="${p}">${String(p)}</button>`);			
		  }
		}
		pg.push('		<button class="md-grid__page-btn" '+(gridState.pageInd == totalPages? 'disabled' : '')+' index="'+(pageInd == totalPages ? totalPages : pageInd+1)+'">'+icon('chevronRight') + '</button>');
		pg.push('	</div>');
		
		
		
		return pg.join('')
	}
	
	function _renderMultiCtxGrid(md, parentCmp){
		let gridState = _getGridState(md.contextPath);
		let gridRecs = _getMultiCtxRecs(md) || [];
		
		let hideGrid = false;
		if(md.renderCondition){
			let renderRules = _activeForm.renderRules;				
			if(renderRules[md.renderCondition]){
				let renderRule = renderRules[md.renderCondition];
				let navObj = _navStack.at(-1);
				let ctxIds = navObj.ctxIds || {};
					
				let rulePassed = evaluateRenderRules(renderRule, _dataJson, ctxIds, _renderRulesComutations, _fieldsCache);			
				if(!rulePassed){
					hideGrid = true;
				}
				
			}
		}
			
			
		let fg = [];
		fg.push('<div class="md-grid multi-ctx-section" section-id="'+md.sectionId+'" style="display:'+(hideGrid?'none':'inherit')+'">');
		
		fg.push(buildFormGridToolbar(md, gridState));
		fg.push(buildFormGrid(md, gridRecs, gridState));
		
		fg.push('<div class="md-grid__pagination">');
		fg.push(buildFormGridPager(md, gridRecs, gridState));		
		fg.push('</div>')
		
		fg.push('</div>')
		
		$(parentCmp).append(fg.join(''));
	}
	
	function _getMultiCtxRecs(secMd){
		let secRecs = [];
		let ctxPath = secMd.contextPath;
		if(!ctxPath){
			return secRecs;
		}
		
		let parentPath = ctxPath.indexOf('.') > 0 ? ctxPath.substr(0, ctxPath.lastIndexOf('.')) : null;
		let ctxName = ctxPath.indexOf('.') > 0 ? ctxPath.substr(ctxPath.lastIndexOf('.')+1) : ctxPath;
		let ctxPathArr = (parentPath && parentPath.split('.')) || [];
		let navObj = _navStack.at(-1);
		let ctxIds = navObj?.ctxIds || {};
		
		let ctxObj = (parentPath && getCtxByPath(parentPath, _dataJson, ctxIds)) || _dataJson;
		
		ctxName = ctxName.replace('$', '');
		if(!ctxObj || !ctxObj[ctxName] || !Array.isArray(ctxObj[ctxName]) ){
			return [];
		}
		
		return ctxObj[ctxName];
	}
	
	function renderSectionDetailsPanel(){
		let navObj = _navStack.at(-1);
		if(!navObj){
			return;
		}
		let secMd = _sectionCache[navObj.sectionId];
		if(!secMd){
			return;			
		}
		
		//make left nac sec item as active
		$('.md-nav .md-nav__item').removeClass('active');
		$('.md-nav .md-nav__item[data-section-id="'+navObj.sectionId+'"]').addClass('active');
		
		$('.case-edit-app .md-breadcrumb .md-breadcrum-items-wrap').html(_buildBreadcrumb());
		
		//Tab panel
		let tabPnl = _renderSectionTab(secMd, navObj.mcRecId)
		$('.case-edit-app .md-tabbar').html(tabPnl);
		$('.case-edit-app .md-tabbar').show()
		if(tabPnl.length < 1){
			$('.case-edit-app .md-tabbar').hide()
		}
		
		_renderTabForm();
	}
	
	
	function _buildFormHeader(){
		let hd = [];
		
		hd.push('<div class="md-header">');
		
		//Title wrap
		hd.push('  <div class="md-header__title">');
		hd.push('	<span class="md-header__form-name">'+(_activeForm.formName || _activeForm.formId) + '</span>');
		hd.push('	<span class="header__record-title">'+(_getRecordTitle(_activeForm) || AppI18N.t('form.newRecord')) + '</span>');
		hd.push('  </div>');
		
		// Actions div
		hd.push('  <div class="md-header__actions">');
		const actions = _activeForm.formHeaderActions || [];
		const switchAction = actions.find(a => a.actionId === 'switchForm');
		const otherActions = actions.filter(a => a.actionId !== 'switchForm');
		const standard = otherActions.filter(a => a.type !== 'moreAction');
		const more = otherActions.filter(a => a.type === 'moreAction');
		
		// Switch Form — inline dropdown menu button
		if (switchAction) {
			const fms = Object.keys(_formMD.FORMS || {});
			if (fms.length > 1) {
				hd.push('  <div class="menu-wrapper"  menu-handler="AppFORM.switch">');
				//Form-switch button
				hd.push('    <button class="menu-btn-cmp md-btn md-form-switch md-btn--secondary">');
				hd.push(		icon('swap') + ' ' + AppI18N.t('form.switchForm') + ' ' + icon('chevronDown'));
				hd.push('    </button>');
				
				//Forms menu
				hd.push('  	 <div class="md-dropdown__menu" style="min-width:180px;">');
				for (const fId of fms) {
				  const f = _formMD.FORMS[fId];
				  if(_activeForm.formID === fId){continue;}
				  hd.push(`  	 <div class="menu-btn-cmp md-form-switch-item md-dropdown__menu__item ${fId === _activeForm.formId ? 'md-lang-active':''}" formId=${fId}>${f.formName}</div>`);				  
				}
				hd.push('    </div> ');
				
				hd.push('  </div> ');		
			}
		}
		
		// Remaining standard actions (up to 3)
		const shownStd = standard.slice(0, 3);
		const extraStd = standard.slice(3);
		const moreItems = [...extraStd, ...more];

		for (const action of shownStd) {
			hd.push('  <button class="md-form-btns md-btn md-btn--secondary" action="'+action.actionId+'" > ');
			hd.push(	(icon(action.icon) || '') + AppI18N.t(action.label));
			hd.push('  </button>');
		}

		if (moreItems.length > 0) {
			hd.push('  <div class="menu-wrapper" menu-handler="AppFORM.action">');
			hd.push('	<button class="menu-btn-cmp md-form-more-btn md-btn md-btn--secondary">');
			hd.push(	icon('moreVert') + AppI18N.t('More'));
			hd.push('	</button>');
			
			//More action menu
			hd.push('  	<div class="md-dropdown__menu" >');
			for (const action of moreItems) {
				hd.push('  	<div class="md-dropdown__menu__item" action="'+action.actionId+'">');
				hd.push(	 (icon(action.icon) || '') + AppI18N.t(action.label));				
				hd.push('  	</div>');				
			}
			
			hd.push('  	</div>');/*End of More action menu */
						
			hd.push('  </div>');/*End of More Actions Btn div */		  
		}
		
		
		hd.push('  </div>');/*End of Actions div */			
		
		hd.push('</div>');

		return hd.join('');		
	}
	
	function _buildNavPanel(){
		let np = [];
		
		np.push('<div class="md-nav" style="width:'+(_activeForm.layout?.navigationWidth || '280px')+'">');
			
		//Nav header
		np.push('	<div class="md-nav__header">');
		np.push('		<span class="md-nav__title">'+AppI18N.t('Sections')+'</span>');
		np.push('		<button class="md-icon-btn dark md-nav__collapse-btn" style="height:auto;" title="'+AppI18N.t('Collapse panel')+'">');
		np.push(			icon('panelLeft'));
		np.push('		</button>');
		np.push('	</div>');
		
		//Section nav panel
		np.push('	<div class="md-nav" style="--nav-expanded-width:'+(_activeForm.layout?.navigationWidth || '280px')+'">');
		
		np.push('		<div class="md-nav__list">');
		for (const sec of (_activeForm.sections || [])) {
			let hideNavItem = false;
			if(sec.renderCondition){
				let renderRules = _activeForm.renderRules;				
				if(renderRules[sec.renderCondition]){
					let renderRule = renderRules[sec.renderCondition];
					let rulePassed = evaluateRenderRules(renderRule, _dataJson, {}, _renderRulesComutations, _fieldsCache);			
					if(!rulePassed){
						hideNavItem = true;
					}
					
				}
			}
			np.push('		<div class="md-nav__item" data-section-id="'+sec.sectionId+'" style="display:'+(hideNavItem ? 'none' : '')+'">');
			np.push('			<span class="md-nav__item-icon">' + sec.multiContext ? icon('grid') : icon('chevronRight') + '</span>');
			np.push('			<span>' + (AppI18N.mT(sec.title, _moduleId) || sec.sectionId) + '</span>');
			np.push('		</div>');
			
			//Cache sections
			_sectionCache[sec.sectionId] = sec;
		}
		np.push('		</div>');
		
		np.push('	</div>');
		
		np.push('</div>');
		
		return np.join('');
	}
	
	function _buildFormDetailPanel(){
		let fd = [];
		//Right Form Details Panel
		fd.push('<div class="md-form-panel">');
		fd.push(`	
		<div class="md-breadcrumb" style="flex-direction: row;justify-content: space-between;">
		  <div class="md-breadcrum-items-wrap" style="display: flex;align-items: center;gap: 4px;"></div>
		  <div class="app-bar__actions">
			<!-- Validation error indicator — hidden when no errors -->
			  <button class="app-bar__err-btn has-errors" title="View validation messages" style="display: inline-flex;">
				  ${MDUtils.icon('warn')}
				  <span class="app-bar__err-count" id="errIndicatorCount">5</span>
			  </button>
		  </div>		
		</div>`);
		fd.push('	<div class="md-tabbar"></div>');	
		fd.push('	<div class="md-section-content"></div>');	
		fd.push('</div>');
		
		
		return fd.join('')
	}
	
	function _buildFormContainer(){
		let fc = [];
		
		//Left Navigation Panel
		let _navEl = _buildNavPanel();
		fc.push(_navEl);
		
		let fd = _buildFormDetailPanel();
		fc.push(fd);
				
		return fc.join('')
	}
	
	function switchForm(menuCmp){
		let formId = menuCmp.getAttribute('formId');
		if(!formId || !_formMD.FORMS[formId])return;
		
		_activeForm = _formMD.FORMS[formId];
	
		
		let fmContainer = _buildFormContainer();
		$('.md-body').html(fmContainer);
		
		formNavigate();		
	}
	
	function _buildFormPage(){
		_navStack = [];
		_sectionCache = {};
		
		let fhHtml = _buildFormHeader();
		$('.case-edit-app').html(fhHtml);
		
		//Form Container
		$('.case-edit-app').append('<div class="md-body"></div>');
		
		
		let fmContainer = _buildFormContainer();
		$('.md-body').html(fmContainer);
		
		formNavigate();		
		
	}
	
	async function renderDataForm(recId){
		let item = AppMenuHeader.activeModule();
		_editJson = {};
		_delRecJson = {};
		
		
		$('.case-edit-overlay').addClass('active');
		$('.case-edit-app').html('<div style="height:100%;display:flex;align-items:center;justify-content:center;"><div class="md-spinner"></div></div>');
		
		//Load the Form Metadata
		let formMeta = await AppMD.forms(item.moduleId);
		let moduleFields = await AppMD.fields(item.moduleId);
		
		if(!formMeta?.FORMS || Object.values(formMeta?.FORMS).length === 0 || !moduleFields || Object.values(moduleFields).length == 0){
			$('.case-edit-overlay').removeClass('active');			
			return;
		}
		_formMD = formMeta;
		_moduleId = item.moduleId;
				
		//Load the form data from backend
		if(!recId){
			_recId = generateUUID();
			_isNew = true;
			_dataJson = {id:_recId};
			_editJson = {id:_recId}
		} else {
			_recId = recId;
			let dataRec = await AppAPI.fetchDataRec(recId, item.moduleId);
			_dataJson = dataRec;	
			_editJson = {id:_dataJson.id}			
		}
		
		_activeForm = Object.values(_formMD.FORMS)[0];		
		_fieldsCache = _activeForm.fieldsCache;
		_renderRulesComutations = {};
		_buildFormPage();
		console.log(_dataJson);
	}
	
	global.AppFORM = {
		open:		renderDataForm,
		switch:		switchForm,
		navigate:	formNavigate,
		tab:		formTabHandler,
		togglePanel:toggleSectionPanel,
		
		
		mcRecChk:	multiCtxRecSelect,
		insert:		insertMcRecord,
		copy:		copyMcRecord,
		delete:		deleteMcRecord,		
		sort:		sortMcGridRecs,
		pager:		gridPaginationHandler,
		pageSize:	gridPageSizeHandler,
		
		lookup:		openLookupModule,		
		comboSearch:msComboSearchHandler,		
		
		editField:	formFieldChangeHandler,
		msComboSel:	msComboSelectHandler,
		clearLookup:clearLookupValue,
		valSwitch:	switchInputHandler,
		
		mcRecEdit:		mcRecEditHandler,
		mcCtxback:		mcNavBackHandler,
		
		action:		handleFormActions,
		toggleNav:	toggleNavPanel,
		
		errorWin: 	showErrorPopup
		
	};
})(window);
