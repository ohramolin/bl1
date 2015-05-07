function contentPickerController($scope, uCommerceContentService) {

	$scope.pictureLoad = pictureLoad;
	$scope.closeContainer = closeContainer;
	$scope.SavePicture = savePicture;
	$scope.setSelectedId = setSelectedId;
	$scope.setSelectedImagePreviewUrl = setSelectedImagePreviewUrl;
    $scope.launcherId = '';
	$scope.ImageUrl = '';
	$scope.ImageClasses = '';
	$scope.ImagePicker = '';
	$scope.imagePreviewUrl = '';
	$scope.selectedId = '';
	$scope.selectedInputValueName = '';
	$scope.inputValueName = '';
	$scope.inputValue = '';
	$scope.selectButtonText = '';
	$scope.hasPreview = '';
	$scope.removeButtonText = '';
	$scope.showImage = showImage;
	$scope.contentStyle = contentStyle;
	$scope.showImagePreview = showImagePreview;

	$scope.modalStyle = function () {
		return {
			width: $scope.width + 'px',
			height: $scope.height + 'px',
			padding: 0
		};
	};
	
	$scope.modalStyleOffset = function (offset) {
		return {
			width: $scope.width + 'px',
			height: ($scope.height - offset) + 'px',
			padding: 0,
			'overflow-y': 'none',
			'max-height': $scope.height + 'px'
		};
	};

	$scope.getContentPickerType = function () {
		return $scope.contentPickerType;
	};

	$scope.$on('nodeSelected', function (event, data) {
		var node = data;
		setSelectedImagePreviewUrl(node.url);
		setSelectedId(node.id);
		setSelectedName(node.name);

	});
	
	function setSelectedName(name) {
		$scope.selectedInputValueName = name;
	}

	function showImage() {
	    var show = $scope.ImageUrl != '' && $scope.hasPreview === 'true';
		return show;
	}
	
	function showImagePreview() {
		var show = $scope.imagePreviewUrl != '' && $scope.hasPreview === 'true';
		return show;
	}

	function contentStyle() {
        if ($scope.hasPreview == "false") {
            return { 'min-width': '100%' };
        }
	}

	function setSelectedId(id) {
		$scope.selectedId = id;
	}
	
	function setSelectedImagePreviewUrl(url) {
		if (url != '') {
			$scope.imagePreviewUrl = url;
			$scope.currentNodeElement.find('#selectedImagePreview').show();
		}
	}
	
	function closeContainer(event) {
	    event.stopPropagation();

	    if (event.WasHandled) { return; }
	    event.WasHandled = true;

	    UCommerceClientMgr.closeModalWindow();
	}
	
	function savePicture(event) {   
	    event.stopPropagation();

	    if (event.WasHandled) { return; }
	    event.WasHandled = true;

	    if ($scope.selectedId != '' && $scope.imagePreviewUrl != '') {
            // We have to look through all the iframes to find the one containing the launcher.
	        var frames = parent.$.find('iframe');
            if (frames.length) {
                for (var index = 0; index < frames.length; index++) {
                    var frame = frames[index];
                    // Find the potential launcher.
                    var launchers = frame.contentWindow.$('#' + $scope.launcherId);
                    if (launchers.length && launchers.length > 0) {
                        // Launcher found!
                        frame.contentWindow
                            .SavePicture(
                                $scope.launcherId,
                                $scope.imagePreviewUrl,
                                $scope.selectedId,
                                $scope.selectedInputValueName
                            );
                        UCommerceClientMgr.closeModalWindow();
                        return;
                    }
                }
            }
		}
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

window.SavePicture = function (elmId, imagePreviewUrl, selectedId, selectedInputValueName) {
    var imagePickerScope = angular.element('#' + elmId).scope();

    imagePickerScope.$apply(function(scope) {
        scope.ImageUrl = imagePreviewUrl;
        scope.inputValue = selectedId;
        scope.inputValueName = selectedInputValueName;
        scope.currentNodeElement.next().val(selectedId);
    });
};

angular.module('ucommerce').controller("contentPickerController", contentPickerController);