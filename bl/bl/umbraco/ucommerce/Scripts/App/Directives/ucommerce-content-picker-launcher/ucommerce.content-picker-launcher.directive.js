//// Simple navigation directive, binding to a navigation view.
function ucommerceContentPickerLauncher() {
    return {
        restrict: 'E',
        transclude: true,
        replace: true,
        scope: {
            id: "@"
        },
        templateUrl: UCommerceClientMgr.BaseUCommerceUrl + 'scripts/app/directives/ucommerce-content-picker-launcher/ucommerce.content-picker-launcher.html',
        controller: contentPickerLauncherController,
        link: function (scope, elm, attrs) {
            scope.dialogHeaderText = attrs["dialogHeaderText"];
            scope.dialogHeaderTinyText = attrs["dialogHeaderTinyText"];
            scope.saveText = attrs["saveText"];
            scope.saveOrText = attrs["saveOrText"];
            scope.cancelText = attrs["cancelText"];
            scope.hasPreview = attrs["hasPreview"];
            
            scope.inputValueName = attrs["inputValueName"];
            scope.selectButtonText = attrs["selectButtonText"];
            scope.removeButtonText = attrs["removeButtonText"];

            scope.pictureLoad(attrs["image"], attrs["imageClasses"], elm, attrs["contentPickerType"]);
            scope.currentNodeElement = elm;
        }
    };
}

