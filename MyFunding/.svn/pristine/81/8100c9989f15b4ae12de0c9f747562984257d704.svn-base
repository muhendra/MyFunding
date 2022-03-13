(function () {
    'use strict';

    window.app.directive('detailjurnalPencadangan', detailjurnalPencadangan);
    function detailjurnalPencadangan() {
        return {
            scope: {
                data: '='
            },
            templateUrl: MyApplication.rootPath + '/pencadangan/template/detailjurnal.tmpl.cshtml',
            controller: controller,
            controllerAs: 'vm'
        }
    }

    controller.$inject = ['$scope', '$modal', 'PencadanganService'];
    function controller($scope, $modal, PencadanganService) {
        var vm = this;
        vm.saving = false;
        vm.detailjurnal = angular.copy($scope.data[0]);
        vm.detailjurnal2 = angular.copy($scope.data[1]);
        
        vm.getBranceName = function () {
            if (vm.detailjurnal.branchId != null && vm.detailjurnal.branchId != '') {
                PencadanganService.descbranch(vm.detailjurnal.branchId).then(function (val) {
                    vm.detailjurnal.branchName = val;
                });
            }
        }
        vm.getCatName = function () {
            if (vm.detailjurnal.intAccCategoryId != null && vm.detailjurnal.intAccCategoryId != '') {
                PencadanganService.descintaccount(vm.detailjurnal.intAccCategoryId).then(function (val) {
                    vm.detailjurnal.intAccCategoryName = val;
                });
            }
        }

        vm.getBranceName2 = function () {
            if (vm.detailjurnal2.branchId != null && vm.detailjurnal2.branchId != '') {
                PencadanganService.descbranch(vm.detailjurnal2.branchId).then(function (val) {
                    vm.detailjurnal2.branchName = val;
                });
            }
        }
        vm.getCatName2 = function () {
            if (vm.detailjurnal2.intAccCategoryId != null && vm.detailjurnal2.intAccCategoryId != '') {
                PencadanganService.descintaccount(vm.detailjurnal2.intAccCategoryId).then(function (val) {
                    vm.detailjurnal2.intAccCategoryName = val;
                });
            }
        }
        vm.save = function () {
            vm.saving = true;
            vm.model = [];
            vm.model.push(vm.detailjurnal);
            vm.model.push(vm.detailjurnal2);
            $scope.$parent.$close(vm.model);
        }
    }
})();