(function() {
	"use strict";

	window.app.directive('editBreakamortisasirequest', editBreakamortisasirequest);

	function editBreakamortisasirequest() {
		return {
			scope: {
				data: "="
			},
			templateUrl: MyApplication.rootPath + '/breakamortisasirequest/template/edit.tmpl.cshtml',
			controller: controller,
			controllerAs: 'vm'
		}
	}

	controller.$inject = ['$scope', '$modal', 'Upload', '$timeout', 'BreakAmortisasiRequestService', 'employeeService', 'departmentService'];
	function controller($scope, $modal, Upload, $timeout, BreakAmortisasiRequestService, employeeService, departmentService) {
		var vm = this;
		vm.save = save;
		vm.saving = false;
		vm.breakamortisasirequest = angular.copy($scope.data);
		vm.pathDO = "Files/deliveryorder/";
		vm.pathPR = "Files/purchaserequest/";
		vm.pathET = "Files/enquirytabungan/";
		vm.kartuAmortisasi = [];
		vm.totalBeban = 0;
		vm.bebanperbulan = 0;
		var reffCode = [];
		for (var i = 0; i < vm.breakamortisasirequest.jurnalDetail.length; i++) {
		    var CekAda = 0;
		    for (var b = 0; b < reffCode.length; b++) {
		        if (reffCode[b] == vm.breakamortisasirequest.jurnalDetail[i].ref_code) {
		            CekAda++;
		        }
		    }
		    if (CekAda == 0) {
		        reffCode.push(vm.breakamortisasirequest.jurnalDetail[i].ref_code);
		    }
		}

		vm.jurnalNameCombobox = [
            { id: 1, name: 'Break Amortisasi Tabungan Si Pucuk', transaksi: 'BreakAmortisasiSiPucuk' },
            { id: 2, name: 'Break Amortisasi Tabungan Berhadiah', transaksi: 'BreakAmortisasiBerhadiah' }
		];


		vm.counterJurnalDetail = reffCode.length;
		//BreakAmortisasiRequestService.generateNo().then(function (data) {
		//    vm.breakamortisasirequest.requestId = data;
		//});
	    //Grid Amortisasi Jurnal Detai
		//vm.breakamortisasirequest.jurnalDetail = [];
		vm.tableActions = {
		    onDelete: deleteData,
		    onEdit: editdata
		};
		function deleteData(data) {
		    var OldData = [];
		    for (var i = 0; i < vm.breakamortisasirequest.jurnalDetail.length; i++) {
		        if (vm.breakamortisasirequest.jurnalDetail[i].ref_code == data.ref_code) {
		            OldData.push(vm.breakamortisasirequest.jurnalDetail[i]);
		        }
		    }
		    if (confirm("Delete Jurnal Detail?")) {
		        vm.breakamortisasirequest.jurnalDetail.splice(vm.breakamortisasirequest.jurnalDetail.indexOf(OldData[0]), 1);
		        vm.breakamortisasirequest.jurnalDetail.splice(vm.breakamortisasirequest.jurnalDetail.indexOf(OldData[1]), 1);
		        vm.refreshData();
		    }
		}
		function editdata(val) {
		    var oldData = [];
		    for (var i = 0; i < vm.breakamortisasirequest.jurnalDetail.length; i++) {
		        if (vm.breakamortisasirequest.jurnalDetail[i].ref_code == val.ref_code) {
		            oldData.push(vm.breakamortisasirequest.jurnalDetail[i]);
		        }
		    }
		    var data = oldData;
		    var modalInstance = $modal.open({
		        windowClass: 'form-modal-window-1200',
		        backdrop: 'static',
		        template: '<detailjurnal-breakamortisasirequest data="data"/>',
		        scope: angular.extend($scope.$new(true), { data: data })
		    });

		    modalInstance.result.then(function (data) {
		        vm.breakamortisasirequest.jurnalDetail[vm.breakamortisasirequest.jurnalDetail.indexOf(oldData[0])] = data[0];
		        vm.breakamortisasirequest.jurnalDetail[vm.breakamortisasirequest.jurnalDetail.indexOf(oldData[1])] = data[1];
		        vm.refreshData();
		    }, function () {
		        //$log.info('Modal dismissed at: ' + new Date());
		    });
		}
		vm.addJurnalDetail = function () {
		    //var amount = angular.copy(vm.bebanperbulan);
		    vm.counterJurnalDetail++;
		    var modalInstance = $modal.open({
		        windowClass: 'form-modal-window-1200',
		        backdrop: 'static',
		        template: '<detailjurnal-breakamortisasirequest data="data"/>',
		        scope: angular.extend($scope.$new(true), {
		            data: [{
		                value_date: new Date(),
		                currency: '',
		                narative: '',
		                ref_code: vm.breakamortisasirequest.requestId + vm.counterJurnalDetail.toString(),
		                amount: 0
		            }, {
		                value_date: new Date(),
		                currency: '',
		                narative: '',
		                ref_code: vm.breakamortisasirequest.requestId + vm.counterJurnalDetail.toString(),
		                amount: 0
		            }]
		        })
		    });

		    modalInstance.result.then(function (data) {
		        vm.breakamortisasirequest.jurnalDetail.push(data[0]);
		        vm.breakamortisasirequest.jurnalDetail.push(data[1]);
		        vm.refreshData();
		    }, function () {
		        //$log.info('Modal dismissed at: ' + new Date());
		    });
		}
	    //Grid Amortisasi Jurnal Detai

	    //Pick List Delivery Order
        
		vm.selectedDeliveryOrder = {
		    id: vm.breakamortisasirequest.tTid,
		    requestId: vm.breakamortisasirequest.requestId
		};



		vm.kartuAmortisasi = vm.breakamortisasirequest.listKartuAmortisasi;
		vm.totalBeban = vm.breakamortisasirequest.pO_TotalPurchase / 0.8; //+ (20 / 100 * vm.breakamortisasirequest.pO_NominalBarang);

		vm.deliveryOrderGetPage = BreakAmortisasiRequestService.getDeliveryOrder;
		vm.onSelectDeliveryOrder =
        function () {
            vm.breakamortisasirequest.tTid = vm.selectedDeliveryOrder.id;
            vm.breakamortisasirequest.tT_RequestDate = vm.selectedDeliveryOrder.requestDate;
            vm.breakamortisasirequest.do_PurchaseOrderId = vm.selectedDeliveryOrder.do_PurchaseOrderId;
            vm.breakamortisasirequest.do_DeliveryOrderId = vm.selectedDeliveryOrder.do_DeliveryOrderId;
            vm.breakamortisasirequest.do_DeliveryOrderDate = vm.selectedDeliveryOrder.do_DeliveryOrderDate;
            vm.breakamortisasirequest.do_StatusBarang = vm.selectedDeliveryOrder.do_StatusBarang;
            vm.breakamortisasirequest.do_Receiver = vm.selectedDeliveryOrder.do_Receiver;
            vm.breakamortisasirequest.do_Condition = vm.selectedDeliveryOrder.do_Condition;
            vm.breakamortisasirequest.do_attachmentTandaTerima = vm.selectedDeliveryOrder.do_attachmentTandaTerima;
            vm.breakamortisasirequest.do_Description = vm.selectedDeliveryOrder.do_Description;
            vm.breakamortisasirequest.pO_EnquiryId = vm.selectedDeliveryOrder.pO_EnquiryId;
            vm.breakamortisasirequest.pO_DetailBarangId = vm.selectedDeliveryOrder.pO_DetailBarangId;
            vm.breakamortisasirequest.pO_POId = vm.selectedDeliveryOrder.pO_POId;
            vm.breakamortisasirequest.pO_PODate = vm.selectedDeliveryOrder.pO_PODate;
            vm.breakamortisasirequest.pO_POGroupId = vm.selectedDeliveryOrder.pO_POGroupId;
            vm.breakamortisasirequest.pO_CategoryId = vm.selectedDeliveryOrder.pO_CategoryId;
            vm.breakamortisasirequest.pO_PolaId = vm.selectedDeliveryOrder.pO_PolaId;
            vm.breakamortisasirequest.pO_UnitId = vm.selectedDeliveryOrder.pO_UnitId;
            vm.breakamortisasirequest.pO_TypeId = vm.selectedDeliveryOrder.pO_TypeId;
            vm.breakamortisasirequest.pO_PaymentMethod = vm.selectedDeliveryOrder.pO_PaymentMethod;
            vm.breakamortisasirequest.pO_PaymentType = vm.selectedDeliveryOrder.pO_PaymentType;
            vm.breakamortisasirequest.pO_DPAmount = vm.selectedDeliveryOrder.pO_DPAmount;
            vm.breakamortisasirequest.pO_Quantity = vm.selectedDeliveryOrder.pO_Quantity;
            vm.breakamortisasirequest.pO_Currency = vm.selectedDeliveryOrder.pO_Currency;
            vm.breakamortisasirequest.pO_NominalBarang = vm.selectedDeliveryOrder.pO_NominalBarang;
            vm.breakamortisasirequest.pO_NominalPurchase = vm.selectedDeliveryOrder.pO_NominalPurchase;
            vm.breakamortisasirequest.pO_TotalPurchase = vm.selectedDeliveryOrder.pO_TotalPurchase;
            vm.breakamortisasirequest.pO_SupplierId = vm.selectedDeliveryOrder.pO_SupplierId;
            vm.breakamortisasirequest.pO_NilaiBuku = vm.selectedDeliveryOrder.pO_NilaiBuku;
            vm.breakamortisasirequest.pO_NikEmp = vm.selectedDeliveryOrder.pO_NikEmp;
            vm.breakamortisasirequest.pO_DeptId = vm.selectedDeliveryOrder.pO_DeptId;
            vm.breakamortisasirequest.pO_VendorQuotationNo = vm.selectedDeliveryOrder.pO_VendorQuotationNo;
            vm.breakamortisasirequest.pO_VendorQuotationDate = vm.selectedDeliveryOrder.pO_VendorQuotationDate;
            vm.breakamortisasirequest.pO_VendorQuotationAmount = vm.selectedDeliveryOrder.pO_VendorQuotationAmount;
            vm.breakamortisasirequest.pO_VendorInvoiceNo = vm.selectedDeliveryOrder.pO_VendorInvoiceNo;
            vm.breakamortisasirequest.pO_VendorInvoiceDate = vm.selectedDeliveryOrder.pO_VendorInvoiceDate;
            vm.breakamortisasirequest.pO_VendorInvoiceAmount = vm.selectedDeliveryOrder.pO_VendorInvoiceAmount;
            vm.breakamortisasirequest.pO_PODescription = vm.selectedDeliveryOrder.pO_PODescription;
            vm.breakamortisasirequest.pO_ApproveBy2 = vm.selectedDeliveryOrder.pO_ApproveBy2;
            vm.breakamortisasirequest.pO_ApproveDate2 = vm.selectedDeliveryOrder.pO_ApproveDate2;
            vm.breakamortisasirequest.pO_StatusData2 = vm.selectedDeliveryOrder.pO_StatusData2;
            vm.breakamortisasirequest.dB_EnquiryId = vm.selectedDeliveryOrder.dB_EnquiryId;
            vm.breakamortisasirequest.dB_PromotionCode = vm.selectedDeliveryOrder.dB_PromotionCode;
            vm.breakamortisasirequest.dB_KategoriBarang = vm.selectedDeliveryOrder.dB_KategoriBarang;
            vm.breakamortisasirequest.dB_TypeBarang = vm.selectedDeliveryOrder.dB_TypeBarang;
            vm.breakamortisasirequest.dB_Merek = vm.selectedDeliveryOrder.dB_Merek;
            vm.breakamortisasirequest.dB_Penalty = vm.selectedDeliveryOrder.dB_Penalty;
            vm.breakamortisasirequest.dB_Quantity = vm.selectedDeliveryOrder.dB_Quantity;
            vm.breakamortisasirequest.dB_Warna = vm.selectedDeliveryOrder.dB_Warna;
            vm.breakamortisasirequest.pR_TglBukaRekening = vm.selectedDeliveryOrder.pR_TglBukaRekening;
            vm.breakamortisasirequest.pR_JenisTabungan = vm.selectedDeliveryOrder.pR_JenisTabungan;
            vm.breakamortisasirequest.pR_NoRekening = vm.selectedDeliveryOrder.pR_NoRekening;
            vm.breakamortisasirequest.pR_NoCif = vm.selectedDeliveryOrder.pR_NoCif;
            vm.breakamortisasirequest.pR_NamaNasabah = vm.selectedDeliveryOrder.pR_NamaNasabah;
            vm.breakamortisasirequest.pR_KodePromosi = vm.selectedDeliveryOrder.pR_KodePromosi;
            vm.breakamortisasirequest.pR_Cabang = vm.selectedDeliveryOrder.pR_Cabang;
            vm.breakamortisasirequest.pR_StartDate = vm.selectedDeliveryOrder.pR_StartDate;
            vm.breakamortisasirequest.pR_MaturityDate = vm.selectedDeliveryOrder.pR_MaturityDate;
            vm.breakamortisasirequest.pR_Nominal = vm.selectedDeliveryOrder.pR_Nominal;
            vm.breakamortisasirequest.pR_PRId = vm.selectedDeliveryOrder.pR_PRId;
            vm.breakamortisasirequest.pR_PRDate = vm.selectedDeliveryOrder.pR_PRDate;
            vm.breakamortisasirequest.pR_DraftPRId = vm.selectedDeliveryOrder.pR_DraftPRId;
            vm.breakamortisasirequest.pR_DraftPRDate = vm.selectedDeliveryOrder.pR_DraftPRDate;
            vm.breakamortisasirequest.pR_AttachmentSPNasabah = vm.selectedDeliveryOrder.pR_AttachmentSPNasabah;
            vm.breakamortisasirequest.pR_Requester = vm.selectedDeliveryOrder.pR_Requester;
            vm.breakamortisasirequest.pR_RewardBudget = vm.selectedDeliveryOrder.pR_RewardBudget;
            vm.breakamortisasirequest.pR_AttachmentMemoDireksi = vm.selectedDeliveryOrder.pR_AttachmentMemoDireksi;
            vm.breakamortisasirequest.pR_CatatanCabang = vm.selectedDeliveryOrder.pR_CatatanCabang;
            vm.breakamortisasirequest.pR_CatatanFProduct = vm.selectedDeliveryOrder.pR_CatatanFProduct;
            vm.breakamortisasirequest.pR_DetailBarangId = vm.selectedDeliveryOrder.pR_DetailBarangId;
            vm.breakamortisasirequest.pR_ApproveBy2 = vm.selectedDeliveryOrder.pR_ApproveBy2;
            vm.breakamortisasirequest.pR_ApproveDate2 = vm.selectedDeliveryOrder.pR_ApproveDate2;
            vm.breakamortisasirequest.pR_StatusData2 = vm.selectedDeliveryOrder.pR_StatusData2;
            //if (vm.breakamortisasirequest.pR_StartDate != vm.breakamortisasirequest.pR_MaturityDate) {
            //    var startdate = new Date(vm.breakamortisasirequest.pR_StartDate);
            //    var endate = new Date(vm.breakamortisasirequest.pR_MaturityDate);
            //    var loopdate = startdate;
            //    var jumbulan = 0;
            //    vm.kartuAmortisasi = [];
            //    if (endate.getFullYear() == startdate.getFullYear()) {
            //        jumbulan = endate.getMonth() - startdate.getMonth();
            //    } else if (endate.getFullYear() > startdate.getFullYear()) {
            //        jumbulan = (endate.getMonth() + ((endate.getFullYear() - startdate.getFullYear()) * 12)) - startdate.getMonth();
            //    }
            //    vm.totalBeban = vm.breakamortisasirequest.pO_NominalBarang + (10 / 100 * vm.breakamortisasirequest.pO_NominalBarang)
            //    vm.bebanperbulan = vm.totalBeban / jumbulan;
            //    for (var i = 0; i < jumbulan; i++) {
            //        loopdate.setMonth(loopdate.getMonth() + 1);
            //        vm.kartuAmortisasi.push({ id: i + 1, valuedate: angular.copy(loopdate), bebanbulanan: vm.bebanperbulan });
            //    }
            //}
        }
	    //Pick List Delivery Order

	    //Pick List Delivery Order
		    vm.viewOrDownload = function (namafile) {
		        window.open(
                    MyApplication.rootPath + namafile,
                    '_blank'
                );
		    }
		    //vm.setKartuAmortisasi();

		    vm.closeAction = function () {
		        vm.setFile();
		        $scope.$parent.$close();
		    }
		    function save() {
		        if (vm.breakamortisasirequest.jurnalDetail.length == 0) {
		            alert("Detail Jurnal Amortisasi Harus diisi!")
		            return false;
		        }
		    vm.saving = true;
		    vm.setFile();
		    vm.breakamortisasirequest.attachmentBreakAmortisasiRequest = vm.attachmentBreakAmortisasiRequestTemp;
		    BreakAmortisasiRequestService.update($scope.data, vm.breakamortisasirequest)
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


	}
})();