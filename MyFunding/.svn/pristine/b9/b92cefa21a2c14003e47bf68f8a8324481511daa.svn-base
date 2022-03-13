(function() {
	'use strict';

	window.app.controller('RejectenquirytabunganController', RejectenquirytabunganController);

	RejectenquirytabunganController.$inject = ['$scope', '$modal', 'EnquirytabunganService', 'branchService', 'alerts'];
	function RejectenquirytabunganController($scope, $modal, EnquirytabunganService, branchService, alerts) {
	    var vm = this;
	    vm.search = search;
	    vm.add = add;
	    vm.reject = reject;
	    vm.deleted = deleted;
	    vm.detail = detail;
	    vm.edit = edit;
		vm.message = alerts;
		vm.searchParams = {};
		vm.enquirytabungan = {};
		vm.searchParams.tanggalDraft = null;
		vm.searchParams.jenisTabungan = "TabunganSiPucukReward";
		vm.searchParams.cabang = "";
		vm.searchParams.noRekening = "";
		vm.searchParams.noDraft = "";
		
		
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

		    //EnquirytabunganService.authorizegetPage(vm.searchParams).then(function (value) {
		    //    vm.authorizeenquirytabunganGetPage = value.data;
		        vm.refreshData();
		    //})

		    if (vm.searchParams.jenisTabungan == 6501)
		        vm.searchParams.jenisTabungan = "TabunganSiPucuk"
		    if (vm.searchParams.jenisTabungan == 6502)
		        vm.searchParams.jenisTabungan = "TabunganSiPucukReward"
		    if (vm.searchParams.jenisTabungan == 6008)
		        vm.searchParams.jenisTabungan = "TabunganHadiahLangsung"
		}

		EnquirytabunganService.getBranchUserLogin().then(function (value) {
		    vm.enquirytabungan.cabang = value.branchCodeT24;
		    if (value.isKpno == 'no') {
		        vm.selectedCabang = { branchCodeT24: value.branchCodeT24, branchName: value.branchName };
		        vm.searchParams.cabang = value.branchCodeT24;
		    }
		    vm.isKpno = value.isKpno;

		    vm.authorizeenquirytabunganGetPage = EnquirytabunganService.authorizegetPage;
		    vm.rejectenquirytabunganGetPage = EnquirytabunganService.rejectgetPage;
		})

		vm.onSelectCabang = function () {
		    //vm.cabang = vm.cabang.branchCodeT24;
		    if (vm.selectedCabang == null) {
		        vm.enquirytabungan.cabang = null;
		        vm.searchParams.cabang = "";
		    }
		    else {
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
		    onDetail: detail,
		    onDelete: deleted,
		    onApprove: approve,
		    onReject: reject,
            onEdit: edit,
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

		        EnquirytabunganService.reject(data)
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
		    if (confirm("Are you sure for authorize?")) {

		            vm.saving = true;
		          
		            EnquirytabunganService.approve(data)
                            .then(function (data) {
                                alert("Approve success");
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

		function deleted(data) {
		    if (confirm("Are you sure for delete?")) {

		        vm.saving = true;

		        EnquirytabunganService.deleted(data)
                        .then(function (data) {
                            alert("Delete success");
                            //Close the modal
                            //$scope.$close();
                            search();
                        })
                        .catch(function (response) {
                            if (response.data.errorMessage) {
                                vm.message.error("There was a problem delete data : <br/>" + response.data.errorMessage + "<br/>Please try again.");
                            } else {
                                vm.message.error("There was a problem delete data. Please try again.");
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
		        template: '<add-enquirytabungan data="data" />',
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
		        windowClass: 'form-modal-window-1000',
		        template: '<editreject-enquirytabungan data="data" />',
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
		        template: '<details-enquirytabungan data="data" />',
		        scope: angular.extend($scope.$new(true), { data: data })
		    });
		}
	}
})();