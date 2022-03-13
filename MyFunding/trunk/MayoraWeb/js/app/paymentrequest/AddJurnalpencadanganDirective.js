(function () {
    "use strict";

    window.app.directive('addJurnalpencadangan', addJurnalpencadangan);

    function addJurnalpencadangan() {
       return {
            scope: {
                data: "="
            },
            templateUrl: MyApplication.rootPath + '/paymentrequest/template/addjurnalpencadangan.tmpl.cshtml',
            controller: controller,
            controllerAs: 'vm'
        }
    }
    //harus di include di sini (combo box internal account)
   controller.$inject = ['$scope', 'PurchasereceiveService', 'PaymentrequestService', 'branchService', 'AmortisasiRequestService', 'companyTemenosService'];
   function controller($scope, PurchasereceiveService, PaymentrequestService, branchService, AmortisasiRequestService, companyTemenosService) {
        var vm = this;
        vm.saveJurnalPencadangan = saveJurnalPencadangan;

        vm.saving = false;
        vm.addjurnalpencadangan = { debetKredit: 'D', valueDate: new Date() };
        

        vm.cabanggetpage = companyTemenosService.getPage;
        if ($scope.data != null)
            vm.addjurnalpencadangan = angular.copy($scope.data);
        vm.searchParamInternalAccount = {};
       
        vm.cabang = {
            id: vm.addjurnalpencadangan.branchId, company_name: vm.addjurnalpencadangan.branchName
        };
        vm.addjurnalpencadanganinternalAccount = {};


        vm.onSelectCabang = function () {
            if (vm.cabang != null) {
                vm.addjurnalpencadangan.branchId = vm.cabang.id;
                vm.addjurnalpencadangan.branchName = vm.cabang.company_name;
                vm.addjurnalpencadangan.valueDate = new Date();
                vm.searchParamInternalAccount = { branchId: vm.cabang.id };
            }
            else
            {
                vm.addjurnalpencadangan.branchId = null;
                vm.addjurnalpencadangan.branchName = null;
                vm.searchParamInternalAccount = { branchId: null };
            }
            if (vm.addjurnalpencadangan.debetKredit == 'D') {
                vm.internalAccountItem = PaymentrequestService.getInternalAccountJurnalPencadanganDebit;
            }
            else {
                vm.internalAccountItem = PaymentrequestService.getInternalAccountJurnalPencadanganKredit;
            }
        }
        vm.getBranceName = function () {
            if (vm.addjurnalpencadangan.branchId != null && vm.jurna.branchId != '') {
                PaymentrequestService.descbranch(vm.addjurnalpencadangan.branchId).then(function (val) {
                    vm.addjurnalpencadangan.branchName = val;
                });
            }
        }

        vm.validateCabang = function () {
            return vm.addjurnalpencadangan.branchName == null || vm.addjurnalpencadangan.branchName == '';
        }
        vm.validateInternalAccount = function () {
            return vm.addjurnalpencadangan.internalAccount == null || vm.addjurnalpencadangan.internalAccount == '';

        }
        vm.getCatName = function () {
            if (vm.addjurnalpencadangan.internalAccount != null && vm.addjurnalpencadangan.internalAccount != '') {
                AmortisasiRequestService.descintaccount(vm.addjurnalpencadangan.internalAccount).then(function (val) {
                    vm.addjurnalpencadangan.internalAccountName = val;
                });
            }
        }
        //vm.internalAccountItem = PaymentrequestService.getinternalaccount;
        //PaymentrequestService.getinternalaccount()
        //     .then(function (response) {
        //         vm.internalAccountItem = response.data;

        //         for (var i = 0; i < vm.internalAccountItem.length; i++) {
        //             if (vm.addjurnalpelunasan.internalAccount == vm.internalAccountItem[i].nomorIA) {
        //                 vm.addjurnalpelunasaninternalAccount = vm.internalAccountItem[i];
        //             }
        //         }
        //     });
        if (vm.addjurnalpencadangan != null) {
            vm.addjurnalpencadanganinternalAccount = { nomorIA: vm.addjurnalpencadangan.internalAccount, cabang: vm.addjurnalpencadangan.namaCabang, deskripsi: vm.addjurnalpencadangan.internalAccountName };
        }
        vm.onSelectIA = function () {
            if (vm.addjurnalpencadanganinternalAccount != null) {
                vm.addjurnalpencadangan.internalAccount = vm.addjurnalpencadanganinternalAccount.nomorIA;
                vm.addjurnalpencadangan.internalAccountName = vm.addjurnalpencadanganinternalAccount.deskripsi;
                vm.addjurnalpencadangan.namaCabang = vm.addjurnalpencadanganinternalAccount.namaCabang;
            }
            else {
                vm.addjurnalpencadangan.internalAccount = null;
                vm.addjurnalpencadangan.internalAccountName = null;
                vm.addjurnalpencadangan.namaCabang = null;
            }
        }

        vm.debetKreditChange = function () {
            vm.addjurnalpencadangan.internalAccount = null;
            vm.addjurnalpencadangan.internalAccountName = null;
            vm.addjurnalpencadangan.namaCabang = null;

            vm.addjurnalpencadanganinternalAccount = { nomorIA: null };
         
            if (vm.addjurnalpencadangan.debetKredit == 'D') {
                vm.internalAccountItem = PaymentrequestService.getInternalAccountJurnalPencadanganDebit;
            }
            else {
                vm.internalAccountItem = PaymentrequestService.getInternalAccountJurnalPencadanganKredit;
            }

        }
       
        function saveJurnalPencadangan() {
            vm.saving = true;
            vm.addjurnalpencadangan.guid = _guid();

            $scope.$parent.$close(vm.addjurnalpencadangan);
        }
    }
})();