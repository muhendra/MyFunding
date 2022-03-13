(function () {
    "use strict";

    window.app.directive('addKatalog', addKatalog);

    function addKatalog() {
        return {
            templateUrl: MyApplication.rootPath + '/katalog/template/add.tmpl.cshtml',
            controller: controller,
            controllerAs: 'vm'
        }
    }

    controller.$inject = ['$scope', '$modal', 'Upload', '$timeout', 'KatalogService', 'employeeService', 'departmentService' ];
    function controller($scope, $modal, Upload, $timeout, KatalogService, employeeService, departmentService)  {
        var vm = this;
        vm.save = save;
        vm.saving = false;
        
        vm.KodePromoGetPage = KatalogService.kataloggetPage2;
        vm.onSelectKodePromo =
         function () {
             vm.katalog.iDKode_Promo2 = vm.selectedKodePromo.id
             vm.katalog.kode_Promo = vm.selectedKodePromo.description;
         }


        vm.uploadFiles = function (files, errFiles) {
            vm.files = files;
            vm.errFiles = errFiles;
            if (vm.katalog.attachmentKatalog != null) {
                var param = { namaFile: vm.katalog.attachmentKatalog };
                KatalogService.resetData(param)
                .then(function (data) {
                    if (data == "Succes") {
                        vm.katalog.attachmentKatalog = null;
                        vm.files = [];
                        angular.forEach(files, function (file) {
                            file.upload = Upload.upload({
                                url: MyApplication.rootPath + 'Katalog/UploadKatalog',
                                data: { file: file }
                            });

                            file.upload.then(function (response) {
                                $timeout(function () {
                                    vm.katalog.attachmentKatalog = response.data;
                                });
                            }, function (response) {
                                if (response.status > 0) {
                                    $scope.errorMsg = response.status + ': ' + response.data;
                                    alert($scope.errorMsg);
                                }
                            }, function (evt) {
                                file.progress = Math.min(100, parseInt(100.0 *
                                                         evt.loaded / evt.total));
                            });
                        });
                    }
                });
            } else {
                angular.forEach(files, function (file) {
                    file.upload = Upload.upload({
                        url: MyApplication.rootPath + 'Katalog/UploadKatalog',
                        data: { file: file }
                    });

                    file.upload.then(function (response) {
                        $timeout(function () {
                            vm.katalog.attachmentKatalog = response.data;
                        });
                    }, function (response) {
                        if (response.status > 0) {
                            $scope.errorMsg = response.status + ': ' + response.data;
                            alert($scope.errorMsg);
                        }
                    }, function (evt) {
                        file.progress = Math.min(100, parseInt(100.0 *
                                                 evt.loaded / evt.total));
                    });
                });
            }
            
        }

        vm.resetFile = function (namafile) {
            var param = { namaFile: namafile };
            KatalogService.resetData(param)
            .then(function (data) {
                if (data == "Succes") {
                    vm.katalog.attachmentKatalog = null;
                    vm.files = [];
                }
            });
        }

        vm.viewOrDownload = function (namafile) {
            window.open(
                MyApplication.rootPath + "Files/Katalog/Temp/" + namafile,
                '_blank'
            );
        }

        function save() {
            vm.saving = true;
            KatalogService.add(vm.katalog)
                    .then(function (data) {
                        //alert("No Purchase Order : " + data.poId);
                        //Close the modal
                        $scope.$close();
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
        }

        vm.closeAction = function () {
            if (vm.katalog.attachmentKatalog != null) {
                var param = { namaFile: vm.katalog.attachmentKatalog };
                KatalogService.resetData(param);
            }
            $scope.$close();
        }
    }
})();