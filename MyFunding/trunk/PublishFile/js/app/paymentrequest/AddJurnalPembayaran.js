(function () {
    "use strict";

    window.app.directive('addJurnalpembayaran', addJurnalpembayaran);

    function addJurnalpembayaran() {
        return {
            scope: {
                data: '='
            },
            templateUrl: MyApplication.rootPath + '/paymentrequest/template/addjurnalpembayaran.tmpl.cshtml',
            controller: controller,
            controllerAs: 'vm'
        }
    }

    controller.$inject = ['$scope', 'PaymentrequestService' ,'branchService', 'companyTemenosService' ];
    function controller($scope, PaymentrequestService, branchService, companyTemenosService ) {
        var vm = this;
        vm.saveJurnalPembayaran = saveJurnalPembayaran;
        vm.cabangGetPage = companyTemenosService.getPage;
        vm.cabangGetPage2 = companyTemenosService.getPage;

        
        vm.saving = false;
        vm.jurnalpembayaran = {};
        vm.jurnalpembayaran2 = {};

        vm.searchParamInternalAccount = {};
        vm.searchParamInternalAccountKredit = {};

        vm.jurnalpembayaran = angular.copy($scope.data[0]);
        vm.jurnalpembayaran2 = angular.copy($scope.data[1]);

        vm.selectedCabang2 = { id: vm.jurnalpembayaran2.branchId }
        vm.selectedCabang = { id: vm.jurnalpembayaran.branchId }

        vm.cabanggetpage = branchService.getPage;

        vm.onSelectCabang = function () {
            if (vm.selectedCabang != null) {
                vm.jurnalpembayaran.branchId = vm.selectedCabang.id;
                vm.jurnalpembayaran.branchName = vm.selectedCabang.company_name;
                vm.searchParamInternalAccount = { branchId: vm.selectedCabang.id };
                //vm.internalAccountItem = PaymentrequestService.getinternalaccount;
            }
            else
            {
                vm.jurnalpembayaran.branchId = null;
                vm.jurnalpembayaran.branchName = null;
                vm.searchParamInternalAccount = { branchId: null };                
            }
            vm.internalAccountItem = PaymentrequestService.getinternalaccount;
            vm.jurnalpembayaran.internalAccount = null;
            vm.jurnalpembayaran.internalAccountName = null;
            vm.jurnalpembayaran.namaCabang = null;
            vm.jurnalpembayaraninternalAccount = null;
        }

        vm.onSelectCabang2 = function () {
            if (vm.selectedCabang2 != null) {
                vm.jurnalpembayaran2.branchId = vm.selectedCabang2.id;
                vm.jurnalpembayaran2.branchName = vm.selectedCabang2.company_name;
                vm.searchParamInternalAccountKredit = { branchId: vm.selectedCabang2.id };
            }
            else
            {
                vm.jurnalpembayaran2.branchId = null;
                vm.jurnalpembayaran2.branchName = null;
                vm.searchParamInternalAccountKredit = { branchId: vm.selectedCabang2.id };
            }
            vm.internalAccountItemKredit = PaymentrequestService.getInternalAccountKredit;
            vm.jurnalpembayaran2.internalAccount = null;
            vm.jurnalpembayaran2.internalAccountName = null;
            vm.jurnalpembayaran2.namaCabang = null;
            vm.jurnalpembayaran2internalAccount = null;
        }


        vm.changeamount = function () {
            vm.jurnalpembayaran2.amount = vm.jurnalpembayaran.amount;
        }

        vm.changeamount2 = function () {
            vm.jurnalpembayaran.amount = vm.jurnalpembayaran2.amount;
        }

        vm.getBranceName = function () {
            if (vm.jurnalpembayaran.branchId != null && vm.jurnalpembayaran.branchId != '') {
                PaymentrequestService.descbranch(vm.jurnalpembayaran.branchId).then(function (val) {
                    vm.jurnalpembayaran.branchName = val;
                });
            }
        }

        vm.getCatName = function () {
            if (vm.jurnalpembayaran.internalAccount != null && vm.jurnalpembayaran.internalAccount != '') {
                PaymentrequestService.descintaccount(vm.jurnalpembayaran.internalAccount).then(function (val) {
                    vm.jurnalpembayaran.internalAccountName = val;
                });
            }
        }

        vm.getBranceName2 = function () {
            if (vm.jurnalpembayaran2.branchId != null && vm.jurnalpembayaran2.branchId != '') {
                PaymentrequestService.descbranch(vm.jurnalpembayaran2.branchId).then(function (val) {
                    vm.jurnalpembayaran2.branchName = val;
                });
            }
        }

        vm.getCatName2 = function () {
            if (vm.jurnalpembayaran2.internalAccount != null && vm.jurnalpembayaran2.internalAccount != '') {
                PaymentrequestService.descintaccount(vm.jurnalpembayaran2.internalAccount).then(function (val) {
                    vm.jurnalpembayaran2.internalAccountName = val;
                });
            }
        }

        //combo box internal account
        
        //PaymentrequestService.getinternalaccount()
        //    .then(function (response) {
        //        vm.internalAccountItem = response.data;
        //        for (var i = 0; i < vm.internalAccountItem.length; i++) {
        //            if(vm.jurnalpembayaran.internalAccount == vm.internalAccountItem[i].nomorIA){
        //                vm.jurnalpembayaraninternalAccount = vm.internalAccountItem[i];
        //            }
        //            if(vm.jurnalpembayaran2.internalAccount == vm.internalAccountItem[i].nomorIA){
        //                vm.jurnalpembayaran2internalAccount = vm.internalAccountItem[i];
        //            }
                    
        //        }
        //})
        if (vm.jurnalpembayaran != null) {
            vm.jurnalpembayaraninternalAccount = { nomorIA: vm.jurnalpembayaran.internalAccount, cabang: vm.jurnalpembayaran.namaCabang, deskripsi: vm.jurnalpembayaran.internalAccountName};
        }
        
        vm.onSelectIA = function () {
            if (vm.jurnalpembayaraninternalAccount != null) {
                vm.jurnalpembayaran.internalAccount = vm.jurnalpembayaraninternalAccount.nomorIA;
                vm.jurnalpembayaran.internalAccountName = vm.jurnalpembayaraninternalAccount.deskripsi;
                vm.jurnalpembayaran.namaCabang = vm.jurnalpembayaraninternalAccount.namaCabang;
            }
            else
            {
                vm.jurnalpembayaran.internalAccount = null;
                vm.jurnalpembayaran.internalAccountName = null;
                vm.jurnalpembayaran.namaCabang = null;
            }
           
        }
        vm.validateCabang = function () {
            return vm.jurnalpembayaran.branchId == null || vm.jurnalpembayaran.branchId == '';
        }
        vm.validateCabang2 = function () {
            return vm.jurnalpembayaran2.branchId == null || vm.jurnalpembayaran2.branchId == '';
        }


        vm.validateInternalAccount = function () {
            return vm.jurnalpembayaran.internalAccount == null || vm.jurnalpembayaran.internalAccount== '';
            

        }
        vm.validateInternalAccount2 = function () {
            return vm.jurnalpembayaran2.internalAccount == null || vm.jurnalpembayaran.internalAccount == '';
        }

        //if (vm.jurnalpembayaraninternalAccount.nomorIA == ' ') {
        
      

        //combo box internal account
        if (vm.jurnalpembayaran2 != null) {
            vm.jurnalpembayaran2internalAccount = { nomorIA: vm.jurnalpembayaran2.internalAccount, cabang: vm.jurnalpembayaran2.namaCabang, deskripsi: vm.jurnalpembayaran2.internalAccountName };
        }
        
        vm.onSelectIA2 = function () {
            if (vm.jurnalpembayaran2internalAccount != null) {
                vm.jurnalpembayaran2.internalAccount = vm.jurnalpembayaran2internalAccount.nomorIA;
                vm.jurnalpembayaran2.internalAccountName = vm.jurnalpembayaran2internalAccount.deskripsi;
                vm.jurnalpembayaran2.namaCabang = vm.jurnalpembayaran2internalAccount.namaCabang;
            }
            else
            {
                vm.jurnalpembayaran2.internalAccount = null;
                vm.jurnalpembayaran2.internalAccountName = null;
                vm.jurnalpembayaran2.namaCabang = null;
            }
        }
        

        function saveJurnalPembayaran() {
            if (vm.jurnalpembayaran.internalAccount == vm.jurnalpembayaran2.internalAccount)
            {
                alert("Internal Account Debit tidak boleh sama dengan Internal Account Kredit!");
                return;
            }

            vm.saving = true;
            vm.model = [];
            vm.model.push(vm.jurnalpembayaran);
            vm.model.push(vm.jurnalpembayaran2);
            $scope.$parent.$close(vm.model);

            //vm.jurnalpembayaran.guid = _guid();
            //$scope.$close(vm.jurnalpembayaran);
        }
    }
})();