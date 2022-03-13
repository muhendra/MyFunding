(function() {
	"use strict";

	window.app.directive('editAmortisasirequest', editAmortisasirequest);

	function editAmortisasirequest() {
		return {
			scope: {
				data: "="
			},
			templateUrl: MyApplication.rootPath + '/amortisasirequest/template/edit.tmpl.cshtml',
			controller: controller,
			controllerAs: 'vm'
		}
	}

	controller.$inject = ['$scope', '$modal', 'Upload', '$timeout', 'AmortisasiRequestService', 'employeeService', 'departmentService', 'PurchaseorderService'];
	function controller($scope, $modal, Upload, $timeout, AmortisasiRequestService, employeeService, departmentService, PurchaseorderService) {
		var vm = this;
		vm.save = save;
		vm.saving = false;
		vm.amortisasirequest = angular.copy($scope.data);
		vm.pathDO = "Files/deliveryorder/";
		vm.pathPR = "Files/purchaserequest/";
		vm.pathET = "Files/enquirytabungan/";
        vm.kartuAmortisasi = vm.amortisasirequest.listKartuAmortisasi;
        //vm.kartuAmortisasi =[];
		vm.totalBeban = 0;
		vm.bebanperbulan = 0;
		
		var reffCode = [];
		for (var i = 0; i < vm.amortisasirequest.jurnalDetail.length; i++) {
		    var CekAda = 0;
		    for (var b = 0; b < reffCode.length; b++) {
		        if (reffCode[b] == vm.amortisasirequest.jurnalDetail[i].ref_code) {
		            CekAda++;
		        }
		    }
		    if (CekAda == 0) {
		        reffCode.push(vm.amortisasirequest.jurnalDetail[i].ref_code);
		    }
		}
		vm.counterJurnalDetail = reffCode.length;
		vm.tableActions = {
		    onDelete: deleteData,
		    onEdit: editdata
		};
		function deleteData(data) {
		    var OldData = [];
		    for (var i = 0; i < vm.amortisasirequest.jurnalDetail.length; i++) {
		        if (vm.amortisasirequest.jurnalDetail[i].ref_code == data.ref_code) {
		            OldData.push(vm.amortisasirequest.jurnalDetail[i]);
		        }
		    }
		    if (confirm("Delete Jurnal Detail?")) {
		        vm.amortisasirequest.jurnalDetail.splice(vm.amortisasirequest.jurnalDetail.indexOf(OldData[0]), 1);
		        vm.amortisasirequest.jurnalDetail.splice(vm.amortisasirequest.jurnalDetail.indexOf(OldData[1]), 1);
		        vm.refreshData();
		    }
		}
		function editdata(val) {
		    var oldData = [];
		    for (var i = 0; i < vm.amortisasirequest.jurnalDetail.length; i++) {
		        if (vm.amortisasirequest.jurnalDetail[i].ref_code == val.ref_code) {
		            oldData.push(vm.amortisasirequest.jurnalDetail[i]);
		        }
		    }
		    var data = oldData;
		    var modalInstance = $modal.open({
		        windowClass: 'form-modal-window-1200',
		        backdrop: 'static',
		        template: '<detailjurnal-amortisasirequest data="data"/>',
		        scope: angular.extend($scope.$new(true), { data: data })
		    });

		    modalInstance.result.then(function (data) {
		        vm.amortisasirequest.jurnalDetail[vm.amortisasirequest.jurnalDetail.indexOf(oldData[0])] = data[0];
		        vm.amortisasirequest.jurnalDetail[vm.amortisasirequest.jurnalDetail.indexOf(oldData[1])] = data[1];
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
		        template: '<detailjurnal-amortisasirequest data="data"/>',
		        scope: angular.extend($scope.$new(true), {
		            data: [{
		                value_date: new Date(),
		                currency: '',
		                narative: '',
		                ref_code: vm.amortisasirequest.requestId + vm.counterJurnalDetail.toString(),
		                amount: amount
		            }, {
		                value_date: new Date(),
		                currency: '',
		                narative: '',
		                ref_code: vm.amortisasirequest.requestId + vm.counterJurnalDetail.toString(),
		                amount: amount
		            }]
		        })
		    });

		    modalInstance.result.then(function (data) {
		        vm.amortisasirequest.jurnalDetail.push(data[0]);
		        vm.amortisasirequest.jurnalDetail.push(data[1]);
		        vm.refreshData();
		    }, function () {
		        //$log.info('Modal dismissed at: ' + new Date());
		    });
		}
	    //Grid Amortisasi Jurnal Detail

	    //Pick List Delivery Order
        
		vm.selectedDeliveryOrder = {
		    id: vm.amortisasirequest.dOid,
		    deliveryOrderId: vm.amortisasirequest.do_DeliveryOrderId
		};
		vm.deliveryOrderGetPage = AmortisasiRequestService.getDeliveryOrder;
		vm.onSelectDeliveryOrder =
        function () {
            vm.amortisasirequest.dOid = vm.selectedDeliveryOrder.id;
            vm.amortisasirequest.do_PurchaseOrderId = vm.selectedDeliveryOrder.purchaseOrderId;
            vm.amortisasirequest.do_DeliveryOrderId = vm.selectedDeliveryOrder.deliveryOrderId;
            vm.amortisasirequest.do_DeliveryOrderDate = vm.selectedDeliveryOrder.deliveryOrderDate;
            vm.amortisasirequest.do_StatusBarang = vm.selectedDeliveryOrder.statusBarang;
            vm.amortisasirequest.do_Receiver = vm.selectedDeliveryOrder.receiver;
            vm.amortisasirequest.do_Condition = vm.selectedDeliveryOrder.condition;
            vm.amortisasirequest.do_attachmentTandaTerima = vm.selectedDeliveryOrder.attachmentTandaTerima;
            vm.amortisasirequest.do_Description = vm.selectedDeliveryOrder.description;
            vm.amortisasirequest.pO_EnquiryId = vm.selectedDeliveryOrder.pO_EnquiryId;
            vm.amortisasirequest.pO_DetailBarangId = vm.selectedDeliveryOrder.pO_DetailBarangId;
            vm.amortisasirequest.pO_POId = vm.selectedDeliveryOrder.pO_POId;
            vm.amortisasirequest.pO_PODate = vm.selectedDeliveryOrder.pO_PODate;
            vm.amortisasirequest.pO_POGroupId = vm.selectedDeliveryOrder.pO_POGroupId;
            vm.amortisasirequest.pO_CategoryId = vm.selectedDeliveryOrder.pO_CategoryId;
            vm.amortisasirequest.pO_PolaId = vm.selectedDeliveryOrder.pO_PolaId;
            vm.amortisasirequest.pO_UnitId = vm.selectedDeliveryOrder.pO_UnitId;
            vm.amortisasirequest.pO_TypeId = vm.selectedDeliveryOrder.pO_TypeId;
            vm.amortisasirequest.pO_PaymentMethod = vm.selectedDeliveryOrder.pO_PaymentMethod;
            vm.amortisasirequest.pO_PaymentType = vm.selectedDeliveryOrder.pO_PaymentType;
            vm.amortisasirequest.pO_DPAmount = vm.selectedDeliveryOrder.pO_DPAmount;
            vm.amortisasirequest.pO_Quantity = vm.selectedDeliveryOrder.pO_Quantity;
            vm.amortisasirequest.pO_Currency = vm.selectedDeliveryOrder.pO_Currency;
            vm.amortisasirequest.pO_NominalBarang = vm.selectedDeliveryOrder.pO_NominalBarang;
            vm.amortisasirequest.pO_NominalPurchase = vm.selectedDeliveryOrder.pO_NominalPurchase;
            vm.amortisasirequest.pO_TotalPurchase = vm.selectedDeliveryOrder.pO_TotalPurchase;
            vm.amortisasirequest.pO_SupplierId = vm.selectedDeliveryOrder.pO_SupplierId;
            vm.amortisasirequest.pO_NilaiBuku = vm.selectedDeliveryOrder.pO_NilaiBuku;
            vm.amortisasirequest.pO_NikEmp = vm.selectedDeliveryOrder.pO_NikEmp;
            vm.amortisasirequest.pO_DeptId = vm.selectedDeliveryOrder.pO_DeptId;
            vm.amortisasirequest.pO_VendorQuotationNo = vm.selectedDeliveryOrder.pO_VendorQuotationNo;
            vm.amortisasirequest.pO_VendorQuotationDate = vm.selectedDeliveryOrder.pO_VendorQuotationDate;
            vm.amortisasirequest.pO_VendorQuotationAmount = vm.selectedDeliveryOrder.pO_VendorQuotationAmount;
            vm.amortisasirequest.pO_VendorInvoiceNo = vm.selectedDeliveryOrder.pO_VendorInvoiceNo;
            vm.amortisasirequest.pO_VendorInvoiceDate = vm.selectedDeliveryOrder.pO_VendorInvoiceDate;
            vm.amortisasirequest.pO_VendorInvoiceAmount = vm.selectedDeliveryOrder.pO_VendorInvoiceAmount;
            vm.amortisasirequest.pO_PODescription = vm.selectedDeliveryOrder.pO_PODescription;
            vm.amortisasirequest.pO_ApproveBy2 = vm.selectedDeliveryOrder.pO_ApproveBy2;
            vm.amortisasirequest.pO_ApproveDate2 = vm.selectedDeliveryOrder.pO_ApproveDate2;
            vm.amortisasirequest.pO_StatusData2 = vm.selectedDeliveryOrder.pO_StatusData2;
            vm.amortisasirequest.dB_EnquiryId = vm.selectedDeliveryOrder.dB_EnquiryId;
            vm.amortisasirequest.dB_PromotionCode = vm.selectedDeliveryOrder.dB_PromotionCode;
            vm.amortisasirequest.dB_KategoriBarang = vm.selectedDeliveryOrder.dB_KategoriBarang;
            vm.amortisasirequest.dB_TypeBarang = vm.selectedDeliveryOrder.dB_TypeBarang;
            vm.amortisasirequest.dB_Merek = vm.selectedDeliveryOrder.dB_Merek;
            vm.amortisasirequest.dB_Penalty = vm.selectedDeliveryOrder.dB_Penalty;
            vm.amortisasirequest.dB_Quantity = vm.selectedDeliveryOrder.dB_Quantity;
            vm.amortisasirequest.dB_Warna = vm.selectedDeliveryOrder.dB_Warna;
            vm.amortisasirequest.pR_TglBukaRekening = vm.selectedDeliveryOrder.pR_TglBukaRekening;
            vm.amortisasirequest.pR_JenisTabungan = vm.selectedDeliveryOrder.pR_JenisTabungan;
            vm.amortisasirequest.pR_NoRekening = vm.selectedDeliveryOrder.pR_NoRekening;
            vm.amortisasirequest.pR_NoCif = vm.selectedDeliveryOrder.pR_NoCif;
            vm.amortisasirequest.pR_NamaNasabah = vm.selectedDeliveryOrder.pR_NamaNasabah;
            vm.amortisasirequest.pR_KodePromosi = vm.selectedDeliveryOrder.pR_KodePromosi;
            vm.amortisasirequest.pR_Cabang = vm.selectedDeliveryOrder.pR_Cabang;
            vm.amortisasirequest.pR_StartDate = vm.selectedDeliveryOrder.pR_StartDate;
            vm.amortisasirequest.pR_MaturityDate = vm.selectedDeliveryOrder.pR_MaturityDate;
            vm.amortisasirequest.pR_Nominal = vm.selectedDeliveryOrder.pR_Nominal;
            vm.amortisasirequest.pR_PRId = vm.selectedDeliveryOrder.pR_PRId;
            vm.amortisasirequest.pR_PRDate = vm.selectedDeliveryOrder.pR_PRDate;
            vm.amortisasirequest.pR_DraftPRId = vm.selectedDeliveryOrder.pR_DraftPRId;
            vm.amortisasirequest.pR_DraftPRDate = vm.selectedDeliveryOrder.pR_DraftPRDate;
            vm.amortisasirequest.pR_AttachmentSPNasabah = vm.selectedDeliveryOrder.pR_AttachmentSPNasabah;
            vm.amortisasirequest.pR_Requester = vm.selectedDeliveryOrder.pR_Requester;
            vm.amortisasirequest.pR_RewardBudget = vm.selectedDeliveryOrder.pR_RewardBudget;
            vm.amortisasirequest.pR_AttachmentMemoDireksi = vm.selectedDeliveryOrder.pR_AttachmentMemoDireksi;
            vm.amortisasirequest.pR_CatatanCabang = vm.selectedDeliveryOrder.pR_CatatanCabang;
            vm.amortisasirequest.pR_CatatanFProduct = vm.selectedDeliveryOrder.pR_CatatanFProduct;
            vm.amortisasirequest.pR_DetailBarangId = vm.selectedDeliveryOrder.pR_DetailBarangId;
            vm.amortisasirequest.pR_ApproveBy2 = vm.selectedDeliveryOrder.pR_ApproveBy2;
            vm.amortisasirequest.pR_ApproveDate2 = vm.selectedDeliveryOrder.pR_ApproveDate2;
            vm.amortisasirequest.pR_StatusData2 = vm.selectedDeliveryOrder.pR_StatusData2;
            vm.setKartuAmortisasi();
        }

		vm.setKartuAmortisasi = function () {
		    if (vm.amortisasirequest.pR_StartDate != vm.amortisasirequest.pR_MaturityDate) {
		        var startdate = new Date(vm.amortisasirequest.pR_StartDate);
		        var endate = new Date(vm.amortisasirequest.pR_MaturityDate);
		        var loopdate = startdate;
		        var jumbulan = 0;
		        vm.kartuAmortisasi = [];
		        if (endate.getFullYear() == startdate.getFullYear()) {
		            jumbulan = endate.getMonth() - startdate.getMonth();
		        } else if (endate.getFullYear() > startdate.getFullYear()) {
		            jumbulan = (endate.getMonth() + ((endate.getFullYear() - startdate.getFullYear()) * 12)) - startdate.getMonth();
		        }
		        vm.totalBeban = vm.amortisasirequest.pO_TotalPurchase / 0.8;
		        //+ (20 / 100 * vm.amortisasirequest.pO_NominalBarang)
		        vm.bebanperbulan = parseFloat(vm.totalBeban / jumbulan).toFixed(2);
		        vm.beban = vm.bebanperbulan;
		        vm.bebanPertamax = vm.beban;
		        var j = 0;
		        var dateNow = new Date();
		        for (var i = 0; i < jumbulan; i++) {
		            var nextMonth = angular.copy(loopdate);
		            nextMonth.setMonth(nextMonth.getMonth() + 1);
		            if (nextMonth < dateNow) {
		                vm.beban = parseFloat(vm.beban) + parseFloat(vm.bebanperbulan);
		                vm.beban = parseFloat(vm.beban).toFixed(2);
		                vm.bebanPertamax = vm.beban;
		            }
		            else {

		                // Periode Terakhir
		                if (i == jumbulan - 1) {
		                    vm.totalAmor = 0;
		                    for (var k = 0; k < vm.kartuAmortisasi.length; k++) {
		                        vm.totalAmor = vm.totalAmor + parseFloat(vm.kartuAmortisasi[k].amortizeAmount);
		                    }
		                    vm.beban = vm.totalBeban - vm.totalAmor;
		                }

		                vm.kartuAmortisasi.push({ periode: j + 1, valueDate: angular.copy(loopdate), amortizeAmount: parseFloat(vm.beban).toFixed(2) });
		                if (j == 0)
		                    vm.kartuAmortisasi[0].isProceed = true;
		                vm.beban = vm.bebanperbulan;
		                j++;
		            }
		            loopdate.setMonth(loopdate.getMonth() + 1);
		        }

		        vm.amortisasirequest.listKartuAmortisasi = vm.kartuAmortisasi;
		        vm.amortisasirequest.pO_NilaiBuku = parseFloat(vm.totalBeban) - parseFloat(vm.bebanPertamax);
		        vm.amortisasirequest.jurnalDetail = [];
		        AmortisasiRequestService.processJurnalOtomatis({ poNo: vm.selectedPurchaseOrder.poId, narrative: vm.amortisasirequest.requestId }).then(function (data) {
		            for (var i = 0; i < data.data.length; i++) {
		                data.data[i].amount = vm.bebanPertamax;
		                vm.amortisasirequest.jurnalDetail.push(data.data[i]);
		            }
		            vm.refreshData();
		        });
		    }
		}

	    //Pick List Delivery Order
	    //Pick List Purchase Order
		vm.selectedPurchaseOrder = { id: vm.amortisasirequest.poId, poId: vm.amortisasirequest.pO_POId };
		vm.purchaseOrderGetPage = AmortisasiRequestService.getPurchaseOrder;
		vm.onSelectPurchaseOrder =
        function () {
            if (vm.selectedPurchaseOrder != null) {

                PurchaseorderService.historyGetPage({ no: vm.selectedPurchaseOrder.poId, jenistabungan: 'TabunganSiPucukReward', cabang: '' }).then(function (data) {

                    vm.amortisasirequest.dB_EnquiryId = data.data[0].enquiryId;
                    vm.amortisasirequest.dB_PromotionCode = data.data[0].promotionCode;
                    vm.amortisasirequest.dB_KategoriBarang = data.data[0].kategoriBarang;
                    vm.amortisasirequest.dB_TypeBarang = data.data[0].typeBarang;
                    vm.amortisasirequest.dB_Merek = data.data[0].merek;
                    vm.amortisasirequest.dB_Penalty = data.data[0].penalty;
                    vm.amortisasirequest.dB_Quantity = data.data[0].quantity;
                    vm.amortisasirequest.dB_Warna = data.data[0].warna;
                    vm.amortisasirequest.pR_TglBukaRekening = data.data[0].tglBukaRekening;
                    vm.amortisasirequest.pR_JenisTabungan = data.data[0].jenisTabungan;
                    vm.amortisasirequest.pR_NoRekening = data.data[0].noRekening;
                    vm.amortisasirequest.pR_NoCif = data.data[0].noCif;
                    vm.amortisasirequest.pR_NamaNasabah = data.data[0].namaNasabah;
                    vm.amortisasirequest.pR_KodePromosi = data.data[0].kodePromosi;
                    vm.amortisasirequest.pR_Cabang = data.data[0].company_name;
                    vm.amortisasirequest.pR_StartDate = data.data[0].startDate;
                    vm.amortisasirequest.pR_MaturityDate = data.data[0].maturityDate;
                    vm.amortisasirequest.pR_Nominal = data.data[0].nominalPurchase;
                    vm.amortisasirequest.pR_PRId = data.data[0].prId;
                    vm.amortisasirequest.pR_PRDate = data.data[0].prDate;
                    vm.amortisasirequest.pR_DraftPRId = data.data[0].draftPRId;
                    vm.amortisasirequest.pR_DraftPRDate = data.data[0].draftPRDate;
                    vm.amortisasirequest.pR_AttachmentSPNasabah = data.data[0].attachmentSPNasabah;
                    vm.amortisasirequest.pR_Requester = data.data[0].requester;
                    vm.amortisasirequest.pR_RewardBudget = data.data[0].rewardBudget;
                    vm.amortisasirequest.pR_AttachmentMemoDireksi = data.data[0].attachmentMemoDireksi;
                    vm.amortisasirequest.pR_CatatanCabang = data.data[0].catatanCabang;
                    vm.amortisasirequest.pR_DetailBarangId = data.data[0].detailBarangId;
                    
                    vm.setKartuAmortisasi();

                })

                vm.amortisasirequest.pOid = vm.selectedPurchaseOrder.id;
                vm.amortisasirequest.pO_EnquiryId = vm.selectedPurchaseOrder.enquiryId;
                vm.amortisasirequest.pO_DetailBarangId = vm.selectedPurchaseOrder.detailBarangId;
                vm.amortisasirequest.pO_POId = vm.selectedPurchaseOrder.poId;
                vm.amortisasirequest.pO_PODate = vm.selectedPurchaseOrder.poDate;
                vm.amortisasirequest.pO_POGroupId = vm.selectedPurchaseOrder.poGroupId;
                vm.amortisasirequest.pO_CategoryId = vm.selectedPurchaseOrder.categoryId;
                vm.amortisasirequest.pO_PolaId = vm.selectedPurchaseOrder.polaId;
                vm.amortisasirequest.pO_UnitId = vm.selectedPurchaseOrder.unitId;
                vm.amortisasirequest.pO_TypeId = vm.selectedPurchaseOrder.typeId;
                vm.amortisasirequest.pO_PaymentMethod = vm.selectedPurchaseOrder.paymentMethod;
                vm.amortisasirequest.pO_PaymentType = vm.selectedPurchaseOrder.paymentType;
                vm.amortisasirequest.pO_DPAmount = vm.selectedPurchaseOrder.dpAmount;
                vm.amortisasirequest.pO_Quantity = vm.selectedPurchaseOrder.quantity;
                vm.amortisasirequest.pO_Currency = vm.selectedPurchaseOrder.currency;
                vm.amortisasirequest.pO_NominalBarang = vm.selectedPurchaseOrder.nominalBarang;
                vm.amortisasirequest.pO_NominalPurchase = vm.selectedPurchaseOrder.nominalPurchase;
                vm.amortisasirequest.pO_TotalPurchase = vm.selectedPurchaseOrder.totalPurchase;
                vm.amortisasirequest.pO_SupplierId = vm.selectedPurchaseOrder.supplierId;
                //vm.amortisasirequest.pO_NilaiBuku = vm.selectedPurchaseOrder.nilaiBuku;
                vm.amortisasirequest.pO_NikEmp = vm.selectedPurchaseOrder.nikEmp;
                vm.amortisasirequest.pO_DeptId = vm.selectedPurchaseOrder.deptId;
                vm.amortisasirequest.pO_VendorQuotationNo = vm.selectedPurchaseOrder.vendorQuotationNo;
                vm.amortisasirequest.pO_VendorQuotationDate = vm.selectedPurchaseOrder.vendorQuotationDate;
                vm.amortisasirequest.pO_VendorQuotationAmount = vm.selectedPurchaseOrder.vendorQuotationAmount;
                vm.amortisasirequest.pO_VendorInvoiceNo = vm.selectedPurchaseOrder.vendorInvoiceNo;
                vm.amortisasirequest.pO_VendorInvoiceDate = vm.selectedPurchaseOrder.vendorInvoiceDate;
                vm.amortisasirequest.pO_VendorInvoiceAmount = vm.selectedPurchaseOrder.vendorInvoiceAmount;
                vm.amortisasirequest.pO_PODescription = vm.selectedPurchaseOrder.poDescription;
                vm.amortisasirequest.pO_ApproveBy2 = vm.selectedPurchaseOrder.approveBy2;
                vm.amortisasirequest.pO_ApproveDate2 = vm.selectedPurchaseOrder.approveDate2;
                vm.amortisasirequest.pO_StatusData2 = vm.selectedPurchaseOrder.statusData2;
                //vm.amortisasirequest.dB_EnquiryId = vm.selectedPurchaseOrder.enquiryId;
                //vm.amortisasirequest.dB_PromotionCode = vm.selectedPurchaseOrder.promotionCode;
                //vm.amortisasirequest.dB_KategoriBarang = vm.selectedPurchaseOrder.kategoriBarang;
                //vm.amortisasirequest.dB_TypeBarang = vm.selectedPurchaseOrder.typeBarang;
                //vm.amortisasirequest.dB_Merek = vm.selectedPurchaseOrder.merek;
                //vm.amortisasirequest.dB_Penalty = vm.selectedPurchaseOrder.penalty;
                //vm.amortisasirequest.dB_Quantity = vm.selectedPurchaseOrder.quantity;
                //vm.amortisasirequest.dB_Warna = vm.selectedPurchaseOrder.warna;
                //vm.amortisasirequest.pR_TglBukaRekening = vm.selectedPurchaseOrder.tglBukaRekening;
                //vm.amortisasirequest.pR_JenisTabungan = vm.selectedPurchaseOrder.jenisTabungan;
                //vm.amortisasirequest.pR_NoRekening = vm.selectedPurchaseOrder.noRekening;
                //vm.amortisasirequest.pR_NoCif = vm.selectedPurchaseOrder.noCif;
                //vm.amortisasirequest.pR_NamaNasabah = vm.selectedPurchaseOrder.namaNasabah;
                //vm.amortisasirequest.pR_KodePromosi = vm.selectedPurchaseOrder.kodePromosi;
                //vm.amortisasirequest.pR_Cabang = vm.selectedPurchaseOrder.cabang;
                //vm.amortisasirequest.pR_StartDate = vm.selectedPurchaseOrder.startDate;
                //vm.amortisasirequest.pR_MaturityDate = vm.selectedPurchaseOrder.maturityDate;
                //vm.amortisasirequest.pR_Nominal = vm.selectedPurchaseOrder.nominal;
                //vm.amortisasirequest.pR_PRId = vm.selectedPurchaseOrder.pRId;
                //vm.amortisasirequest.pR_PRDate = vm.selectedPurchaseOrder.pRDate;
                //vm.amortisasirequest.pR_DraftPRId = vm.selectedPurchaseOrder.draftPRId;
                //vm.amortisasirequest.pR_DraftPRDate = vm.selectedPurchaseOrder.draftPRDate;
                //vm.amortisasirequest.pR_AttachmentSPNasabah = vm.selectedPurchaseOrder.attachmentSPNasabah;
                //vm.amortisasirequest.pR_Requester = vm.selectedPurchaseOrder.requester;
                //vm.amortisasirequest.pR_RewardBudget = vm.selectedPurchaseOrder.rewardBudget;
                //vm.amortisasirequest.pR_AttachmentMemoDireksi = vm.selectedPurchaseOrder.attachmentMemoDireksi;
                //vm.amortisasirequest.pR_CatatanCabang = vm.selectedPurchaseOrder.catatanCabang;
                //vm.amortisasirequest.pR_CatatanFProduct = vm.selectedPurchaseOrder.catatanFProduct;
                //vm.amortisasirequest.pR_DetailBarangId = vm.selectedPurchaseOrder.detailBarangId;
                //vm.amortisasirequest.pR_ApproveBy2 = vm.selectedPurchaseOrder.approveBy2;
                //vm.amortisasirequest.pR_ApproveDate2 = vm.selectedPurchaseOrder.approveDate2;
                //vm.amortisasirequest.pR_StatusData2 = vm.selectedPurchaseOrder.statusData2;
            }
            else {
                vm.amortisasirequest.pOid = null;
                vm.amortisasirequest.pO_EnquiryId = null;
                vm.amortisasirequest.pO_DetailBarangId = null;
                vm.amortisasirequest.pO_POId = null;
                vm.amortisasirequest.pO_PODate = null;
                vm.amortisasirequest.pO_POGroupId = null;
                vm.amortisasirequest.pO_CategoryId = null;
                vm.amortisasirequest.pO_PolaId = null;
                vm.amortisasirequest.pO_UnitId = null;
                vm.amortisasirequest.pO_TypeId = null;
                vm.amortisasirequest.pO_PaymentMethod = null;
                vm.amortisasirequest.pO_PaymentType = null;
                vm.amortisasirequest.pO_DPAmount = null;
                vm.amortisasirequest.pO_Quantity = null;
                vm.amortisasirequest.pO_Currency = null;
                vm.amortisasirequest.pO_NominalBarang = null;
                vm.amortisasirequest.pO_NominalPurchase = null;
                vm.amortisasirequest.pO_TotalPurchase = null;
                vm.amortisasirequest.pO_SupplierId = null;
                vm.amortisasirequest.pO_NilaiBuku = null;
                vm.amortisasirequest.pO_NikEmp = null;
                vm.amortisasirequest.pO_DeptId = null;
                vm.amortisasirequest.pO_VendorQuotationNo = null;
                vm.amortisasirequest.pO_VendorQuotationDate = null;
                vm.amortisasirequest.pO_VendorQuotationAmount = null;
                vm.amortisasirequest.pO_VendorInvoiceNo = null;
                vm.amortisasirequest.pO_VendorInvoiceDate = null;
                vm.amortisasirequest.pO_VendorInvoiceAmount = null;
                vm.amortisasirequest.pO_PODescription = null;
                vm.amortisasirequest.pO_ApproveBy2 = null;
                vm.amortisasirequest.pO_ApproveDate2 = null;
                vm.amortisasirequest.pO_StatusData2 = null;

                vm.amortisasirequest.dB_EnquiryId = null;
                vm.amortisasirequest.dB_PromotionCode = null;
                vm.amortisasirequest.dB_KategoriBarang = null;
                vm.amortisasirequest.dB_TypeBarang = null;
                vm.amortisasirequest.dB_Merek = null;
                vm.amortisasirequest.dB_Penalty = null;
                vm.amortisasirequest.dB_Quantity = null;
                vm.amortisasirequest.dB_Warna = null;
                vm.amortisasirequest.pR_TglBukaRekening = null;
                vm.amortisasirequest.pR_JenisTabungan = null;
                vm.amortisasirequest.pR_NoRekening = null;
                vm.amortisasirequest.pR_NoCif = null;
                vm.amortisasirequest.pR_NamaNasabah = null;
                vm.amortisasirequest.pR_KodePromosi = null;
                vm.amortisasirequest.pR_Cabang = null;
                vm.amortisasirequest.pR_StartDate = null;
                vm.amortisasirequest.pR_MaturityDate = null;
                vm.amortisasirequest.pR_Nominal = null;
                vm.amortisasirequest.pR_PRId = null;
                vm.amortisasirequest.pR_PRDate = null;
                vm.amortisasirequest.pR_DraftPRId = null;
                vm.amortisasirequest.pR_DraftPRDate = null;
                vm.amortisasirequest.pR_AttachmentSPNasabah = null;
                vm.amortisasirequest.pR_Requester = null;
                vm.amortisasirequest.pR_RewardBudget = null;
                vm.amortisasirequest.pR_AttachmentMemoDireksi = null;
                vm.amortisasirequest.pR_CatatanCabang = null;
                //vm.amortisasirequest.pR_CatatanFProduct = data.data[0].catatanFProduct;
                vm.amortisasirequest.pR_DetailBarangId = null;

                vm.kartuAmortisasi = [];
                vm.totalBeban = 0;
                vm.bebanperbulan = 0;
            }

        }
	    //Pick List Purchase Order



		    vm.viewOrDownload = function (namafile) {
		        window.open(
                    MyApplication.rootPath + namafile,
                    '_blank'
                );
		    }
		    vm.setKartuAmortisasi();

    function save() {
		        if (vm.amortisasirequest.jurnalDetail.length == 0) {
		            alert("Detail Jurnal Amortisasi Harus diisi!")
		            return false;
		        }
		    vm.saving = true;
		    vm.amortisasirequest.attachmentAmortisasiRequest = vm.attachmentAmortisasiRequestTemp;
		    AmortisasiRequestService.update($scope.data, vm.amortisasirequest)
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