(function () {
    'use strict';

    window.app.directive('detailsBreakamortisasirequest', detailsBreakamortisasirequest);
    function detailsBreakamortisasirequest() {
        return {
            scope: {
                data: '='
            },
            templateUrl: MyApplication.rootPath + '/breakamortisasirequest/template/details.tmpl.cshtml',
            controller: controller,
            controllerAs: 'vm'
        }
    }

    controller.$inject = ['$scope', '$modal'];
    function controller($scope, $modal) {
        var vm = this;

        vm.breakamortisasirequest = $scope.data;
        vm.selectedView = 'details';
        vm.breakamortisasirequest = angular.copy($scope.data);
        vm.pathDO = "Files/deliveryorder/";
        vm.pathPR = "Files/purchaserequest/";
        vm.pathET = "Files/enquirytabungan/";
        vm.pathMemo = "Files/BreakMemo/";
        vm.kartuAmortisasi = [];
        vm.totalBeban = 0;
        vm.bebanperbulan = 0;

        vm.kartuAmortisasi = vm.breakamortisasirequest.listKartuAmortisasi;
        vm.totalBeban = vm.breakamortisasirequest.pO_TotalPurchase / 0.8; //+ (20 / 100 * vm.breakamortisasirequest.pO_NominalBarang);

        vm.setKartuAmortisasi = function () {
            if (vm.breakamortisasirequest.pR_StartDate != vm.breakamortisasirequest.pR_MaturityDate) {
                var startdate = new Date(vm.breakamortisasirequest.pR_StartDate);
                var endate = new Date(vm.breakamortisasirequest.pR_MaturityDate);
                var loopdate = startdate;
                var jumbulan = 0;
                vm.kartuAmortisasi = [];
                if (endate.getFullYear() == startdate.getFullYear()) {
                    jumbulan = endate.getMonth() - startdate.getMonth();
                } else if (endate.getFullYear() > startdate.getFullYear()) {
                    jumbulan = (endate.getMonth() + ((endate.getFullYear() - startdate.getFullYear()) * 12)) - startdate.getMonth();
                }
                vm.totalBeban = vm.breakamortisasirequest.pO_NominalBarang + (10 / 100 * vm.breakamortisasirequest.pO_NominalBarang)
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
        //vm.setKartuAmortisasi();
    }
})();