(function () {
    "use strict"
    window.app.controller("StatusNasabahController", StatusNasabahController);
    StatusNasabahController.$inject = ["$scope", "$modal", "alerts", "StatusNasabahService", 'branchService'];
    function StatusNasabahController($scope, $modal, alerts, StatusNasabahService, branchService) {
        var vm = this;
        //20190117, jeni, BEGIN
        vm.search = search;
        vm.searchParams = {};
        vm.statusnasabah = {};
        vm.searchParams.NoRekening = "";
        vm.searchParams.NoCIF = "";
        vm.searchParams.cabang = "";
        //20190117, jeni, END
        //vm.statusNasabahGetPage = StatusNasabahService.getpage;
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

        StatusNasabahService.getBranchUserLogin().then(function (value) {
            vm.statusnasabah.cabang = value.branchCodeT24;
            vm.statusnasabah.requester = value.userFullName;
            if (value.isKpno == 'no') {
                vm.selectedCabang = { branchCodeT24: value.branchCodeT24, branchName: value.branchName };
                vm.searchParams.cabang = value.branchCodeT24;
            }
            vm.isKpno = value.isKpno;

            vm.statusNasabahGetPage = StatusNasabahService.getpage;
        })
    }
})()