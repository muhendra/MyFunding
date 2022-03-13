(function () {
    'use strict';

    window.app.directive('detailsKatalog', detailsKatalog);
    function detailsKatalog() {
        return {
            scope: {
                data: '='
            },
            templateUrl: MyApplication.rootPath + '/katalog/template/details.tmpl.cshtml',
            controller: controller,
            controllerAs: 'vm'
        }
    }

    controller.$inject = ['$scope', '$modal'];
    function controller($scope, $modal) {
        var vm = this;

        vm.katalog = $scope.data;
        vm.selectedView = 'details';
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
    }
})();