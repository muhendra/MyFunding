(function() {
	'use strict';

	window.app.controller('AuthorizedeliveryorderController', AuthorizedeliveryorderController);

	AuthorizedeliveryorderController.$inject = ['$scope', '$modal', 'PurchasereceiveService', 'branchService', 'alerts'];
	function AuthorizedeliveryorderController($scope, $modal, PurchasereceiveService, branchService, alerts) {
	    var vm = this;
	    vm.search = search;
		vm.add = add;
		vm.detail = detail;
		vm.edit = edit;
		vm.message = alerts;
		vm.purchasereceiveGetPage = [];
		vm.authorizepurchasereceiveGetPage = [];
		vm.searchParams = {};
		vm.purchasereceive = {};
		vm.searchParams.tanggal = null;
		vm.searchParams.cabang = "";
		vm.searchParams.noPo = "";
		vm.searchParams.no = "";
		
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

		    PurchasereceiveService.authorizegetPage(vm.searchParams).then(function (value) {
		        vm.authorizepurchasereceiveGetPage = value.data;
		        vm.refreshData();
		    })

		}

		vm.onSelectCabang = function () {
		    //vm.cabang = vm.cabang.branchCodeT24;
		    if (vm.selectedCabang == null)
		        vm.purchasereceive.cabang = null;
		    else
		        vm.purchasereceive.cabang = vm.selectedCabang.branchCodeT24;

		    vm.searchParams.cabang = vm.selectedCabang.branchCodeT24;
		    
		    //EnquirytabunganService.getPage(vm.searchParams).then(function (value) {
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
		    onApprove : approve,
		    onClick: function (value) {
		        //alert('Click : ' + value);
		    },
		    onDblClick: function (value) {
		        //alert('DblClick : ' + value);
		    }
		};
         
		function approve(data) 
		{
		    if (confirm("Are you sure for authorize?")) {

		            vm.saving = true;
		          
		            PurchasereceiveService.approve(data)
                            .then(function (data) {
                                alert("Save success");
                                //Close the modal
                                //$scope.$close();
                                search();
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
		        template: '<details-purchasereceive data="data" />',
		        scope: angular.extend($scope.$new(true), { data: data })
		    });
		}
	}
})();