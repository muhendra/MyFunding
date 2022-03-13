(function () {
    'use strict';

    window.app.controller('HistoryCashbackController', HistoryCashbackController);

    HistoryCashbackController.$inject = ['$scope', '$modal', 'PurchaseorderService', 'CashbackService', 'branchService', 'alerts', '$window'];
    function HistoryCashbackController($scope, $modal, PurchaseorderService, CashbackService, branchService, alerts, $window) {
        var vm = this;
        vm.search = search;
        vm.detail = detail;
        vm.message = alerts;
        vm.purchaseorderGetPage = [];
        vm.historyPurchaseOrderGetPage = [];
        vm.searchParams = {};
        vm.purchaseorder = {};
        vm.cashback = {};
        vm.enquirytabungan = {};
        vm.searchParams.tanggal = null;
        vm.searchParams.jenisTabungan = "TabunganHadiahLangsung";
        vm.searchParams.cabang = "";
        vm.searchParams.noRekening = "";
        vm.searchParams.no = "";
        vm.searchParams.print = "1";
        vm.cabanggetpage = branchService.getPage;
        vm.cashbackGroupGetPage = CashbackService.getCashbackGroup;

        vm.GetJurnalCashback = CashbackService.GetJurnalCashback;

        vm.onChangeJenisTabungan = function () {
            if (vm.searchParams.jenisTabungan == "TabunganSiPucuk")
                vm.searchParams.jenisTabungan = 6501
            if (vm.searchParams.jenisTabungan == "TabunganSiPucukReward")
                vm.searchParams.jenisTabungan = 6502
            if (vm.searchParams.jenisTabungan == "TabunganHadiahLangsung")
                vm.searchParams.jenisTabungan = 6008
        }

        PurchaseorderService.getBranchUserLogin().then(function (value) {
            vm.purchaseorder.cabang = value.branchCodeT24;
            if (value.isKpno == 'no') {
                vm.selectedCabang = { branchCodeT24: value.branchCodeT24, branchName: value.branchName };
                vm.searchParams.cabang = value.branchCodeT24;
            }
            vm.isKpno = value.isKpno;

            vm.historyCashbackGetPage = CashbackService.historyGetPage;
        })

        vm.GetJurnalCashback = CashbackService.GetJurnalCashback;

        function search() {
            if (vm.searchParams.jenisTabungan == "TabunganSiPucuk")
                vm.searchParams.jenisTabungan = 6501
            if (vm.searchParams.jenisTabungan == "TabunganSiPucukReward")
                vm.searchParams.jenisTabungan = 6502
            if (vm.searchParams.jenisTabungan == "TabunganHadiahLangsung")
                vm.searchParams.jenisTabungan = 6008

            if (vm.selectedCabang == null)
                vm.searchParams.cabang = "";
            if (vm.searchParams.tanggal == "")
                vm.searchParams.tanggal = null;

            CashbackService.authorizegetPage(vm.searchParams).then(function (value) {
                vm.authorizeCashbackGetPage = value.data;
                vm.refreshData();
            })

            if (vm.searchParams.jenisTabungan == 6501)
                vm.searchParams.jenisTabungan = "TabunganSiPucuk"
            if (vm.searchParams.jenisTabungan == 6502)
                vm.searchParams.jenisTabungan = "TabunganSiPucukReward"
            if (vm.searchParams.jenisTabungan == 6008)
                vm.searchParams.jenisTabungan = "TabunganHadiahLangsung"
        }

        vm.onSelectCabang = function () {
            if (vm.selectedCabang == null) {
                vm.purchaseorder.cabang = null;
                vm.searchParams.cabang = "";
            }
            else {
                vm.purchaseorder.cabang = vm.selectedCabang.branchCodeT24;
                vm.searchParams.cabang = vm.selectedCabang.branchCodeT24;
            }
        }

        vm.cashbackTableActions = {
            onDelete: deleteDetailBarang
        };

        vm.tableActions = {
            onDetail: detail,
            onReject: reject,
            onDelete: deleteDetailBarang,

            onReport: function (data) {
                var params = { poGroupId: data.poGroupId }
                var url = MyApplication.rootPath + "Cashback/DownloadTextfile/";
                CashbackService.downloadFile(url, params);
            },

            onClick: function (value) {
            },
            onDblClick: function (value) {
            }
        };

        function deleteDetailBarang(data) {
            if (confirm("Are you sure for authorize?")) {

                vm.saving = true;

                CashbackService.deleteRow(data)
                        .then(function (data) {
                            alert("Save success");
                            search();
                        })
                        .catch(function (response) {
                            if (response.data.errorMessage) {
                                vm.message.error("There was a problem saving data : <br/>" + response.data.errorMessage + "<br/>Please try again.");
                            } else {
                                vm.message.error("There was a problem saving data. Please try again.");
                            }
                        })
                        .finally(function () {
                            vm.saving = false;
                        });

            } else {
                return false;
            }
        }

        function deleted(data) {
            if (confirm("Are you sure for delete?")) {

                vm.saving = true;

                CashbackService.deleted(data)
                        .then(function (data) {
                            alert("Delete success");
                            search();
                        })
                        .catch(function (response) {
                            if (response.data.errorMessage) {
                                vm.message.error("There was a problem delete data : <br/>" + response.data.errorMessage + "<br/>Please try again.");
                            } else {
                                vm.message.error("There was a problem delete data. Please try again.");
                            }
                        })
                        .finally(function () {
                            vm.saving = false;
                        });

            } else {
                return false;
            }
        }

        function reject(data) {
            if (confirm("Are you sure for reject?")) {

                vm.saving = true;
                CashbackService.reject(data)
                        .then(function (data) {
                            alert("Reject success");
                            search();
                        })
                        .catch(function (response) {
                            if (response.data.errorMessage) {
                                vm.message.error("There was a problem reject data : <br/>" + response.data.errorMessage + "<br/>Please try again.");
                            } else {
                                vm.message.error("There was a problem reject data. Please try again.");
                            }
                        })
                        .finally(function () {
                            vm.saving = false;
                        });
            } else {
                return false;
            }
        }


        function detail(data) {
            $modal.open({
                windowClass: 'form-modal-window-1200',
                template: '<details-cashback data="data" />',
                scope: angular.extend($scope.$new(true), { data: data })
            });
        }
    }
})();