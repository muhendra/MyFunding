(function () {
    'use strict';

    window.app.directive('deleteKatalog', deleteKatalog);
    function deleteKatalog() {
        return {
            scope: {
                data: '='
            },
            templateUrl: MyApplication.rootPath + '/katalog/template/delete.tmpl.cshtml',
            controller: controller,
            controllerAs: 'vm'
        }
    }

    controller.$inject = ['$scope', '$modal', 'KatalogService'];
    function controller($scope, $modal, KatalogService) {
        var vm = this;

        vm.katalog = $scope.data;
        vm.selectedView = 'delete';
        vm.setView = setView;  

        function setView(view) {
            vm.selectedView = view;
        }

        vm.viewOrDownload = function (namafile) {
            window.open(
                MyApplication.rootPath + "Files/Katalog/" + namafile,
                '_blank'
            );
        }

        vm.delete = function () {
            vm.saving = true;
            KatalogService.deleteData(vm.katalog)
				.then(function () {
				    //Close the modal
				    $scope.$parent.$close();
				})
				.catch(function (response) {
				    if (response.data.errorMessage) {
				        vm.message.error("There was a problem saving the issue: <br/>" + response.data.errorMessage + "<br/>Please try again.");
				    } else {
				        vm.message.error("There was a problem saving the issue. Please try again.");
				    }
				})
				.finally(function () {
				    vm.saving = false;
				});
        }
    }
})();