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
	
	function resolveFormMd(fmMd, flMdMap){
		let fields = fmMd.fields || [];
		
		for(let f of fields){
			let flMd = flMdMap[f.fieldId];
			if(flMd){resolveFieldMd(f, flMd);}
		}
		
		let gridFields = fmMd.gridFields || [];
		for(let f of gridFields){
			let flMd = flMdMap[f.fieldId];
			if(flMd){resolveFieldMd(f, flMd);}
		}
		
		let sections = fmMd.sections || [];
		for(let sec of sections){
			resolveFormMd(sec, flMdMap);
		}
	}
	
	function resolveMetadata(mdBundle){
		let listingMd = mdBundle?.listingMetadata
		let lkpMd = mdBundle?.lookupMetadata;
		let fmsMd = mdBundle?.formMetadata?.FORMS || {};
		let flMdMap = {};
		for(let f of (mdBundle?.fields || [])){
			flMdMap[f.fieldId] = resolveFieldUiMetadata(f)
		}
		
		//resolve Listing metadata
		resolveListingMd(listingMd, flMdMap);
		resolveListingMd(lkpMd, flMdMap);
		
		for(let fmId in fmsMd){
			resolveFormMd(fmsMd[fmId], flMdMap)
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
	
	async function getLookupMd(moduleId){
		let metadata = await _getMdPack(moduleId);
		return metadata?.lookupMetadata;
		
	}
	
	global.AppMD = { listing: getListingMd , forms:getAllFormsMd, form:getFormsMd, lookup:getLookupMd};
	
})(window);
