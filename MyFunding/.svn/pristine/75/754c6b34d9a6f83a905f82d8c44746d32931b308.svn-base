(function () {
    window.app.factory("RegisteredAccountService", RegisteredAccountService);
    RegisteredAccountService.$inject = ["DataService", "$http", "alerts"];

    function RegisteredAccountService(DataService, $http, alerts) {
        var controllerPath = "RegisteredAccount/";
        var list = [];
        var svc = {
            GetPage: GetPage,
            All: All,
            Delete:Delete,
            Update: Update,
            getData: getData,
            list: list,
            getDepartment: getDepartment
        }

        return svc;

        function getDepartment() {
            return DataService.post(controllerPath + 'GetDepartment', {})
                .then(function (data) {
                    return data;
                });
        }

        function GetPage(params) {
            return DataService.post(controllerPath + "GetPage", params).then(function (response) {
                return response;
            });
        }

        function Update(params) {
            return DataService.post(controllerPath + "Update", params).then(function (response) {
                return response;
            });
        }

        function All(params) {
            return DataService.post(controllerPath + "All", params).then(function (response) {
                list.addRange(response.data);
                return response;
            });
        }

        function Delete(params) {
            return DataService.post(controllerPath + 'Delete', params)
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
})()