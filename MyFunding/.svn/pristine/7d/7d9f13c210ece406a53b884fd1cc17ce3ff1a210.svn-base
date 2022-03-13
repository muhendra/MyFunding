(function() {
	'use strict';

	window.app.controller('AuthorizepurchasereceiveController', AuthorizepurchasereceiveController);

	AuthorizepurchasereceiveController.$inject = ['$scope', '$modal', 'PurchasereceiveService', 'branchService', 'alerts'];
	function AuthorizepurchasereceiveController($scope, $modal, PurchasereceiveService, branchService, alerts) {
	    var vm = this;
	    vm.search = search;
		vm.add = add;
		vm.detail = detail;
		vm.edit = edit;
		vm.message = alerts;
		vm.searchParams = {};
		vm.purchasereceive = {};
		vm.searchParams.tanggal = null;
		vm.searchParams.cabang = "";
		vm.searchParams.nopo = "";
		vm.searchParams.no = "";
		vm.searchParams.tanggalpo = null;

		vm.authorizepurchasereceiveGetPage = PurchasereceiveService.authorizegetPage;
		//vm.jenisgetpage = EnquirytabunganService.jenisgetPage;
		vm.cabanggetpage = branchService.getPage;
		
		//vm.JenisTabungan = function () {
		//    EnquirytabunganService.authorizegetPage(vm.searchParams).then(function (value) {
		//            vm.enquirytabunganGetPage = value.data;
		//            vm.refreshData();
		//        })
		//}

		//vm.onChangeTanggal = function () {
		//    EnquirytabunganService.getPage(vm.searchParams).then(function (value) {
		//        vm.enquirytabunganGetPage = value.data;
		//        vm.refreshData();
		//    })
	    //}

		function search() {

		    if (vm.searchParams.tanggal == "")
		        vm.searchParams.tanggal = null;
		    if (vm.searchParams.tanggalpo == "")
		        vm.searchParams.tanggalpo = null;
		    if (vm.selectedCabang == null)
		        vm.searchParams.cabang = "";

		    //PurchasereceiveService.authorizegetPage(vm.searchParams).then(function (value) {
		    //    vm.authorizepurchasereceiveGetPage = value.data;
		        vm.refreshData();
		    //})
		}

		vm.onSelectCabang = function () {
		    //vm.cabang = vm.cabang.branchCodeT24;
		    if (vm.selectedCabang == null)
            {
		        vm.purchasereceive.cabang = null;
		        vm.searchParams.cabang = "";
		    }
		    else
            {
		        vm.purchasereceive.cabang = vm.selectedCabang.branchCodeT24;
		        vm.searchParams.cabang = vm.selectedCabang.branchCodeT24;
		    }
		    //EnquirytabunganService.getPage(vm.searchParams).then(function (value) {
		    //    vm.enquirytabunganGetPage = value.data;
		    //    vm.refreshData();
		    //})
		}

		vm.tableActions = {
		    onAdd: add,
		    onDetail: detail,
		    onReject: reject,
		    onDelete: function (value) {
		        alert('Delete : ' + value);
		    },
		    onApprove : approve,
		    onClick: function (value) {
		        //alert('Click : ' + value);
		    },
		    onDblClick: function (value) {
		        //alert('DblClick : ' + value);
		    }
		};
         
		function reject(data) {
		    if (confirm("Are you sure for reject?")) {

		        vm.saving = true;

		        PurchasereceiveService.reject(data)
                        .then(function (data) {
                            alert("Reject success");
                            //Close the modal
                            //$scope.$close();
                            search();
                        })
                        .catch(function (response) {
                            if (response.data.errorMessage) {
                                vm.message.error("There was a problem reject data : <br/>" + response.data.errorMessage + "<br/>Please try again.");
                            } else {
                                vm.message.error("There was a problem reject data. Please try again.");
                            }
                        })
                        .finally(function () {
                            vm.saving = false;
                        });

		    } else {
		        return false;
		    }
		}

		function approve(data) 
		{
		    if (confirm("Are you sure for authorize?"))
		    {
		        vm.saving = true;
		          
		        PurchasereceiveService.approve(data)
                        .then(function (data) {
                            alert("Approved success");
                            //Close the modal
                            //$scope.$close();
                            vm.search();
                        })
                        .catch(function (response) {
                            if (response.data.errorMessage) {
                                vm.message.error("There was a problem saving data : <br/>" + response.data.errorMessage + "<br/>Please try again.");
                            } else {
                                vm.message.error("There was a problem saving data. Please try again.");
                            }
                        })
                        .finally(function () {
                            vm.saving = false;
                        });
		    } else {
		        return false;
		    }
		}

		function add(data) {
		    var modalInstance = $modal.open({
		        windowClass: 'form-modal-window-1000',
		        template: '<add-purchasereceive data="data" />',
		        scope: angular.extend($scope.$new(true), { data: data })
		    });

		    modalInstance.result.then(function () {
		        vm.refreshData();
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
		        windowClass: 'form-modal-window-1000',
		        template: '<details-purchasereceive data="data" />',
		        scope: angular.extend($scope.$new(true), { data: data })
		    });
		}
	}
})();