(function () {
    "use strict";

    window.app.directive('addJurnalpelunasan', addJurnalpelunasan);

   function addJurnalpelunasan() {
       return {
            scope: {
                data: "="
            },
            templateUrl: MyApplication.rootPath + '/purchasereceive/template/addjurnalpelunasan.tmpl.cshtml',
            controller: controller,
            controllerAs: 'vm'
        }
    }
    //harus di include di sini (combo box internal account)
   controller.$inject = ['$scope', 'PurchasereceiveService', 'PaymentrequestService', 'branchService', 'AmortisasiRequestService', 'companyTemenosService'];
   function controller($scope, PurchasereceiveService, PaymentrequestService, branchService, AmortisasiRequestService, companyTemenosService) {
        var vm = this;
        vm.saveJurnalPelunasan = saveJurnalPelunasan;

        vm.saving = false;
        vm.addjurnalpelunasan = { debetKredit: 'D', valueDate: new Date() };
        

        vm.cabanggetpage = companyTemenosService.getPage;
        if ($scope.data != null)
            vm.addjurnalpelunasan = angular.copy($scope.data);
        vm.searchParamInternalAccount = {};
       
        vm.cabang = {
            id: vm.addjurnalpelunasan.branchId, company_name: vm.addjurnalpelunasan.branchName
        };
        vm.addjurnalpelunasaninternalAccount = {};


        vm.onSelectCabang = function () {
            if (vm.cabang != null) {
                vm.addjurnalpelunasan.branchId = vm.cabang.id;
                vm.addjurnalpelunasan.branchName = vm.cabang.company_name;
                vm.addjurnalpelunasan.valueDate = new Date();
                vm.searchParamInternalAccount = { branchId: vm.cabang.id };
            }
            else
            {
                vm.addjurnalpelunasan.branchId = null;
                vm.addjurnalpelunasan.branchName = null;
                vm.searchParamInternalAccount = { branchId: null };
            }
            if (vm.addjurnalpelunasan.debetKredit == 'D') {
                vm.internalAccountItem = PaymentrequestService.getInternalAccountJurnalDebit;
            }
            else {
                vm.internalAccountItem = PaymentrequestService.getInternalAccountKredit;
            }
        }
        vm.getBranceName = function () {
            if (vm.addjurnalpelunasan.branchId != null && vm.jurna.branchId != '') {
                PaymentrequestService.descbranch(vm.addjurnalpelunasan.branchId).then(function (val) {
                    vm.addjurnalpelunasan.branchName = val;
                });
            }
        }

        vm.validateCabang = function () {
            return vm.addjurnalpelunasan.branchName == null || vm.addjurnalpelunasan.branchName == '';
        }
        vm.validateInternalAccount = function () {
            return vm.addjurnalpelunasan.internalAccount == null || vm.addjurnalpelunasan.internalAccount == '';

        }
        vm.getCatName = function () {
            if (vm.addjurnalpelunasan.internalAccount != null && vm.addjurnalpelunasan.internalAccount != '') {
                AmortisasiRequestService.descintaccount(vm.addjurnalpelunasan.internalAccount).then(function (val) {
                    vm.addjurnalpelunasan.internalAccountName = val;
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
        if (vm.addjurnalpelunasan != null) {
            vm.addjurnalpelunasaninternalAccount = { nomorIA: vm.addjurnalpelunasan.internalAccount, cabang: vm.addjurnalpelunasan.namaCabang, deskripsi: vm.addjurnalpelunasan.internalAccountName };
        }
        vm.onSelectIA = function () {
            if (vm.addjurnalpelunasaninternalAccount != null) {
                vm.addjurnalpelunasan.internalAccount = vm.addjurnalpelunasaninternalAccount.nomorIA;
                vm.addjurnalpelunasan.internalAccountName = vm.addjurnalpelunasaninternalAccount.deskripsi;
                vm.addjurnalpelunasan.namaCabang = vm.addjurnalpelunasaninternalAccount.namaCabang;
            }
            else {
                vm.addjurnalpelunasan.internalAccount = null;
                vm.addjurnalpelunasan.internalAccountName = null;
                vm.addjurnalpelunasan.namaCabang = null;
            }
        }

        vm.debetKreditChange = function () {
            vm.addjurnalpelunasan.internalAccount = null;
            vm.addjurnalpelunasan.internalAccountName = null;
            vm.addjurnalpelunasan.namaCabang = null;

            vm.addjurnalpelunasaninternalAccount = { nomorIA: null };
         
            if (vm.addjurnalpelunasan.debetKredit == 'D') {
                vm.internalAccountItem = PaymentrequestService.getInternalAccountJurnalDebit;
            }
            else {
                vm.internalAccountItem = PaymentrequestService.getInternalAccountKredit;
            }

        }
       
        function saveJurnalPelunasan() {
            vm.saving = true;
            vm.addjurnalpelunasan.guid = _guid();

            $scope.$parent.$close(vm.addjurnalpelunasan);
        }
    }
})();