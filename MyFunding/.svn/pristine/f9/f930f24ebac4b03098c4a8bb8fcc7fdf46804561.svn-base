(function() {
	"use strict";

	window.app.directive('editPencadangan', editPencadangan);

	function editPencadangan() {
		return {
			scope: {
				data: "="
			},
			templateUrl: MyApplication.rootPath + '/pencadangan/template/edit.tmpl.cshtml',
			controller: controller,
			controllerAs: 'vm'
		}
	}

	controller.$inject = ['$scope', '$modal', 'Upload', '$timeout', 'PencadanganService', 'employeeService', 'departmentService'];
	function controller($scope, $modal, Upload, $timeout, PencadanganService, employeeService, departmentService) {
		var vm = this;
		vm.save = save;
		vm.saving = false;
		vm.pencadangan = angular.copy($scope.data);
		vm.pathDO = "Files/deliveryorder/";
		vm.pathPR = "Files/purchaserequest/";
		vm.pathET = "Files/enquirytabungan/";
		vm.kartuAmortisasi = [];
		vm.totalBeban = 0;
		vm.bebanperbulan = 0;
		
		var reffCode = [];
		for (var i = 0; i < vm.pencadangan.jurnalDetail.length; i++) {
		    var CekAda = 0;
		    for (var b = 0; b < reffCode.length; b++) {
		        if (reffCode[b] == vm.pencadangan.jurnalDetail[i].ref_code) {
		            CekAda++;
		        }
		    }
		    if (CekAda == 0) {
		        reffCode.push(vm.pencadangan.jurnalDetail[i].ref_code);
		    }
		}
		vm.counterJurnalDetail = reffCode.length;
		//PencadanganService.generateNo().then(function (data) {
		//    vm.pencadangan.requestId = data;
		//});
	    //Grid Amortisasi Jurnal Detai
		//vm.pencadangan.jurnalDetail = [];
		vm.tableActions = {
		    onDelete: deleteData,
		    onEdit: editdata
		};
		function deleteData(data) {
		    var OldData = [];
		    for (var i = 0; i < vm.pencadangan.jurnalDetail.length; i++) {
		        if (vm.pencadangan.jurnalDetail[i].ref_code == data.ref_code) {
		            OldData.push(vm.pencadangan.jurnalDetail[i]);
		        }
		    }
		    if (confirm("Delete Jurnal Detail?")) {
		        vm.pencadangan.jurnalDetail.splice(vm.pencadangan.jurnalDetail.indexOf(OldData[0]), 1);
		        vm.pencadangan.jurnalDetail.splice(vm.pencadangan.jurnalDetail.indexOf(OldData[1]), 1);
		        vm.refreshData();
		    }
		}
		function editdata(val) {
		    var oldData = [];
		    for (var i = 0; i < vm.pencadangan.jurnalDetail.length; i++) {
		        if (vm.pencadangan.jurnalDetail[i].ref_code == val.ref_code) {
		            oldData.push(vm.pencadangan.jurnalDetail[i]);
		        }
		    }
		    var data = oldData;
		    var modalInstance = $modal.open({
		        windowClass: 'form-modal-window-1200',
		        backdrop: 'static',
		        template: '<detailjurnal-pencadangan data="data"/>',
		        scope: angular.extend($scope.$new(true), { data: data })
		    });

		    modalInstance.result.then(function (data) {
		        vm.pencadangan.jurnalDetail[vm.pencadangan.jurnalDetail.indexOf(oldData[0])] = data[0];
		        vm.pencadangan.jurnalDetail[vm.pencadangan.jurnalDetail.indexOf(oldData[1])] = data[1];
		        vm.refreshData();
		    }, function () {
		        //$log.info('Modal dismissed at: ' + new Date());
		    });
		}
		vm.addJurnalDetail = function () {
		    var amount = angular.copy(vm.bebanperbulan);
		    vm.counterJurnalDetail++;
		    var modalInstance = $modal.open({
		        windowClass: 'form-modal-window-1200',
		        backdrop: 'static',
		        template: '<detailjurnal-pencadangan data="data"/>',
		        scope: angular.extend($scope.$new(true), {
		            data: [{
		                value_date: new Date(),
		                currency: '',
		                narative: '',
		                ref_code: vm.pencadangan.requestId + vm.counterJurnalDetail.toString(),
		                amount: amount
		            }, {
		                value_date: new Date(),
		                currency: '',
		                narative: '',
		                ref_code: vm.pencadangan.requestId + vm.counterJurnalDetail.toString(),
		                amount: amount
		            }]
		        })
		    });

		    modalInstance.result.then(function (data) {
		        vm.pencadangan.jurnalDetail.push(data[0]);
		        vm.pencadangan.jurnalDetail.push(data[1]);
		        vm.refreshData();
		    }, function () {
		        //$log.info('Modal dismissed at: ' + new Date());
		    });
		}
	    //Grid Amortisasi Jurnal Detai

	    //Pick List Delivery Order
        
		vm.selectedDeliveryOrder = {
		    id: vm.pencadangan.dOid,
		    deliveryOrderId: vm.pencadangan.do_DeliveryOrderId
		};
		vm.deliveryOrderGetPage = PencadanganService.getDeliveryOrder;
		vm.onSelectDeliveryOrder =
        function () {
            vm.pencadangan.dOid = vm.selectedDeliveryOrder.id;
            vm.pencadangan.do_PurchaseOrderId = vm.selectedDeliveryOrder.purchaseOrderId;
            vm.pencadangan.do_DeliveryOrderId = vm.selectedDeliveryOrder.deliveryOrderId;
            vm.pencadangan.do_DeliveryOrderDate = vm.selectedDeliveryOrder.deliveryOrderDate;
            vm.pencadangan.do_StatusBarang = vm.selectedDeliveryOrder.statusBarang;
            vm.pencadangan.do_Receiver = vm.selectedDeliveryOrder.receiver;
            vm.pencadangan.do_Condition = vm.selectedDeliveryOrder.condition;
            vm.pencadangan.do_attachmentTandaTerima = vm.selectedDeliveryOrder.attachmentTandaTerima;
            vm.pencadangan.do_Description = vm.selectedDeliveryOrder.description;
            vm.pencadangan.pO_EnquiryId = vm.selectedDeliveryOrder.pO_EnquiryId;
            vm.pencadangan.pO_DetailBarangId = vm.selectedDeliveryOrder.pO_DetailBarangId;
            vm.pencadangan.pO_POId = vm.selectedDeliveryOrder.pO_POId;
            vm.pencadangan.pO_PODate = vm.selectedDeliveryOrder.pO_PODate;
            vm.pencadangan.pO_POGroupId = vm.selectedDeliveryOrder.pO_POGroupId;
            vm.pencadangan.pO_CategoryId = vm.selectedDeliveryOrder.pO_CategoryId;
            vm.pencadangan.pO_PolaId = vm.selectedDeliveryOrder.pO_PolaId;
            vm.pencadangan.pO_UnitId = vm.selectedDeliveryOrder.pO_UnitId;
            vm.pencadangan.pO_TypeId = vm.selectedDeliveryOrder.pO_TypeId;
            vm.pencadangan.pO_PaymentMethod = vm.selectedDeliveryOrder.pO_PaymentMethod;
            vm.pencadangan.pO_PaymentType = vm.selectedDeliveryOrder.pO_PaymentType;
            vm.pencadangan.pO_DPAmount = vm.selectedDeliveryOrder.pO_DPAmount;
            vm.pencadangan.pO_Quantity = vm.selectedDeliveryOrder.pO_Quantity;
            vm.pencadangan.pO_Currency = vm.selectedDeliveryOrder.pO_Currency;
            vm.pencadangan.pO_NominalBarang = vm.selectedDeliveryOrder.pO_NominalBarang;
            vm.pencadangan.pO_NominalPurchase = vm.selectedDeliveryOrder.pO_NominalPurchase;
            vm.pencadangan.pO_TotalPurchase = vm.selectedDeliveryOrder.pO_TotalPurchase;
            vm.pencadangan.pO_SupplierId = vm.selectedDeliveryOrder.pO_SupplierId;
            vm.pencadangan.pO_NilaiBuku = vm.selectedDeliveryOrder.pO_NilaiBuku;
            vm.pencadangan.pO_NikEmp = vm.selectedDeliveryOrder.pO_NikEmp;
            vm.pencadangan.pO_DeptId = vm.selectedDeliveryOrder.pO_DeptId;
            vm.pencadangan.pO_VendorQuotationNo = vm.selectedDeliveryOrder.pO_VendorQuotationNo;
            vm.pencadangan.pO_VendorQuotationDate = vm.selectedDeliveryOrder.pO_VendorQuotationDate;
            vm.pencadangan.pO_VendorQuotationAmount = vm.selectedDeliveryOrder.pO_VendorQuotationAmount;
            vm.pencadangan.pO_VendorInvoiceNo = vm.selectedDeliveryOrder.pO_VendorInvoiceNo;
            vm.pencadangan.pO_VendorInvoiceDate = vm.selectedDeliveryOrder.pO_VendorInvoiceDate;
            vm.pencadangan.pO_VendorInvoiceAmount = vm.selectedDeliveryOrder.pO_VendorInvoiceAmount;
            vm.pencadangan.pO_PODescription = vm.selectedDeliveryOrder.pO_PODescription;
            vm.pencadangan.pO_ApproveBy2 = vm.selectedDeliveryOrder.pO_ApproveBy2;
            vm.pencadangan.pO_ApproveDate2 = vm.selectedDeliveryOrder.pO_ApproveDate2;
            vm.pencadangan.pO_StatusData2 = vm.selectedDeliveryOrder.pO_StatusData2;
            vm.pencadangan.dB_EnquiryId = vm.selectedDeliveryOrder.dB_EnquiryId;
            vm.pencadangan.dB_PromotionCode = vm.selectedDeliveryOrder.dB_PromotionCode;
            vm.pencadangan.dB_KategoriBarang = vm.selectedDeliveryOrder.dB_KategoriBarang;
            vm.pencadangan.dB_TypeBarang = vm.selectedDeliveryOrder.dB_TypeBarang;
            vm.pencadangan.dB_Merek = vm.selectedDeliveryOrder.dB_Merek;
            vm.pencadangan.dB_Penalty = vm.selectedDeliveryOrder.dB_Penalty;
            vm.pencadangan.dB_Quantity = vm.selectedDeliveryOrder.dB_Quantity;
            vm.pencadangan.dB_Warna = vm.selectedDeliveryOrder.dB_Warna;
            vm.pencadangan.pR_TglBukaRekening = vm.selectedDeliveryOrder.pR_TglBukaRekening;
            vm.pencadangan.pR_JenisTabungan = vm.selectedDeliveryOrder.pR_JenisTabungan;
            vm.pencadangan.pR_NoRekening = vm.selectedDeliveryOrder.pR_NoRekening;
            vm.pencadangan.pR_NoCif = vm.selectedDeliveryOrder.pR_NoCif;
            vm.pencadangan.pR_NamaNasabah = vm.selectedDeliveryOrder.pR_NamaNasabah;
            vm.pencadangan.pR_KodePromosi = vm.selectedDeliveryOrder.pR_KodePromosi;
            vm.pencadangan.pR_Cabang = vm.selectedDeliveryOrder.pR_Cabang;
            vm.pencadangan.pR_StartDate = vm.selectedDeliveryOrder.pR_StartDate;
            vm.pencadangan.pR_MaturityDate = vm.selectedDeliveryOrder.pR_MaturityDate;
            vm.pencadangan.pR_Nominal = vm.selectedDeliveryOrder.pR_Nominal;
            vm.pencadangan.pR_PRId = vm.selectedDeliveryOrder.pR_PRId;
            vm.pencadangan.pR_PRDate = vm.selectedDeliveryOrder.pR_PRDate;
            vm.pencadangan.pR_DraftPRId = vm.selectedDeliveryOrder.pR_DraftPRId;
            vm.pencadangan.pR_DraftPRDate = vm.selectedDeliveryOrder.pR_DraftPRDate;
            vm.pencadangan.pR_AttachmentSPNasabah = vm.selectedDeliveryOrder.pR_AttachmentSPNasabah;
            vm.pencadangan.pR_Requester = vm.selectedDeliveryOrder.pR_Requester;
            vm.pencadangan.pR_RewardBudget = vm.selectedDeliveryOrder.pR_RewardBudget;
            vm.pencadangan.pR_AttachmentMemoDireksi = vm.selectedDeliveryOrder.pR_AttachmentMemoDireksi;
            vm.pencadangan.pR_CatatanCabang = vm.selectedDeliveryOrder.pR_CatatanCabang;
            vm.pencadangan.pR_CatatanFProduct = vm.selectedDeliveryOrder.pR_CatatanFProduct;
            vm.pencadangan.pR_DetailBarangId = vm.selectedDeliveryOrder.pR_DetailBarangId;
            vm.pencadangan.pR_ApproveBy2 = vm.selectedDeliveryOrder.pR_ApproveBy2;
            vm.pencadangan.pR_ApproveDate2 = vm.selectedDeliveryOrder.pR_ApproveDate2;
            vm.pencadangan.pR_StatusData2 = vm.selectedDeliveryOrder.pR_StatusData2;
            vm.setKartuAmortisasi();
            
        }

		vm.setKartuAmortisasi = function () {
		    if (vm.pencadangan.pR_StartDate != vm.pencadangan.pR_MaturityDate) {
		        var startdate = new Date(vm.pencadangan.pR_StartDate);
		        var endate = new Date(vm.pencadangan.pR_MaturityDate);
		        var loopdate = startdate;
		        var jumbulan = 0;
		        vm.kartuAmortisasi = [];
		        if (endate.getFullYear() == startdate.getFullYear()) {
		            jumbulan = endate.getMonth() - startdate.getMonth();
		        } else if (endate.getFullYear() > startdate.getFullYear()) {
		            jumbulan = (endate.getMonth() + ((endate.getFullYear() - startdate.getFullYear()) * 12)) - startdate.getMonth();
		        }
		        vm.totalBeban = vm.pencadangan.pO_NominalBarang + (20 / 100 * vm.pencadangan.pO_NominalBarang)
		        vm.bebanperbulan = vm.totalBeban / jumbulan;
		        for (var i = 0; i < jumbulan; i++) {
		            loopdate.setMonth(loopdate.getMonth() + 1);
		            vm.kartuAmortisasi.push({ id: i + 1, valuedate: angular.copy(loopdate), bebanbulanan: vm.bebanperbulan });
		        }
		    }
		}

	    //Pick List Delivery Order
		    vm.viewOrDownload = function (namafile) {
		        window.open(
                    MyApplication.rootPath + namafile,
                    '_blank'
                );
		    }
		    vm.setKartuAmortisasi();

		function save() {		    
		    vm.saving = true;

		    vm.pencadangan.attachmentPencadangan = vm.attachmentPencadanganTemp;
		    PencadanganService.update($scope.data, vm.pencadangan)
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