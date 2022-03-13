(function () {
    "use strict";

    window.app.directive('detailsEnquirytabungan', detailsEnquirytabungan);

    function detailsEnquirytabungan() {
        return {          
            templateUrl: MyApplication.rootPath + '/enquirytabungan/template/details.tmpl.cshtml',
            controller: controller,
            controllerAs: 'vm'
        }
    }

    controller.$inject = ['$scope', '$modal', 'Upload', '$timeout', 'EnquirytabunganService'];
    function controller($scope, $modal, Upload, $timeout, EnquirytabunganService) {
        var vm = this;

        vm.enquirytabungan = $scope.data;
        vm.edit = edit;
        vm.uploadnasabahGetPage = EnquirytabunganService.getPageUpload(vm.enquirytabungan);

        vm.tableActions = {
            onDownload: Download
        };

        function Download(data) {
            var fileURL = MyApplication.rootPath + 'Files\\enquirytabungan\\' + data.attachmentSPNasabah;
            var a = document.createElement('a');
            a.href = fileURL;
            a.target = '_blank';
            a.download = data.attachmentSPNasabah;
            document.body.appendChild(a);
            a.click();
        }

        function edit(data) {
            $modal.open({
                template: '<edit-moa data="data" />',
                scope: angular.extend($scope.$new(true), { data: data })
            });
        }
    }
})();