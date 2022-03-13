(function () {
    'use strict';

    window.app.directive('detailsReceive', detailsReceive);
    function detailsReceive() {
        return {            
            templateUrl: MyApplication.rootPath + '/Purchasereceive/template/detailsReceive.tmpl.cshtml',
            controller: controller,
            controllerAs: 'vm'
        }
    }

    controller.$inject = ['$scope', '$modal', 'PurchaseorderService'];
    function controller($scope, $modal, PurchaseorderService) {
        var vm = this;

        vm.purchasereceive = $scope.data;
          
        vm.purchaseOrderView = function (draftNo) {

            PurchaseorderService.historyGetPage({ no: draftNo, jenistabungan: 'TabunganSiPucukReward', cabang: '' }).then(function (data) {

                $modal.open({
                    windowClass: 'form-modal-window-1200',
                    template: '<history-purchaseorder data="data" />',
                    scope: angular.extend($scope.$new(true), { data: data.data[0] })
                });

            })
        }

    }
})();