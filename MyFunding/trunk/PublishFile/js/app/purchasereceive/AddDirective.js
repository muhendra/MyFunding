(function () {
    "use strict";

    window.app.directive('addPurchasereceive', addPurchasereceive);

    function addPurchasereceive() {
        return {
            templateUrl: MyApplication.rootPath + '/purchasereceive/template/add.tmpl.cshtml',
            controller: controller,
            controllerAs: 'vm'
        }
    }

    controller.$inject = ['$scope', '$modal', 'Upload', '$timeout', 'PurchasereceiveService', 'applicationusersService', 'PurchaseorderService'];
    function controller($scope, $modal, Upload, $timeout, PurchasereceiveService, applicationusersService, PurchaseorderService) {
        var vm = this;
        vm.save = save;
        vm.saving = false;
        //vm.addJurnalPembayaran = addJurnalPembayaran;
        
        vm.purchasereceive = angular.copy($scope.data);
        //vm.data = { vm.purchasereceive.purchaseOrderId };
        //vm.purchasereceive.jurnalPembayaranList = [];
        //vm.purchasereceive.purchaseOrderId = vm.paymentrequest.id;
        //vm.purchasereceive.enquiryId = 0;
        vm.purchasereceive.id = 0;

        vm.detailbarangGetPage = PurchasereceiveService.getDetailBarang;

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
        vm.purchasereceive.purchaseReceiveDate = new Date();
        
        PurchasereceiveService.getNoPurchaseReceive()
        .then(function (value) {
            vm.purchasereceive.purchaseReceiveId = value;
        });

        //vm.onSelectCabang = function () {
        //    vm.paymentrequest.cabang = vm.selectedCabang.branchCodeT24;
        //}

        //vm.onSelectDetailBarang = function () {
        //    vm.purchaseorder.penalty = vm.selectedDetailBarang.penalty;
        //    vm.purchaseorder.detailBarangList.push(vm.selectedDetailBarang);
        //    vm.refreshDetailBarang();
        //}

        vm.detailJurnalPelunasanTableActions = {
            onDelete: deleteJurnalPelunasan
        };

        function deleteJurnalPelunasan(data) {
            if (confirm("Delete Jurnal Pelunasan?")) {
                _removeArray(vm.purchasereceive.detailJurnalPelunasan, "guid", data.guid);
                vm.refreshJurnalPelunasan();
            }
        }

        function addJurnalPelunasan() {
            var modalInstance = $modal.open({
                //windowClass: 'form-modal-window-800',
                backdrop: 'static',
                template: '<add-jurnalpelunasan />'
            });

            modalInstance.result.then(function (jurnalPelunasan) {
                vm.purchasereceive.jurnalPelunasanList.push(jurnalPelunasan);
                vm.refreshJurnalPelunasan();
                
            }, function () {
                //$log.info('Modal dismissed at: ' + new Date());
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

        function save() {
            vm.saving = true;
            PurchasereceiveService.add(vm.purchasereceive)
                    .then(function (data) {
                        alert("No Purchase Receive : " + data.purchaseReceiveId);
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