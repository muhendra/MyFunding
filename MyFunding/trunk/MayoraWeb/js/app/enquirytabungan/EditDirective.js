(function () {
    "use strict";

    window.app.directive('editEnquirytabungan', editEnquirytabungan);

    function editEnquirytabungan() {
        return {
            templateUrl: MyApplication.rootPath + '/enquirytabungan/template/edit.tmpl.cshtml',
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

        EnquirytabunganService.getNoPurchase()
        .then(function (value) {
            vm.enquirytabungan.draftPRId = value;
        });
        //20200710, Eka, BEGIN
        vm.enquirytabungan.jenisTabungan;
        vm.enquirytabungan.PenyimpanganProgram;
        //20200710, Eka, END

        vm.onSelectCabang = function () {
            vm.enquirytabungan.cabang = vm.selectedCabang.branchCodeT24;
        }

        vm.detailBarangTableActions = {
            onDelete: deleteDetailBarang
        };

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

        function save() {
            if (vm.enquirytabungan.detailBarangList.count < 1) {
                alert("Detail barang tidak boleh kosong.");
                return false;
            }

            if (vm.enquirytabungan.attachmentSPNasabah == null) {
                alert('Upload SP Nasabah tidak boleh kosong.');
                return false;
            }

            vm.setFile();

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