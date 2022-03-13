(function () {
    "use strict";
    window.app.directive("editMasteremailtemplate", editMasteremailtemplate);

    function editMasteremailtemplate() {
        return {
            scope : {
                data : "="
            },
            templateUrl: MyApplication.rootPath + '/MasterEmailTemplate/template/edit.tmpl.cshtml',
            controller: controller,
            controllerAs: "vm"
        }
    }

    controller.$inject = ["$scope", "$modal", "MasterEmailTemplateService", "$timeout", "MasterProductService", "MasterParameterService"];
    function controller($scope, $modal, MasterEmailTemplateService, $timeout, MasterProductService,MasterParameterService) {
        var vm = this;
        vm.masteremailtemplate = angular.copy($scope.data);
        vm.title = "Edit Master Email Template";
        vm.saving = false;
        vm.save = save;
        vm.CategoryMasterProductGetPage = MasterProductService.getPage;
        function parameter() {
            var param = { id: 11 }
            MasterParameterService.getpage(param).then(function (response) {
                vm.keyword = response.data[0].value;
            });
        };
        parameter();

        vm.codeSearch = { code: vm.masteremailtemplate.productCode, productName: vm.masteremailtemplate.productName }
        vm.onSelectCodeSearch = function () {
            if (vm.codeSearch !=null) {
                vm.masteremailtemplate.productCode = vm.codeSearch.code;
            } else {
                vm.masteremailtemplate.productCode = null;
            }
        }

        function save() {
            vm.saving = true;
            if (vm.masteremailtemplate.productCode == null || vm.masteremailtemplate.productCode == "") {
                vm.message.error("Please must be filled.");
                vm.saving = false;
            } else {
                MasterEmailTemplateService.update($scope.data, vm.masteremailtemplate).then(function () {
                    $scope.$parent.$close();
                }).catch(function () {
                    if (response.data.errorMessage) {
                        vm.message.error("There was a problem saving the issue: <br/>" + response.data.errorMessage + "<br/>Please try again.");
                    } else {
                        vm.message.error("There was a problem saving the issue. Please try again.");
                    }
                }).finally(function () {
                    vm.saving = false;
                })
            }
        };
    }
})()