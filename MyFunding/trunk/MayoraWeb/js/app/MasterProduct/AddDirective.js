(function () {
    "use strict";

    window.app.directive('addMasterproduct', addMasterproduct);

    function addMasterproduct() {
        return {
            templateUrl: MyApplication.rootPath + '/masterproduct/template/add.tmpl.cshtml',
            controller: controller,
            controllerAs: 'vm'
        }
    }

    controller.$inject = ['$scope', '$modal', '$timeout', 'MasterProductService'];
    function controller($scope, $modal, $timeout, MasterProductService) {
        var vm = this;
        vm.masterproduct = {};
        vm.title = 'Add Master Product';
        vm.CategoryTemenosGetPage = MasterProductService.getPageCategoryTemenos;
        vm.save = save;
        vm.saving = false;

        vm.codeSearch = {};
        vm.onSelectCodeSearch = function () {
            if (vm.codeSearch != null) {
                vm.masterproduct.code = vm.codeSearch.code;
                vm.masterproduct.productName = vm.codeSearch.productName;
            } else {
                vm.masterproduct.code = null;
                vm.masterproduct.productName = null;
            }
        }

       vm.onChangeIsActive = function () {
            if (vm.selectedIsActive) {
                vm.masterproduct.IsActive = true;
            } else {
                vm.masterproduct.IsActive = false;
            }
       }

        function save() {
            vm.saving = true;
            if (vm.masterproduct.code ==''||vm.masterproduct.code==null) {
                vm.message.error("Please must be filled.");
                vm.saving = false;
            } else {
                MasterProductService.add(vm.masterproduct)
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
})();