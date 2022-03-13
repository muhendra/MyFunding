(function () {
    window.app.factory('DeliveryorderService', DeliveryorderService);

    DeliveryorderService.$inject = ['$http', 'DataService', 'alerts'];
    function DeliveryorderService($http, DataService, alerts) {

        var controllerPath = 'Deliveryorder/'
        var list = [];

        var svc = {
            loadAll: loadAll,
            getPage: getPage,
            add: add,
            update: update,
            list: list,
            getData: getData,
            uploadData: uploadData,
            getNoDeliveryOrder: getNoDeliveryOrder,
            jenisgetPage: jenisgetPage,
            authorizegetPage: authorizegetPage,
            approve: approve,
            edit: edit,
            getpageDetail: getpageDetail
        };

        return svc;

        function loadAll(pageNumber, pageSize) {
            return DataService.post(controllerPath + 'All')
                           .then(function (response) {
                               list.addRange(response.data);
                               return response;
                           });
        }
        function approve(obj) {
            return DataService.post(controllerPath + 'Approve', obj)
                .then(function (data) {
                    list.unshift(data);
                    return data;
                });
        }
        function getNoDeliveryOrder(params) {
            return DataService.post(controllerPath + 'GetNoDeliveryOrder', params)
				.then(function (response) {
				    return response;
				});
        }
        function getPage(params) {
            return DataService.post(controllerPath + 'GetPage', params)
				.then(function (response) {
				    return response;
				});
        }
        function getpageDetail(params) {
            return DataService.post(controllerPath + 'GetPageDetail', params)
				.then(function (response) {
				    return response;
				});
        }
        function jenisgetPage(params) {
            return DataService.post(controllerPath + 'JenisGetPage', params)
				.then(function (response) {
				    return response;
				});
        }
        function cabanggetPage(params) {
            return DataService.post(controllerPath + 'CabangGetPage', params)
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
        function authorizegetPage(params) {
            return DataService.post(controllerPath + 'AuthorizeGetPage', params)
				.then(function (response) {
				    return response;
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
        function edit(params) {
            //return $http.post(MyApplication.rootPath + controllerPath + 'Update', updatedObj)
            //	.success(function (obj) {
            //	    angular.extend(existingObj, obj);
            //	});
            return DataService.post(controllerPath + 'Edit', params)
                .then(function (data) {
                    return data;
                });
        }
        function uploadData(objList) {
            return DataService.post(controllerPath + 'UploadData', objList)
             .then(function (response) {

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