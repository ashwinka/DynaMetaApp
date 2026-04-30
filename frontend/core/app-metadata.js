/**
 * MetaDyna — Metadata repositories/store will be maintained.
 * Metadata will be accessed via AppMD.get(moduleId), AppMD.listing(moduleId), AppMD.lookup(moduleId)
 * For the first time it will load the metadata bundle from backed end and cache with internal store. Subsequent access will be served from the internal store.
 *
 */
(function(global){
	console.log('Initializing App Metadata')
	let _md_store = {};
	
	function resolveFieldUiMetadata(flMd){
		try{
			flMd.uiMetadata = JSON.parse(flMd.uiMetadata);
		}catch(err){
			flMd.uiMetadata = {};
		}
		return flMd;		
	}
	
	function resolveFieldMd(f, flMd){
		f.fieldPath = flMd.fieldPath;
		f.fieldName = flMd.fieldName;
		f.listingAlias = flMd.listingAlias;
		f.dataType = flMd.dataType;
		f.maxLength = flMd.maxLength;
		f.requiredField = flMd.requiredField;
		
		if(!f.label && flMd.label){
			f.label = flMd.label;
		}
		if(!f.labelInfo && flMd.labelInfo){
			f.labelInfo = flMd.labelInfo;
		}
		if(!f.description && flMd.description){
			f.description = flMd.description;
		}
				
		let uiMd = flMd.uiMetadata || {};
		for(let uiProp in uiMd){
			if(!f[uiProp]){
				f[uiProp] = uiMd[uiProp]
			}
		}
	}
	
	function resolveRenderRulesFieldImpacts(renderRule, triggerFieldImpacts, target, targetType){
		let triggerFields = renderRule.triggerFields ? renderRule.triggerFields.split('|') : [];
		
		for(let flId of triggerFields){
			if(!triggerFieldImpacts[flId]){
				triggerFieldImpacts[flId] = {impactedRules:{}, impactedFieldsRender:{}, impactedSectionsRender:{}, impactedFieldReadonly:{}, impactedGridActions:{}, impactedFieldCodelist:{}, impactedFieldLookup:{}};
			}
			
			let currFlImpacts = triggerFieldImpacts[flId];
			currFlImpacts.impactedRules[renderRule.ruleId] = true;
			
			switch(targetType){
				case 'fieldRender':
					currFlImpacts.impactedFieldsRender[target] = true;
					break;
				case 'readonlyRender':
					currFlImpacts.impactedFieldReadonly[target] = true;
					break;				
				case 'codelistRender':
					currFlImpacts.impactedFieldCodelist[target] = true;
					break;
					
				case 'lookupRender':
					currFlImpacts.impactedFieldLookup[target] = true;
					break;
					
				case 'sectionRender':
					currFlImpacts.impactedSectionsRender[target] = true;
					break;
					
				case 'gridActionsRender':
					currFlImpacts.impactedGridActions[target] = true;
					break;
			}
			
		}

		
	}
	
	function resolveListingMd(md, flMdMap){
		//Resolve Filters
		let filters = md?.FILTERS_FIELDS || [];
		for(let f of filters){
			let flMd = flMdMap[f.fieldId];
			if(flMd){
				resolveFieldMd(f, flMd);				
			}
		}
		
		//Resolve Grid fields
		let gridFls = md?.GRID_FIELDS || []
		for(let f of gridFls){
			let flMd = flMdMap[f.fieldId];
			if(flMd){
				resolveFieldMd(f, flMd);				
			}
		}
	}
	
	function resolveFormMd(fmMd, currFormFields, flMdMap, renderRuleMap, triggerFieldImpacts, rlInd, level, parentSecPath){
		let fields = fmMd.fields || [];
		let sectionPath = fmMd.tabPanel || fmMd.multiContext ? parentSecPath + '.' + fmMd.sectionId : parentSecPath;
		
		for(let f of fields){
			let flMd = flMdMap[f.fieldId];
			if(flMd){resolveFieldMd(f, flMd);}
			
			currFormFields[f.fieldId] = f;
			//Set the section path for field jump or fieldd navigation from error window
			f.sectionPath = sectionPath;
			
			
			if(f.renderCondition && rlInd[f.renderCondition]){
				let renderRule = rlInd[f.renderCondition];
				renderRuleMap[renderRule.ruleId] = renderRule;
				resolveRenderRulesFieldImpacts(renderRule, triggerFieldImpacts, f.fieldId, 'fieldRender');
			}
			
			if(f.readonlyCondition && rlInd[f.readonlyCondition]){
				let renderRule = rlInd[f.readonlyCondition];
				renderRuleMap[renderRule.ruleId] = renderRule;
				resolveRenderRulesFieldImpacts(renderRule, triggerFieldImpacts, f.fieldId, 'readonlyRender');
			}
		}
		
		if(fmMd.renderCondition && rlInd[fmMd.renderCondition]){
			let renderRule = rlInd[fmMd.renderCondition];
			renderRuleMap[renderRule.ruleId] = renderRule;
			resolveRenderRulesFieldImpacts(renderRule, triggerFieldImpacts, fmMd.sectionId, 'sectionRender');
		}
		
		if(fmMd.gridActionsRender && rlInd[fmMd.gridActionsRender]){
			let renderRule = rlInd[fmMd.gridActionsRender];
			renderRuleMap[renderRule.ruleId] = renderRule;
			resolveRenderRulesFieldImpacts(renderRule, triggerFieldImpacts, fmMd.sectionId, 'gridActionsRender');
		}
		
		
		let gridFields = fmMd.gridFields || [];
		for(let f of gridFields){
			let flMd = flMdMap[f.fieldId];
			if(flMd){resolveFieldMd(f, flMd);}
		}
		
		let sections = fmMd.sections || [];
		for(let sec of sections){
			sec.sectionPath = sectionPath;
			resolveFormMd(sec, currFormFields, flMdMap, renderRuleMap, triggerFieldImpacts, rlInd, (level+1), sectionPath);
		}
	}
	
	function resolveMetadata(mdBundle){
		let listingMd = mdBundle?.listingMetadata
		let lkpMd = mdBundle?.lookupMetadata;
		let fmsMd = mdBundle?.formMetadata?.FORMS || {};
		let rules = mdBundle?.renderRules || [];
		let rlInd = {};
		let flMdMap = {};
		for(let f of (mdBundle?.fields || [])){
			flMdMap[f.fieldId] = resolveFieldUiMetadata(f)
		}
		
		for(let r of rules){
			try{
				r.ruleExpression = JSON.parse(r.ruleExpression);
				rlInd[r.ruleId] = r;
			}catch(err){
				
			}
		}
		
		//resolve Listing metadata
		resolveListingMd(listingMd, flMdMap);
		resolveListingMd(lkpMd, flMdMap);
		
		for(let fmId in fmsMd){
			let renderRuleMap = {};
			let triggerFieldImpacts = {};
			let currFormFields = {...flMdMap};
			
			
			let sections = fmsMd[fmId].sections || [];
			for(let sec of sections){				 
				resolveFormMd(sec, currFormFields, flMdMap, renderRuleMap, triggerFieldImpacts, rlInd, 1, sec.sectionId);
			}
		
			fmsMd[fmId].triggerFieldImpacts = triggerFieldImpacts;
			fmsMd[fmId].renderRules = renderRuleMap;
			fmsMd[fmId].fieldsCache = currFormFields;
		}
		return mdBundle;
		
	}
	
	async function _getMdPack(moduleId){
		
		if(_md_store[moduleId]){
			return _md_store[moduleId]
		} else {		
			console.log("Fetching Metadata...")
			let moduleMd = await AppAPI.fetchMd(moduleId);
			_md_store[moduleId] = resolveMetadata(moduleMd);			
			
			console.log("Caching Metadata...")
			return _md_store[moduleId]
			
			//Load from backend or js depends on offline or online mode.
		}
	}
	
	async function getListingMd(moduleId){
		let metadata = await _getMdPack(moduleId);
		
		return metadata?.listingMetadata						
		
	}
	
	async function getAllFormsMd(moduleId){
		let metadata = await _getMdPack(moduleId);
		return metadata?.formMetadata || {};			
	}
	
	async function getFormsMd(formId, moduleId){
		let metadata = await _getMdPack(moduleId);
		return (metadata?.formMetadata && metadata?.formMetadata.FORMS[formId])|| {};	
		
	}
	async function getModuleFields(moduleId){
		let metadata = await _getMdPack(moduleId);
		return metadata.fields || {};		
	}
	
	async function getLookupMd(moduleId){
		let metadata = await _getMdPack(moduleId);
		return metadata?.lookupMetadata;
		
	}
	
	global.AppMD = { listing: getListingMd , forms:getAllFormsMd, form:getFormsMd, fields:getModuleFields, lookup:getLookupMd};
	
})(window);
