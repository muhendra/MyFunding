(function () {
    "use strict";
    window.app.factory("InsertLogService", InsertLogService);
    InsertLogService.$inject = ["DataService", "$http", "alerts"];
    function InsertLogService(DataService, $http, alerts) {
        var controllerPath ="InsertLog/";
        var list = [];

        var svc = {
            getpage: getPage,
            list: list,
            add: add,
            update: update,
            deleted: deleted,
        };

        return svc;

        function getPage(params) {
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