(function () {
    "use strict";

    window.app.directive('addUploadfile', addUploadfile);

    function addUploadfile() {
        return {
            templateUrl: MyApplication.rootPath + '/UploadFile/template/add.tmpl.cshtml',
            controller: controller,
            controllerAs: 'vm'
        }
    }

    controller.$inject = ['$scope', 'alerts', '$timeout','UploadFileService'];
    function controller($scope, alerts, $timeout, UploadFileService) {
        var vm = this;
        vm.uploadFile = {};
        vm.save = save;
        vm.saving = false;
        
        function save() {

            vm.saving = true;
            if (vm.uploadFile.NameFile == null) {
                vm.message.error("No Data");
                vm.saving = false;
            } else {
                vm.setFile().then(function () {
                    UploadFileService.add(vm.uploadFile)
                       .then(function (data) {
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
                }).finally(function () {
                    vm.saving = false;
                });
            }
           
        };
    }
})();