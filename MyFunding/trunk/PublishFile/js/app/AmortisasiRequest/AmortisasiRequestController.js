(function() {
	'use strict';

	window.app.controller('AmortisasiRequestController', AmortisasiRequestController);

	AmortisasiRequestController.$inject = ['$scope', '$modal', 'AmortisasiRequestService', 'branchService', 'alerts'];
	function AmortisasiRequestController($scope, $modal, AmortisasiRequestService, branchService, alerts) {
	    var vm = this;
	    //vm.search = search;
		vm.add = add;
		vm.message = alerts;
		vm.searchParams = {};
		vm.amortisasirequest = {};
		vm.amortisasirequestGetPage = AmortisasiRequestService.getPage;

		vm.tableActions = {
            onEdit: edit,
		    onDetail: detail,
		    onDelete: deleteData
		};

		function add() {
		    var modalInstance = $modal.open({
		        windowClass: 'form-modal-window-1200',
		        backdrop: 'static',
		        template: '<add-amortisasirequest />'
		    });

		    modalInstance.result.then(function () {
		        vm.refreshData();
		    }, function () {
		        //$log.info('Modal dismissed at: ' + new Date());
		    });
		}

		function edit(data) {
		    var modalInstance = $modal.open({
		        windowClass: 'form-modal-window-1200',
		        template: '<edit-amortisasirequest data="data" />',
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
		        template: '<details-amortisasirequest data="data" />',
		        scope: angular.extend($scope.$new(true), { data: data })
		    });
		}

		function deleteData(data) {
		    var modalInstance = $modal.open({
		        windowClass: 'form-modal-window-1200',
		        template: '<delete-amortisasirequest data="data" />',
		        scope: angular.extend($scope.$new(true), { data: data })
		    });

		    modalInstance.result.then(function () {
		        vm.refreshData();
		    }, function () {
		        //$log.info('Modal dismissed at: ' + new Date());
		    });
		}


		vm.sendMail = function () {
		    AmortisasiRequestService.sendMail().then(function (data) {
		        console.log(data);
		    });
		}
	}
})();