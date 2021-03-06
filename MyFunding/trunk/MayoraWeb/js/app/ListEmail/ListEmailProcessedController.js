(function () {
    "use strict";
    window.app.controller("ListEmailProcessedController", ListEmailProcessedController);
    ListEmailProcessedController.$inject = ["$window", "$scope", "ListEmailService", "alerts"];
    function ListEmailProcessedController($window, $scope, ListEmailService, alerts) {
        var vm = this;
        var tabClasses;
        vm.period = new Date();
        vm.searchParams = {};
        vm.searchParams.period = vm.period;
        vm.listEmailSuccessGetPage = ListEmailService.listEmailSuccessGetPage;
        vm.listEmailSuccessGetAll = ListEmailService.listEmailSuccessGetAll;
        vm.tableActions = {
            onDownload: Download,
            onView: View,
            onSend: Send
        }

        vm.search = function (tabNum) {
            vm.searchParams.period = vm.period;
            vm.searchParams.param = tabNum;
            vm.setActiveTab(tabNum);
        }

        function initTabs() {
            tabClasses = ["", "", "", ""];
        }

        vm.getTabClass = function (tabNum) {
            return tabClasses[tabNum];
        };

        vm.getTabPaneClass = function (tabNum) {
            return "tab-pane " + tabClasses[tabNum];
        }

        vm.setActiveTab = function (tabNum) {
            initTabs();
            tabClasses[tabNum] = "active";
            vm.searchParams.param = tabNum;
            vm.refreshData();
            
        };
        initTabs();
        

        function Send(data) {
            var param = { id: data.id }
            ListEmailService.sendEmail(param)
                .then(function (response) {
                    alert("Success");
                    vm.refreshData();
                })
                .catch(function (response) {
                    if (response.data.errorMessage) {
                        alert("There was a problem saving data : \n" + response.data.errorMessage + "\nPlease try again.");
                    } else {
                        alert("There was a problem saving data. Please try again.");
                    }
                    vm.refreshData();
                })
                .finally(function () {

                });
        };

        function Download(data) {
            var fileURL = MyApplication.rootPath + 'Files\\PDF\\' + data.downloadpdf;
            var a = document.createElement('a');
            a.href = fileURL;
            a.target = '_blank';
            a.download = data.file;
            document.body.appendChild(a);
            a.click();
        }

        function View(data) {
            var params = { id: data.id }
            var url = MyApplication.rootPath + "ListEmail/Contents/";
            if (params !== undefined && params !== null) {
                url += "?";
                for (var key in params) {
                    if (params[key] !== undefined) {
                        if (params[key] instanceof Date) {
                            url += key + '=' + params[key].toISOString() + '&';
                        } else {
                            url += key + '=' + params[key] + '&';
                        }
                    }
                }
            }
            var widht = 600;
            var height = 600;
            var left = screen.width / 2 - (widht / 2), top = 1//screen.height / 2 - (height / 4)
            $window.open(url, '', "top=" + top + ",left=" + left + ",width=" + widht + ",height=" + height)

        }
    }
})();