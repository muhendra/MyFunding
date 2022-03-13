(function() {
	'use strict';

	window.app.controller('PurchasereceiveController', PurchasereceiveController);

	PurchasereceiveController.$inject = ['$scope', '$modal', 'PurchasereceiveService', 'branchService', 'alerts'];
	function PurchasereceiveController($scope, $modal, PurchasereceiveService, branchService, alerts) {
	    var vm = this;
	    vm.search = search;
	    vm.search2 = search2;
	    vm.add = add;
	    vm.detail = detail;
	    vm.edit = edit;
		vm.message = alerts;
		vm.searchParams = {};
		vm.purchasereceive = {};
		vm.pelunasan = {};
		//vm.searchParams.tanggal = new Date();
		vm.searchParams.jenisTabungan = "TabunganSiPucukReward";
		vm.searchParams.cabang = "";
		vm.searchParams.no = "";
		vm.searchParams.nopr = "";
		vm.searchParams.noRekening = "";
		vm.searchParams.tanggal = null;
		vm.searchParams.tanggalpr = null;
		vm.purchasereceiveGetPage = PurchasereceiveService.getPage;
		vm.pelunasanGetPage = PurchasereceiveService.pelunasangetPage;
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

		    if (vm.searchParams.tanggal == "")
		        vm.searchParams.tanggal = null;
		    if (vm.selectedCabang == null)
		        vm.searchParams.cabang = "";

		    //PurchasereceiveService.getPage(vm.searchParams).then(function (value) {
		    //    vm.purchasereceiveGetPage = value.data;
		        vm.refreshData();
		    //})

		    if (vm.searchParams.jenisTabungan == 6501)
		        vm.searchParams.jenisTabungan = "TabunganSiPucuk"
		    if (vm.searchParams.jenisTabungan == 6502)
		        vm.searchParams.jenisTabungan = "TabunganSiPucukReward"
		    if (vm.searchParams.jenisTabungan == 6008)
		        vm.searchParams.jenisTabungan = "TabunganHadiahLangsung"
		}

		function search2() {
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

		    PurchasereceiveService.pelunasangetPage(vm.searchParams).then(function (value) {
		        vm.purchasereceiveGetPage = value.data;
		        vm.refreshData();
		    })

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
		        vm.purchasereceive.cabang = null;
		        vm.searchParams.cabang = "";
		        vm.pelunasan.cabang = "";
		    }
		    else
            {
		        vm.purchasereceive.cabang = vm.selectedCabang.branchCodeT24;
		        vm.pelunasan.cabang = vm.selectedCabang.branchCodeT24;
		        vm.searchParams.cabang = vm.selectedCabang.branchCodeT24;
		    }
		    //PurchasereceiveService.getPage(vm.searchParams).then(function (value) {
		    //    vm.enquirytabunganGetPage = value.data;
		    //    vm.refreshData();
		    //})
		}

		vm.tableActions = {
		    onAdd: add,
		    onAdd2: add2,
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
		        //windowClass: 'form-modal-window-1000',
		        template: '<add-purchasereceive data="data" />',
		        scope: angular.extend($scope.$new(true), { data: data })
		    });

		    modalInstance.result.then(function () {
		        vm.refreshData();
		        vm.search();
		    }, function () {
		        //$log.info('Modal dismissed at: ' + new Date());
		    });
		}

		function add2(data) {
		    if (data.paymentMethod == 'FPAfterReceive' && data.paymentRequestType == 'Pencadangan' && data.approveByPaymentRequest == null)
		    {
		        alert('Tidak Bisa Add Pelunasan Payment karena jurnal Pencadangan untuk Nomor Pencadangan : ' + data.paymentRequestId + ' belum di Approved')
		        return;
		    }

		    var modalInstance = $modal.open({
		        windowClass: 'form-modal-window-1000',
		        template: '<add-pelunasan data="data" />',
		        scope: angular.extend($scope.$new(true), { data: data })
		    });

		    modalInstance.result.then(function () {
		        vm.refreshData();
		        vm.search2();
		    }, function () {
		        //$log.info('Modal dismissed at: ' + new Date());
		    });
		}

		function edit(data) {
		    var modalInstance = $modal.open({
		        template: '<edit-purchasereceive data="data" />',
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
		        template: '<details-purchasereceive data="data" />',
		        scope: angular.extend($scope.$new(true), { data: data })
		    });
		}
	}
})();