(function () {
    "use strict";

    window.app.directive('rejectreasonbacktoprPurchaseorder', rejectreasonbacktoprPurchaseorder);

    function rejectreasonbacktoprPurchaseorder() {
        return {
            templateUrl: MyApplication.rootPath + '/purchaseorder/template/rejectreasonbacktopr.tmpl.cshtml',
            controller: controller,
            controllerAs: 'vm'
        }
    }
    controller.$inject = ['$scope', '$modal', 'PurchaseorderService', 'alerts'];
    function controller($scope, $modal, PurchaseorderService, alerts) {
        var vm = this;
        vm.save = save;
        vm.saving = false;
        vm.purchaseorder = angular.copy($scope.data);
        vm.authorizepurchaseorderGetPage = PurchaseorderService.authorizegetPage;

        function save() {
            vm.saving = true;
            PurchaseorderService.rejecttopr(vm.purchaseorder)
                 .then(function (data) {
                     //alert("Reject success");
                     //vm.refreshData();
                     $scope.$close();
                 })
                .catch(function (response) {
                    if (response.data.errorMessage) {
                        vm.message.error("There was a problem reject data : <br/>" + response.data.errorMessage + "<br/>Please try again.");
                    } else {
                        vm.message.error("There was a problem reject data. Please try again.");
                    }
                })
                .finally(function () {
                    vm.saving = false;
                });

        }

    }

})();