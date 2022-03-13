(function() {
	'use strict';

	window.app.controller('PurchaserequestController', PurchaserequestController);

	PurchaserequestController.$inject = ['$scope', '$modal', 'PurchaserequestService', 'branchService', 'alerts'];
	function PurchaserequestController($scope, $modal, PurchaserequestService, branchService, alerts) {
	    var vm = this;
	    vm.search = search;
		vm.add = add;
		vm.detail = detail;
		vm.edit = edit;
		vm.message = alerts;
		vm.searchParams = {};
		vm.enquirytabungan = {};
		//vm.searchParams.tanggal = new Date();
		vm.searchParams.jenisTabungan = "TabunganSiPucukReward";
		vm.searchParams.cabang = "";
		vm.searchParams.noDraft = "";
		vm.searchParams.noRekening = "";
		vm.purchaserequestGetPage = PurchaserequestService.getPage;
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

		    //PurchaserequestService.getPage(vm.searchParams).then(function (value) {
		    //    vm.purchaserequestGetPage = value.data;
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
		        vm.enquirytabungan.cabang = null;
		    else
		        vm.enquirytabungan.cabang = vm.selectedCabang.branchCodeT24;

		    vm.searchParams.cabang = vm.selectedCabang.branchCodeT24;
		    
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
		    //20190115, jeni, BEGIN
		    onRejecttoDpr: rejecttodpr,
		    //20190115, jeni, END
		    onClick: function (value) {
		        //alert('Click : ' + value);
		    },
		    onDblClick: function (value) {
		        //alert('DblClick : ' + value);
		    }
		};

	    //20190115, jeni, BEGIN
		function rejecttodpr(data) {
		    var modalInstance = $modal.open({
		        windowClass: 'form-modal-window-600',
		        template: '<rejectreasonbacktodpr-purchaserequest data="data" />',
		        scope: angular.extend($scope.$new(true), { data: data })
		    });
		    modalInstance.result.then(function () {
		        vm.search();
		    }, function () {
		    });
		}
	    //20190115, jeni, END

		function add(data) {
		    var modalInstance = $modal.open({
		        windowClass: 'form-modal-window-1000',
		        template: '<add-purchaserequest data="data" />',
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
		        template: '<edit-purchaserequest data="data" />',
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
		        template: '<details-purchaserequest data="data" />',
		        scope: angular.extend($scope.$new(true), { data: data })
		    });
		}
	}
})();