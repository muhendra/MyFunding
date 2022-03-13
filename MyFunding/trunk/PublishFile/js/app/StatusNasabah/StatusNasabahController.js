(function () {
    "use strict"
    window.app.controller("StatusNasabahController", StatusNasabahController);
    StatusNasabahController.$inject = ["$scope", "$modal", "alerts", "StatusNasabahService", 'branchService'];
    function StatusNasabahController($scope, $modal, alerts, StatusNasabahService, branchService) {
        var vm = this;
        //20190117, jeni, BEGIN
        vm.search = search;
        vm.searchParams = {};
        vm.searchParams.NoRekening = "";
        vm.searchParams.NoCIF = "";
        vm.searchParams.cabang = "";
        //20190117, jeni, END
        vm.statusNasabahGetPage = StatusNasabahService.getpage;
        vm.cabanggetpage = branchService.getPage;

        function search() {
            vm.refreshData();
        }

        vm.onSelectCabang = function () {
            if (vm.selectedCabang == null)
                vm.searchParams.cabang = null;
            else
                vm.searchParams.cabang = vm.selectedCabang.branchCodeT24;
        }

    }
})()