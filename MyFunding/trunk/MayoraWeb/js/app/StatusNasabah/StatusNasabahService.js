(function () {
    "use strict";
    window.app.factory("StatusNasabahService", StatusNasabahService);
    StatusNasabahService.$inject = ["DataService", "$http", "alerts"];
    function StatusNasabahService(DataService, $http, alerts) {
        var controllerPath ="StatusNasabah/";
        var list = [];

        var svc = {
            getpage: getPage,
            getAll: getAll,
            list: list,
            add: add,
            update: update,
            deleted: deleted,
            getBranchUserLogin: getBranchUserLogin
        };

        return svc;

        function getPage(params) {
            return DataService.post(controllerPath + 'GetPage', params)
				.then(function (response) {
				    return response;
				});
        }

        function getBranchUserLogin(params) {
            return DataService.post(controllerPath + 'GetBranchUserLogin')
				.then(function (response) {
				    return response;
				});
        }

        function getAll(params) {
            return DataService.post(controllerPath + 'getAll', params)
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