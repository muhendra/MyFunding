(function () {
    "use strict";

    window.app.directive('editMasterproduct', editMasterproduct);

    function editMasterproduct() {
        return {
            scope: {
                data: '='
            },
            templateUrl: MyApplication.rootPath + '/masterproduct/template/edit.tmpl.cshtml',
            controller: controller,
            controllerAs: 'vm'
        }
    }

    controller.$inject = ['$scope', 'MasterProductService', 'alerts', '$timeout'];
    function controller($scope, MasterProductService, alerts, $timeout) {
        var vm = this;
        vm.save = save;
        vm.title = "Edit Master Product";
        vm.CategoryTemenosGetPage = MasterProductService.getPageCategoryTemenos;
        vm.saving = false;
        vm.masterproduct = angular.copy($scope.data);

        vm.codeSearch = { code: vm.masterproduct.code};
        vm.onSelectCodeSearch = function () {
            if (vm.codeSearch != null) {
                vm.masterproduct.code = vm.codeSearch.code;
                vm.masterproduct.productName = vm.codeSearch.productName;
            } else {
                vm.masterproduct.code = null;
                vm.masterproduct.productName = null;
            }
        }
        vm.selectedIsActive = vm.masterproduct.isActive;
        vm.onChangeIsActive = function () {
            if (vm.selectedIsActive) {
                vm.masterproduct.isActive = true;
            } else {
                vm.masterproduct.isActive = false;
            }
        }

        function save() {
            if (vm.masterproduct.code == '' || vm.masterproduct.code == null) {
                vm.message.error("Please must be filled.");
                vm.saving = false;
            } else {
                vm.saving = true;
                MasterProductService.update($scope.data, vm.masterproduct)
                        .then(function (data) {
                            //Close the modal
                            $scope.$parent.$close();
                        })
                        .catch(function (response) {
                            if (response.data.errorMessage) {
                                vm.message.error("There was a problem saving data : <br/>" + response.data.errorMessage + "<br/>Please try again.");
                            } else {
                                vm.message.error("There was a problem saving data. Please try again.");
                            }
                        })
                        .finally(function () {
                            vm.saving = false;
                        });
            }
        }
    }
})();