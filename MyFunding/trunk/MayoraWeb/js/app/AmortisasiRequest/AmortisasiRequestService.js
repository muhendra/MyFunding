(function () {
    window.app.factory('AmortisasiRequestService', AmortisasiRequestService);

    AmortisasiRequestService.$inject = ['$http', 'DataService', 'alerts'];
    function AmortisasiRequestService($http, DataService, alerts) {

        var controllerPath = 'AmortisasiRequest/'
        var list = [];

        var svc = {
            loadAll: loadAll,
            getPage: getPage,
            add: add,
            //20200806, eka, BEGIN,CaseID I200000249
            GetDetail: GetDetail,
            //20200806, eka, END,CaseID I200000249
            update: update,
            sendMail: sendMail,
            resetData: resetData,
            descintaccount: descintaccount,
            descbranch: descbranch,
            list: list,
            deleteData: deleteData,
            getData: getData,
            uploadData: uploadData,
            generateNo: generateNo,
            getDeliveryOrder: getDeliveryOrder,
            jenisgetPage: jenisgetPage,
            authorizegetPage: authorizegetPage,
            approveData: approveData,
            rejectData: rejectData,
            getPurchaseOrder: getPurchaseOrder,
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
            return DataService.post(controllerPath + 'GetBranceDesc', {id: id})
				.then(function (response) {
				    return response;
				});
        }

        function descintaccount(id) {
            return DataService.post(controllerPath + 'GetIntAccOrCategoryDesc', {id: id})
				.then(function (response) {
				    return response;
				});
        }

        function approveData(obj) {
            return DataService.post(controllerPath + 'Approve', obj)
                .then(function (data) {
                    list.unshift(data);
                    return data;
                });
        }

        function rejectData(obj) {
            return DataService.post(controllerPath + 'Reject', obj)
                .then(function (data) {
                    list.unshift(data);
                    return data;
                });
        }

        function generateNo() {
            return DataService.post(controllerPath + 'GenerateNo')
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

        function getDeliveryOrder(params) {
            return DataService.post(controllerPath + 'getDeliveryOrder', params)
				.then(function (response) {
				    return response;
				});
        }

        function getPurchaseOrder(params) {
            return DataService.post(controllerPath + 'getPurchaseOrder', params)
				.then(function (response) {
				    return response;
				});
        }

        function resetData(params) {
            return DataService.post(controllerPath + 'ResetData', params)
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

        function processJurnalOtomatis(params) {
            return DataService.post(controllerPath + 'ProcessJurnalOtomatis', params)
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
        //20200806, eka, BEGIN,CaseID I200000249
        function GetDetail(params) {
            return DataService.post(controllerPath + 'GetDetail', params)
				.then(function (response) {
				    return response;
				});
        }
        //20200806, eka, END,CaseID I200000249
        function getData(id) {
            for (var i = 0; i < list.length; i++) {
                if (list[i].Id == id) return list[i];
            }

            return null;
        }
    }
})();