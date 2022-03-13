(function () {
    "use strict";

    window.app.directive('addCashbacka', addCashbacka);

    function addCashbacka() {
        return {
            templateUrl: MyApplication.rootPath + '/Cashback/template/add.tmpl.cshtml',
            controller: controller,
            controllerAs: 'vm'
        }
    }

    controller.$inject = ['$scope', '$modal', 'Upload', '$timeout', 'PurchaseorderService', 'CashbackService', 'employeeService', 'departmentService', 'PurchaserequestService', 'EnquirytabunganService'];
    function controller($scope, $modal, Upload, $timeout, PurchaseorderService, CashbackService , employeeService, departmentService, PurchaserequestService, EnquirytabunganService) {
        var vm = this;
        vm.save = save;
        vm.saving = false;
        vm.searchParams = {};
        vm.searchParams.paymentMethod = "";

        vm.recalculate = function () {
            vm.cashback.totalPurchase = (vm.cashback.quantity * vm.cashback.nominalBarang) + vm.cashback.nominalPurchase
            if (vm.cashback.paymentMethod == "FPBeforeReceive") {
                vm.cashback.dpAmount = vm.cashback.totalPurchase;
            }
        }

        vm.disableDP = function () {
            vm.selectedIsActive = false;
            vm.onChangeIsActive();
            if (vm.cashback.paymentMethod == "FPAfterReceive") {
                vm.disableDPAmount = true;
                vm.cashback.dpAmount = 0;
            } else
                if (vm.cashback.paymentMethod == "FPBeforeReceive") {
                    vm.disableDPAmount = true;
                    vm.cashback.dpAmount = vm.cashback.totalPurchase;
                }
                else
                    vm.disableDPAmount = false;

            //vm.recalculate();
        }
        vm.purchaseorder = angular.copy($scope.data);

        vm.data = { enquiryId: vm.purchaseorder.id };

        vm.cashback = angular.copy($scope.data);

        vm.enquirytabungan = angular.copy($scope.data);

        vm.data = { enquiryId: vm.cashback.id };

        vm.params = { enquiryId: vm.cashback.id };

        //vm.insertJurnalCashback = CashbackService.insertJurnalCashback;

        //vm.param = { poGroupId: vm.cashback.poGroupId };

        vm.getJurnalCashback = CashbackService.getJurnalCashback;

        //vm.cashback.detailBarangList = [];

        CashbackService.getNoPurchaseOrder().then(function (value) {
            vm.cashback.poId = value;
            //20190131, jeni, BEGIN
            vm.cashback.poGroupId = value;
            vm.selectedPOGroup2 = { poGroupId: vm.cashback.poGroupId }
            //20190131, jeni, END
        });

        vm.detailbarangGetPage = CashbackService.getDetailBarang;

        vm.cashbackviewsp = function (namafile) {
            if (namafile != undefined) {
                window.open(
                    MyApplication.rootPath + "Files/enquirytabungan/" + namafile,
                    '_blank'
                );
            }
        }

        vm.cashbackviewmemo = function (namafile) {
            if (namafile != undefined) {
                window.open(
                    MyApplication.rootPath + "Files/purchaserequest/" + namafile,
                    '_blank'
                );
            }
        }
        vm.cashback.poDate = new Date();
        vm.cashback.poDescription = "Cashback "
        vm.cashback.additionalInfoDetailItem = "Cashback "
        vm.cashback.ccyKredit = "IDR"
        vm.cashback.ccyDebet = "IDR"

        vm.onSelectCabang = function () {
            vm.cashback.cabang = vm.selectedCabang.branchCodeT24;
        }

        for (var i = 0; i < vm.cashback.detailBarangList.length; i++) {
            vm.selectedDetailBarang = { id: vm.cashback.detailBarangList[i].id, promotionCode: vm.cashback.detailBarangList[i].promotionCode };
            vm.cashback.kategoriBarang = vm.cashback.detailBarangList[i].kategoriBarang;
            vm.cashback.typeBarang = vm.cashback.detailBarangList[i].typeBarang;
            vm.cashback.merek = vm.cashback.detailBarangList[i].merek;
            vm.cashback.quantityBarang = vm.cashback.detailBarangList[i].quantity;
            vm.cashback.penalty = vm.cashback.detailBarangList[i].penalty;
            vm.cashback.quantity = vm.cashback.detailBarangList[i].quantity;
            vm.cashback.keterangan = vm.cashback.detailBarangList[i].keterangan;
        }

        vm.onSelectDetailBarang = function () {
            vm.cashback.detailBarangList = [];
            vm.cashback.detailBarangId = vm.selectedDetailBarang.id;
            vm.cashback.promotionCode = vm.selectedDetailBarang.promotionCode;
            vm.cashback.kategoriBarang = vm.selectedDetailBarang.kategoriBarang;
            vm.cashback.typeBarang = vm.selectedDetailBarang.typeBarang;
            vm.cashback.merek = vm.selectedDetailBarang.merek;
            vm.cashback.quantityBarang = vm.selectedDetailBarang.quantity;
            vm.cashback.penalty = vm.selectedDetailBarang.penalty;
            vm.cashback.quantity = vm.selectedDetailBarang.quantity;
            vm.cashback.detailBarangList.push(vm.selectedDetailBarang);
            vm.refreshDetailBarang();
        }

        vm.detailBarangTableActions = {
            onDelete: deleteDetailBarang
        };

        function deleteDetailBarang(data) {
            if (confirm("Delete Detail Barang?")) {
                _removeArray(vm.cashback.detailBarangList, "guid", data.guid);
                vm.refreshDetailBarang();
            }
        }

        function addDetailBarang() {
            var modalInstance = $modal.open({
                backdrop: 'static',
                template: '<add-detailbarangpo/>'
            });

            modalInstance.result.then(function (detailBarang) {
                vm.cashback.detailBarangList.push(detailBarang);
                vm.refreshDetailBarang();
            }, function () {
            });
        }

        vm.draftPurchaseRequestView = function (draftNo) {
            EnquirytabunganService.getDraftPurchaseRequest({ noDraft: draftNo }).then(function (data) {

                $modal.open({
                    windowClass: 'form-modal-window-1200',
                    template: '<details-enquirytabungan data="data" />',
                    scope: angular.extend($scope.$new(true), { data: data.data[0] })
                });
            })
        }

        vm.purchaseRequestView = function (draftNo) {
            PurchaserequestService.getPurchaseRequest({ purchaseRequestNo: draftNo }).then(function (data) {

                $modal.open({
                    windowClass: 'form-modal-window-1200',
                    template: '<details-purchaserequest data="data" />',
                    scope: angular.extend($scope.$new(true), { data: data.data[0] })
                });
            })
        }

        function save() {
            vm.cashback.enquiryId = vm.cashback.id;
            //vm.insertJurnalCashback = CashbackService.insertJurnalCashback;
            vm.saving = true;
            CashbackService.add(vm.cashback)
                    .then(function (data) {
                        alert("No Cashback : " + data.poId);
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

        vm.poGroupGetPage = CashbackService.getPOGroup;
        
        vm.onSelectPOGroup = function () {
            if (vm.selectedPOGroup2 != null) {
                vm.cashback.poGroupId = vm.selectedPOGroup2.poGroupId;
                //vm.cashback.ccyKredit = vm.selectedPOGroup.ccyKredit;
                //vm.cashback.ccyDebet = vm.selectedPOGroup2.ccyDebet;
                vm.cashback.catatanPO = vm.selectedPOGroup2.catatanPO;
                //vm.cashback.poDate = vm.selectedPOGroup2.poDate;
            }
            else {
                vm.cashback.poGroupId = null;
            }
        }
        
        vm.onChangeIsActive = function () {
            if (vm.selectedIsActive) {
                CashbackService.getPOGroup(vm.searchParams).then(function (value) {
                    vm.poGroupGetPage = value.data;
                    //vm.selectedIsActive = false;
                })
            }
            else {
                vm.cashback.poGroupId = vm.cashback.poGroupId;
                vm.selectedPOGroup2 = { poGroupId: vm.cashback.poGroupId }
                vm.cashback.catatanPO = vm.selectedPOGroup2.catatanPO;
                //vm.cashback.ccyKredit = vm.selectedPOGroup.ccyKredit;
                //vm.cashback.ccyDebet = vm.selectedPOGroup2.ccyDebet;
                vm.cashback.poDate = new Date();
            }
        }
    }
})();