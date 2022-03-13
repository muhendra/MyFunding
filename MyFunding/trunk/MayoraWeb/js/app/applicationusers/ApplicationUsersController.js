(function() {
	'use strict';

	window.app.controller('ApplicationUsersController', ApplicationUsersController);

	ApplicationUsersController.$inject = ['$scope', '$modal', 'applicationusersService', 'alerts', '$location'];
	function ApplicationUsersController($scope, $modal, applicationusersService, alerts, $location) {
		var vm = this;
		//vm.add = add;
		//vm.detail = detail;
		vm.edit = edit;        
		vm.applicationusersGetPage = applicationusersService.getPage;
		vm.applicationusersGetEmployee = applicationusersService.getEmployee;
		vm.applicationusersGetDepartment = applicationusersService.getDepartment;
		vm.applicationusersGetArea = applicationusersService.getArea;
		vm.applicationusersGetBranch = applicationusersService.getBranch;
		vm.message = alerts;

		vm.applicationusersGetEmployee()
                        .then(function (data) {
                            vm.employee = data;
                        });
	    vm.applicationusersGetDepartment()
                        .then(function (data) {
                            vm.department = data;
                        });
	    vm.applicationusersGetArea()
                        .then(function (data) {
                            vm.area = data;
                        });
	    vm.applicationusersGetBranch()
                       .then(function (data) {
                           vm.branch = data;
                       });


		vm.tableActions = {
		    onEdit: edit,
		    //onDetail: detail,
		    //onDelete: function (value) {
		    //    alert('Delete : ' + value);
		    //}
		};

		//function add() {
		//    var modalInstance = $modal.open({
		//        //windowClass: 'form-modal-window-1000',
		//        backdrop: 'static',
		//        template: '<add-application />'
		//    });

		//    modalInstance.result.then(function () {
		//        vm.refreshData();
		//    }, function () {
		//        //$log.info('Modal dismissed at: ' + new Date());
		//    });		  
		//}

		function edit(data) {
		    window.location = MyApplication.rootPath + "ApplicationUsers/Edit/" + data.id ;
		    //$window.location()
		    //if (!$scope.$$phase) $scope.$apply();
		}

		//function detail(data) {
		//    $modal.open({
		//        template: '<details-application data="data" />',
		//        scope: angular.extend($scope.$new(true), { data: data })
		//    });
		//}
	}
})();