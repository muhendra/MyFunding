(function() {
	'use strict';

	window.app.controller('AuthorizepurchaseorderController', AuthorizepurchaseorderController);

	AuthorizepurchaseorderController.$inject = ['$scope', '$modal', 'PurchaseorderService', 'branchService', 'alerts', '$window'];
	function AuthorizepurchaseorderController($scope, $modal, PurchaseorderService, branchService, alerts, $window) {
	    var vm = this;
	    vm.search = search;
		vm.add = add;
		vm.detail = detail;
		vm.edit = edit;
		vm.message = alerts;
		vm.purchaseorderGetPage = [];
		vm.authorizepurchaseorderGetPage = [];
		vm.searchParams = {};
		vm.purchaseorder = {};
		vm.searchParams.tanggal = null;
		vm.searchParams.jenisTabungan = "TabunganSiPucukReward";
		vm.searchParams.cabang = "";
		vm.searchParams.noRekening = "";
		vm.searchParams.no = "";
		
		//vm.authorizepurchaseorderGetPage = PurchaseorderService.authorizegetPage;
		//vm.jenisgetpage = EnquirytabunganService.jenisgetPage;
		vm.cabanggetpage = branchService.getPage;
		
		//vm.JenisTabungan = function () {
		//    EnquirytabunganService.authorizegetPage(vm.searchParams).then(function (value) {
		//            vm.enquirytabunganGetPage = value.data;
		//            vm.refreshData();
		//        })
		//}
		PurchaseorderService.getBranchUserLogin().then(function (value) {
		    vm.purchaseorder.cabang = value.branchCodeT24;
		    if (value.isKpno == 'no') {
		        vm.selectedCabang = { branchCodeT24: value.branchCodeT24, branchName: value.branchName };
		        vm.searchParams.cabang = value.branchCodeT24;
		    }
		    vm.isKpno = value.isKpno;

		    vm.authorizepurchaseorderGetPage = PurchaseorderService.authorizegetPage;
		    //vm.rejectpurchaseorderGetPage = PurchaseorderService.historyGetPage;
		})

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

		    PurchaseorderService.authorizegetPage(vm.searchParams).then(function (value) {
		        vm.authorizepurchaseorderGetPage = value.data;
		        vm.refreshData();
		    })

		    if (vm.searchParams.jenisTabungan == 6501)
		        vm.searchParams.jenisTabungan = "TabunganSiPucuk"
		    if (vm.searchParams.jenisTabungan == 6502)
		        vm.searchParams.jenisTabungan = "TabunganSiPucukReward"
		    if (vm.searchParams.jenisTabungan == 6008)
		        vm.searchParams.jenisTabungan = "TabunganHadiahLangsung"
		}

		vm.onSelectCabang = function () {
		    //vm.cabang = vm.cabang.branchCodeT24;
		    if (vm.selectedCabang == null) {
		        vm.purchaseorder.cabang = null;
		        vm.searchParams.cabang = "";
		    }
		    else {
		        vm.purchaseorder.cabang = vm.selectedCabang.branchCodeT24;
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
		    onReport: function (data) {
		        //20190206, jeni, BEGIN
		        //var params = { id: data.id, poNo: data.poId }
		        //20190206, jeni, END
		        var params = { id: data.id, poNo: data.poGroupId }
		        var url = MyApplication.rootPath + "Purchaseorder/ViewReport/";
		        if (params !== undefined && params !== null) {
		            url += "?";
		            for (var key in params) {
		                if (params[key] !== undefined) {
		                    if (params[key] instanceof Date) {
		                        url += key + '=' + params[key].toISOString() + '&';
		                    } else {
		                        url += key + '=' + params[key] + '&';
		                    }
		                }
		            }
		        }
		        var widht = 900;
		        var height = 600;
		        var left = screen.width / 2 - (widht / 2), top = 1//screen.height / 2 - (height / 4)
		        $window.open(url, '', "top=" + top + ",left=" + left + ",width=" + widht + ",height=" + height)
		    },
		    onReject : reject,
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
		          
		            PurchaseorderService.approve(data)
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
		        template: '<add-purchaseorder data="data" />',
		        scope: angular.extend($scope.$new(true), { data: data })
		    });

		    modalInstance.result.then(function () {
		        vm.refreshData();
		    }, function () {
		        //$log.info('Modal dismissed at: ' + new Date());
		    });
		}

		function deleted(data) {
		    if (confirm("Are you sure for delete?")) {

		        vm.saving = true;

		        PurchaseorderService.deleted(data)
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

		function reject(data) {
		    if (confirm("Are you sure for reject?")) {

		        vm.saving = true;

		        PurchaseorderService.reject(data)
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
		        windowClass: 'form-modal-window-1200',
		        template: '<history-purchaseorder data="data" />',
		        scope: angular.extend($scope.$new(true), { data: data })
		    });
		}
	}
})();