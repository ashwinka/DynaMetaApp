(function (global) {
	console.log('Initializing App Menu Bar Component')
	let _loggedUser = sessionStorage.getItem('md_user') || 'User';	
	let _activeModule = sessionStorage.getItem('md_act_module') || null;
	let _menuItems = {};
	let _menu_registry = {};
	
	
	//set the menu registry from the static variable from config folder menu_registry file
	try {
		let sessionMenu = sessionStorage.getItem('md_menu');
		var menuObj = JSON.parse(sessionMenu);		
		MENU_REGISTRY.groups = menuObj.groups;		
		_menu_registry = {...MENU_REGISTRY}
		if (menuObj.appName) _menu_registry.appName = menuObj.appName;
	} catch (e) {
		console.warn('Failed to restore menu from sessionStorage; Defaulting to static Menu item');
		_menu_registry = {};
		if (typeof MENU_REGISTRY !== 'undefined') {
			_menu_registry = {...MENU_REGISTRY};			
		}
		
	}
	
	function toggleMenuDrawer(targetCmp){
		$(targetCmp).parents('.md-dropdown__menu').removeClass('open');
	}
	
	function performMenuNavigation(){
		let menuItemObj = _activeModule && _menuItems[_activeModule];
		if(!menuItemObj){
			return;		
		}
		
		AppListScreen.listing();
	}
	
	function setActiveMenuItem(menuCmp){
		let menuId = $(menuCmp).attr('data-item-id');
		
		if(!menuId){
			return;
		}
	
		if(_menuItems[menuId]){
			_activeModule = menuId;
			sessionStorage.setItem('md_act_module', _activeModule);
			
			let item = _menuItems[menuId];
			let itemTrans = AppI18N.trans(item.translations, item.label);
			var itemLabel = itemTrans?.label ? itemTrans?.label : item.label
			$('#appBarPageTitle').text(itemLabel);
		}
		
		$('.menu-item').removeClass('active');
		$('.menu-item[data-item-id="'+menuId+'"]').addClass('active');

		toggleMenuDrawer(menuCmp);
		performMenuNavigation();
		
	}
	function getMenuItem(menuId){
		return _menuItems[menuId] || {};
		
	}
	
	function buildAppMenuBar(){
		console.log('Building App Menu Bar')
		buildAppHeader();
		buildAppMenuDrawer();
		
		$('#drawerUserName').text(_loggedUser);
		$('#drawerAvatarEl').text(_loggedUser.slice(0,2).toUpperCase());
		

		/* Auto-navigate to first non-disabled item */
		if(!_activeModule){
			for (var gi = 0; gi < (_menu_registry.groups || []).length; gi++) {
				var items = _menu_registry.groups[gi].items || [];
				for (var ii = 0; ii < items.length; ii++) {
					if (!items[ii].disabled) { _activeModule = items[ii].itemId;break;}
				}
				if(_activeModule){break}
			}				
		}
		setActiveMenuItem(_activeModule);
	}
	
	function buildAppHeader(){
			  
		let appHeaderHtml = `
			<div class="menu-wrapper">
				<button class="app-bar__menu-btn menu-btn-cmp">
					<svg viewBox="0 0 24 24"><line x1="3" y1="6" x2="21" y2="6"/><line x1="3" y1="12" x2="21" y2="12"/><line x1="3" y1="18" x2="21" y2="18"/></svg>
				</button>
				<!-- MENU DRAWER -->
				<nav class="menu-drawer md-dropdown__menu" id="menuDrawer" style="display:none;">
				  
				</nav>
			</div>
			<div class="app-bar__brand">
				<div class="app-bar__brand-icon">
					<svg viewBox="0 0 24 24"><path id="appBarBrandPath" d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5"/></svg>
				</div>
				<span id="appBarBrandName">${AppI18N.t('app.header.title')}</span>
			</div>
			<div class="app-bar__sep"></div>
			<span class="app-bar__page-title" id="appBarPageTitle"></span>
			<div class="app-bar__spacer"></div>
			
			<!-- Language switcher -->
			<div class="app-bar__lang menu-wrapper">
				<button class="app-bar__lang-btn menu-btn-cmp">
				  <svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="10"/><line x1="2" y1="12" x2="22" y2="12"/><path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"/></svg>
				  <span id="appBarLangCode">${LANG_META[AppI18N.lang()].short}</span>
				</button>
				<div class="md-dropdown__menu" menu-handler="selectAppLanguage">
					${AppI18N.appI18nCombo()}
				</div>
			</div>
			<div class="app-bar__user">
				<div class="avatar" id="avatarEl">${_loggedUser.slice(0,2).toUpperCase()}</div>
				<span id="userNameEl">${_loggedUser}</span>
				<button class="btn-logout" id="btnLogout" onclick="logout()">Sign out</button>
			</div>
			
		`;
		$('.app-bar').html(appHeaderHtml);
		
	}
	
	
	function buildAppMenuDrawer(){
		//Menu Header
		let menuPanelHeader = `
		  <div class="menu-drawer__header">
			<div class="menu-drawer__header-brand">
			  <div class="menu-drawer__header-icon">
				<svg viewBox="0 0 24 24"><path id="drawerBrandPath" d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5"/></svg>
			  </div>
			  <span id="drawerBrandName">${AppI18N.t('app.header.title')}</span>
			</div>
			<button class="menu-drawer__close">
			  <svg viewBox="0 0 24 24"><line x1="18" y1="6" x2="6" y2="18"/><line x1="6" y1="6" x2="18" y2="18"/></svg>
			</button>
		  </div>	
		`;
		
		//Menu body
		let menuPanelBody = `<div class="menu-drawer__body" id="menuDrawerBody" style="height:90%;">${buildMenuItems()}</div>`;
		
		//Menu Footer
		let menuPanelFooter = `
		  <div class="menu-drawer__footer">
			<div class="menu-drawer__user">
			  <div class="avatar" id="drawerAvatarEl">DU</div>
			  <div class="menu-drawer__user-info">
				<div class="menu-drawer__user-name" id="drawerUserName">${_loggedUser}</div>
				<div class="menu-drawer__user-role">Administrator</div>
			  </div>
			</div>
		  </div>
		`;
		
		
		$('#menuDrawer').html(menuPanelHeader);
		$('#menuDrawer').append(menuPanelBody);
		$('#menuDrawer').append(menuPanelFooter);
	}


	function buildMenuItems() {
		
		let menuBodyHtml = [];
	  
		(_menu_registry.groups || []).forEach(function(group, gi) {
		if (gi > 0) {
			menuBodyHtml.push('<div class="menu-divider"></div>');
		}
		
		menuBodyHtml.push('<div class="menu-group__heading">');
		menuBodyHtml.push('<svg viewBox="0 0 24 24" style="width:12px;height:12px;stroke:currentColor;fill:none;stroke-width:2;stroke-linecap:round;flex-shrink:0;"><path d="' + group.icon + '"/></svg>');
		menuBodyHtml.push(AppI18N.trans(group.translations, group.label));
		menuBodyHtml.push('</div>');
		
		
		(group.items || []).forEach(function(item) {
			_menuItems[item.itemId] = item;
			let itemTrans = AppI18N.trans(item.translations, item.label);
			var itemLabel = itemTrans?.label ? itemTrans?.label : item.label
			var itemDesc  = itemTrans?.description ? itemTrans?.description : item.label;
		  
			menuBodyHtml.push(`<div class="menu-item ${item.disabled ? 'disabled' : ''}" data-item-id="${item.itemId}">`);
			menuBodyHtml.push('  <div class="menu-item__icon"><svg viewBox="0 0 24 24"><path d="' + (item.icon || 'M12 12h.01') + '"/></svg></div>');
			menuBodyHtml.push('  <div class="menu-item__text">');
			menuBodyHtml.push('    <div class="menu-item__label">' + itemLabel + '</div>');
			menuBodyHtml.push('    <div class="menu-item__desc">' + (itemDesc ? itemDesc : '') + '</div>');
			menuBodyHtml.push('  </div>');
			menuBodyHtml.push('</div>');
		  
		  
		});
	  });
	  
	  return menuBodyHtml.join('');		
	}
	
	/* ════════════════════════════════════════════════ MENU OPEN/CLOSE ════════════════════════════════════════════════ */

	global.AppMenuHeader = {
		setMenu:		setActiveMenuItem,
		getMenu: 		getMenuItem,
		build: 			buildAppMenuBar,
		activeModule:	()=>{return _menuItems[_activeModule]},
		toggle:			toggleMenuDrawer,
		navigate:		performMenuNavigation
	};
})(window);
