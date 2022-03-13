(function () {
    'use strict';

    window.app.directive('detailsPurchasereceive', detailsPurchasereceive);
    function detailsPurchasereceive() {
        return {            
            templateUrl: MyApplication.rootPath + '/Purchasereceive/template/details.tmpl.cshtml',
            controller: controller,
            controllerAs: 'vm'
        }
    }

    controller.$inject = ['$scope', '$modal', 'PurchaseorderService'];
    function controller($scope, $modal, PurchaseorderService) {
        var vm = this;

        vm.purchasereceive = $scope.data;

        vm.label = 'Pelunasan Payment';
        if (vm.purchasereceive.paymentMethod == 'UMBeforeReceive')
            vm.label = 'Pelunasan Payment';
        else if (vm.purchasereceive.paymentMethod == 'FPBeforeReceive')
            vm.label = 'Pembebanan Payment';
        else if (vm.purchasereceive.paymentMethod == 'FPAfterReceive' && vm.purchasereceive.paymentRequestType == 'Pencadangan')
            vm.label = 'Penyelesaian Payment';
        else if (vm.purchasereceive.paymentMethod == 'FPAfterReceive' && vm.purchasereceive.paymentRequestType == null)
            vm.label = 'Full Payment After Receive';
          
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