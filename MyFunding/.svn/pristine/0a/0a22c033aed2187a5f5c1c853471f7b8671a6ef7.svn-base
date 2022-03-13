(function () {
    'use strict';

    window.app.directive('deleteParameteremail', deleteParameteremail);
    function deleteParameteremail() {
        return {       
            templateUrl: MyApplication.rootPath + '/parameteremail/template/delete.tmpl.cshtml',
            controller: controller,
            controllerAs: 'vm'
        }
    }

    controller.$inject = ['$scope', '$modal', 'ParameterEmailService'];
    function controller($scope, $modal, ParameterEmailService) {
        var vm = this;

        vm.parameterEmail = $scope.data;
        vm.selectedView = 'delete';
        vm.setView = setView;  

        function setView(view) {
            vm.selectedView = view;
        }    

        vm.delete = function () {
            vm.saving = true;
            ParameterEmailService.deleteData(vm.parameterEmail)
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
				.finally(function () {
				    vm.saving = false;
				});
        }
    }
})();