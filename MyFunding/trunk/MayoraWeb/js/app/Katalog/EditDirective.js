(function() {
	"use strict";

	window.app.directive('editKatalog', editKatalog);

	function editKatalog() {
		return {
			scope: {
				data: "="
			},
			templateUrl: MyApplication.rootPath + '/katalog/template/edit.tmpl.cshtml',
			controller: controller,
			controllerAs: 'vm'
		}
	}

	controller.$inject = ['$scope', 'Upload', '$timeout', 'KatalogService', 'imageclassService'];
	function controller($scope, Upload, $timeout, KatalogService, imageclassService) {
		var vm = this;
		vm.save = save;
		vm.title = "Edit Katalog";
		vm.saving = false;
		vm.katalog = angular.copy($scope.data);
		vm.attachmentKatalogTemp = vm.katalog.attachmentKatalog;

		vm.kodePromoGetPage = KatalogService.kataloggetPage2;
		vm.selectedKodePromo = { id: vm.katalog.id, description: vm.katalog.kode_Promo }
		vm.onSelectKodePromo =
         function () {
             vm.katalog.kode_Promo = vm.selectedKodePromo.description;
         }

		vm.uploadFiles = function (files, errFiles) {
		    vm.files = files;
		    vm.errFiles = errFiles;
		    var param = { namaFile: vm.attachmentKatalogTemp };
		    KatalogService.resetData(param)
            .then(function (data) {
                if (data == "Succes") {
                    vm.attachmentKatalogTemp = null;
                    angular.forEach(files, function (file) {
                        file.upload = Upload.upload({
                            url: MyApplication.rootPath + 'Katalog/UploadKatalog',
                            data: { file: file }
                        });

                        file.upload.then(function (response) {
                            $timeout(function () {
                                vm.attachmentKatalogTemp = response.data;
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
		}

		vm.resetFile = function (namafile) {
		    var param = { namaFile: namafile };
		    KatalogService.resetData(param)
            .then(function (data) {
                if (data == "Succes") {
                    vm.attachmentKatalogTemp = null;
                    vm.files = [];
                }
            });
		}

		function save() {		    
		    vm.saving = true;
		    if (vm.attachmentKatalogTemp == null || vm.attachmentKatalogTemp == '') {
		        if (vm.katalog.attachmentKatalog != null && vm.katalog.attachmentKatalog != '') {
		            var param = { namaFile: vm.katalog.attachmentKatalog };
		            KatalogService.hapusData(param);
		        }
		    }
		    vm.katalog.attachmentKatalog = vm.attachmentKatalogTemp;
		    KatalogService.update($scope.data, vm.katalog)
				.then(function () {
					//Close the modal
					$scope.$parent.$close();
				})
				.catch(function (response) {
				    if (response.data.errorMessage) {
				        vm.message.error("There was a problem saving the issue: <br/>" + response.data.errorMessage + "<br/>Please try again.");
				    } else {
				        vm.message.error("There was a problem saving the issue. Please try again.");
				    }
				})
				.finally(function() {
					vm.saving = false;
				});
		}

        /*Validation Area*/

		vm.validationPenalty = function () {
		    if (vm.katalog.penalty < 1 || vm.katalog.penalty > 99999999999999.99) {
		        return true;
		    }

		    return false;
		}

		vm.validationJangkaWaktu = function () {
		    if (vm.katalog.jangkaWaktu < 1 || vm.katalog.jangkaWaktu > 99999999999999.99) {
		        return true;
		    }

		    return false;
		}

        /*End Validation Area*/


		vm.viewOrDownload = function (namafile) {
		    if (vm.katalog.attachmentKatalog == namafile) {
		        window.open(
                    MyApplication.rootPath + "Files/Katalog/" + namafile,
                    '_blank'
                );
		    } else {
		        window.open(
                    MyApplication.rootPath + "Files/Katalog/Temp/" + namafile,
                    '_blank'
                );
		    }
		}

		vm.closeAction = function () {
		    if (vm.attachmentKatalogTemp != null) {
		        var param = { namaFile: vm.attachmentKatalogTemp };
		        KatalogService.resetData(param);
		    }
		    $scope.$parent.$close();
		}
	}
})();