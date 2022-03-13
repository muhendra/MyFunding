(function () {
    "use strict";

    window.app.directive('historyCashback', historyCashback);

    function historyCashback() {
        return {
            templateUrl: MyApplication.rootPath + '/cashback/template/history.tmpl.cshtml',
            controller: controller,
            controllerAs: 'vm'
        }
    }

    controller.$inject = ['$scope', '$modal', 'Upload', '$timeout', 'PurchaseorderService', 'CashbackService' , 'employeeService', 'departmentService', 'PurchaserequestService', 'EnquirytabunganService'];
    function controller($scope, $modal, Upload, $timeout, PurchaseorderService, CashbackService , employeeService, departmentService, PurchaserequestService, EnquirytabunganService) {
        var vm = this;
        //vm.search = search;
        vm.save = save;
        vm.saving = false;

        vm.purchaseorder = $scope.data;

        vm.recalculate = function () {
            vm.purchaseorder.totalPurchase = (vm.purchaseorder.quantity * vm.purchaseorder.nominalBarang) + vm.purchaseorder.nominalPurchase
            if (vm.purchaseorder.paymentMethod == "FPBeforeReceive") {
                vm.purchaseorder.dpAmount = vm.purchaseorder.totalPurchase;
            }
        }

        vm.disableDP = function () {
            if (vm.purchaseorder.paymentMethod == "FPAfterReceive" ){
                vm.disableDPAmount = true;
                vm.purchaseorder.dpAmount = 0;
            } else
            if (vm.purchaseorder.paymentMethod == "FPBeforeReceive") {
                vm.disableDPAmount = true;
                vm.purchaseorder.dpAmount = vm.purchaseorder.totalPurchase;
            }
            else
                vm.disableDPAmount = false;
        }

        vm.purchaseorder = angular.copy($scope.data);

        vm.cashback = angular.copy($scope.data);

        vm.data = { enquiryId: vm.purchaseorder.id };

        vm.params = { enquiryId: vm.purchaseorder.enquiryId, poGroupId: vm.cashback.poGroupId, poId: vm.cashback.poId };

        vm.params2 = { poGroupId: vm.cashback.poGroupId };

        vm.selectedDetailBarang = { id: vm.purchaseorder.detailBarangId, promotionCode: vm.purchaseorder.kodePromosi };

        vm.selectedMasterUser = { nik: vm.purchaseorder, nama: vm.purchaseorder.nama };

        vm.purchaseorder.namaCabang = vm.purchaseorder.company_name;

        vm.selectedSupplier = { supp_ID: vm.purchaseorder.supplierId, nm_Supp: vm.purchaseorder.supplierName }

        vm.selectedBank = { bankName: vm.purchaseorder.namaBank }

        vm.detailbarangGetPage = PurchaseorderService.getDetailBarang;

        vm.masteruserGetPage = employeeService.getPage;

        vm.supplierGetPage = PurchaseorderService.getSupplier;

        vm.getJurnalCashback = CashbackService.getJurnalCashback;

        vm.getListPOGroup = CashbackService.getListPOGroup;

        vm.getListHistoryJurnalCashback = CashbackService.historyJurnalCashback;

        vm.detailJurnalCashback = CashbackService.detailJurnalCashback;

        vm.purchaseorderview = function (namafile) {
            if (namafile != undefined)
            {
                window.open(
                    MyApplication.rootPath + "Files/enquirytabungan/" + namafile,
                    '_blank'
                );
            }
        }

        vm.purchaseorderviewmemo = function (namafile) {
            if (namafile != undefined) {
                window.open(
                    MyApplication.rootPath + "Files/purchaserequest/" + namafile,
                    '_blank'
                );
            }
        }

        vm.onSelectCabang = function () {
            vm.purchaseorder.cabang = vm.selectedCabang.branchCodeT24;
        }

        vm.onSelectMasterUser = function () {
            vm.purchaseorder.nikEmp = vm.selectedMasterUser.nik;
            vm.purchaseorder.deptId = vm.selectedMasterUser.department;
        }

        vm.onSelectDetailBarang = function () {
            vm.purchaseorder.detailBarangList = [];
            vm.purchaseorder.detailBarangId = vm.selectedDetailBarang.id;
            vm.purchaseorder.promotionCode = vm.selectedDetailBarang.promotionCode;
            vm.purchaseorder.kategoriBarang = vm.selectedDetailBarang.kategoriBarang;
            vm.purchaseorder.typeBarang = vm.selectedDetailBarang.typeBarang;
            vm.purchaseorder.merek = vm.selectedDetailBarang.merek;
            vm.purchaseorder.quantityBarang = vm.selectedDetailBarang.quantity;
            vm.purchaseorder.penalty = vm.selectedDetailBarang.penalty;
            vm.purchaseorder.detailBarangList.push(vm.selectedDetailBarang);
            vm.refreshDetailBarang();
        }

        vm.tableActions = {
            onDelete: deleteDetailBarang
        };

        vm.cashbackTableActions = {
            onDelete: deleteDetailBarang
        };

        function deleteDetailBarang(data) {
            if (confirm("Are you sure delete this data?")) {

                vm.saving = true;
                CashbackService.deleteRow(data)
                        .then(function (data) {
                            alert("Reject success");
                            //search();
                        })
                        .catch(function (response) {
                            if (response.data.errorMessage) {
                                vm.message.error("There was a problem reject data : <br/>" + response.data.errorMessage + "<br/>Please try again.");
                            } else {
                                vm.message.error("There was a problem reject data. Please try again.");
                            }
                        })
                        .finally(function () {
                            vm.saving = false;
                            vm.refreshCashback();
                            vm.refreshJurnalCashback();
                            vm.refreshDataAuthorizeCashback();
                        });
            } else {
                return false;
            }
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
            vm.saving = true;
            PurchaseorderService.add(vm.purchaseorder)
                    .then(function (data) {
                        alert("No Purchase Order : " + data.poId);
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
        }}})();