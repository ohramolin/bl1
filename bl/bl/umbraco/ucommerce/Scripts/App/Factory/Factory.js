/*
	Responsible for registering all needed components for the angular app in native uCommerce editors.
	Things should be loaded from here and registered as an individual components. If not. Do so. 
*/

/* Resources */
angular.module('ucommerce.resources').factory('uCommerceDefinitionsResource', uc_definitions_Resource);
angular.module('ucommerce.resources').factory('uCommerceContentResource', uc_content_resource);

/* Services */
angular.module('ucommerce.services').factory('definitionsService', uc_definitions_service);
angular.module('ucommerce.services').factory('uCommerceContentService', uc_content_picker_service);

angular.module('ucommerce').controller("definitionGraphsController", uc_definitionsGraphController);
angular.module('ucommerce').controller("treeController", uc_treeController);
angular.module('ucommerce').controller("contentTreeController", contentTreeController);
angular.module('ucommerce').controller("multiPickerController", uc_multiPickerController);

angular.module('ucommerce.directives').directive("rightClick", uc_rightClick);
angular.module('ucommerce.directives').directive('ucommerceDefinitionsGraph', ucommerceDefinitionsGraph);
angular.module('ucommerce.directives').directive('ucommerceTree', ucommerceTree);
angular.module('ucommerce.directives').directive('ucommerceContentTree', ucommerceContentTree);
angular.module('ucommerce.directives').directive("ucommerceContentPicker", ucommerceContentPicker);
angular.module('ucommerce.directives').directive("ucommerceContentPickerLauncher", ucommerceContentPickerLauncher);
angular.module('ucommerce.directives').directive("ucommerceMultiPicker", ucommerceMultiPicker);