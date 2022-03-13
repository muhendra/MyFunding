(function () {
    window.app.factory("ListEmailService", ListEmailService);
    ListEmailService.$inject = ["DataService", "$http", "alerts"];
    function ListEmailService(DataService, $http, alerts) {
        var controllerPath = 'ListEmail/'
        var list = [];

        var svc = {
            listEmailPendingGetPage: listEmailPendingGetPage,
            listEmailProcessedGetPage: listEmailProcessedGetPage,
            listEmailPendingGetAll: listEmailPendingGetAll,
            listEmailSuccessGetAll: listEmailSuccessGetAll,
            listEmailSuccessGetPage:listEmailSuccessGetPage,
            sendEmail: sendEmail,
            getData: getData,
            list: list
        };

        return svc;

        function listEmailSuccessGetAll(params) {
            return DataService.post(controllerPath + 'ListEmailProcessedGetAll', params)
               .then(function (response) {
                   list.addRange(response.data);
                   return response;
               });
        }

        function listEmailSuccessGetPage(params) {
            return DataService.post(controllerPath + 'ListEmailProcessedGetPage', params)
				.then(function (response) {
				    return response;
				});
        }

        function listEmailPendingGetAll(params) {
            return DataService.post(controllerPath + 'All', params)
               .then(function (response) {
                   list.addRange(response.data);
                   return response;
               });
        }
        function listEmailPendingGetPage(params) {
            return DataService.post(controllerPath + 'GetListEmailPending', params)
				.then(function (response) {
				    return response;
				});
        }

        function listEmailProcessedGetPage(params) {
            return DataService.post(controllerPath + 'GetListEmailProcessed', params)
				.then(function (response) {
				    return response;
				});
        }

        function sendEmail(params) {
            return DataService.post(controllerPath + 'SendEmail', params)
				.then(function (response) {
				    return response;
				});
        }

        function getData(id) {
            for (var i = 0; i < list.length; i++) {
                if (list[i].Id == id) return list[i];
            }

            return null;
        }
    }
})();