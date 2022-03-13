(function () {
    'use strict';

    window.app.directive('detailsDeliveryorder', detailsDeliveryorder);
    function detailsDeliveryorder() {
        return {
            scope: {
                data: '='
            },
            templateUrl: MyApplication.rootPath + '/deliveryorder/template/details.tmpl.cshtml',
            controller: controller,
            controllerAs: 'vm'
        }
    }

    controller.$inject = ['$scope', '$modal', 'DeliveryorderService'];
    function controller($scope, $modal, DeliveryorderService) {
        var vm = this;
        vm.searchParams = {};
        vm.deliveryorder = $scope.data;

        var param = { poid: vm.deliveryorder.purchaseOrderId };
        DeliveryorderService.getpageDetail(param).then(function (data) {
            vm.deliveryorderGetPage = data.data;
        });

        vm.tableActions = {
            onDetail: detail
        };

        function detail(data) {
            if (data.attachmentTandaTerima != undefined) {
                window.open(
                    MyApplication.rootPath + "Files/deliveryorder/" + data.attachmentTandaTerima,
                    '_blank'
                );
            }
        }
    }
})();