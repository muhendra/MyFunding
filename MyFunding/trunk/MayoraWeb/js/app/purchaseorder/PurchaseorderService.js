(function () {
    window.app.factory('PurchaseorderService', PurchaseorderService);

    PurchaseorderService.$inject = ['$http', 'DataService', 'alerts'];
    function PurchaseorderService($http, DataService, alerts) {

        var controllerPath = 'Purchaseorder/'
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
            getNoPurchaseGroup: getNoPurchaseGroup,
            getDetailBarang: getDetailBarang,
            jenisgetPage: jenisgetPage,
            authorizegetPage: authorizegetPage,
            approve: approve,
            deleted: deleted,
            reject: reject,
            //20190115, jeni, BEGIN
            rejecttopr: rejecttopr,
            getPOGroup: getPOGroup,
            //20190115, jeni, END
            getNoPurchaseOrder: getNoPurchaseOrder,
            historyGetPage: historyGetPage,
            getSupplier: getSupplier,
            getNikUserLogin: getNikUserLogin,
            getCmsBankPage: getCmsBankPage,
            //20200710, eka, BEGIN
            historyGetAll: historyGetAll,
            historyPOGetAll: historyPOGetAll,
            GetDetail: GetDetail,
            getBranchUserLogin: getBranchUserLogin
            //20200710, eka, BEGIN
        };
        return svc;

        //20200710, eka, BEGIN
        function getBranchUserLogin(params) {
            return DataService.post(controllerPath + 'GetBranchUserLogin')
				.then(function (response) {
				    return response;
				});
        }

        function historyGetAll(params) {
            return DataService.post(controllerPath + 'historyGetAll', params)
				.then(function (response) {
				    return response;
				});
        }

        function GetDetail(params) {
            return DataService.post(controllerPath + 'GetDetail', params)
				.then(function (response) {
				    return response;
				});
        }
        //20200710, eka, END

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
        function rejecttopr(obj) {
            return DataService.post(controllerPath + 'RejecttoPr', obj)
                .then(function (data) {
                    list.unshift(data);
                    return data;
                });
        }

        function getPOGroup(params) {
            return DataService.post(controllerPath + 'GetPOGroup', params)
				.then(function (response) {
				    return response;
				});
        }

        //20190115. jeni, END

        function getNoPurchaseOrder() {
            return DataService.post(controllerPath + 'GetNoPurchaseOrder')
				.then(function (response) {
				    return response;
				});
        }


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


        function getNoPurchaseGroup(params) {
            return DataService.post(controllerPath + 'GetNoPurchaseGroup', params)
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

        function historyGetPage(params) {
            return DataService.post(controllerPath + 'HistoryGetPage', params)
				.then(function (response) {
				    return response;
				});
        }

        function historyPOGetAll(params) {
            return DataService.post(controllerPath + 'HistoryPOGetAll', params)
				.then(function (response) {
				    return response;
				});
        }

        function getSupplier(params) {
            return DataService.post(controllerPath + 'GetSupplier', params)
				.then(function (response) {
				    return response;
				});
        }

        function getNikUserLogin(params) {
            return DataService.post(controllerPath + 'GetNikUserLogin', params)
				.then(function (response) {
				    return response;
				});
        }

        function getCmsBankPage(params) {
            return DataService.post(controllerPath + 'GetCMSBankPage', params)
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
        
        function getData(id) {
            for (var i = 0; i < list.length; i++) {
                if (list[i].Id == id) return list[i];
            }

            return null;
        }
    }

})();