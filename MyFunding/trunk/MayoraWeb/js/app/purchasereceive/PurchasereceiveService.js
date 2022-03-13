(function () {
    window.app.factory('PurchasereceiveService', PurchasereceiveService);

    PurchasereceiveService.$inject = ['$http', 'DataService', 'alerts'];
    function PurchasereceiveService($http, DataService, alerts) {

        var controllerPath = 'Purchasereceive/'
        var list = [];

        var svc = {
            loadAll: loadAll,
            getPage: getPage,
            add: add,
            update: update,
            list: list,
            getData: getData,
            uploadData: uploadData,
            getNoPurchaseReceive: getNoPurchaseReceive,
            getDetailBarang: getDetailBarang,
            jenisgetPage: jenisgetPage,
            authorizegetPage: authorizegetPage,
            HistoryGetPage: HistoryGetPage,
            HistoryGetAll: HistoryGetAll,
            pelunasangetPage: pelunasangetPage,
            approve: approve,
            getNoPelunasan: getNoPelunasan,
            edit: edit,
            reject: reject,
            authorizeReceiveGetPage: authorizeReceiveGetPage,
            approveReceive: approveReceive,
            rejectReceive: rejectReceive,
            processJurnalOtomatis: processJurnalOtomatis,
            getBranchUserLogin: getBranchUserLogin
        };

        return svc;

        function getBranchUserLogin(params) {
            return DataService.post(controllerPath + 'GetBranchUserLogin')
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

        function approveReceive(obj) {
            return DataService.post(controllerPath + 'ApproveReceive', obj)
                .then(function (data) {
                    list.unshift(data);
                    return data;
                });
        }

        function rejectReceive(obj) {
            return DataService.post(controllerPath + 'RejectReceive', obj)
                .then(function (data) {
                    list.unshift(data);
                    return data;
                });
        }

        function getNoPelunasan(params) {
            return DataService.post(controllerPath + 'GetNoPelunasan', params)
				.then(function (response) {
				    return response;
				});
        }

        function getNoPurchaseReceive(params) {
            return DataService.post(controllerPath + 'GetNoPurchase', params)
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
        
        function pelunasangetPage(params) {
            return DataService.post(controllerPath + 'PelunasanGetPage', params)
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

        function HistoryGetPage(params) {
            return DataService.post(controllerPath + 'HistoryGetPage', params)
				.then(function (response) {
				    return response;
				});
        }

        function HistoryGetAll(params) {
            return DataService.post(controllerPath + 'HistoryGetAll', params)
				.then(function (response) {
				    return response;
				});
        }

        function authorizeReceiveGetPage(params) {
            return DataService.post(controllerPath + 'authorizeReceiveGetPage', params)
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

            //return $http.post(MyApplication.rootPath + controllerPath + 'UploadData', objList)
			//	.success(function (response) {
				    
			//	});
        }

        function processJurnalOtomatis(params) {
            return DataService.post(controllerPath + 'processJurnalOtomatis', params)
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