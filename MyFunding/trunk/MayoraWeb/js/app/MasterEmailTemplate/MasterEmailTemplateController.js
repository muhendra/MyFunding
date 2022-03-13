(function() {
    "use strict";
    window.app.controller("MasterEmailTemplateController", MasterEmailTemplateController);
    MasterEmailTemplateController.$inject = ["$scope", "$modal", "MasterEmailTemplateService", "alerts"];
    function MasterEmailTemplateController($scope, $modal, MasterEmailTemplateService, alerts) {
        var vm = this;
        vm.GetPage = MasterEmailTemplateService.getpage;
        vm.getAll = MasterEmailTemplateService.All;

        vm.add = function () {
            var modalInstance = $modal.open({
                windowClass: "form-modal-window-800",
                backdrop: "static",
                template: "<add-masteremailtemplate />"
            });
            modalInstance.result.then(function () {
                vm.refreshData();
            });
        }

        vm.tableActions = {
            onEdit: function (data) {
                var modalInstance = $modal.open({
                    backdrop: 'static',
                    keyboard: false,
                    windowClass: 'form-modal-window-1000',
                    template: '<edit-masteremailtemplate data="data" />',
                    scope: angular.extend($scope.$new(true), { data: data })
                });

                modalInstance.result.then(function () {
                    vm.refreshData();
                }, function () {
                    //$log.info('Modal dismissed at: ' + new Date());
                });
            },
            onDelete: function (data) {
                var modalInstance = $modal.open({
                    backdrop: 'static',
                    keyboard: false,
                    windowClass: 'form-modal-window-800',
                    template: '<delete-masteremailtemplate data="data" />',
                    scope: angular.extend($scope.$new(true), { data: data })
                });

                modalInstance.result.then(function () {
                    vm.refreshData();
                }, function () {
                    //$log.info('Modal dismissed at: ' + new Date());
                });
            }
        };
    }
})() 