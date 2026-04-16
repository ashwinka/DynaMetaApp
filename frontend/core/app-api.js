/**
 * MetaDyna Forms — API Service, to load the Metadata, Listing screen records, Edit screen Data record , Save/Update the Data Record, Patch/Smart save Data Record
 *
 * METADATA LOADING
 * ────────────────
 * When a module is first accessed, AppAPI fetches the complete UI metadata bundle along with Codeist.
 * bundle from the backend:
 *   GET /api/metadata/ui/{moduleId}
 *   Headers: Authorization: Bearer <jwt>, X-Tenant-ID: <tenantId>
 *
 * The bundle response shape:
 *   { formMetadata: { module, FORMS: { <name>: <json> } },
 *     listingMetadata: <json>,
 *     lookupMetadata:  <json>,
 *     i18nTrans:       <json> }
 *
 * Results are cached in the internal AppMD store — subsequent calls for the same
 * module are served instantly from the store without hitting the network.
 * 
 */
(function(global){
	console.log('Initializing App API')
	
	function _getAuthHeaders() {
		var jwt      = sessionStorage.getItem('md_auth') || '';
		var tenantId = sessionStorage.getItem('md_tenant_id') || '';
		return {
		  'Content-Type':  'application/json',
		  'Authorization': 'Bearer ' + jwt,
		  'X-Tenant-ID':   tenantId
		};
	}
	
	
	async function fetchOfflineMetadataRegistry(moduleId){
		let url = 'metadata/' + moduleId + '.js'
		return new Promise((resolve, reject) => {
			const s = document.createElement('script');
			s.src = url;

			s.onload = () => {
			  resolve(window.offline_metadata); // ✅ return value
			};

			s.onerror = () => {
			  reject(new Error("Failed to load script"));
			};

			document.head.appendChild(s);
		});
	}
	
	async function fetchMetadata(moduleId) {
		let codelistsLoaded = false;
		if(AppCL !== undefined){
			isClLoaded = AppCL.status();
		}
		
		if(undefined === CONFIG_API_BASE_URL || !CONFIG_API_BASE_URL){
			//Offline mode, load the module specific metadata registry from js file by dynamic script tag attach.
			let offlineMd = await fetchOfflineMetadataRegistry(moduleId);
			AppI18N.moduleTrans(moduleId, offlineMd.i18nTrans);
			return offlineMd;
		}
		/* If codelists not yet loaded, use the /full endpoint to get both in one call.
		   If codelists are already in store, use the lighter metadata-only endpoint. */
		var url = codelistsLoaded ? 
			CONFIG_API_BASE_URL + '/api/metadata/ui/' + encodeURIComponent(moduleId) :
			CONFIG_API_BASE_URL + '/api/metadata/ui/' + encodeURIComponent(moduleId) + '/full';

	
		console.info('MetaDynaAPI: fetching UI metadata' + (codelistsLoaded ? '' : ' + codelists') + ' for "' + moduleId + '" from ' + url);

		const response = await fetch(url, { headers: _getAuthHeaders() });
		const respData = await response.json(); 
		if (respData.data?.codeLists) {
			console.log('Adding Codelist pack')
			let clPack = respData.data.codeLists;
			AppCL.addPack(clPack);
			delete response.codeLists;
        }
		if(respData.data?.i18nTrans){
			console.log('Adding Module translation pack')
			AppI18N.moduleTrans(moduleId, respData.data.i18nTrans);
		}
				
		return respData.data;
	}
	
	async function fetchModuleListingData(moduleId, criteria){
		
		if(undefined === CONFIG_API_BASE_URL || !CONFIG_API_BASE_URL){
			//Offline mode, load the module specific metadata registry from js file by dynamic script tag attach.
			return {
			  records:       [],
			  totalRecords:  0,
			  page:          0,
			  size:          0
			};
		}
		
		
		var url = CONFIG_API_BASE_URL + '/api/modules/' + encodeURIComponent(moduleId) + '/records/listing';
		const fetchRecsResp = await fetch(url, { 
			method: 'POST', 
			headers: _getAuthHeaders(), 
			body: JSON.stringify(criteria || {})
		});
		const respJson = await fetchRecsResp.json(); 
		const listnigData = respJson.data;
		return {
		  records:       listnigData.content || [],
		  totalRecords:  listnigData.totalElements || 0,
		  page:          listnigData.page || 0,
		  size:          listnigData.size || 0
		};	
		
	}
	
	async function fetchModuleDataRecord(id, moduleId){
		var url = CONFIG_API_BASE_URL + '/api/modules/' + encodeURIComponent(moduleId) + '/records/edit/' + encodeURIComponent(id);
		const dataRedResp = await fetch(url, { headers: _getAuthHeaders() });
		const dataRecObj = await dataRedResp.json();		
		return dataRecObj.data;
	}
	
	async function updateModuleDataRecord(moduleId, data){
		var url = CONFIG_API_BASE_URL + '/api/modules/' + encodeURIComponent(moduleId) + '/save/'+ encodeURIComponent(data.id);
		const dataRedResp = await fetch(url, { method: 'POST', headers: _getAuthHeaders(),
		  body: JSON.stringify(data || {})
		});
		const dataRecObj = await dataRedResp.json();	
		return dataRecObj;		
	}
	
	async function patchModuleDataRecord(moduleId, updatedJson, deletedJson){
		if(undefined === CONFIG_API_BASE_URL || !CONFIG_API_BASE_URL){
			//Offline mode, load the module specific metadata registry from js file by dynamic script tag attach.
			return updatedJson
		}
				
		/* PATCH /api/modules/{moduleId}/records/patch/{id} — delta update */
		var url = CONFIG_API_BASE_URL + '/api/modules/' + encodeURIComponent(moduleId) + '/records/patch/' + encodeURIComponent(updatedJson.id);
		const dataRedResp = await fetch(url, { method: 'PATCH', headers: _getAuthHeaders(),
		  body: JSON.stringify({ updatedJson: updatedJson || {}, deletedRec: deletedJson || {} })
		});
		const dataRecObj = await dataRedResp.json();	
		return dataRecObj;
	}
	
	global.AppAPI = {
		fetchMd:fetchMetadata,
		fetchListingRecs:fetchModuleListingData,
		fetchDataRec:fetchModuleDataRecord,
		update:updateModuleDataRecord,
		patch:patchModuleDataRecord
	};
})(window)
