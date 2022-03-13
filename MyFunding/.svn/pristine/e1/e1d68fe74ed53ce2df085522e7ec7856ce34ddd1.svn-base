(function () {
    window.app.factory('PaymentrequestService', PaymentrequestService);

    PaymentrequestService.$inject = ['$http', 'DataService', 'alerts'];
    function PaymentrequestService($http, DataService, alerts) {

        var controllerPath = 'Paymentrequest/'
        var list = [];

        var svc = {
            loadAll: loadAll,
            getPage: getPage,
            add: add,
            update: update,
            list: list,
            getData: getData,
            uploadData: uploadData,
            getNoPayment: getNoPayment,
            getDetailBarang: getDetailBarang,
            jenisgetPage: jenisgetPage,
            authorizegetPage: authorizegetPage,
            approve: approve,
            descintaccount: descintaccount,
            reject: reject,
            deleted: deleted,
            getinternalaccount: getinternalaccount,
            descbranch: descbranch,
            getInternalAccountKredit: getInternalAccountKredit,
            getInternalAccountJurnalDebit: getInternalAccountJurnalDebit,
            getInternalAccountJurnalPencadanganDebit: getInternalAccountJurnalPencadanganDebit,
            getInternalAccountJurnalPencadanganKredit: getInternalAccountJurnalPencadanganKredit,
            processJurnalOtomatis: processJurnalOtomatis
        };

        return svc;

        function loadAll(pageNumber, pageSize) {
            return DataService.post(controllerPath + 'All')
                           .then(function (response) {
                               list.addRange(response.data);
                               return response;
                           });
        }

        function descbranch(id) {
            return DataService.post(controllerPath + 'GetBranceDesc', { id: id })
				.then(function (response) {
				    return response;
				});
        }

        function descintaccount(id) {
            return DataService.post(controllerPath + 'GetIntAccOrCategoryDesc', { id: id })
				.then(function (response) {
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

        function reject(obj) {
            return DataService.post(controllerPath + 'Reject', obj)
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

        function getNoPayment(params) {
            return DataService.post(controllerPath + 'GetNoPayment')
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

        function getinternalaccount(params) {
            return DataService.post(controllerPath + 'getinternalaccount', params)
				.then(function (response) {
				    return response;
				});
        }

        function getInternalAccountKredit(params) {
            return DataService.post(controllerPath + 'GetInternalAccountKredit', params)
				.then(function (response) {
				    return response;
				});
        }

        function getInternalAccountJurnalDebit(params) {
            return DataService.post(controllerPath + 'GetInternalAccountJurnalPelunasanDebit', params)
				.then(function (response) {
				    return response;
				});
        }

        function getInternalAccountJurnalPencadanganDebit(params) {
            return DataService.post(controllerPath + 'GetInternalAccountJurnalPencadanganDebit', params)
				.then(function (response) {
				    return response;
				});
        }

        function getInternalAccountJurnalPencadanganKredit(params) {
            return DataService.post(controllerPath + 'GetInternalAccountJurnalPencadanganKredit', params)
				.then(function (response) {
				    return response;
				});
        }

        function processJurnalOtomatis(params) {
            return DataService.post(controllerPath + 'ProcessJurnalOtomatis', params)
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
                 return respond
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