(function() {
    "use strict";
    window.app.controller("MasterPromotionController", MasterPromotionController);
    MasterPromotionController.$inject = ["$scope", "$modal", "MasterPromotionService", "alerts"];
    function MasterPromotionController($scope, $modal, MasterPromotionService, alerts) {
        var vm = this;
        vm.GetPage = MasterPromotionService.getpage;
        vm.getAll = MasterPromotionService.getAll;

        vm.add = function () {
            var modalInstance = $modal.open({
                windowClass: "form-modal-window-800",
                backdrop: "static",
                template: "<add-masterpromotion />"
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
                    template: '<edit-masterpromotion data="data" />',
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
                    template: '<delete-masterpromotion data="data" />',
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