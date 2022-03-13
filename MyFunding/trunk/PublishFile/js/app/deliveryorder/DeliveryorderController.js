(function() {
	'use strict';

	window.app.controller('DeliveryorderController', DeliveryorderController);

	DeliveryorderController.$inject = ['$scope', '$modal', 'DeliveryorderService', 'branchService', 'alerts'];
	function DeliveryorderController($scope, $modal, DeliveryorderService, branchService, alerts) {
	    var vm = this;
	    vm.search = search;
	    vm.add = add;
	    vm.detail = detail;
	    vm.edit = edit;
		vm.message = alerts;
		vm.searchParams = {};
		vm.deliveryorder = {};
		//vm.searchParams.tanggal = new Date();
		vm.searchParams.jenisTabungan = "TabunganSiPucukReward";
		vm.searchParams.cabang = "";
		vm.searchParams.no = "";
		vm.searchParams.nopr = "";
		vm.searchParams.noRekening = "";
		vm.searchParams.tanggal = null;
		vm.searchParams.tanggalpr = null;
		vm.deliveryorderGetPage = DeliveryorderService.getPage;
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
		    if (vm.searchParams.tanggal == "")
		        vm.searchParams.tanggal = null;
		    if (vm.searchParams.tanggalpr == "")
		        vm.searchParams.tanggalpr = null;

		    //DeliveryorderService.getPage(vm.searchParams).then(function (value) {
		    //    vm.deliveryorderGetPage = value.data;
		        vm.refreshData();
		    //})

		    if (vm.searchParams.jenisTabungan == 6501)
		        vm.searchParams.jenisTabungan = "TabunganSiPucuk"
		    if (vm.searchParams.jenisTabungan == 6502)
		        vm.searchParams.jenisTabungan = "TabunganSiPucukReward"
		    if (vm.searchParams.jenisTabungan == 6008)
		        vm.searchParams.jenisTabungan = "TabunganHadiahLangsung"
		}

		//vm.onChangeTanggal = function () {
		//    PurchaserequestService.getPage(vm.searchParams).then(function (value) {
		//        vm.purchaserequestGetPage = value.data;
		//        vm.refreshData();
		//    })
		//}

		vm.onSelectCabang = function () {
		    //vm.cabang = vm.cabang.branchCodeT24;
		    if (vm.selectedCabang == null)
            {
		        vm.deliveryorder.cabang = null;
		        vm.searchParams.cabang = "";
		    }
		    else
            {
		        vm.deliveryorder.cabang = vm.selectedCabang.branchCodeT24;
		        vm.searchParams.cabang = vm.selectedCabang.branchCodeT24;
		    }
		    //PurchaserequestService.getPage(vm.searchParams).then(function (value) {
		    //    vm.enquirytabunganGetPage = value.data;
		    //    vm.refreshData();
		    //})
		}

		vm.tableActions = {
		    onAdd: add,
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
		        windowClass: 'form-modal-window-1000',
		        template: '<add-deliveryorder data="data" />',
		        scope: angular.extend($scope.$new(true), { data: data })
		    });

		    modalInstance.result.then(function () {
		        vm.refreshData();
		        vm.search();
		    }, function () {
		        //$log.info('Modal dismissed at: ' + new Date());
		        //vm.refreshData();
		        //vm.search();
		    });
		}
		
		function edit(data) {
		    var modalInstance = $modal.open({
		        template: '<edit-deliveryorder data="data" />',
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
		        windowClass: 'form-modal-window-800',
		        template: '<details-deliveryorder data="data" />',
		        scope: angular.extend($scope.$new(true), { data: data })
		    });
		}
	}
})();