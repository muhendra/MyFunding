(function () {
    'use strict';

    window.app.directive('detailsParameteremail', detailsParameteremail);
    function detailsParameteremail() {
        return {  
            templateUrl: MyApplication.rootPath + '/parameteremail/template/details.tmpl.cshtml',
            controller: controller,
            controllerAs: 'vm'
        }
    }

    controller.$inject = ['$scope', '$modal'];
    function controller($scope, $modal) {
        var vm = this;

        vm.parameterEmail = $scope.data;
        vm.selectedView = 'details';
        vm.setView = setView;  

        function setView(view) {
            vm.selectedView = view;
        }
        
    }
})();