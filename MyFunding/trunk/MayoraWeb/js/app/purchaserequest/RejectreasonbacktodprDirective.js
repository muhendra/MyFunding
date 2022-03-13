(function () {
    "use strict";

    window.app.directive('rejectreasonbacktodprPurchaserequest', rejectreasonbacktodprPurchaserequest);

    function rejectreasonbacktodprPurchaserequest() {
        return {
            templateUrl: MyApplication.rootPath + '/purchaserequest/template/rejectreasonbacktodpr.tmpl.cshtml',
            controller: controller,
            controllerAs: 'vm'
        }
    }
    controller.$inject = ['$scope', '$modal', 'PurchaserequestService', 'branchService', 'alerts'];
    function controller($scope, $modal, PurchaserequestService, branchService, alerts) {
        var vm = this;
        vm.save = save;
        vm.saving = false;
        vm.purchaserequest = angular.copy($scope.data);
        vm.authorizepurchaserequestGetPage = PurchaserequestService.authorizegetPage;
        vm.rejectpurchaserequestGetPage = PurchaserequestService.rejectgetPage;

        function save() {
            vm.saving = true;
            PurchaserequestService.rejecttodpr(vm.purchaserequest)
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