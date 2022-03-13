(function () {
    "use strict";
    window.app.directive("addMasterparameter", addMasterparameter);
    function addMasterparameter() {
        return {
            templateUrl:MyApplication.rootPath+"/MasterParameter/template/add.tmpl.cshtml",
            controller: controller,
            controllerAs: "vm"
        }
    }
    
    controller.$inject = ["$scope", "alerts", "$timeout", "MasterParameterService"];
    function controller($scope, alerts, $timeout, MasterParameterService) {
        var vm = this;
        vm.title = "Add Master Parameter";
        vm.masterparameter = {};
        vm.saving = false;
        vm.save = function(){
            vm.saving = true;
            MasterParameterService.add(vm.masterparameter).then(function () {
                $scope.$close();
            }).catch(function (response) {
                if (response.data.errorMessage) {
                    vm.message.error("There was a problem saving the issue: <br/>" + response.data.errorMessage + "<br/>Please try again.");
                } else {
                    vm.message.error("There was a problem saving the issue. Please try again.");
                }
            }).finally(function () {
                vm.saving = false;
            });
        }
    }
})()