(function () {
    'use strict';

    window.app.directive('detailjurnalAmortisasirequest', detailjurnalAmortisasirequest);
    function detailjurnalAmortisasirequest() {
        return {
            scope: {
                data: '='
            },
            templateUrl: MyApplication.rootPath + '/amortisasirequest/template/detailjurnal.tmpl.cshtml',
            controller: controller,
            controllerAs: 'vm'
        }
    }

    controller.$inject = ['$scope', '$modal', 'AmortisasiRequestService', 'branchService'];
    function controller($scope, $modal, AmortisasiRequestService, branchService) {
        var vm = this;
        vm.saving = false;
        vm.detailjurnal = angular.copy($scope.data[0]);
        vm.detailjurnal2 = angular.copy($scope.data[1]);
        vm.cabanggetpage = branchService.getPage;
        vm.cabanggetpage2 = branchService.getPage;
        vm.selectedCabang = { branchCodeT24: vm.detailjurnal.branchId };
        vm.selectedCabang2 = { branchCodeT24: vm.detailjurnal2.branchId };

        vm.getBranceName = function () {
            if (vm.detailjurnal.branchId != '' && vm.detailjurnal.branchId != '') {
                AmortisasiRequestService.descbranch(vm.detailjurnal.branchId).then(function (val) {
                    vm.detailjurnal.branchName = val;
                });
            }
        }
        vm.getCatName = function () {
            if (vm.detailjurnal.intAccCategoryId != null && vm.detailjurnal.intAccCategoryId != '') {
                AmortisasiRequestService.descintaccount(vm.detailjurnal.intAccCategoryId).then(function (val) {
                    vm.detailjurnal.intAccCategoryName = val;
                });
            }
        }

        vm.getBranceName2 = function () {
            if (vm.detailjurnal2.branchId != null && vm.detailjurnal2.branchId != '') {
                AmortisasiRequestService.descbranch(vm.detailjurnal2.branchId).then(function (val) {
                    vm.detailjurnal2.branchName = val;
                });
            }
        }
        vm.getCatName2 = function () {
            if (vm.detailjurnal2.intAccCategoryId != null && vm.detailjurnal2.intAccCategoryId != '') {
                AmortisasiRequestService.descintaccount(vm.detailjurnal2.intAccCategoryId).then(function (val) {
                    vm.detailjurnal2.intAccCategoryName = val;
                });
            }
        }

        vm.onSelectCabang = function () {
            //vm.cabang = vm.cabang.branchCodeT24;
            if (vm.selectedCabang == null) {
                vm.detailjurnal.branchId = null;
                vm.detailjurnal.branchName = null;
            }
            else {
                vm.detailjurnal.branchId = vm.selectedCabang.branchCodeT24;
                vm.detailjurnal.branchName = vm.selectedCabang.branchName;
            }
            //PurchaserequestService.getPage(vm.searchParams).then(function (value) {
            //    vm.enquirytabunganGetPage = value.data;
            //    vm.refreshData();
            //})
        }

        vm.onSelectCabang2 = function () {
            //vm.cabang = vm.cabang.branchCodeT24;
            if (vm.selectedCabang2 == null) {
                vm.detailjurnal2.branchId = null;
                vm.detailjurnal2.branchName = null;
            }
            else {
                vm.detailjurnal2.branchId = vm.selectedCabang2.branchCodeT24;
                vm.detailjurnal2.branchName = vm.selectedCabang2.branchName;
            }
            //PurchaserequestService.getPage(vm.searchParams).then(function (value) {
            //    vm.enquirytabunganGetPage = value.data;
            //    vm.refreshData();
            //})
        }

        vm.save = function () {
            if (vm.detailjurnal.intAccCategoryId == vm.detailjurnal2.intAccCategoryId) {
                vm.message.error("Acc Category debit dan Kredit Tidak boleh Sama!");
                return false;
            }
            vm.saving = true;
            vm.model = [];
            vm.model.push(vm.detailjurnal);
            vm.model.push(vm.detailjurnal2);
            $scope.$parent.$close(vm.model);
        }
    }
})();