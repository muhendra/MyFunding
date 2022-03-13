(function () {
    "use strict";

    window.app.directive('addDetailupload', addDetailupload);

    function addDetailupload() {
        return {
            templateUrl: MyApplication.rootPath + '/enquirytabungan/template/adddetailupload.tmpl.cshtml',
            controller: controller,
            controllerAs: 'vm'
        }
    }

    controller.$inject = ['$scope', 'EnquirytabunganService', 'KatalogService'];
    function controller($scope, EnquirytabunganService, KatalogService) {
        var vm = this;
        vm.saveDetailUpload = saveDetailUpload;
        vm.search = {};
        vm.saving = false;
        vm.detailupload = angular.copy($scope.data);

        function saveDetailUpload() {
            vm.detailupload.attachmentSPNasabah = vm.attachmentSPNasabah;
            $scope.$close(vm.detailupload);
        }
    }
})();