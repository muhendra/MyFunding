(function () {
    window.app.factory("MasterEmailTemplateService", MasterEmailTemplateService);
    MasterEmailTemplateService.$inject = ["$http", "DataService", "alerts"];

    function MasterEmailTemplateService($http, DataService, alerts) {
        var controllerPath = "MasterEmailTemplate/";
        var list = [];

        var svc = {
            getpage: getpage,
            list: list,
            add: add,
            update: update,
            deleted: deleted,
            All:All
        }
        return svc;

        function All(params) {
            return DataService.post(controllerPath + "All", params).then(function (data) {
                list.addRange(data.data);
                return data;
            })
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