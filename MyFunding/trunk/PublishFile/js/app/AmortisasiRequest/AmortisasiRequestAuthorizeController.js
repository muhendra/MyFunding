(function() {
	'use strict';

	window.app.controller('AmortisasiRequestAuthorizeController', AmortisasiRequestAuthorizeController);

	AmortisasiRequestAuthorizeController.$inject = ['$scope', '$modal', 'AmortisasiRequestService', 'branchService', 'alerts'];
	function AmortisasiRequestAuthorizeController($scope, $modal, AmortisasiRequestService, branchService, alerts) {
	    var vm = this;
	    //vm.search = search;
		
		vm.message = alerts;
		vm.searchParams = {};
		vm.amortisasirequest = {};
		vm.amortisasirequestGetPage = AmortisasiRequestService.authorizegetPage;

		vm.tableActions = {
		    onApprove: Approve,
		    onDetail: detail
		};


		function Approve(data) {
		    var modalInstance = $modal.open({
		        windowClass: 'form-modal-window-1200',
		        template: '<approve-amortisasirequest data="data" />',
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
	}
})();