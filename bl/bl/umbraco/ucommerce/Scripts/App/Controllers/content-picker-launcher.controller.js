function contentPickerLauncherController($scope, uCommerceContentService) {

    $scope.pictureLoad = pictureLoad;
    $scope.launchTreePicker = launchTreePicker;
    $scope.removeContent = removeContent;
    $scope.ImageUrl = '';
    $scope.ImageClasses = '';
    $scope.inputValueName = '';
    $scope.selectButtonText = '';
    $scope.removeButtonText = '';
    $scope.showImage = showImage;
    $scope.selectedItemEmpty = selectedItemEmpty;

    function selectedItemEmpty() {
        return $scope.inputValue != '';
    }

    function showImage() {
        var show = $scope.ImageUrl != '' && $scope.hasPreview === 'true';
        return show;
    }

    function launchTreePicker() {
        var contentPickerUrl = UCommerceClientMgr.BaseUCommerceUrl + "ContentTree.aspx" +
	        "?id=" + $scope.id +
	        "&hasPreview=" + $scope.hasPreview +
	        "&headerText=" + $scope.dialogHeaderText +
	        "&tinyHeaderText=" + $scope.dialogHeaderTinyText +
	        "&saveText=" + $scope.saveText +
	        "&saveOrText=" + $scope.saveOrText +
	        "&cancelText=" + $scope.cancelText +
	        "&contentPickerType=" + $scope.contentPickerType;

        var pickerWidth = ($scope.hasPreview == "true") ? 700 : 400;

        UCommerceClientMgr.openModal(contentPickerUrl, "ContentPicker", pickerWidth, 500);
    };

    function removeContent() {
        $scope.inputValue = '';
        $scope.ImageUrl = '';
        $scope.inputValueName = '';
        $scope.currentNodeElement.next().val('');
    }

    function pictureLoad(id, classes, imagePicker, type) {
        $scope.contentPickerType = type;
        $scope.ImageClasses = classes;
        $scope.ImagePicker = imagePicker;
        $scope.inputValue = id;
        uCommerceContentService.getImageUrl(id).then(
		function (data) {
		    $scope.ImageUrl = data;
		    $scope.imagePreviewUrl = data;
		});
    }
}

angular.module('ucommerce').controller("contentPickerLauncherController", contentPickerLauncherController);