(function () {
    "use strict";

    window.app.directive('addPelunasan', addPelunasan);

    function addPelunasan() {
        return {
            scope: {
                data: "="
            },
            templateUrl: MyApplication.rootPath + '/purchasereceive/template/addpelunasan.tmpl.cshtml',
            controller: controller,
            controllerAs: 'vm'
        }
    }

    controller.$inject = ['$scope', '$modal', 'Upload', '$timeout', 'PurchasereceiveService', 'applicationusersService', 'PurchaseorderService'];
    function controller($scope, $modal, Upload, $timeout, PurchasereceiveService, applicationusersService, PurchaseorderService) {
        var vm = this;
        vm.save = save;
        vm.saving = false;
        vm.addJurnalPelunasan = addJurnalPelunasan;

        vm.purchasereceive = angular.copy($scope.data);


        vm.purchasereceive.jurnalPelunasanList = [];
        vm.label = 'Pelunasan Payment';
        if (vm.purchasereceive.paymentMethod == 'UMBeforeReceive')
            vm.label = 'Pelunasan Payment';
        else if (vm.purchasereceive.paymentMethod == 'FPBeforeReceive')
            vm.label = 'Pembebanan Payment';
        else if (vm.purchasereceive.paymentMethod == 'FPAfterReceive' && vm.purchasereceive.paymentRequestType == 'Pencadangan')
            vm.label = 'Penyelesaian Payment';
        else if (vm.purchasereceive.paymentMethod == 'FPAfterReceive' && vm.purchasereceive.paymentRequestType == null)
            vm.label = 'Full Payment After Receive';
       
        var debit = { valueDate: new Date(), internalAccount: "", internalAccountName: "", debetKredit: "D", narrative: "Jurnal " + vm.label, amount: vm.purchasereceive.sisaPembayaran, branchId: "", branchName: "" };
        var credit = { valueDate: new Date(), internalAccount: "", internalAccountName: "", debetKredit: "K", narrative: "Jurnal " + vm.label, amount: vm.purchasereceive.sisaPembayaran, branchId: "", branchName: "" };
        //vm.purchasereceive.jurnalPelunasanList.push(debit);
        //vm.purchasereceive.jurnalPelunasanList.push(credit);



        vm.purchasereceive.jurnalValueDate = new Date();

        PurchasereceiveService.getNoPelunasan()
        .then(function (value) {
            vm.purchasereceive.pelunasanId = value;

            PurchasereceiveService.processJurnalOtomatis({ poNo: vm.purchasereceive.poId, narrative: value }).then(function (data) {
                for (var i = 0; i < data.data.length; i++) {
                    vm.purchasereceive.jurnalPelunasanList.push(data.data[i]);
                }
                vm.refreshJurnalPelunasan();
            }


            );
        });

        vm.tableActions = {
            onDelete: deletePelunasan,
            onEdit: editPelunasan
        };

        function deletePelunasan(data) {
            if (confirm("Delete Jurnal Pelunasan?")) {
                _removeArray(vm.purchasereceive.jurnalPelunasanList, "guid", data.guid);
                vm.refreshJurnalPelunasan();
            }
        }

        function addJurnalPelunasan() {
            //return true;
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

        function editPelunasan(data) {
            vm.olddata = data;
            var modalInstance = $modal.open({
                //windowClass: 'form-modal-window-800',
                backdrop: 'static',
                template: '<add-jurnalpelunasan data="data" />',
                scope: angular.extend($scope.$new(true), { data: data })
            });

            modalInstance.result.then(function (data) {
                vm.purchasereceive.jurnalPelunasanList[vm.purchasereceive.jurnalPelunasanList.indexOf(vm.olddata)] = data;
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
            var debetValue = 0;
            var kreditValue = 0;
            for (var i = 0; i < vm.purchasereceive.jurnalPelunasanList.length; i++) {
                if (vm.purchasereceive.jurnalPelunasanList[i].internalAccount == "") {
                    vm.message.error("Terdapat Internal Account Belum terisi");
                    return false;
                }
                if (vm.purchasereceive.jurnalPelunasanList[i].branchId == "") {
                    vm.message.error("Terdapat Cabang Belum Terisi");
                    return false;
                }
                if (vm.purchasereceive.jurnalPelunasanList[i].internalAccount == "") {
                    vm.message.error("Terdapat Internal Account Belum Terisi");
                    return false;
                }

                if (vm.purchasereceive.jurnalPelunasanList[i].debetKredit == 'D')
                {
                    debetValue = debetValue + vm.purchasereceive.jurnalPelunasanList[i].amount;
                }
                else
                {
                    kreditValue = kreditValue + vm.purchasereceive.jurnalPelunasanList[i].amount;
                }
            }

            if (debetValue != kreditValue)
            {
                vm.message.error("Jumlah Amount Debit & Kredit tidak sama!");
                return false;
            }
            vm.saving = true;
            PurchasereceiveService.edit(vm.purchasereceive)
                    .then(function (data) {
                        //alert("No Pelunasan : " + data.pelunasanId);
                        //Close the modal

                        $scope.$parent.$close();
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


        function getinternalaccount() {
            return DataService.post(controllerPath + 'getinternalaccount')
                        .then(function (response) {
                            return response;
                        });
            vm.saving = true;
            PurchasereceiveService.edit(vm.purchasereceive)
                    .then(function (data) {
                        //alert("No Pelunasan : " + data.pelunasanId);
                        //Close the modal

                        $scope.$parent.$close();
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