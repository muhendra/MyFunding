(function() {
	'use strict';

	window.app.controller('BreakAmortisasiRequestController', BreakAmortisasiRequestController);

	BreakAmortisasiRequestController.$inject = ['$scope', '$modal', 'BreakAmortisasiRequestService', 'branchService', 'alerts'];
	function BreakAmortisasiRequestController($scope, $modal, BreakAmortisasiRequestService, branchService, alerts) {
	    var vm = this;
	    //vm.search = search;
		vm.add = add;
		vm.message = alerts;
		vm.searchParams = {};
		vm.breakamortisasirequest = {};
		vm.breakamortisasirequestGetPage = BreakAmortisasiRequestService.getPage;

		vm.tableActions = {
            onEdit: edit,
		    onDetail: detail,
		    onDelete: deleteData
		};

		function add() {
		    var modalInstance = $modal.open({
		        windowClass: 'form-modal-window-1200',
		        backdrop: 'static',
		        template: '<add-breakamortisasirequest />'
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
		        template: '<edit-breakamortisasirequest data="data" />',
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
		        template: '<details-breakamortisasirequest data="data" />',
		        scope: angular.extend($scope.$new(true), { data: data })
		    });
		}

		function deleteData(data) {
		    var modalInstance = $modal.open({
		        windowClass: 'form-modal-window-1200',
		        template: '<delete-breakamortisasirequest data="data" />',
		        scope: angular.extend($scope.$new(true), { data: data })
		    });

		    modalInstance.result.then(function () {
		        vm.refreshData();
		    }, function () {
		        //$log.info('Modal dismissed at: ' + new Date());
		    });
		}


		vm.sendMail = function () {
		    BreakAmortisasiRequestService.sendMail().then(function (data) {
		        console.log(data);
		    });
		}
	}
})();