(function () {
    window.app.factory('PurchaserequestService', PurchaserequestService);

    PurchaserequestService.$inject = ['$http', 'DataService', 'alerts'];
    function PurchaserequestService($http, DataService, alerts) {

        var controllerPath = 'Purchaserequest/'
        var list = [];

        var svc = {
            loadAll: loadAll,
            getPage: getPage,
            add: add,
            //20190116, jeni, BEGIN
            //update: update,
            //20190116, jeni, END
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
            //20190115, jeni, BEGIN
            editreject: editreject,
            rejecttodpr: rejecttodpr,
            //20190115, jeni, END
            getPurchaseRequest: getPurchaseRequest
            
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

        function reject(obj) {
            return DataService.post(controllerPath + 'Reject', obj)
                .then(function (data) {
                    list.unshift(data);
                    return data;
                });
        }

        //20190115. jeni, BEGIN
        function rejecttodpr(obj) {
            return DataService.post(controllerPath + 'RejecttoDpr', obj)
                .then(function (data) {
                    list.unshift(data);
                    return data;
                });
        }

        function editreject(obj) {
            return DataService.post(controllerPath + 'EditReject', obj)
                .then(function (data) {
                    list.unshift(data);
                    return data;
                });
        }
        //20190115. jeni, END
        function deleted(obj) {
            return DataService.post(controllerPath + 'Deleted', obj)
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

        function getPurchaseRequest(params) {
            return DataService.post(controllerPath + 'GetPurchaseRequest', params)
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
        function rejectgetPage(params) {
            return DataService.post(controllerPath + 'RejectGetPage', params)
				.then(function (response) {
				    return response;
				});
        }
        //20190116, jeni, BEGIN
        //function update(existingObj, updatedObj) {
        //    //return $http.post(MyApplication.rootPath + controllerPath + 'Update', updatedObj)
        //    //	.success(function (obj) {
        //    //	    angular.extend(existingObj, obj);
        //    //	});

        //    return DataService.post(controllerPath + 'Update', updatedObj)
        //       .then(function (obj) {
        //           angular.extend(existingObj, obj);
        //       });
        //}

        function editreject(existingObj, updatedObj) {
            //return $http.post(MyApplication.rootPath + controllerPath + 'Update', updatedObj)
            //	.success(function (obj) {
            //	    angular.extend(existingObj, obj);
            //	});

            return DataService.post(controllerPath + 'Update', updatedObj)
               .then(function (obj) {
                   angular.extend(existingObj, obj);
               });
        }
        //20190116, jeni, END



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