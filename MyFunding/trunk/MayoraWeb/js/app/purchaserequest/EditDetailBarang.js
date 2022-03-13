//20200806, Eka, BEGIN
(function () {
    "use strict";

    window.app.directive('editDetailbarang', editDetailbarang);

    function editDetailbarang() {
        return {
            templateUrl: MyApplication.rootPath + '/purchaserequest/template/editdetailbarang.tmpl.cshtml',
            controller: controller,
            controllerAs: 'vm'
        }
    }

    controller.$inject = ['$scope', '$timeout', 'PurchaserequestService'];
    function controller($scope, $timeout, PurchaserequestService) {
        var vm = this;
        vm.saveDetailBarang = saveDetailBarang;
        vm.saving = false;
        vm.detailbarang = angular.copy($scope.data);
        vm.updateDetailBarang = PurchaserequestService.updated;
        //function save() {
        //    vm.saving = true;
        //    PurchaserequestService.updated($scope.data, vm.detailbarang)
		//		.then(function () {
		//		    //Close the modal
		//		    $scope.$parent.$close();
		//		})
		//		.catch(function (response) {
		//		    if (response.data.errorMessage) {
		//		        vm.message.error("There was a problem saving the issue: <br/>" + response.data.errorMessage + "<br/>Please try again.");
		//		    } else {
		//		        vm.message.error("There was a problem saving the issue. Please try again.");
		//		    }
		//		})
		//		.finally(function () {
		//		    vm.saving = false;
		//		});
        //}

        function saveDetailBarang() {
            vm.detailbarang.guid = _guid();
            PurchaserequestService.updated(vm.detailbarang)
				.then(function () {
				    //Close the modal
				    $scope.$close(vm.detailbarang);
				    return alert("Update Success !");

			})
            //$scope.$close(vm.detailbarang);
        }
    }
})();
//20200806, Eka, END