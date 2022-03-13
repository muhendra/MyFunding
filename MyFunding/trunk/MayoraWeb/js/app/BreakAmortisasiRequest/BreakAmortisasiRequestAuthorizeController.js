(function() {
	'use strict';

	window.app.controller('BreakAmortisasiRequestAuthorizeController', BreakAmortisasiRequestAuthorizeController);

	BreakAmortisasiRequestAuthorizeController.$inject = ['$scope', '$modal', 'BreakAmortisasiRequestService', 'branchService', 'alerts'];
	function BreakAmortisasiRequestAuthorizeController($scope, $modal, BreakAmortisasiRequestService, branchService, alerts) {
	    var vm = this;
	    //vm.search = search;
		
		vm.message = alerts;
		vm.searchParams = {};
		vm.breakamortisasirequest = {};
		vm.breakamortisasirequestGetPage = BreakAmortisasiRequestService.authorizegetPage;

		vm.tableActions = {
		    onApprove: Approve,
		    onDetail: detail
		};


		function Approve(data) {
		    var modalInstance = $modal.open({
		        windowClass: 'form-modal-window-1200',
		        template: '<approve-breakamortisasirequest data="data" />',
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
	}
})();