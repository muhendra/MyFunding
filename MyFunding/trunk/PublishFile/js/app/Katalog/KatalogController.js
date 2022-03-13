(function() {
	'use strict';

	window.app.controller('KatalogController', KatalogController);

	KatalogController.$inject = ['$scope', '$modal', 'KatalogService', 'branchService', 'alerts'];
	function KatalogController($scope, $modal, KatalogService, branchService, alerts) {
	    var vm = this;
	    //vm.search = search;
		vm.add = add;
		vm.message = alerts;
		vm.searchParams = {};
		vm.katalog = {};
		vm.katalogGetPage = KatalogService.getPage;

		vm.tableActions = {
            onEdit: edit,
		    onDetail: detail,
		    onDelete: deleteData
		};

		function add() {
		    var modalInstance = $modal.open({
		        windowClass: 'form-modal-window-1000',
		        backdrop: 'static',
		        template: '<add-katalog />'
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
		        template: '<edit-katalog data="data" />',
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
		        template: '<details-katalog data="data" />',
		        scope: angular.extend($scope.$new(true), { data: data })
		    });
		}

		function deleteData(data) {
		    var modalInstance = $modal.open({
		        //windowClass: 'form-modal-window-1000',
		        template: '<delete-katalog data="data" />',
		        scope: angular.extend($scope.$new(true), { data: data })
		    });

		    modalInstance.result.then(function () {
		        vm.refreshData();
		    }, function () {
		        //$log.info('Modal dismissed at: ' + new Date());
		    });
		}
		vm.sendMail = function () {
		    KatalogService.sendMail().then(function (data) {
		        console.log(data);
		    });
		}
	}
})();