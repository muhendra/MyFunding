(function() {
	"use strict";

	window.app.directive('editParameteremail', editParameteremail);

	function editParameteremail() {
		return {			
			templateUrl: MyApplication.rootPath + '/parameteremail/template/edit.tmpl.cshtml',
			controller: controller,
			controllerAs: 'vm'
		}
	}

	controller.$inject = ['$scope', 'Upload', '$timeout', 'ParameterEmailService', 'imageclassService'];
	function controller($scope, Upload, $timeout, ParameterEmailService, imageclassService) {
		var vm = this;
		vm.save = save;
		vm.title = "Edit Parameter Email";
		vm.saving = false;
		vm.parameterEmail = angular.copy($scope.data);		

		function save() {		    
		    vm.saving = true;

		    ParameterEmailService.update($scope.data, vm.parameterEmail)
				.then(function () {
					//Close the modal
					$scope.$close();
				})
				.catch(function (response) {
				    if (response.data.errorMessage) {
				        vm.message.error("There was a problem saving the issue: <br/>" + response.data.errorMessage + "<br/>Please try again.");
				    } else {
				        vm.message.error("There was a problem saving the issue. Please try again.");
				    }
				})
				.finally(function() {
					vm.saving = false;
				});
		}        
	}
})();