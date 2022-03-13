(function () {
    "use strict";

    window.app.directive('addDetailbarangpo', addDetailbarangpo);

    function addDetailbarangpo() {
        return {
            templateUrl: MyApplication.rootPath + '/enquirytabungan/template/adddetailbarang.tmpl.cshtml',
            controller: controller,
            controllerAs: 'vm'
        }
    }

    controller.$inject = ['$scope', 'EnquirytabunganService'];
    function controller($scope, EnquirytabunganService) {
        var vm = this;
        vm.saveDetailBarang = saveDetailBarang;

        vm.saving = false;
        vm.detailbarang = {};

        //vm.onchangeprice = function () {
        //    vm.detailbarang.total = (vm.detailbarang.price * vm.aspekfinancial.quantity) + ((vm.aspekfinancial.price * vm.aspekfinancial.quantity) * (vm.aspekfinancial.ppn / 100));
        //}

        //vm.onchangeppn = function () {
        //    vm.detailbarang.total = (vm.aspekfinancial.price * vm.aspekfinancial.quantity) + ((vm.aspekfinancial.price * vm.aspekfinancial.quantity) * (vm.aspekfinancial.ppn / 100));
        //}

        //vm.onchangequantity = function () {
        //    vm.detailbarang.total = (vm.aspekfinancial.price * vm.aspekfinancial.quantity) + ((vm.aspekfinancial.price * vm.aspekfinancial.quantity) * (vm.aspekfinancial.ppn / 100));
        //}

        function saveDetailBarang() {
            vm.detailbarang.guid = _guid();
            $scope.$close(vm.detailbarang);
        }
    }
})();