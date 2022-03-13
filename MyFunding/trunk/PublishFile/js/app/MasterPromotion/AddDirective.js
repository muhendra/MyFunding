(function () {
    "use strict";
    window.app.directive("addMasterpromotion", addMasterpromotion);

    function addMasterpromotion() {
        return {
            templateUrl: MyApplication.rootPath + "/MasterPromotion/template/add.tmpl.cshtml",
            controller: controller,
            controllerAs: "vm"
        }
    }

    controller.$inject = ["$scope", "$modal", "$timeout", "MasterProductService", "MasterPromotionService"];
    function controller($scope, $modal, $timeout, MasterProductService, MasterPromotionService) {
        var vm = this;
        vm.title = "Add Master Promotion";
        vm.CategoryMasterProductGetPage = MasterProductService.getPage;
        vm.masterpromotion = {};
        vm.save = save;
        vm.saving = false;
        vm.codeSearch = {};
        vm.onSelectCodeSearch = function () {
            if (vm.codeSearch != null) {
                vm.masterpromotion.productCode = vm.codeSearch.code;
            } else {
                vm.masterpromotion.productCode = null;
            }
        }

        vm.onChangePeriodFrom = function () {
            if (vm.periodFrom != null) {
                vm.masterpromotion.periodFrom = vm.periodFrom;
            } else {
                vm.periodFrom = new Date();
            }
        }

        function save() {
            vm.saving = true;
            if (vm.masterpromotion.productCode == '' || vm.masterpromotion.productCode == null) {
                vm.message.error("Please must be filled.");
                vm.saving = false;
            } else {
                MasterPromotionService.add(vm.masterpromotion)
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
    }
})()