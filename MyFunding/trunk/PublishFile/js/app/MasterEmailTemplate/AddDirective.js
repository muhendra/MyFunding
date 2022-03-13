(function () {
    "use strict";
    window.app.directive("addMasteremailtemplate", addMasteremailtemplate);

    function addMasteremailtemplate() {
        return {
            templateUrl: MyApplication.rootPath + '/MasterEmailTemplate/template/add.tmpl.cshtml',
            controller: controller,
            controllerAs: "vm"
        }
    }

    controller.$inject = ["$scope", "$modal", "MasterEmailTemplateService", "$timeout", "MasterProductService","MasterParameterService"];
    function controller($scope, $modal, MasterEmailTemplateService, $timeout, MasterProductService, MasterParameterService) {
        var vm = this;
        vm.masteremailtemplate = {};
        vm.title = "Add Master Email Template";
        vm.saving = false;
        vm.save = save;
        vm.CategoryMasterProductGetPage = MasterProductService.getPage;
        vm.onSelectCodeSearch = function () {
            if (vm.codeSearch !=null) {
                vm.masteremailtemplate.productCode = vm.codeSearch.code;
            } else {
                vm.masteremailtemplate.productCode = null;
            }
        }

        function parameter() {
            var param = { id: 11 }
            MasterParameterService.getpage(param).then(function (response) {
                vm.keyword = response.data[0].value;
            });
        };

        parameter();

        function save() {
            vm.saving = true;
            if (vm.masteremailtemplate.productCode == null || vm.masteremailtemplate.productCode == "" || vm.masteremailtemplate.content == null || vm.masteremailtemplate.content =="") {
                vm.message.error("Please must be filled.");
                vm.saving = false;
            } else {
                MasterEmailTemplateService.add(vm.masteremailtemplate).then(function () {
                    $scope.$close();
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