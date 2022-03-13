(function () {
    "use strict";
    window.app.factory("MasterParameterService", MasterParameterService);
    MasterParameterService.$inject = ["DataService", "$http", "alerts"];
    function MasterParameterService(DataService, $http, alerts) {
        var controllerPath ="MasterParameter/";
        var list = [];

        var svc = {
            getpage: getpage,
            list: list,
            add: add,
            update: update,
            deleted: deleted,
        };

        return svc;

        function getpage(params) {
            return DataService.post(controllerPath + 'GetPage', params)
				.then(function (response) {
				    return response;
				});
        }
        
        function add(obj) {
            return DataService.post(controllerPath + 'Add', obj)
                .then(function (data) {
                    list.unshift(data);
                });
        }

        function update(existingObj, updatedObj) {
            return DataService.post(controllerPath + 'Update', updatedObj)
               .then(function (obj) {
                   angular.extend(existingObj, obj);
               });
        }
        function deleted(existingObj, updatedObj) {
            return DataService.post(controllerPath + 'Delete', updatedObj)
               .then(function (obj) {
                   angular.extend(existingObj, obj);
               });
        }
    }
})()