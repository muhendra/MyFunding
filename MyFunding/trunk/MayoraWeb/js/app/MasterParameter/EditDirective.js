(function () {
    "use strict";
    window.app.directive("editMasterparameter", editMasterparameter);
    function editMasterparameter() {
        return {
            scope: {
                data:"="
            },
            templateUrl:MyApplication.rootPath+"/MasterParameter/template/edit.tmpl.cshtml",
            controller: controller,
            controllerAs: "vm"
        }
    }
    
    controller.$inject = ["$scope", "alerts", "$timeout", "MasterParameterService"];
    function controller($scope, alerts, $timeout, MasterParameterService) {
        var vm = this;
        vm.title = "Edit Master Parameter";
        vm.masterparameter = angular.copy($scope.data);
        vm.saving = false;
        vm.save = function(){
            vm.saving = true;
            MasterParameterService.update($scope.data, vm.masterparameter).then(function () {
                $scope.$parent.$close();
            }).catch(function (response) {
                if (response.data.errorMessage) {
                    //vm.message.error("There was a problem saving the issue: <br/>" + response.data.errorMessage + "<br/>Please try again.");
                    vm.message.error(response.data.errorMessage);
                } else {
                    vm.message.error("There was a problem saving the issue. Please try again.");
                }
            }).finally(function () {
                vm.saving = false;
            });
        }
    }
})()