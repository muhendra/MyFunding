(function () {
    "use strict";

    window.app.directive('editrejectPurchaserequest', editrejectPurchaserequest);

    function editrejectPurchaserequest() {
        return {
            templateUrl: MyApplication.rootPath + '/purchaserequest/template/editreject.tmpl.cshtml',
            controller: controller,
            controllerAs: 'vm'
        }
    }

    controller.$inject = ['$scope', '$modal', 'Upload', '$timeout', 'PurchaserequestService', 'EnquirytabunganService'];
    function controller($scope, $modal, Upload, $timeout, PurchaserequestService, EnquirytabunganService) {
        var vm = this;
        vm.save = save;
        vm.saving = false;
        vm.search = {};
        vm.addDetailBarang = addDetailBarang;
        vm.purchaserequest = angular.copy($scope.data);
        //vm.enquirytabungan = {};
        vm.purchaserequest.detailBarangList = [];
        //vm.purchaserequest.detailBarangList.push(vm.selectedDetailBarang);

        PurchaserequestService.getDetailBarang({ id: vm.purchaserequest.id })
        .then(function (response) {
            if (response.data !== undefined && response.data.length > 0) {
                response.data.forEach(function (item) {
                    vm.purchaserequest.detailBarangList.push(item);
                });
            }
            vm.refreshDetailBarang();
        });
        
        vm.onSelectCabang = function () {
            vm.purchaserequest.cabang = vm.selectedCabang.branchCodeT24;
        }
       
        vm.detailBarangTableActions = {
            onDelete: deleteDetailBarang
        };

        function deleteDetailBarang(data) {
            if (confirm("Delete Detail Barang?")) {
                _removeArray(vm.purchaserequest.detailBarangList, "guid", data.guid);
                vm.refreshDetailBarang();
            }
        }

        function addDetailBarang() {
            var modalInstance = $modal.open({
                //windowClass: 'form-modal-window-800',
                backdrop: 'static',
                template: '<add-detailbarang />'
            });

            modalInstance.result.then(function (detailBarang) {
                vm.purchaserequest.detailBarangList.push(detailBarang);
                vm.refreshDetailBarang();
                
            }, function () {
                //$log.info('Modal dismissed at: ' + new Date());
            });
        }


        /*Validation Area*/

        vm.validationRewardBudget = function () {
            if (vm.purchaserequest.rewardBudget < 1 || vm.purchaserequest.rewardBudget > 99999999999999.99) {
                return true;
            }

            return false;
        }

        /*End Validation Area*/

        function save() {
            if (vm.purchaserequest.attachmentMemoDireksi == null) {
                alert('Upload Memo Direksi tidak boleh kosong.');
                return false;
            }

            vm.setFile();
            vm.saving = true;
            PurchaserequestService.add(vm.purchaserequest)
                    .then(function (data) {
                        //alert("No Purchase Request : " + data.prId);
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

        vm.purchaserequestview = function (namafile) {
            window.open(
                MyApplication.rootPath + "Files/enquirytabungan/" + namafile,
                '_blank'
            );
        }

        vm.draftPurchaseRequestView = function (draftNo) {
            EnquirytabunganService.getDraftPurchaseRequest({ noDraft: draftNo }).then(function (data) {
     
                $modal.open({
                    windowClass: 'form-modal-window-1200',
                    template: '<details-enquirytabungan data="data" />',
                    scope: angular.extend($scope.$new(true), { data: data.data[0] })
                });

            })

            //window.open(
            //    MyApplication.rootPath + "Files/enquirytabungan/" + namafile,
            //    '_blank'
            //);
        }

        //vm.uploadFiles = function (files) {
        //    vm.files = files;

        //    angular.forEach(files, function (file) {
        //        file.upload = Upload.upload({
        //            url: MyApplication.rootPath + 'Purchaserequest/UploadMemoDireksi',
        //            data: { file: file, namafile: vm.purchaserequest.attachmentMemoDireksi }
        //        });
        //        file.upload.then(function (response) {
        //            $timeout(function () {
        //                vm.purchaserequest.attachmentMemoDireksi = response.data;
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
