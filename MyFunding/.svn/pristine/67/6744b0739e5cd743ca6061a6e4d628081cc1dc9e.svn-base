(function () {
    "use strict";

    window.app.directive('addDetailbarang', addDetailbarang);

    function addDetailbarang() {
        return {
            templateUrl: MyApplication.rootPath + '/enquirytabungan/template/adddetailbarang.tmpl.cshtml',
            controller: controller,
            controllerAs: 'vm'
        }
    }

    controller.$inject = ['$scope', 'EnquirytabunganService', 'KatalogService'];
    function controller($scope, EnquirytabunganService, KatalogService) {
        var vm = this;
        vm.saveDetailBarang = saveDetailBarang;
        vm.search = {};
        vm.saving = false;
        vm.detailbarang = angular.copy($scope.data);
        vm.detailbarang.kategoriBarang = vm.detailbarang.kategory;
        vm.detailbarang.promotionCode2 = vm.detailbarang.keterangan;
        vm.detailbarang.keterangan = vm.detailbarang.keterangan;
        vm.detailbarang.merek = vm.detailbarang.merk;
        vm.detailbarang.typeBarang = vm.detailbarang.type;
        vm.detailbarang.penalty = vm.detailbarang.penalty;
        vm.detailbarang.promotionCode = vm.detailbarang.kodePromosi;
        vm.detailbarang.quantity = 1;
        if (vm.detailbarang.kodePromosi != null && vm.detailbarang.kodePromosi !='') {

            EnquirytabunganService.loadAll()
             .then(function (data) {
                 var param = { promotionCode: vm.detailbarang.promotionCode };
                 EnquirytabunganService.getDataKodePromosi(param)
                 .then(function (response) {
                     if (response !== undefined) {
                         vm.detailbarang.kategoriBarang = response.kategory;
                         vm.detailbarang.merek = response.merk;
                         vm.detailbarang.typeBarang = response.type;
                         vm.detailbarang.penalty = response.penalty;
                     }
                 })
             });
        }

        vm.KodePromoGetPage2 = KatalogService.kataloggetPage2;
        vm.onSelectdetailbarang =
        function () {                  
            vm.katalog.kode_Promo = vm.detailbarang.PromotionCode;
            vm.katalog.idKode_Promo2 = vm.detailbarang.PromotionCode2;
        }

        function saveDetailBarang() {
                vm.detailbarang.guid = _guid();
                $scope.$close(vm.detailbarang);
        }

        //vm.getdata = function () {
        //    var param = { promotionCode: vm.detailbarang.promotionCode };
        //    EnquirytabunganService.getDataKodePromosi(param)
        //    .then(function (response) {            
        //        if (response !== undefined)
        //        {
        //            vm.detailbarang.kategoriBarang = response.Kategory;
        //            vm.detailbarang.merek = response.merk;
        //            vm.detailbarang.typeBarang = response.type;
        //            vm.detailbarang.penalty = response.penalty;
        //        }
        //    })
        //}


        //vm.detailbarang.promotionCode =
        //vm.onchangeprice = function () {
        //    vm.detailbarang.total = (vm.detailbarang.price * vm.aspekfinancial.quantity) + ((vm.aspekfinancial.price * vm.aspekfinancial.quantity) * (vm.aspekfinancial.ppn / 100));
        //}

        //vm.onchangeppn = function () {
        //    vm.detailbarang.total = (vm.aspekfinancial.price * vm.aspekfinancial.quantity) + ((vm.aspekfinancial.price * vm.aspekfinancial.quantity) * (vm.aspekfinancial.ppn / 100));
        //}

        //vm.onchangequantity = function () {
        //    vm.detailbarang.total = (vm.aspekfinancial.price * vm.aspekfinancial.quantity) + ((vm.aspekfinancial.price * vm.aspekfinancial.quantity) * (vm.aspekfinancial.ppn / 100));
        //}

       
    }
})();