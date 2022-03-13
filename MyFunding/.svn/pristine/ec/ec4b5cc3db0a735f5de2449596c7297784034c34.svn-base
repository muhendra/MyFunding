(function () {
    "use strict";

    window.app.directive('addPaymentrequest', addPaymentrequest);

    function addPaymentrequest() {
        return {
            templateUrl: MyApplication.rootPath + '/paymentrequest/template/add.tmpl.cshtml',
            controller: controller,
            controllerAs: 'vm'
        }
    }

    controller.$inject = ['$scope', '$modal', 'Upload', '$timeout', 'PaymentrequestService', 'applicationusersService', 'PurchaseorderService'];
    function controller($scope, $modal, Upload, $timeout, PaymentrequestService, applicationusersService, PurchaseorderService) {
        var vm = this;
        vm.save = save;
        vm.saving = false;
        vm.addJurnalPembayaran = addJurnalPembayaran;
        vm.addJurnalPencadangan = addJurnalPencadangan;

        vm.counter = 0;
        vm.paymentrequest = angular.copy($scope.data);
        vm.data = { enquiryId: vm.paymentrequest.id };
        vm.paymentrequest.jurnalPembayaranList = [];
        vm.paymentrequest.purchaseOrderId = vm.paymentrequest.id;
        vm.paymentrequest.enquiryId = 0;
        vm.paymentrequest.id = 0;
        vm.detailbarangGetPage = PaymentrequestService.getDetailBarang;

        vm.paymentrequestview = function (namafile) {
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
        vm.paymentrequest.paymentRequestDate = new Date();
        vm.paymentrequest.jurnalValueDate = new Date();
        vm.paymentrequest.transactionCode = "PB";

        if (vm.paymentrequest.paymentMethod == 'FPAfterReceive')
        {
            vm.paymentrequest.paymentRequestType = 'Pencadangan';
        }
        
        PaymentrequestService.getNoPayment()
        .then(function (value) {
            vm.paymentrequest.paymentRequestId = value;
            PaymentrequestService.processJurnalOtomatis({ poNo: vm.paymentrequest.poid, narrative: value, paymentRequestType: vm.paymentrequest.paymentRequestType }).then(function (data) {
                for (var i = 0; i < data.data.length; i++)
                {
                    vm.paymentrequest.jurnalPembayaranList.push(data.data[i]);
                }
                vm.refreshJurnalPembayaran();
            }


            );
        });

        vm.onSelectCabang = function () {
            vm.paymentrequest.cabang = vm.selectedCabang.branchCodeT24;
        }

        vm.onSelectDetailBarang = function () {
            vm.paymentrequest.jurnalPembayaranList.push(vm.selectedDetailBarang);
            vm.refreshJurnalPembayaran();
        }

        vm.detailJurnalPembayaranTableActions = {
            onDelete: deleteJurnalPembayaran,
            onEdit : editJurnalPembayaran
        };

        function deleteJurnalPembayaran(data) {
            if (confirm("Delete Jurnal Pembayaran?")) {
                _removeArray(vm.paymentrequest.jurnalPembayaranList, "guid", data.guid);
                vm.refreshJurnalPembayaran();
            }
        }

        function editJurnalPembayaran(val) {
            var oldData = [];
            for (var i = 0; i < vm.paymentrequest.jurnalPembayaranList.length; i++) {
                if (vm.paymentrequest.jurnalPembayaranList[i].counter == val.counter) {
                    oldData.push(vm.paymentrequest.jurnalPembayaranList[i]);
                }
            }
            var data = oldData;
            var modalInstance = $modal.open({
                windowClass: 'form-modal-window-1200',
                backdrop: 'static',
                template: '<add-jurnalpembayaran data="data"/>',
                scope: angular.extend($scope.$new(true), { data: data })
            });

            modalInstance.result.then(function (data) {
                vm.paymentrequest.jurnalPembayaranList[vm.paymentrequest.jurnalPembayaranList.indexOf(oldData[0])] = data[0];
                vm.paymentrequest.jurnalPembayaranList[vm.paymentrequest.jurnalPembayaranList.indexOf(oldData[1])] = data[1];
                vm.refreshJurnalPembayaran();
            }, function () {
                //$log.info('Modal dismissed at: ' + new Date());
            });
        }

        function addJurnalPembayaran() {
            vm.counter++;

            var modalInstance = $modal.open({
                windowClass: 'form-modal-window-1000',
                backdrop: 'static',
                template: '<add-jurnalpembayaran data="data"/>',
                scope: angular.extend($scope.$new(true), { data: [{ identitas: vm.counter, valueDate: new Date(), internalAccount: "", internalAccountName: "", debetKredit: "D", narrative: "", amount: vm.paymentrequest.dpAmount, branchId: "", branchName: "" }, { identitas: vm.counter, valueDate: new Date(), internalAccount: vm.paymentrequest.noRekSupplier, internalAccountName: vm.paymentrequest.accountTitle, namaCabang: vm.paymentrequest.accountCabang, debetKredit: "K", narrative: "", amount: vm.paymentrequest.dpAmount, branchId: "", branchName: "" }] })
            });

            modalInstance.result.then(function (data) {
                vm.paymentrequest.jurnalPembayaranList.push(data[0]);
                vm.paymentrequest.jurnalPembayaranList.push(data[1]);
                vm.refreshJurnalPembayaran();
            }, function () {
                //$log.info('Modal dismissed at: ' + new Date());
            });
        }

        function addJurnalPencadangan() {
            vm.counter++;

            var modalInstance = $modal.open({
                windowClass: 'form-modal-window-1000',
                backdrop: 'static',
                template: '<add-jurnalpencadangan data="data"/>',
                scope: angular.extend($scope.$new(true), { data: { valueDate: new Date(), debetKredit: "D", amount: vm.paymentrequest.dpAmount } })
            });

            modalInstance.result.then(function (data) {
                vm.paymentrequest.jurnalPembayaranList.push(data);
               // vm.paymentrequest.jurnalPembayaranList.push(data[1]);
                vm.refreshJurnalPembayaran();
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

        vm.onChangePaymentRequestType = function () {
            vm.paymentrequest.jurnalPembayaranList = [];
            //if (vm.paymentrequest.paymentRequestType == 'Pencadangan')
            //{
            //    vm.paymentrequest.vendorInvoiceNo = null;
            //    vm.paymentrequest.vendorInvoiceDate = null;
            //    vm.paymentrequest.vendorInvoiceAmount = 0;                
            //}
        }

        function save() {
            if (vm.paymentrequest.paymentRequestType == 'Pencadangan') {
                vm.paymentrequest.vendorInvoiceNo = null;
                vm.paymentrequest.vendorInvoiceDate = null;
                vm.paymentrequest.vendorInvoiceAmount = 0;
            }

                //if (vm.paymentrequest.jurnalPembayaranList.count < 1) {  //(171016) Hapus Comment Nanti AA
                //    alert("Jurnal Pembayaran tidak boleh kosong.");
                //    return false;
                //}
                vm.saving = true;
                PaymentrequestService.add(vm.paymentrequest)
                        .then(function (data) {
                            alert("No Payment Request : " + data.paymentRequestId);
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
            //}
            //else
            //{
            //    alert('yay');
            //}
        }

        
    }
})();