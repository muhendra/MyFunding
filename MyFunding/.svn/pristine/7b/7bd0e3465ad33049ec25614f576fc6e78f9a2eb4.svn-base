(function () {
    window.app.factory('MasterProductService', MasterProductService);

    MasterProductService.$inject = ['$http', 'DataService', 'alerts'];
    function MasterProductService($http, DataService, alerts) {

        var controllerPath = 'MasterProduct/'
        var list = [];

        var svc = {
            getPage: getPage,
            getPageCategoryTemenos: getPageCategoryTemenos,
            list: list,
            add: add,
            update: update,
            deleted: deleted,
            getAll:getAll
        };

        return svc;

        function getAll(params) {
            return DataService.post(controllerPath + 'All', params)
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
        function getPageCategoryTemenos(params) {
            return DataService.post(controllerPath + 'GetPageCategoryTemenos',params)
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