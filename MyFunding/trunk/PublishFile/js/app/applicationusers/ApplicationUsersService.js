(function () {
    window.app.factory('applicationusersService', applicationusersService);

    applicationusersService.$inject = ['$http', 'DataService', 'alerts'];
    function applicationusersService($http, DataService, alerts) {

        var controllerPath = 'ApplicationUsers/'
        var list = [];       

        var svc = {
            loadAll: loadAll,
            getPage: getPage,
            getEmployee: getEmployee,
            getRoleNames: getRoleNames,
            getDepartment: getDepartment,
            getArea: getArea,
            getBranch: getBranch,
            add: add,
            update: update,
            list: list,
            getData: getData
        };

        return svc;

        //function loadAll(pageNumber, pageSize) {
        //    if (typeof (pageNumber) === 'undefined') pageNumber = 1;
        //    if (typeof (pageSize) === 'undefined') pageSize = 5;

        //    return DataService.post(controllerPath + 'All/' + pageNumber + "/" + pageSize)
		//		.then(function (response) {
		//		    list.addRange(response.data);
		//		    return response;
		//		});
        //}

        function loadAll() {
            return DataService.post(controllerPath + 'All')
				.then(function (response) {
				    list.addRange(response.data);
				    return response;
				});
        }

        function getPage(params) {
            return DataService.post(controllerPath + 'GetPage', params)
				.then(function (response) {
				    return response;
				});
        }

        function getEmployee() {
            return DataService.post(controllerPath + 'GetEmployee')
				.then(function (response) {
				    return response;
				});
        }

        function getRoleNames() {
            return DataService.post(controllerPath + 'GetRoleNames')
				.then(function (response) {
				    return response;
				});
        }

        function getDepartment(params) {
            return DataService.post(controllerPath + 'GetDepartment')
				.then(function (response) {
				    return response;
				});
        }

        function getArea(params) {
            return DataService.post(controllerPath + 'GetArea')
				.then(function (response) {
				    return response;
				});
        }
        function getBranch(params) {
            return DataService.post(controllerPath + 'GetBranch')
				.then(function (response) {
				    return response;
				});
        }

        function add(obj) {
            return DataService.post(controllerPath + 'Add', obj)
                .then(function (data) {
                    list.unshift(data);
            });        
        }

        function update(existingObj, updatedObj) {
            return $http.post(controllerPath + 'Update', updatedObj)
				.success(function (obj) {
				    angular.extend(existingObj, obj);
				});
        }

        function getData(id) {
            for (var i = 0; i < list.length; i++) {
                if (list[i].id == id) return list[i];
            }

            return null;
        }
    }
})();