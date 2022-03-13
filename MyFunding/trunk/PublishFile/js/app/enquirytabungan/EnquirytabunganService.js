(function () {
    window.app.factory('EnquirytabunganService', EnquirytabunganService);

    EnquirytabunganService.$inject = ['$http', 'DataService', 'alerts'];
    function EnquirytabunganService($http, DataService, alerts) {

        var controllerPath = 'Enquirytabungan/'
        var list = [];

        var svc = {
            loadAll: loadAll,
            getPage: getPage,
            add: add,
            update: update,
            list: list,
            getData: getData,
            uploadData: uploadData,
            getNoPurchase: getNoPurchase,
            getDetailBarang: getDetailBarang,
            jenisgetPage: jenisgetPage,
            authorizegetPage: authorizegetPage,
            rejectgetPage: rejectgetPage,
            approve: approve,
            deleted: deleted,
            reject: reject,
            getDataKodePromosi: getDataKodePromosi,
            getDataKodePromosi2: getDataKodePromosi2,
            getBranchUserLogin: getBranchUserLogin,
            getDraftPurchaseRequest: getDraftPurchaseRequest,
            getPageUpload: getPageUpload
        };

        return svc;

        function getPageUpload(params) {
            return DataService.post(controllerPath + 'GetPageUpload', params)
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

        function getNoPurchase(params) {
            return DataService.post(controllerPath + 'GetNoPurchase')
				.then(function (response) {
				    return response;
				});
        }

        function authorizegetPage(params) {
            return DataService.post(controllerPath + 'AuthorizeGetPage', params)
				.then(function (response) {
				    return response;
				});
        }

        function rejectgetPage(params) {
            return DataService.post(controllerPath + 'RejectGetPage', params)
				.then(function (response) {
				    return response;
				});
        }

        function getDetailBarang(params) {
            return DataService.post(controllerPath + 'GetDetailBarang')
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

        function getDraftPurchaseRequest(params) {
            return DataService.post(controllerPath + 'GetDraftPurchaseRequest', params)
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

        function getDataKodePromosi(params) {
            return DataService.post(controllerPath + 'GetDataKodePromosi', params)
				.then(function (response) {
				    return response;
				});
        }

        function getDataKodePromosi2(params) {
            return DataService.post(controllerPath + 'GetDataKodePromosi2', params)
				.then(function (response) {
				    return response;
				});
        }

        function add(obj) {
            return DataService.post(controllerPath + 'Add', obj)
                .then(function (data) {
                    return data;
                });
        }

        function approve(obj) {
            return DataService.post(controllerPath + 'Approve', obj)
                .then(function (data) {
                    list.unshift(data);
                    return data;
                });
        }

        function deleted(obj) {
            return DataService.post(controllerPath + 'Deleted', obj)
                .then(function (data) {
                    list.unshift(data);
                    return data;
                });
        }

        function reject(obj) {
            return DataService.post(controllerPath + 'Reject', obj)
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
               .then(function (data) {
                   angular.extend(existingObj, updatedObj);
                   return data;
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
        
        function getData(id) {
            for (var i = 0; i < list.length; i++) {
                if (list[i].Id == id) return list[i];
            }

            return null;
        }
    }
})();