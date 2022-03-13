﻿(function () {
    "use strict";
    window.app.directive("deleteMasterpromotion", deleteMasterpromotion);

    function deleteMasterpromotion() {
        return {
            scope: {
                data: '='
            },
            templateUrl: MyApplication.rootPath + "/MasterPromotion/template/delete.tmpl.cshtml",
            controller: controller,
            controllerAs: "vm"
        }
    }

    controller.$inject = ["$scope", "$modal", "$timeout", "MasterProductService", "MasterPromotionService"];
    function controller($scope, $modal, $timeout, MasterProductService, MasterPromotionService) {
        var vm = this;
        vm.title = "Delete Master Promotion ? ";
        vm.CategoryMasterProductGetPage = MasterProductService.getPage;
        vm.masterpromotion = angular.copy($scope.data);
        vm.save = save;
        vm.saving = false;
        vm.codeSearch = {};
        
        vm.codeSearch = { code: vm.masterpromotion.productCode, productName: vm.masterpromotion.productName }
       
        vm.onChangePeriodFrom = function () {
            if (vm.periodFrom != null) {
                vm.masterpromotion.periodFrom = vm.periodFrom;
            } else {
                vm.periodFrom = vm.masterpromotion.periodFrom;
            }
        }

        function save() {
            vm.saving = true;
            if (vm.masterpromotion.productCode == '' || vm.masterpromotion.productCode == null) {
                vm.message.error("Please must be filled.");
                vm.saving = false;
            } else {
                MasterPromotionService.deleted($scope.data, vm.masterpromotion)
                    .then(function () {
                        //Close the modal
                        $scope.$parent.$close();
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
    }
})()