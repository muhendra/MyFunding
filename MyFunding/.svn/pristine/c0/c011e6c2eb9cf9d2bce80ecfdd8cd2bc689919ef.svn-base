(function () {
    'use strict';

    window.app.directive('detailsPurchaserequest', detailsPurchaserequest);
    function detailsPurchaserequest() {
        return {            
            templateUrl: MyApplication.rootPath + '/purchaserequest/template/details.tmpl.cshtml',
            controller: controller,
            controllerAs: 'vm'
        }
    }

    controller.$inject = ['$scope', '$modal', 'EnquirytabunganService'];
    function controller($scope, $modal, EnquirytabunganService) {
        var vm = this;

        vm.purchaserequest = $scope.data;

        vm.draftPurchaseRequestView = function (draftNo) {
            EnquirytabunganService.getDraftPurchaseRequest({ noDraft: draftNo }).then(function (data) {

                $modal.open({
                    windowClass: 'form-modal-window-1200',
                    template: '<details-enquirytabungan data="data" />',
                    scope: angular.extend($scope.$new(true), { data: data.data[0] })
                });
            })      
        }
    }
})();