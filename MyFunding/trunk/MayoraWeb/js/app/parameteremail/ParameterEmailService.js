(function () {
    window.app.factory('ParameterEmailService', ParameterEmailService);

    ParameterEmailService.$inject = ['$http', 'DataService', 'alerts'];
    function ParameterEmailService($http, DataService, alerts) {

        var controllerPath = 'ParameterEmail/'
        var list = [];

        var svc = {
            loadAll: loadAll,
            getPage: getPage,
            add: add,
            update: update,
            list: list,
            deleteData: deleteData,
            getData: getData
        };

        return svc;

        function getPage(params) {
            return DataService.post(controllerPath + 'GetPage', params)
				.then(function (response) {
				    return response;
				});
        }

        function loadAll(pageNumber, pageSize) {
            return DataService.post(controllerPath + 'All')
                           .then(function (response) {
                               list.addRange(response.data);
                               return response;
                           });
        }    

        function deleteData(params) {
            return DataService.post(controllerPath + 'Delete', params)
				.then(function (response) {
				    return response;
				});
        }   

        function add(obj) {
            return DataService.post(controllerPath + 'Add', obj)
                .then(function (data) {
                    list.unshift(data);
                    return data;
                });
        } 

        function update(existingObj, updatedObj) {
            //return $http.post(MyApplication.rootPath + controllerPath + 'Update', updatedObj)
			//	.success(function (obj) {
			//	    angular.extend(existingObj, obj);
			//	});

            return DataService.post(controllerPath + 'Update', updatedObj)
               .then(function (obj) {
                   angular.extend(existingObj, obj);
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