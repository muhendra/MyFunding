(function () {
    window.app.factory('CashbackService', CashbackService);

    CashbackService.$inject = ['$http', 'DataService', 'alerts'];
    function CashbackService($http, DataService, alerts) {

        var controllerPath = 'Cashback/'
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
            getCashbackGroup: getCashbackGroup,
            //20190115, jeni, END
            getNoPurchaseOrder: getNoPurchaseOrder,
            historyGetPage: historyGetPage,
            getSupplier: getSupplier,
            getNikUserLogin: getNikUserLogin,
            getCmsBankPage: getCmsBankPage,
            //20200710, eka, BEGIN
            historyGetAll: historyGetAll,
            GetDetail: GetDetail,
            getBranchUserLogin: getBranchUserLogin,
            getJurnalCashback: GetJurnalCashback,
            insertJurnalCashback: InsertJurnalCashback,
            getListPOGroup: GetListPoGroup,
            detailJurnalCashback: DetailJurnalCashback,
            historyJurnalCashback: HistoryJurnalCashback,
            deleteRow: deleteRow,
            downloadFile: downloadFile,
            //20200710, eka, BEGIN
        };
        return svc;
        //20200710, eka, BEGIN
        function downloadFile(url, params) {
            var config = { responseType: 'arraybuffer', transformResponse: jsonBufferToObject, };
            return $http.post(url, params, config)
                .then(function successCallback(result) {

                    //https://stackoverflow.com/a/48864140
                    var contentDisposition = result.headers('Content-Disposition');
                    var filename = contentDisposition.split(';')[1].split('filename')[1].split('=')[1].trim();

                    // TODO when WS success
                    var file = new Blob([result.data], {
                        type: 'application/octet-stream'
                    });
                    //trick to download store a file having its URL
                    var fileURL = URL.createObjectURL(file);

                    var a = document.createElement('a');
                    a.href = fileURL;
                    a.target = '_blank';
                    a.download = filename;
                    document.body.appendChild(a); //create the link "a"
                    a.click(); //click the link "a"
                    document.body.removeChild(a); //remove the link "a"
                    return true;
                }, function errorCallback(response) {
                    if (response.data.errorMessage) {
                        alert("There was a problem saving data : " + response.data.errorMessage + " Please try again.");
                    } else {
                        alert("There was a problem saving data. Please try again.");
                    }
                    return false;
                });
        }

        //https://stackoverflow.com/a/40939055
        function jsonBufferToObject(data, headersGetter, status) {
            var type = headersGetter("Content-Type");
            if (!type.startsWith("application/json")) {
                return data;
            };
            var decoder = new TextDecoder("utf-8");
            var domString = decoder.decode(data);
            var json = JSON.parse(domString);
            return json;
        };
        
        function getBranchUserLogin(params) {
            return DataService.post(controllerPath + 'GetBranchUserLogin')
				.then(function (response) {
				    return response;
				});
        }

        function DetailJurnalCashback(params) {
            return DataService.post(controllerPath + 'DetailJurnalCashback', params)
				.then(function (response) {
				    return response;
				});
        }

        function GetJurnalCashback(params) {
            return DataService.post(controllerPath + 'GetJurnalCashback', params)
				.then(function (response) {
				    return response;
				});
        }

        function InsertJurnalCashback(params) {
            return DataService.post(controllerPath + 'InsertJurnalCashback', params)
				.then(function (response) {
				    return response;
				});
        }

        function GetListPoGroup(params) {
            return DataService.post(controllerPath + 'GetListPoGroup', params)
				.then(function (response) {
				    return response;
				});
        }

        function HistoryJurnalCashback(params) {
            return DataService.post(controllerPath + 'HistoryJurnalCashback', params)
				.then(function (response) {
				    return response;
				});
        }

        function getPOGroup(params) {
            return DataService.post(controllerPath + 'GetPOGroup', params)
				.then(function (response) {
				    return response;
				});
        }

        function deleteRow(params) {
            return DataService.post(controllerPath + 'DeleteRow', params)
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

        function getCashbackGroup(params) {
            return DataService.post(controllerPath + 'getCashbackGroup', params)
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

            return DataService.post(controllerPath + 'Update', updatedObj)
               .then(function (obj) {
                   angular.extend(existingObj, obj);
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