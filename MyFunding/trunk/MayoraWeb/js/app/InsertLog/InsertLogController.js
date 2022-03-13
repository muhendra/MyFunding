(function () {
    "use strict"
    window.app.controller("InsertLogController", InsertLogController);
    InsertLogController.$inject = ["$scope", "$modal", "alerts", "InsertLogService"];
    function InsertLogController($scope, $modal, alerts, InsertLogService) {
        var vm = this;
        vm.insertLogGetPage = InsertLogService.getpage;

       
        vm.tableActions = {
            onEdit: function (data) {
                var modalInstance = $modal.open({
                    backdrop: 'static',
                    keyboard: false,
                    windowClass: 'form-modal-window-800',
                    template: '<edit-masterparameter data="data" />',
                    scope: angular.extend($scope.$new(true), { data: data })
                });

                modalInstance.result.then(function () {
                    vm.refreshData();
                }, function () {

                });
            },
        };
    }
})()