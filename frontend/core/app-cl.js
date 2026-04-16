/**
 * MetaDyna — fall-back, application codelist will be handled.
 * Codelist will be loaded via AppCL.load({'clID':{codelistId:'', values:[{'code':'', 'decode':'', trans:{'en':'',fr:''}}]}}), AppCL.add(clId, {codelistId:'', values:[{'code':'', 'decode':'', trans:{'en':'',fr:''}}]})
 * Codelist will be access via AppCL.cl(clId), AppCL.values(clId), AppCL.code(code, clId), AppCL.trans(code, clId)
 * Module level will be registered first on metadata load AppI18n.load(moduleId, transObj); and access via AppI18n.mT(key, modId)
 * Codelist level will be accessed via AppI18n.clT(clCode, clId, clDecode)
 *
 */
(function(global){
	console.log('Initializing App Codelist')
	let _cl_store = {};
	let _loadStatus = false;
	
	function addCodelistPackage(clPack){
		if(!clPack){
			return;
		}
		for(clId in clPack){
			_cl_store[clId] = clPack[clId];
		}
		
	}
	
	function addCodelist(clId, clObj){
		_cl_store[clId] = clObj;
	}
	
	function getCodelist(clId){
		return _cl_store[clId] || {codelistId:clId, values:[]};
	}
	
	function getClValues(clId){
		return (_cl_store[clId]) || [];
	}
	
	function getClCode(code, clId){
		return (_cl_store[clId] && _cl_store[clId].filter(c=>c.code===code)[0]) || {};
	}
	
	function getClCodeTrans(code, clId){
		let clVal = _cl_store[clId] && _cl_store[clId].filter(c=>c.code===code)[0];
		return clVal?.trans || clVal || {};
	}
	
	function loadStatus(){
		return _loadStatus;
	}
	function setLoadStatus(){
		_loadStatus = true;
	}
	
	global.AppCL = { addPack: addCodelistPackage , add:addCodelist, cl:getCodelist, values:getClValues, code:getClCode, trans:getClCodeTrans, status:loadStatus, loaded:setLoadStatus};
	
})(window);
