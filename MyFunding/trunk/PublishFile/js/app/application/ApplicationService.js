(function () {
    window.app.factory('applicationService', applicationService);

    applicationService.$inject = ['$http', 'DataService','alerts'];
    function applicationService($http, DataService, alerts) {

        var controllerPath = 'Application/'
        var list = [];

        loadAll();

        var svc = {
            loadAll: loadAll,
            getPage: getPage,
            add: add,
            update: update,
            list: list,
            getData: getData
        };

        return svc;

        function loadAll(pageNumber, pageSize) {
            if (typeof (pageNumber) === 'undefined') pageNumber = 1;
            if (typeof (pageSize) === 'undefined') pageSize = 5;

            return DataService.post(controllerPath + 'All/' + pageNumber + "/" + pageSize)
				.then(function (response) {
				    list.addRange(response.data);
				    return response;
				});
        }

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
            return $http.post(controllerPath + 'Update', updatedObj)
				.success(function (obj) {
				    angular.extend(existingObj, obj);
				});
        }

        function getData(id) {
            for (var i = 0; i < list.length; i++) {
                if (list[i].Id == applicationId) return list[i];
            }

            return null;
        }
    }
})();