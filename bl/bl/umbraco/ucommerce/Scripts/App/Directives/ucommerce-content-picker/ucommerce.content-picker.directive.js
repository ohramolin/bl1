// Simple navigation directive, binding to a navigation view.
function ucommerceContentPicker($compile) {
	return {
		restrict: 'E',
		transclude: true,
		replace: true,
		scope: {
			type: '&',
			header: '=',
			close: '&',
			timeout: '@',
		},
		template:
		        '<div class="imagePicker">' +
				    '<div class="sectionGroupHeader">' +
					    '<input id="uc-headline" type=text disabled="disabled" class="entityName uc-headline readOnly" value="{{dialogHeaderText}}">' +
					    '<p class="guiDialogTiny">{{dialogHeaderTinyText}}</p>' +
				    '</div>' +
				    '<div class="imagePickerContainer propertyPane">' +
					    '<div class="imagePickerContainerBody propertyItem">' +
						    '<div class="imagePickerContainerTreeContainer propertyItemContent" ng-style="contentStyle()">' +
							    '<ucommerce-content-tree class="tree" content-picker-type="contentPickerType" load-on-compile="true" tree="data"></ucommerce-content-tree>' +
						    '</div>' +
						    '<div class="imagePickerContainerPreview" data-ng-show="showImagePreview()">' +
							    '<img ng-src="{{imagePreviewUrl}}" class="imagePreview" id="selectedImagePreview" />' +
						    '</div>' +
					    '</div>' +
				    '</div>' +
				    '<div class="footerOkCancel" style="margin-top: 15px;"><input data-ng-click="SavePicture($event)" type="button" class="dialog-saveButton" value="{{saveText}}" /><em style="margin: 10px;">{{orText}}</em><a data-ng-click="closeContainer($event)" Class="dialog-cancelButton">{{cancelText}}</a></div>' +
				    '<img ng-src="{{ImageUrl}}" data-ng-show="showImage()" class="{{ImageClasses}}" id="selectedImage"/>' +
		        '</div>',
		controller: contentPickerController,
		compile: function (tElement, tAttr) {
			return {

				pre: function preLink(scope, tElement, tAttr) {

					var contents = tElement.contents().remove();
					var compiledContents;
					var attrs = tAttr;

					if (!compiledContents) {
						compiledContents = $compile(contents);
					}
					compiledContents(scope, function (clone, scope1) {
						tElement.append(clone);
					});

					var contentPickerType = attrs["contentPickerType"];
					scope.contentPickerType = contentPickerType;

					var preview = attrs["hasPreview"];
					var dialogHeaderText = attrs["dialogHeaderText"];
					var dialogHeaderTinyText = attrs["dialogHeaderTinyText"];
					var saveText = attrs["saveText"];
					var saveOrText = attrs["saveOrText"];
					var cancelText = attrs["cancelText"];

					scope.dialogHeaderTinyText = dialogHeaderTinyText;
					scope.dialogHeaderText = dialogHeaderText;
					scope.saveText = saveText;
					scope.orText = saveOrText;
					scope.cancelText = cancelText;
					scope.hasPreview = preview;
					scope.launcherId = attrs["launcherElementId"];
					scope.currentNodeElement = tElement;
				},

				post: function postLink(scope,elem, attrs)
				{

				}


			};
		},

	};
}




