(function () {
    'use strict';

    window.app.directive('detailsPurchaseorder', detailsPurchaseorder);
    function detailsPurchaseorder() {
        return {
            scope: {
                data: '='
            },
            templateUrl: MyApplication.rootPath + '/purchaseorder/template/details.tmpl.cshtml',
            controller: controller,
            controllerAs: 'vm'
        }
    }

    controller.$inject = ['$scope', '$modal'];
    function controller($scope, $modal) {
        var vm = this;

        vm.purchaseorder = $scope.data;

    }
})();