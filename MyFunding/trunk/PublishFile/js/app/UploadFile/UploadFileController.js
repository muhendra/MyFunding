(function () {
    "use strict";

    window.app.controller("UploadTextFileController",UploadTextFileController);
    
    UploadTextFileController.$inject = ["$scope", "$modal","alerts"];
    function UploadTextFileController ($scope, $modal, alerts){
        var vm = this;

        vm.add = function(){
            var modalInstance = $modal.open({
                windowClass: 'form-modal-window-800',
                backdrop: 'static',
                template: '<add-uploadfile />'
            });
            modalInstance.result.then(function(){
                //vm.refreshData();
            });
        }
    }
})();