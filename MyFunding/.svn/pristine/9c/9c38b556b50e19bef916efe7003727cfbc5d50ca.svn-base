(function () {
    "use strict";

    window.app.directive('addPurchaseorder', addPurchaseorder);

    function addPurchaseorder() {
        return {
            templateUrl: MyApplication.rootPath + '/purchaseorder/template/add.tmpl.cshtml',
            controller: controller,
            controllerAs: 'vm'
        }
    }

    controller.$inject = ['$scope', '$modal', 'Upload', '$timeout', 'PurchaseorderService', 'employeeService', 'departmentService', 'PurchaserequestService', 'EnquirytabunganService'];
    function controller($scope, $modal, Upload, $timeout, PurchaseorderService, employeeService, departmentService, PurchaserequestService, EnquirytabunganService) {
        var vm = this;
        vm.save = save;
        vm.saving = false;
        vm.searchParams = {};
        vm.searchParams.supplierId = "";
        vm.searchParams.paymentMethod = "";
        //vm.addDetailBarang = addDetailBarang;

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
            //20190201, jeni, BEGIN
            vm.selectedIsActive = false;
            vm.onChangeIsActive();
            //20190201, jeni, END
            //if (vm.purchaseorder.paymentMethod == "FPAfterReceive" || vm.purchaseorder.paymentMethod == "FPBeforeReceive")
            if (vm.purchaseorder.paymentMethod == "FPAfterReceive") {
                vm.disableDPAmount = true;
                vm.purchaseorder.dpAmount = 0;
            } else
                if (vm.purchaseorder.paymentMethod == "FPBeforeReceive") {
                    vm.disableDPAmount = true;
                    vm.purchaseorder.dpAmount = vm.purchaseorder.totalPurchase;
                }
                else
                    vm.disableDPAmount = false;

            //vm.recalculate();
        }
        vm.purchaseorder = angular.copy($scope.data);

        vm.data = { enquiryId: vm.purchaseorder.id };

        //vm.purchaseorder.detailBarangList = [];

        PurchaseorderService.getNoPurchaseOrder().then(function (value) {
            vm.purchaseorder.poId = value;
            //20190131, jeni, BEGIN
            //vm.purchaseorder.poGroupId = value + "-1";
            vm.purchaseorder.poGroupId = value;
            vm.selectedPOGroup = { poGroupId: vm.purchaseorder.poGroupId }
            //20190131, jeni, END


        });

        // PurchaseorderService.getDetailBarang({ enquiryId: vm.purchaseorder.id })
        //.then(function (response) {
        //    if (response.data !== undefined && response.data.length > 0) {
        //        response.data.forEach(function (item) {
        //            vm.purchaseorder.detailBarangList.push(item);
        //        });
        //    }
        //    vm.refreshDetailBarang();
        // });

        vm.detailbarangGetPage = PurchaseorderService.getDetailBarang;

        vm.supplierGetPage = PurchaseorderService.getSupplier;

        

        vm.masteruserGetPage = employeeService.getPage;

        vm.bankGetPage = PurchaseorderService.getCmsBankPage;

        PurchaseorderService.getNikUserLogin().then(function (value) {
            vm.purchaseorder.nikEmp = value.nik;
            vm.purchaseorder.deptId = value.departmentId;

            vm.selectedMasterUser = { nik: value.nik, department: value.departmentId };
        })

        vm.purchaseorderview = function (namafile) {
            if (namafile != undefined) {
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
        vm.purchaseorder.poDate = new Date();

        vm.purchaseorder.polaId = "New";

        vm.purchaseorder.typeId = "Tangible";


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

        /*Otomatis terpilih kode voucher*/
        //vm.selectedDetailBarang = { id: vm.purchaseorder.detailBarangId, promotionCode: vm.purchaseorder.kodePromosi };

        //vm.purchaseorder.kategoriBarang = vm.purchaseorder.kategory;
        //vm.purchaseorder.typeBarang = vm.purchaseorder.type;
        //vm.purchaseorder.merek = vm.purchaseorder.merk;

        for (var i = 0; i < vm.purchaseorder.detailBarangList.length; i++) {
            /*Otomatis terpilih kode voucher*/
            vm.selectedDetailBarang = { id: vm.purchaseorder.detailBarangList[i].id, promotionCode: vm.purchaseorder.detailBarangList[i].promotionCode };

            vm.purchaseorder.kategoriBarang = vm.purchaseorder.detailBarangList[i].kategoriBarang;
            vm.purchaseorder.typeBarang = vm.purchaseorder.detailBarangList[i].typeBarang;
            vm.purchaseorder.merek = vm.purchaseorder.detailBarangList[i].merek;
            vm.purchaseorder.quantityBarang = vm.purchaseorder.detailBarangList[i].quantity;
            vm.purchaseorder.penalty = vm.purchaseorder.detailBarangList[i].penalty;
            vm.purchaseorder.quantity = vm.purchaseorder.detailBarangList[i].quantity;
        }
        //vm.recalculate();

        vm.onSelectDetailBarang = function () {
            vm.purchaseorder.detailBarangList = [];
            vm.purchaseorder.detailBarangId = vm.selectedDetailBarang.id;
            vm.purchaseorder.promotionCode = vm.selectedDetailBarang.promotionCode;
            vm.purchaseorder.kategoriBarang = vm.selectedDetailBarang.kategoriBarang;
            vm.purchaseorder.typeBarang = vm.selectedDetailBarang.typeBarang;
            vm.purchaseorder.merek = vm.selectedDetailBarang.merek;
            vm.purchaseorder.quantityBarang = vm.selectedDetailBarang.quantity;
            vm.purchaseorder.penalty = vm.selectedDetailBarang.penalty;
            vm.purchaseorder.quantity = vm.selectedDetailBarang.quantity;
            vm.purchaseorder.detailBarangList.push(vm.selectedDetailBarang);
            vm.refreshDetailBarang();
        }

        vm.onSelectSupplier = function () {
            if (vm.selectedSupplier != null) {
                vm.purchaseorder.supplierId = vm.selectedSupplier.supp_ID;
                vm.purchaseorder.alamatSupplier = vm.selectedSupplier.alamat1 + ' ' + vm.selectedSupplier.alamat2 + ' ' + vm.selectedSupplier.alamat3;
                //20190201, jeni, BEGIN
                vm.selectedIsActive = false;
                vm.onChangeIsActive();
                //20190201, jeni, END
            }
            else {
                vm.purchaseorder.supplierId = null;
                vm.purchaseorder.alamatSupplier = null;
            }
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

        vm.onSelectBank = function () {
            vm.purchaseorder.namaBank = vm.selectedBank.bankName;
        }

        // Validation area
        vm.isNotValidBank =
        function () {
            if (vm.purchaseorder != null) {
                if (vm.purchaseorder.namaBank == null)
                    return true;
                else
                    return false;

                //return vm.jenisKejadian.prosesBisnisId == null;
            }
            else
                return true;
        }

        function save() {
            //vm.setFile();
            //20190129, jeni, BEGIN
            if (vm.purchaseorder.totalPurchase > vm.purchaseorder.rewardBudget) {
                alert("Total Purchase lebih besar dari Reward Budget");
                return false;
            }
            else if (!vm.purchaseorder.poGroupId) {
                alert("PO Group ID tidak boleh kosong");
                return false;
            }
            //20190129, jeni, END
            vm.purchaseorder.enquiryId = vm.purchaseorder.id;
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

        //20190131, jeni, BEGIN
        //vm.searchParams.supplierId = vm.purchaseorder.supplierId;
        //vm.searchParams.paymentMethod = vm.purchaseorder.paymentMethod;
        vm.poGroupGetPage = PurchaseorderService.getPOGroup;

        
        
        vm.onSelectPOGroup = function () {
            if (vm.selectedPOGroup != null) {
                vm.purchaseorder.poGroupId = vm.selectedPOGroup.poGroupId;
                vm.purchaseorder.bankName = vm.selectedPOGroup.namaBank;
                vm.purchaseorder.namaBank = vm.selectedPOGroup.namaBank;
                vm.selectedBank = { bankName: vm.selectedPOGroup.namaBank }
                vm.purchaseorder.nomorRekeningVendor = vm.selectedPOGroup.nomorRekeningVendor;
                vm.purchaseorder.poDate = vm.selectedPOGroup.poDate;
                vm.purchaseorder.currency = vm.selectedPOGroup.currency;
                vm.purchaseorder.paymentType = vm.selectedPOGroup.paymentType;
                
            }
            else {
                vm.purchaseorder.poGroupId = null;
                
            }
        }
        
        vm.onChangeIsActive = function () {
            if (vm.selectedIsActive) {
                if (!vm.purchaseorder.supplierId) {
                    alert("Supplier tidak boleh kosong");
                    vm.selectedIsActive = false;
                }
                else if (!vm.purchaseorder.paymentMethod) {
                    alert("Silahkan pilih payment method");
                    vm.selectedIsActive = false;
                }
                else {
                    vm.searchParams.supplierId = vm.purchaseorder.supplierId;
                    if (vm.purchaseorder.paymentMethod == "UMBeforeReceive")
                        vm.searchParams.paymentMethod = 0
                    if (vm.purchaseorder.paymentMethod == "FPBeforeReceive")
                        vm.searchParams.paymentMethod = 1
                    if (vm.purchaseorder.paymentMethod == "FPAfterReceive")
                        vm.searchParams.paymentMethod = 2
                    PurchaseorderService.getPOGroup(vm.searchParams).then(function (value) {
                        vm.poGroupGetPage = value.data;
                    })
                }
            } else {
                vm.purchaseorder.poGroupId = vm.purchaseorder.poId;
                vm.selectedPOGroup = { poGroupId: vm.purchaseorder.poGroupId }
                vm.purchaseorder.poDate = new Date();
            }
        }
        //20190131, jeni, END
    }
})();