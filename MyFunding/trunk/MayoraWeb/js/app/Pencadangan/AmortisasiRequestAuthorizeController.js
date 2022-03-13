(function() {
	'use strict';

	window.app.controller('PencadanganAuthorizeController', PencadanganAuthorizeController);

	PencadanganAuthorizeController.$inject = ['$scope', '$modal', 'PencadanganService', 'branchService', 'alerts'];
	function PencadanganAuthorizeController($scope, $modal, PencadanganService, branchService, alerts) {
	    var vm = this;
	    //vm.search = search;
		
		vm.message = alerts;
		vm.searchParams = {};
		vm.pencadangan = {};
		vm.pencadanganGetPage = PencadanganService.authorizegetPage;

		vm.tableActions = {
		    onApprove: Approve,
		    onDetail: detail
		};


		function Approve(data) {
		    var modalInstance = $modal.open({
		        windowClass: 'form-modal-window-1200',
		        template: '<approve-pencadangan data="data" />',
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
		        template: '<details-pencadangan data="data" />',
		        scope: angular.extend($scope.$new(true), { data: data })
		    });
		}        	
	}
})();