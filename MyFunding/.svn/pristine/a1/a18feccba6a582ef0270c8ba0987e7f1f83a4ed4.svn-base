(function () {
    'use strict';

    window.app.directive('approveAmortisasirequest', approveAmortisasirequest);
    function approveAmortisasirequest() {
        return {
            scope: {
                data: '='
            },
            templateUrl: MyApplication.rootPath + '/amortisasirequest/template/approve.tmpl.cshtml',
            controller: controller,
            controllerAs: 'vm'
        }
    }

    controller.$inject = ['$scope', '$modal', 'AmortisasiRequestService'];
    function controller($scope, $modal, AmortisasiRequestService) {
        var vm = this;

        vm.amortisasirequest = $scope.data;
        vm.selectedView = 'details';
        vm.amortisasirequest = angular.copy($scope.data);
        vm.pathDO = "Files/deliveryorder/";
        vm.pathPR = "Files/purchaserequest/";
        vm.pathET = "Files/enquirytabungan/";
        vm.kartuAmortisasi = vm.amortisasirequest.listKartuAmortisasi;
        vm.totalBeban = vm.amortisasirequest.pO_TotalPurchase / 0.8;
        //vm.bebanperbulan = 0;


        //vm.setKartuAmortisasi = function () {
        //    if (vm.amortisasirequest.pR_StartDate != vm.amortisasirequest.pR_MaturityDate) {
        //        var startdate = new Date(vm.amortisasirequest.pR_StartDate);
        //        var endate = new Date(vm.amortisasirequest.pR_MaturityDate);
        //        var loopdate = startdate;
        //        var jumbulan = 0;
        //        vm.kartuAmortisasi = [];
        //        if (endate.getFullYear() == startdate.getFullYear()) {
        //            jumbulan = endate.getMonth() - startdate.getMonth();
        //        } else if (endate.getFullYear() > startdate.getFullYear()) {
        //            jumbulan = (endate.getMonth() + ((endate.getFullYear() - startdate.getFullYear()) * 12)) - startdate.getMonth();
        //        }
        //        vm.totalBeban = vm.amortisasirequest.pO_NominalBarang + (20 / 100 * vm.amortisasirequest.pO_NominalBarang)
        //        vm.bebanperbulan = vm.totalBeban / jumbulan;
        //        for (var i = 0; i < jumbulan; i++) {
        //            loopdate.setMonth(loopdate.getMonth() + 1);
        //            vm.kartuAmortisasi.push({ id: i + 1, valuedate: angular.copy(loopdate), bebanbulanan: vm.bebanperbulan });
        //        }
        //    }
        //}

        vm.viewOrDownload = function (namafile) {
            window.open(
                MyApplication.rootPath + namafile,
                '_blank'
            );
        }
        //vm.setKartuAmortisasi();

        vm.approve = function () {
            vm.saving = true;
            AmortisasiRequestService.approveData(vm.amortisasirequest)
				.then(function () {
				    //Close the modal
				    $scope.$parent.$close();
				})
				.catch(function (response) {
				    if (response.data.errorMessage) {
				        vm.message.error("There was a problem saving the issue: <br/>" + response.data.errorMessage + "<br/>Please try again.");
				    } else {
				        vm.message.error("There was a problem saving the issue. Please try again.");
				    }
				})
				.finally(function () {
				    vm.saving = false;
				});
        }

        vm.reject = function () {
            vm.saving = true;
            AmortisasiRequestService.rejectData(vm.amortisasirequest)
				.then(function () {
				    //Close the modal
				    $scope.$parent.$close();
				})
				.catch(function (response) {
				    if (response.data.errorMessage) {
				        vm.message.error("There was a problem saving the issue: <br/>" + response.data.errorMessage + "<br/>Please try again.");
				    } else {
				        vm.message.error("There was a problem saving the issue. Please try again.");
				    }
				})
				.finally(function () {
				    vm.saving = false;
				});
        }
    }
})();