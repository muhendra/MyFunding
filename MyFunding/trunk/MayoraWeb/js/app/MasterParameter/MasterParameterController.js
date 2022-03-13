(function () {
    "use strict"
    window.app.controller("MasterParameterController", MasterParameterController);
    MasterParameterController.$inject = ["$scope", "$modal", "alerts", "MasterParameterService"];
    function MasterParameterController($scope, $modal, alerts, MasterParameterService) {
        var vm = this;
        //vm.add = add;
        vm.GetPage = MasterParameterService.getpage;

        //function add() {
        //    var modalInstance = $modal.open({
        //        windowClass: 'form-modal-window-800',
        //        backdrop: 'static',
        //        template: '<add-masterparameter />'
        //    });
        //    modalInstance.result.then(function () {
        //        refreshData();
        //    });
        //}

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
                    //$log.info('Modal dismissed at: ' + new Date());
                });
            },
            //onDelete: function (data) {
            //    var modalInstance = $modal.open({
            //        backdrop: 'static',
            //        keyboard: false,
            //        windowClass: 'form-modal-window-800',
            //        template: '<delete-masterparameter data="data" />',
            //        scope: angular.extend($scope.$new(true), { data: data })
            //    });

            //    modalInstance.result.then(function () {
            //        vm.refreshData();
            //    }, function () {
            //        //$log.info('Modal dismissed at: ' + new Date());
            //    });
            //}
        };
    }
})()