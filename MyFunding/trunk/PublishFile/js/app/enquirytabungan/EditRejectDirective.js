(function () {
    "use strict";

    window.app.directive('editrejectEnquirytabungan', editrejectEnquirytabungan);

    function editrejectEnquirytabungan() {
        return {
            templateUrl: MyApplication.rootPath + '/enquirytabungan/template/editreject.tmpl.cshtml',
            controller: controller,
            controllerAs: 'vm'
        }
    }

    controller.$inject = ['$scope', '$modal', 'Upload', '$timeout', 'EnquirytabunganService'];
    function controller($scope, $modal, Upload, $timeout, EnquirytabunganService) {
        var vm = this;
        vm.save = save;
        vm.saving = false;
        vm.addDetailBarang = addDetailBarang;
        vm.addDetailUpload = addDetailUpload;


        vm.enquirytabungan = angular.copy($scope.data);

        //vm.enquirytabungan.requester = angular.copy($scope.userFullName);

        vm.valmaturity = function () {
            return vm.enquirytabungan.maturityDate == null || vm.enquirytabungan.maturityDate == '';
        }
        vm.valstartdate = function () {
            return vm.enquirytabungan.startDate == null || vm.enquirytabungan.startDate == '';
        }
        //vm.enquirytabungan = {};
        //vm.enquirytabungan.detailBarangList = [];
       
        //vm.enquirytabungan.draftPRDate = new Date();

        //EnquirytabunganService.getNoPurchase()
        //.then(function (value) {
        //    vm.enquirytabungan.draftPRId = value;
        //});

        function addDetailUpload() {
            $scope.$close(vm.detailupload);
        }

        vm.enquirytabungan.jenisTabungan;

        vm.onSelectCabang = function () {
            vm.enquirytabungan.cabang = vm.selectedCabang.branchCodeT24;
        }

        vm.tableActions = {
            onDelete2: deleteUpload,
            onDownload: Download
        };

        vm.detailBarangTableActions = {
            onDelete: deleteDetailBarang
        };


        function Download(data) {
            var fileURL = MyApplication.rootPath + 'Files\\enquirytabungan\\Temp\\' + data.attachmentSPNasabah;
            var a = document.createElement('a');
            a.href = fileURL;
            a.target = '_blank';
            a.download = data.attachmentSPNasabah;
            document.body.appendChild(a);
            a.click();
        }
        function deleteUpload(data1) {
            if (confirm("Delete Data Upload?")) {
                _removeArray(vm.enquirytabungan.detailUploadList, "attachmentSPNasabah", data1.attachmentSPNasabah);
                vm.refreshData();
            }
        }

        function deleteDetailBarang(data) {
            if (confirm("Delete Detail Barang?")) {
                _removeArray(vm.enquirytabungan.detailBarangList, "guid", data.guid);
                vm.refreshDetailBarang();
            }
        }

        function addDetailBarang(data) {
            var modalInstance = $modal.open({
                //windowClass: 'form-modal-window-800',
                backdrop: 'static',
                template: '<add-detailbarang data="data"/>',
                scope: angular.extend($scope.$new(true), { data: vm.enquirytabungan })
            });

            modalInstance.result.then(function (detailBarang) {
                vm.enquirytabungan.detailBarangList.push(detailBarang);
                vm.refreshDetailBarang();

            }, function () {
                //$log.info('Modal dismissed at: ' + new Date());
            });
        }
        function addDetailUpload(data) {
            var modalInstance = $modal.open({
                //windowClass: 'form-modal-window-800',
                backdrop: 'static',
                template: '<add-detailupload data="data"/>',
                scope: angular.extend($scope.$new(true), { data: vm.enquirytabungan })
            });

            modalInstance.result.then(function (detailUpload) {
                vm.enquirytabungan.detailUploadList.push(detailUpload);
                vm.refreshData();

            }, function () {
                //$log.info('Modal dismissed at: ' + new Date());
            });
        }
        function save() {
            if (vm.enquirytabungan.detailBarangList.count < 1) {
                alert("Detail barang tidak boleh kosong.");
                return false;
            }
            //20190114, jeni, BEGIN
            //if (vm.enquirytabungan.attachmentSPNasabah == null) {
            if (vm.enquirytabungan.detailUploadList.coun < 1) {
                //20190114, jeni, END
                alert('Upload SP Nasabah tidak boleh kosong.');
                return false;
            }

            vm.saving = true;
            EnquirytabunganService.update($scope.data, vm.enquirytabungan)
                    .then(function (data) {                        
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

        //vm.uploadFiles = function (files, errFiles) {
        //    vm.files = files;
        //    vm.errFiles = errFiles;
        //    angular.forEach(files, function (file) {
        //        file.upload = Upload.upload({
        //            url: MyApplication.rootPath + 'Enquirytabungan/UploadSPNasabah',
        //            data: { file: file, namafile: vm.enquirytabungan.attachmentSPNasabah }
        //        });

        //        file.upload.then(function (response) {
        //            $timeout(function () {
        //                vm.enquirytabungan.attachmentSPNasabah = response.data;
        //            });
        //        }, function (response) {
        //            if (response.status > 0) {
        //                $scope.errorMsg = response.status + ': ' + response.data;
        //                alert($scope.errorMsg);
        //            }
        //        }, function (evt) {
        //            file.progress = Math.min(100, parseInt(100.0 *
        //                                     evt.loaded / evt.total));
        //        });
        //    });
        //}
    }
})();