(function() {
	'use strict';

	window.app.controller('PencadanganController', PencadanganController);

	PencadanganController.$inject = ['$scope', '$modal', 'PencadanganService', 'branchService', 'alerts'];
	function PencadanganController($scope, $modal, PencadanganService, branchService, alerts) {
	    var vm = this;
	    //vm.search = search;
		vm.add = add;
		vm.message = alerts;
		vm.searchParams = {};
		vm.pencadangan = {};
		vm.pencadanganGetPage = PencadanganService.getPage;

		vm.tableActions = {
            onEdit: edit,
		    onDetail: detail,
		    onDelete: deleteData
		};

		function add() {
		    var modalInstance = $modal.open({
		        windowClass: 'form-modal-window-1200',
		        backdrop: 'static',
		        template: '<add-pencadangan />'
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
		        template: '<edit-pencadangan data="data" />',
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

		function deleteData(data) {
		    var modalInstance = $modal.open({
		        windowClass: 'form-modal-window-1200',
		        template: '<delete-pencadangan data="data" />',
		        scope: angular.extend($scope.$new(true), { data: data })
		    });

		    modalInstance.result.then(function () {
		        vm.refreshData();
		    }, function () {
		        //$log.info('Modal dismissed at: ' + new Date());
		    });
		}


		vm.sendMail = function () {
		    PencadanganService.sendMail().then(function (data) {
		        console.log(data);
		    });
		}
	}
})();