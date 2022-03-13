(function () {
    "use strict";

    window.app.directive('deleteMasterproduct', deleteMasterproduct);

    function deleteMasterproduct() {
        return {
            scope: {
                data: '='
            },
            templateUrl: MyApplication.rootPath + '/masterproduct/template/delete.tmpl.cshtml',
            controller: controller,
            controllerAs: 'vm'
        }
    }

    controller.$inject = ['$scope', 'MasterProductService', 'alerts', '$timeout'];
    function controller($scope, MasterProductService, alerts, $timeout) {
        var vm = this;
        vm.save = save;
        vm.title = "Delete Master Product ?";
        vm.CategoryTemenosGetPage = MasterProductService.getPageCategoryTemenos;
        vm.saving = false;
        vm.masterproduct = angular.copy($scope.data);

        vm.codeSearch = { code: vm.masterproduct.code };
        vm.selectedIsActive = vm.masterproduct.isActive;

        function save() {
            vm.saving = true;
            MasterProductService.deleted($scope.data, vm.masterproduct)
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
})();