(function () {
    window.app.factory('KatalogService', KatalogService);

    KatalogService.$inject = ['$http', 'DataService', 'alerts'];
    function KatalogService($http, DataService, alerts) {

        var controllerPath = 'Katalog/'
        var list = [];

        var svc = {
            loadAll: loadAll,
            getPage: getPage,
            add: add,
            update: update,
            sendMail: sendMail,
            resetData: resetData,
            uploadData: uploadData,
            list: list,
            deleteData: deleteData,
            getData: getData,
            getNoPurchase: getNoPurchase,
            getDetailBarang: getDetailBarang,
            jenisgetPage: jenisgetPage,
            authorizegetPage: authorizegetPage,
            approve: approve,
            hapusData: hapusData,
            kataloggetPage: kataloggetPage,            
            kataloggetPage2:kataloggetPage2
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

        function getNoPurchase(params) {
            return DataService.post(controllerPath + 'GetNoPurchase')
				.then(function (response) {
				    return response;
				});
        }

        function deleteData(params) {
            return DataService.post(controllerPath + 'Delete', params)
				.then(function (response) {
				    return response;
				});
        }

        function getDetailBarang(params) {
            return DataService.post(controllerPath + 'GetDetailBarang', params)
				.then(function (response) {
				    return response;
				});
        }


        function sendMail() {
            return DataService.post(controllerPath + 'SendMailNotifikasi')
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

        function kataloggetPage(params) {
            return DataService.post(controllerPath + 'KatalogGetPage', params)
				.then(function (response) {
				    return response;
				});
        }

        function kataloggetPage2(params) {
            return DataService.post(controllerPath + 'KatalogGetPage2', params)
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

        function uploadData(objList) {
            return DataService.post(controllerPath + 'UploadData', objList)
             .then(function (response) {

             });

            //return $http.post(MyApplication.rootPath + controllerPath + 'UploadData', objList)
			//	.success(function (response) {
				    
			//	});
        }

        function resetData(params) {
            return DataService.post(controllerPath + 'ResetData', params)
				.then(function (response) {
				    return response;
				});
        }

        function hapusData(params) {
            return DataService.post(controllerPath + 'HapusData', params)
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