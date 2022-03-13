(function () {
    "use strict";

    window.app.directive('addDeliveryorder', addDeliveryorder);

    function addDeliveryorder() {
        return {
            templateUrl: MyApplication.rootPath + '/deliveryorder/template/add.tmpl.cshtml',
            controller: controller,
            controllerAs: 'vm'
        }
    }

    controller.$inject = ['$scope', '$modal', 'Upload', '$timeout', 'DeliveryorderService', 'applicationusersService', 'PurchaseorderService'];
    function controller($scope, $modal, Upload, $timeout, DeliveryorderService, applicationusersService, PurchaseorderService) {
        var vm = this;
        vm.save = save;
        vm.saving = false;
        //vm.addJurnalPembayaran = addJurnalPembayaran;
        
        vm.deliveryorder = angular.copy($scope.data);
        //vm.data = { vm.purchasereceive.purchaseOrderId };
        //vm.purchasereceive.jurnalPembayaranList = [];
        //vm.purchasereceive.purchaseOrderId = vm.paymentrequest.id;
        //vm.purchasereceive.enquiryId = 0;
        vm.deliveryorder.id = 0;

        //vm.paymentrequestview = function (namafile) {
        //    if (namafile != undefined)
        //    {
        //        window.open(
        //            MyApplication.rootPath + "Files/enquirytabungan/" + namafile,
        //            '_blank'
        //        );
        //    }
        //}

        //vm.purchaseorderviewmemo = function (namafile) {
        //    if (namafile != undefined) {
        //        window.open(
        //            MyApplication.rootPath + "Files/purchaserequest/" + namafile,
        //            '_blank'
        //        );
        //    }
        //}

        //vm.enquirytabungan = {};
        //vm.purchaseorder.detailbarangList = [];

        //moaService.getAspekFinancialByMoa(vm.moa)
        //.then(function (response) {            
        //    if (response.data !== undefined && response.data.length > 0)
        //    {
        //        response.data.forEach(function (item) {
        //            vm.moa.aspekFinancialList.push(item);
        //        });
        //    }   
        //    vm.refreshAspekFinancial();
        //});

        //vm.moa = { tglMoa: new Date() };
        vm.deliveryorder.deliveryOrderDate = new Date();
        
        DeliveryorderService.getNoDeliveryOrder()
        .then(function (value) {
            vm.deliveryorder.deliveryOrderId = value;
        });

        //vm.onSelectCabang = function () {
        //    vm.paymentrequest.cabang = vm.selectedCabang.branchCodeT24;
        //}

        //vm.onSelectDetailBarang = function () {
        //    vm.purchaseorder.penalty = vm.selectedDetailBarang.penalty;
        //    vm.purchaseorder.detailBarangList.push(vm.selectedDetailBarang);
        //    vm.refreshDetailBarang();
        //}

        function save() {
            vm.setFile();
            vm.saving = true;
            DeliveryorderService.add(vm.deliveryorder)
                .then(function (data) {
                    //alert("No Delivery Order : " + data.deliveryOrderId);
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

        vm.purchaseOrderView = function (draftNo) {

            PurchaseorderService.historyGetPage({ no: draftNo, jenistabungan: 'TabunganSiPucukReward', cabang: '' }).then(function (data) {

                $modal.open({
                    windowClass: 'form-modal-window-1200',
                    template: '<history-purchaseorder data="data" />',
                    scope: angular.extend($scope.$new(true), { data: data.data[0] })
                });

            })
        }

        //vm.uploadFiles = function (files, errFiles) {
        //    vm.files = files;
        //    vm.errFiles = errFiles;
        //    angular.forEach(files, function (file) {
        //        file.upload = Upload.upload({
        //            url: MyApplication.rootPath + 'Deliveryorder/UploadTandaTerima',
        //            data: { file: file, namafile: vm.deliveryorder.attachmentTandaTerima }
        //        });

        //        file.upload.then(function (response) {
        //            $timeout(function () {
        //                vm.deliveryorder.attachmentTandaTerima = response.data;
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