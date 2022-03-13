(function() {
	'use strict';

	window.app.controller('AuthorizepaymentrequestController', AuthorizepaymentrequestController);

	AuthorizepaymentrequestController.$inject = ['$scope', '$modal', 'PaymentrequestService', 'branchService', 'alerts'];
	function AuthorizepaymentrequestController($scope, $modal, PaymentrequestService, branchService, alerts) {
	    var vm = this;
	    vm.search = search;
		vm.add = add;
		vm.detail = detail;
		vm.edit = edit;
		vm.message = alerts;
		vm.searchParams = {};
		vm.paymentrequest = {};
		vm.searchParams.tanggal = null;
		vm.searchParams.jenisTabungan = "TabunganSiPucukReward";
		vm.searchParams.cabang = "";
		vm.searchParams.noRekening = "";
		vm.searchParams.no = "";
		vm.searchParams.nopo = "";
		vm.searchParams.tanggalpo = null;
		
		vm.authorizepaymentrequestGetPage = PaymentrequestService.authorizegetPage;
		//vm.jenisgetpage = EnquirytabunganService.jenisgetPage;
		vm.cabanggetpage = branchService.getPage;
		
		//vm.JenisTabungan = function () {
		//    EnquirytabunganService.authorizegetPage(vm.searchParams).then(function (value) {
		//            vm.enquirytabunganGetPage = value.data;
		//            vm.refreshData();
		//        })
		//}

		vm.onChangeJenisTabungan = function () {
		    if (vm.searchParams.jenisTabungan == "TabunganSiPucuk")
		        vm.searchParams.jenisTabungan = 6501
		    if (vm.searchParams.jenisTabungan == "TabunganSiPucukReward")
		        vm.searchParams.jenisTabungan = 6502
		    if (vm.searchParams.jenisTabungan == "TabunganHadiahLangsung")
		        vm.searchParams.jenisTabungan = 6008
		}

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
		    if (vm.searchParams.tanggalpo == "")
		        vm.searchParams.tanggalpo = null;

		    //PaymentrequestService.authorizegetPage(vm.searchParams).then(function (value) {
		    //    vm.authorizepaymentrequestGetPage = value.data;
		        vm.refreshData();
		    //})

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
		        vm.paymentrequest.cabang = null;
		        vm.searchParams.cabang = "";
		    }
		    else
            {
		        vm.paymentrequest.cabang = vm.selectedCabang.branchCodeT24;
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
		    onDelete: deleted,
		    onApprove: approve,
            onReject: reject,
		    onClick: function (value) {
		        //alert('Click : ' + value);
		    },
		    onDblClick: function (value) {
		        //alert('DblClick : ' + value);
		    }
		};
		function deleted(data) {
		    if (confirm("Are you sure for delete?")) {

		        vm.saving = true;

		        PaymentrequestService.deleted(data)
                        .then(function (data) {
                            alert("Deleted success");

                            //Close the modal
                            //$scope.$close();
                            vm.refreshData();
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

		function reject(data) {
		    if (confirm("Are you sure for reject?")) {

		        vm.saving = true;
		        PaymentrequestService.reject(data)
                        .then(function (data) {
                            alert("Rejected success");
                            //Close the modal
                            //$scope.$close();
                            vm.refreshData();
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

		function approve(data) 
		{
		    if (confirm("Are you sure for authorize?")) {

		            vm.saving = true;
		          
		            PaymentrequestService.approve(data)
                            .then(function (data) {
                                alert("Approved success");
                                //Close the modal
                                //$scope.$close();
                                vm.refreshData();
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
		        template: '<add-paymentrequest data="data" />',
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
		        template: '<edit-paymentrequest data="data" />',
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
		        windowClass: 'form-modal-window-1200',
		        template: '<details-paymentrequest data="data" />',
		        scope: angular.extend($scope.$new(true), { data: data })
		    });
		}
	}
})();