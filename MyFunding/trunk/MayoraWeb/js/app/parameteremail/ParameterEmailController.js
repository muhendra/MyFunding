(function() {
	'use strict';

	window.app.controller('ParameterEmailController', ParameterEmailController);

	ParameterEmailController.$inject = ['$scope', '$modal', 'ParameterEmailService', 'branchService', 'alerts'];
	function ParameterEmailController($scope, $modal, ParameterEmailService, branchService, alerts) {
	    var vm = this;
	    //vm.search = search;
		vm.add = add;
		vm.message = alerts;
		vm.searchParams = {};
		vm.parameterEmail = {};
		vm.parameterEmailGetPage = ParameterEmailService.getPage;

		vm.tableActions = {
            onEdit: edit,
		    onDetail: detail,
		    onDelete: deleteData
		};

		function add() {
		    var modalInstance = $modal.open({
		        windowClass: 'form-modal-window-1000',
		        backdrop: 'static',
		        template: '<add-parameteremail />'
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
		        template: '<edit-parameterEmail data="data" />',
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
		        template: '<details-parameterEmail data="data" />',
		        scope: angular.extend($scope.$new(true), { data: data })
		    });
		}

		function deleteData(data) {
		    var modalInstance = $modal.open({
		        windowClass: 'form-modal-window-1000',
		        template: '<delete-parameterEmail data="data" />',
		        scope: angular.extend($scope.$new(true), { data: data })
		    });

		    modalInstance.result.then(function () {
		        vm.refreshData();
		    }, function () {
		        //$log.info('Modal dismissed at: ' + new Date());
		    });
		}	
	}
})();