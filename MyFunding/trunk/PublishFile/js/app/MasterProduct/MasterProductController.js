(function () {
    'use strict';

    window.app.controller('MasterProductController', MasterProductController);

    MasterProductController.$inject = ['$scope', '$modal', 'MasterProductService', 'alerts'];
    function MasterProductController($scope, $modal, MasterProductService, alerts) {
        var vm = this;
        vm.GetPage = MasterProductService.getPage;
        vm.GetAll = MasterProductService.getAll;

        vm.add = function () {
            var modalInstance = $modal.open({
                windowClass: 'form-modal-window-800',
                backdrop: 'static',
                template: '<add-masterproduct />'

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
                    template: '<edit-masterproduct data="data" />',
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
                    template: '<delete-masterproduct data="data" />',
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
})();