(function() {
	'use strict';

	window.app.controller('CashbackController', CashbackController);

	CashbackController.$inject = ['$scope', '$modal', 'CashbackService', 'branchService', 'alerts'];
	function CashbackController($scope, $modal, CashbackService, branchService, alerts) {
	    var vm = this;
	    vm.search = search;
		vm.add = add;
		vm.detail = detail;
		vm.edit = edit;
		vm.message = alerts;
		vm.cashbackGetPage = [];
		vm.searchParams = {};
		vm.cashback = {};
		//vm.searchParams.tanggal = new Date();
		vm.searchParams.jenisTabungan = "TabunganHadiahLangsung";
		vm.searchParams.cabang = "";
		vm.searchParams.nomor = "";
		vm.searchParams.noRekening = "";
		//vm.cashbackGetPage = CashbackService.getPage;
	    //vm.jenisgetpage = PurchaserequestService.jenisgetPage;
		vm.cabanggetpage = branchService.getPage;
		
		//vm.JenisTabungan = function () {
		//    PurchaserequestService.getPage(vm.searchParams).then(function (value) {
		//            vm.purchaserequestGetPage = value.data;
		//            vm.refreshData();
		//        })
	    //}

		vm.GetJurnalCashback = CashbackService.GetJurnalCashback;

        function search() {
		    if (vm.searchParams.jenisTabungan == "TabunganSiPucuk")
		        vm.searchParams.jenisTabungan = 6501
		    if (vm.searchParams.jenisTabungan == "TabunganSiPucukReward")
		        vm.searchParams.jenisTabungan = 6502
		    if (vm.searchParams.jenisTabungan == "TabunganHadiahLangsung")
		        vm.searchParams.jenisTabungan = 6008

		    if (vm.selectedCabang == null)
		        vm.searchParams.cabang = "";

		    CashbackService.getPage(vm.searchParams).then(function (value) {
		        vm.cashback = value.data;
		        vm.refreshData();
		    })

		    if (vm.searchParams.jenisTabungan == 6501)
		        vm.searchParams.jenisTabungan = "TabunganSiPucuk"
		    if (vm.searchParams.jenisTabungan == 6502)
		        vm.searchParams.jenisTabungan = "TabunganSiPucukReward"
		    if (vm.searchParams.jenisTabungan == 6008)
		        vm.searchParams.jenisTabungan = "TabunganHadiahLangsung"
		}

        CashbackService.getBranchUserLogin().then(function (value) {
            vm.cashback.cabang = value.branchCodeT24;
            vm.cashback.requester = value.userFullName;
            if (value.isKpno == 'no') {
                vm.selectedCabang = { branchCodeT24: value.branchCodeT24, branchName: value.branchName };
                vm.searchParams.cabang = value.branchCodeT24;
            }
            vm.isKpno = value.isKpno;

            vm.cashbackGetPage = CashbackService.getPage;
        })

		//vm.onChangeTanggal = function () {
		//    PurchaserequestService.getPage(vm.searchParams).then(function (value) {
		//        vm.purchaserequestGetPage = value.data;
		//        vm.refreshData();
		//    })
		//}

		vm.onSelectCabang = function () {
		    //vm.cabang = vm.cabang.branchCodeT24;
		    if (vm.selectedCabang == null)
		        vm.cashback.cabang = null;
		    else
		        vm.cashback.cabang = vm.selectedCabang.branchCodeT24;
		    vm.searchParams.cabang = vm.selectedCabang.branchCodeT24;

		}

		vm.tableActions = {
		    onAdd: add,
		    //20190129, jeni, BEGIN
		    onRejecttoPr: rejectbacktopr,
		    //20190129, jeni, END
		    onDetail: detail,
		    onDelete: function (value) {
		        alert('Delete : ' + value);
		    },
		    onClick: function (value) {
		        //alert('Click : ' + value);
		    },
		    onDblClick: function (value) {
		        //alert('DblClick : ' + value);
		    }
		};

		function add(data) {
		    var modalInstance = $modal.open({
		        windowClass: 'form-modal-window-1200',
		        template: '<add-cashbacka data="data" />',
		        scope: angular.extend($scope.$new(true), { data: data })
		    });

		    modalInstance.result.then(function () {
		        vm.refreshData();
		        vm.search();
		    }, function () {
		        //$log.info('Modal dismissed at: ' + new Date());
		    });
		}

		function edit(data) {
		    var modalInstance = $modal.open({
		        template: '<edit-cashback data="data" />',
		        scope: angular.extend($scope.$new(true), { data: data })
		    });

		    modalInstance.result.then(function () {
		        vm.refreshData();
		    }, function () {
		        //$log.info('Modal dismissed at: ' + new Date());
		    });
		}

		function detail(data) {
		    $modal.open({
		        template: '<details-cashback data="data" />',
		        scope: angular.extend($scope.$new(true), { data: data })
		    });
		}

	    //20190129, jeni, BEGIN
		function rejectbacktopr(data) {
		    var modalInstance = $modal.open({
		        windowClass: 'form-modal-window-600',
		        template: '<rejectreasonbacktopr-cashback data="data" />',
		        scope: angular.extend($scope.$new(true), { data: data })
		    });
		    modalInstance.result.then(function () {
		        vm.search();
		    }, function () {
		    });
		}
	    //20190129, jeni, END
	}
})();