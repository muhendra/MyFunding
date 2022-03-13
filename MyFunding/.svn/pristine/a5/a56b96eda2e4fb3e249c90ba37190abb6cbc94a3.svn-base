(function() {
	'use strict';

	window.app.controller('EnquirytabunganController', EnquirytabunganController);

	EnquirytabunganController.$inject = ['$scope','$modal', 'EnquirytabunganService','branchService','alerts'];
	function EnquirytabunganController($scope, $modal, EnquirytabunganService, branchService, alerts) {
	    var vm = this;
	    vm.search = search;
		vm.add = add;
		vm.detail = detail;
		vm.edit = edit;
		vm.message = alerts;
		vm.searchParams = {};
		vm.enquirytabungan = {};
		vm.searchParams.tanggal = null;
		vm.searchParams.jenisTabungan = "TabunganSiPucukReward";
		vm.searchParams.cabang = "";
		vm.isKpno = "yes";

		vm.cabanggetpage = branchService.getPage;

		EnquirytabunganService.getBranchUserLogin().then(function (value) {
		    vm.enquirytabungan.cabang = value.branchCodeT24;
		    vm.enquirytabungan.requester = value.userFullName;
		    if (value.isKpno == 'no') {
		        vm.selectedCabang = { branchCodeT24: value.branchCodeT24, branchName: value.branchName };
		        vm.searchParams.cabang = value.branchCodeT24;
		    }
		    vm.isKpno = value.isKpno;
		    
		    vm.enquirytabunganGetPage = EnquirytabunganService.getPage;
		})
		
		
		//vm.jenisgetpage = EnquirytabunganService.jenisgetPage;
		
		
		//vm.JenisTabungan = function () {
		//    EnquirytabunganService.getPage(vm.searchParams).then(function (value) {
		//            vm.enquirytabunganGetPage = value.data;
		//            vm.refreshData();
		//        })
		//}

		
		//vm.onChangeJenisTabungan = function () {
		//    if (vm.searchParams.jenisTabungan == "TabunganSiPucuk")
		//        vm.searchParams.jenisTabungan = 6501
		//    if (vm.searchParams.jenisTabungan == "TabunganSiPucukReward")
		//        vm.searchParams.jenisTabungan = 6502
		//    if (vm.searchParams.jenisTabungan == "TabunganHadiahLangsung")
		//        vm.searchParams.jenisTabungan = 6008

		//    EnquirytabunganService.getPage(vm.searchParams).then(function (value) {
		//            vm.enquirytabunganGetPage = value.data;
		//            vm.refreshData();
		//    })

		//    if (vm.searchParams.jenisTabungan == 6501)
		//        vm.searchParams.jenisTabungan = "TabunganSiPucuk"
		//    if (vm.searchParams.jenisTabungan == 6502)
		//        vm.searchParams.jenisTabungan = "TabunganSiPucukReward"
		//    if (vm.searchParams.jenisTabungan == 6008)
		//        vm.searchParams.jenisTabungan = "TabunganHadiahLangsung"
		//}

		//vm.onChangeTanggal = function () {
		//    EnquirytabunganService.getPage(vm.searchParams).then(function (value) {
		//        vm.enquirytabunganGetPage = value.data;
		//        vm.refreshData();
		//    })
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

		    vm.refreshData();

		    if (vm.searchParams.jenisTabungan == 6501)
		        vm.searchParams.jenisTabungan = "TabunganSiPucuk"
		    if (vm.searchParams.jenisTabungan == 6502)
		        vm.searchParams.jenisTabungan = "TabunganSiPucukReward"
		    if (vm.searchParams.jenisTabungan == 6008)
		        vm.searchParams.jenisTabungan = "TabunganHadiahLangsung"
		}

		vm.onSelectCabang = function () {
		    //vm.cabang = vm.cabang.branchCodeT24;
		    if (vm.selectedCabang == null)
            {
		        vm.enquirytabungan.cabang = null;
		        vm.searchParams.cabang
		    }
		    else
            {
		        vm.enquirytabungan.cabang = vm.selectedCabang.branchCodeT24;
		        vm.searchParams.cabang = vm.selectedCabang.branchCodeT24;
		    }
		    //EnquirytabunganService.getPage(vm.searchParams).then(function (value) {
		    //    vm.enquirytabunganGetPage = value.data;
		    //    vm.refreshData();
		    //})
		}

		vm.tableActions = {
		    onAdd: add,
		    onEdit: edit,
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
		        template: '<add-enquirytabungan data="data", userFullName="userFullName" />',
		        scope: angular.extend($scope.$new(true), { data: data, userFullName: vm.enquirytabungan.requester })
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
		        windowClass: 'form-modal-window-1000',
		        template: '<edit-enquirytabungan data="data" />',
		        scope: angular.extend($scope.$new(true), { data: data })
		    });

		    modalInstance.result.then(function () {
		        vm.refreshData();
		    }, function () {
		        //$log.info('Modal dismissed at: ' + new Date());
		    });
		}

		function detail(data) {
		    var modalInstance = $modal.open({
		        template: '<details-enquirytabungan data="data" />',
		        scope: angular.extend($scope.$new(true), { data: data })
		    });

		    modalInstance.result.then(function () {
		        vm.refreshData();
		    }, function () {
		        //$log.info('Modal dismissed at: ' + new Date());
		    });
		}
	}
})();