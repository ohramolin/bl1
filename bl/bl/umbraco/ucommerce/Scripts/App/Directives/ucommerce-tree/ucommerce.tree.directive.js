function ucommerceTree($compile) {
	return {
		restrict: 'E',
		scope: {
			tree: '=',
			hasCheckboxFor: '=',
			contentPickerType: '=',
			iconFolder: '=',
			loadOnCompile: '=',
			hasRightClickMenu: '=',
			preSelectedValues: '=',
			selectedNodeStyle: '=',
			iconFolderOverwrite: '='
		},
		templateUrl: UCommerceClientMgr.BaseUCommerceUrl+'scripts/app/directives/ucommerce-tree/ucommerce.tree.html',
		replace: true,
		controller: uc_treeController,
		compile: function (tElement, tAttr) {
			var contents = tElement.contents().remove();
			var compiledContents;
			return function (scope, iElement, iAttr) {
				scope.currentNodeElement = iElement;
				scope.nodeIconClasses = function (icon) {
					if (UCommerceClientMgr.Shell === 'Umbraco7') {
						if (icon === '.sprTreeFolder') {
							icon = 'icon-folder';
						}

						return 'treeNodeIcon icon umb-tree-icon ' + icon;
					} else {
						return 'treeNodeIcon';
					}
				};

				if (!compiledContents) {
					compiledContents = $compile(contents);
				}
				compiledContents(scope, function (clone, scope) {
					iElement.append(clone);
				});
			};
		}
	};
}