(function () {
    'use strict';

    window.app.directive('approveEnquiry', approveEnquiry);
    function approveEnquiry() {
        return {
            scope: {
                data: '='
            },
            templateUrl: MyApplication.rootPath + '/enquirytabungan/template/approve.tmpl.cshtml',
            controller: controller,
            controllerAs: 'vm'
        }
    }

    controller.$inject = ['$scope', '$modal', 'Upload', '$timeout', 'EnquirytabunganService'];
    function controller($scope, $modal, Upload, $timeout, EnquirytabunganService) {
        var vm = this;
        vm.save = save;
        vm.saving = false;

        vm.enquirytabungan = angular.copy($scope.data);
       
        function save() {
            vm.saving = true;
            EnquirytabunganService.approveBy(vm.enquirytabungan)
                    .then(function (data) {

                        //Close the modal
                        $scope.$parent.$close();
                    })
                    .catch(function (response) {
                        if (response.data.errorMessage) {
                            vm.message.error("There was a problem saving data : <br/>" + response.data.errorMessage + "<br/>Please try again.");
                        } else {
                            vm.message.error("There was a problem saving data. Please try again.");
                        }
                    })
                    .finally(function () {
                        vm.saving = false;
                    });

        }
    }
})();