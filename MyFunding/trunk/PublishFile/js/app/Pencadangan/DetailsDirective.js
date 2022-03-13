(function () {
    'use strict';

    window.app.directive('detailsPencadangan', detailsPencadangan);
    function detailsPencadangan() {
        return {
            scope: {
                data: '='
            },
            templateUrl: MyApplication.rootPath + '/pencadangan/template/details.tmpl.cshtml',
            controller: controller,
            controllerAs: 'vm'
        }
    }

    controller.$inject = ['$scope', '$modal'];
    function controller($scope, $modal) {
        var vm = this;

        vm.pencadangan = $scope.data;
        vm.selectedView = 'details';
        vm.pencadangan = angular.copy($scope.data);
        vm.pathDO = "Files/deliveryorder/";
        vm.pathPR = "Files/purchaserequest/";
        vm.pathET = "Files/enquirytabungan/";
        vm.kartuAmortisasi = [];
        vm.totalBeban = 0;
        vm.bebanperbulan = 0;

        vm.setKartuAmortisasi = function () {
            if (vm.pencadangan.pR_StartDate != vm.pencadangan.pR_MaturityDate) {
                var startdate = new Date(vm.pencadangan.pR_StartDate);
                var endate = new Date(vm.pencadangan.pR_MaturityDate);
                var loopdate = startdate;
                var jumbulan = 0;
                vm.kartuAmortisasi = [];
                if (endate.getFullYear() == startdate.getFullYear()) {
                    jumbulan = endate.getMonth() - startdate.getMonth();
                } else if (endate.getFullYear() > startdate.getFullYear()) {
                    jumbulan = (endate.getMonth() + ((endate.getFullYear() - startdate.getFullYear()) * 12)) - startdate.getMonth();
                }
                vm.totalBeban = vm.pencadangan.pO_NominalBarang + (20 / 100 * vm.pencadangan.pO_NominalBarang)
                vm.bebanperbulan = vm.totalBeban / jumbulan;
                for (var i = 0; i < jumbulan; i++) {
                    loopdate.setMonth(loopdate.getMonth() + 1);
                    vm.kartuAmortisasi.push({ id: i + 1, valuedate: angular.copy(loopdate), bebanbulanan: vm.bebanperbulan });
                }
            }
        }

        vm.viewOrDownload = function (namafile) {
            window.open(
                MyApplication.rootPath + namafile,
                '_blank'
            );
        }
        vm.setKartuAmortisasi();
    }
})();