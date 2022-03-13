(function () {
    "use strict";

    window.app.directive('addParameteremail', addParameteremail);

    function addParameteremail() {
        return {
            templateUrl: MyApplication.rootPath + '/parameteremail/template/add.tmpl.cshtml',
            controller: controller,
            controllerAs: 'vm'
        }
    }

    controller.$inject = ['$scope', '$modal', 'Upload', '$timeout', 'ParameterEmailService', 'employeeService', 'departmentService' ];
    function controller($scope, $modal, Upload, $timeout, ParameterEmailService, employeeService, departmentService) {
        var vm = this;
        vm.save = save;
        vm.saving = false;

        vm.parameterEmail = { isActive: true };

        function save() {
            vm.saving = true;
            ParameterEmailService.add(vm.parameterEmail)
                    .then(function (data) {
                        //alert("No Purchase Order : " + data.poId);
                        //Close the modal
                        $scope.$close();
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