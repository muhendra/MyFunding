(function() {
	'use strict';

	window.app.controller('PurchaseorderController', PurchaseorderController);

	PurchaseorderController.$inject = ['$scope', '$modal', 'PurchaseorderService', 'branchService', 'alerts'];
	function PurchaseorderController($scope, $modal, PurchaseorderService, branchService, alerts) {
	    var vm = this;
	    vm.search = search;
		vm.add = add;
		vm.detail = detail;
		vm.edit = edit;
		vm.message = alerts;
		vm.purchaseorderGetPage = [];
		vm.searchParams = {};
		vm.purchaseorder = {};
		//vm.searchParams.tanggal = new Date();
		vm.searchParams.jenisTabungan = "TabunganSiPucukReward";
		vm.searchParams.cabang = "";
		vm.searchParams.nomor = "";
		vm.searchParams.noRekening = "";
		//vm.purchaseorderGetPage = PurchaseorderService.getPage;
	    //vm.jenisgetpage = PurchaserequestService.jenisgetPage;
		vm.cabanggetpage = branchService.getPage;
		
		//vm.JenisTabungan = function () {
		//    PurchaserequestService.getPage(vm.searchParams).then(function (value) {
		//            vm.purchaserequestGetPage = value.data;
		//            vm.refreshData();
		//        })
		//}
        function search() {
		    if (vm.searchParams.jenisTabungan == "TabunganSiPucuk")
		        vm.searchParams.jenisTabungan = 6501
		    if (vm.searchParams.jenisTabungan == "TabunganSiPucukReward")
		        vm.searchParams.jenisTabungan = 6502
		    if (vm.searchParams.jenisTabungan == "TabunganHadiahLangsung")
		        vm.searchParams.jenisTabungan = 6008

		    if (vm.selectedCabang == null)
		        vm.searchParams.cabang = "";

		    PurchaseorderService.getPage(vm.searchParams).then(function (value) {
		        vm.purchaseorderGetPage = value.data;
		        vm.refreshData();
		    })

		    if (vm.searchParams.jenisTabungan == 6501)
		        vm.searchParams.jenisTabungan = "TabunganSiPucuk"
		    if (vm.searchParams.jenisTabungan == 6502)
		        vm.searchParams.jenisTabungan = "TabunganSiPucukReward"
		    if (vm.searchParams.jenisTabungan == 6008)
		        vm.searchParams.jenisTabungan = "TabunganHadiahLangsung"
		}

        PurchaseorderService.getBranchUserLogin().then(function (value) {
            vm.purchaseorder.cabang = value.branchCodeT24;
            vm.purchaseorder.requester = value.userFullName;
            if (value.isKpno == 'no') {
                vm.selectedCabang = { branchCodeT24: value.branchCodeT24, branchName: value.branchName };
                vm.searchParams.cabang = value.branchCodeT24;
            }
            vm.isKpno = value.isKpno;

            vm.purchaseorderGetPage = PurchaseorderService.getPage;
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
		        vm.purchaseorder.cabang = null;
		    else
		        vm.purchaseorder.cabang = vm.selectedCabang.branchCodeT24;

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
		        template: '<add-purchaseorder data="data" />',
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
		        template: '<edit-purchaseorder data="data" />',
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
		        template: '<details-purchaseorder data="data" />',
		        scope: angular.extend($scope.$new(true), { data: data })
		    });
		}

	    //20190129, jeni, BEGIN
		function rejectbacktopr(data) {
		    var modalInstance = $modal.open({
		        windowClass: 'form-modal-window-600',
		        template: '<rejectreasonbacktopr-purchaseorder data="data" />',
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