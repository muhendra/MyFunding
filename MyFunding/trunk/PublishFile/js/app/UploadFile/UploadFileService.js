(function () {
    window.app.factory('UploadFileService', UploadFileService);

    UploadFileService.$inject = ['$http', 'DataService', 'alerts'];
    function UploadFileService($http, DataService, alerts) {

        var controllerPath = 'UploadTextfile/'
        var list = [];

        var svc = {
           add: add,
        };

        return svc;
        
        function add(obj) {
            return DataService.post(controllerPath + 'Add', obj)
                .then(function (data) {
                    list.unshift(data);
                });
        }

    }
})()