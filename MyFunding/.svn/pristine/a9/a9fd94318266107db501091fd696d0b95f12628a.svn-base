(function () {
    "use strict";
    window.app.directive("deleteMasteremailtemplate", deleteMasteremailtemplate);

    function deleteMasteremailtemplate() {
        return {
            scope : {
                data : "="
            },
            templateUrl: MyApplication.rootPath + '/MasterEmailTemplate/template/delete.tmpl.cshtml',
            controller: controller,
            controllerAs: "vm"
        }
    }

    controller.$inject = ["$scope", "$modal", "MasterEmailTemplateService", "$timeout", "MasterProductService"];
    function controller($scope, $modal, MasterEmailTemplateService, $timeout, MasterProductService) {
        var vm = this;
        vm.masteremailtemplate = angular.copy($scope.data);
        vm.title = "Delete Master Email Template ?";
        vm.saving = false;
        vm.save = save;
        vm.CategoryMasterProductGetPage = MasterProductService.getPage;

        vm.codeSearch = { code: vm.masteremailtemplate.productCode, productName: vm.masteremailtemplate.productName }
        
        function save() {
            vm.saving = true;
            MasterEmailTemplateService.deleted($scope.data, vm.masteremailtemplate).then(function () {
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
        };
    }
})()