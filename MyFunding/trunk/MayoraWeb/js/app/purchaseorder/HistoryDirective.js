(function () {
    "use strict";

    window.app.directive('historyPurchaseorder', historyPurchaseorder);

    function historyPurchaseorder() {
        return {
            templateUrl: MyApplication.rootPath + '/purchaseorder/template/history.tmpl.cshtml',
            controller: controller,
            controllerAs: 'vm'
        }
    }

    controller.$inject = ['$scope', '$modal', 'Upload', '$timeout', 'PurchaseorderService', 'employeeService', 'departmentService', 'PurchaserequestService', 'EnquirytabunganService'];
    function controller($scope, $modal, Upload, $timeout, PurchaseorderService, employeeService, departmentService, PurchaserequestService, EnquirytabunganService) {
        var vm = this;
        vm.save = save;
        vm.saving = false;
        //vm.addDetailBarang = addDetailBarang;

        vm.purchaseorder = $scope.data;

        vm.recalculate = function () {
            vm.purchaseorder.totalPurchase = (vm.purchaseorder.quantity * vm.purchaseorder.nominalBarang) + vm.purchaseorder.nominalPurchase
            if (vm.purchaseorder.paymentMethod == "FPBeforeReceive") {
                vm.purchaseorder.dpAmount = vm.purchaseorder.totalPurchase;
            }
        }


        //vm.recalculate2 = function () {
        //    vm.purchaseorder.nilaiBuku = vm.purchaseorder.totalPurchase + (vm.purchaseorder.totalPurchase * vm.purchaseorder.pajak / 100);
        //}

        vm.disableDP = function () {
            //if (vm.purchaseorder.paymentMethod == "FPAfterReceive" || vm.purchaseorder.paymentMethod == "FPBeforeReceive")
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

        vm.data = { enquiryId: vm.purchaseorder.id };

        vm.selectedDetailBarang = { id: vm.purchaseorder.detailBarangId, promotionCode: vm.purchaseorder.kodePromosi };

        vm.selectedMasterUser = { nik: vm.purchaseorder, nama: vm.purchaseorder.nama };

        vm.purchaseorder.namaCabang = vm.purchaseorder.company_name;

        vm.selectedSupplier = { supp_ID: vm.purchaseorder.supplierId, nm_Supp: vm.purchaseorder.supplierName }

        vm.selectedBank = { bankName: vm.purchaseorder.namaBank }

        //vm.purchaseorder.detailBarangList = [];

        //PurchaseorderService.getNoPurchaseOrder().then(function (value) {
        //      vm.purchaseorder.poId = value;
        //      vm.purchaseorder.poGroupId = value +"-1";
              

        //  });

       // PurchaseorderService.getDetailBarang({ enquiryId: vm.purchaseorder.id })
       //.then(function (response) {
       //    if (response.data !== undefined && response.data.length > 0) {
       //        response.data.forEach(function (item) {
       //            vm.purchaseorder.detailBarangList.push(item);
       //        });
       //    }
       //    vm.refreshDetailBarang();
       // });

        vm.historyPurchaseOrderGetAll = PurchaseorderService.historyGetAll;

        vm.detailbarangGetPage = PurchaseorderService.getDetailBarang;

        vm.masteruserGetPage = employeeService.getPage;

        vm.supplierGetPage = PurchaseorderService.getSupplier;

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
        //vm.purchaseorder.poDate = new Date();

        //vm.purchaseorder.polaId = "New";

        //vm.purchaseorder.typeId = "Tangible";

        
       // PurchaseorderService.getNoPurchaseGroup(vm.purchaseorder)
       //.then(function (value) {
       //    vm.purchaseorder.poGroupId = vm.purchaseorder.poId + "-" + value;
       //});

        vm.onSelectCabang = function () {
            vm.purchaseorder.cabang = vm.selectedCabang.branchCodeT24;
        }

        vm.onSelectMasterUser = function () {
            vm.purchaseorder.nikEmp = vm.selectedMasterUser.nik;
            vm.purchaseorder.deptId = vm.selectedMasterUser.department;
            //departmentService.loadAll()
            //.then(function () {
            //    vm.purchaseorder.deptId = vm.selectedMasterUser.department;
                //vm.purchaseorder.deptId = departmentService.getData(vm.selectedMasterUser.department).nama;
            //});
        }

        //vm.onSelectSupplier = function () {
        //    vm.purchaseorder.supp_ID = vm.selectedSupplier.suppID;
        //    vm.purchaseorder.NomorRekeningVendor = vm.selectedSupplier.NomorRekeningVendor;
        //}

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

        vm.detailBarangTableActions = {
            onDelete: deleteDetailBarang
        };

        function deleteDetailBarang(data) {
            if (confirm("Delete Detail Barang?")) {
                _removeArray(vm.purchaseorder.detailBarangList, "guid", data.guid);
                vm.refreshDetailBarang();
            }
        }

        function addDetailBarang() {
            var modalInstance = $modal.open({
                //windowClass: 'form-modal-window-800',
                backdrop: 'static',
                template: '<add-detailbarangpo/>'
            });

            modalInstance.result.then(function (detailBarang) {
                vm.purchaseorder.detailBarangList.push(detailBarang);
                vm.refreshDetailBarang();
                
            }, function () {
                //$log.info('Modal dismissed at: ' + new Date());
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
            //vm.setFile();

            vm.saving = true;
            PurchaseorderService.add(vm.purchaseorder)
                    .then(function (data) {
                        alert("No Purchase Order : " + data.poId);
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