(function () {
    window.app.factory("MasterPromotionService", MasterPromotionService);
    MasterPromotionService.$inject = ["$http", "DataService", "alerts"];

    function MasterPromotionService($http, DataService, alerts) {
        var controllerPath = "MasterPromotion/";
        var list = [];

        var svc = {
            getpage: getpage,
            list: list,
            add: add,
            update: update,
            deleted: deleted,
            getAll: getAll
        }
        return svc;

        function getAll(params) {
            return DataService.post(controllerPath + "GetAll", params)
            .then(function (response) {
                list.addRange(response.data);
                return response;
            });
        }

        function getpage(params) {
            return DataService.post(controllerPath + "Getpage", params)
            .then(function (response) {
                return response;
            });
        }

        function add(obj) {
            return DataService.post(controllerPath + "Add", obj)
            .then(function (data) {
                list.unshift(data);
            })
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
})();