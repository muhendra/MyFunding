using AutoMapper;
using Core.Web.Utilities;
using Heroic.AutoMapper;
using MyWeb.Models;
using MyWeb.Models.Reward;
using MyWeb.ViewModels.MyReward;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace MyWeb.ViewModels.Reward
{
    public class AmortisasiRequestViewModel : IMapFrom<AmortisasiRequest>, IHaveCustomMappings
	{

        public int Id { get; set; }
        public string RequestId { get; set; }

        public string NoRekening { get; set; }
        public int? DOid { get; set; }
        [DataType(DataType.Date)]
        public DateTime RequestDate { get; set; }

        /// <summary>
        /// Do View
        /// </summary>
        [Display(Name="Purchase Order Id")]
        public int Do_PurchaseOrderId { get; set; }
        public string Do_DeliveryOrderId { get; set; }
        public DateTime? Do_DeliveryOrderDate { get; set; }
        public StatusBarang Do_StatusBarang { get; set; }
        public string Do_Receiver { get; set; }
        public Condition Do_Condition { get; set; }
        public string Do_attachmentTandaTerima { get; set; }
        public string Do_Description { get; set; }

        /// <summary>
        /// Purchase Order (PO)
        /// </summary>
        public int PO_EnquiryId { get; set; }
        public int? PO_DetailBarangId { get; set; }
        //public int PO_POId { get; set; }
        public string PO_POId { get; set; }
        public DateTime? PO_PODate { get; set; }
        public string PO_POGroupId { get; set; }
        public string PO_CategoryId { get; set; }
        public string PO_PolaId { get; set; }
        public UnitId PO_UnitId { get; set; }
        public string PO_TypeId { get; set; }
        public PaymentMethod PO_PaymentMethod { get; set; }
        public PaymentType PO_PaymentType { get; set; }
        public decimal PO_DPAmount { get; set; }
        public int? PO_Quantity { get; set; }
        public Currency PO_Currency { get; set; }
        public decimal PO_NominalBarang { get; set; }
        public decimal PO_NominalPurchase { get; set; }
        public decimal PO_TotalPurchase { get; set; }
        public string PO_SupplierId { get; set; }
        public decimal? PO_NilaiBuku { get; set; }
        public string PO_NikEmp { get; set; }
        public string PO_DeptId { get; set; }
        public string PO_VendorQuotationNo { get; set; }
        public DateTime? PO_VendorQuotationDate { get; set; }
        public decimal PO_VendorQuotationAmount { get; set; }
        public string PO_VendorInvoiceNo { get; set; }
        public DateTime? PO_VendorInvoiceDate { get; set; }
        public decimal PO_VendorInvoiceAmount { get; set; }
        public string PO_PODescription { get; set; }
        public string PO_ApproveBy2 { get; set; }
        public DateTime? PO_ApproveDate2 { get; set; }
        public StatusData PO_StatusData2 { get; set; }

        /// <summary>
        /// Detail Barang
        /// </summary>

        public int? DB_EnquiryId { get; set; }
        public string DB_PromotionCode { get; set; }
        public string DB_KategoriBarang { get; set; }
        public string DB_TypeBarang { get; set; }
        public string DB_Merek { get; set; }
        public decimal DB_Penalty { get; set; }
        public int? DB_Quantity { get; set; }
        public string DB_Warna { get; set; }

        /// <summary>
        /// Enquery Tabungan/ Purchase Request (PR)
        /// </summary>
        public DateTime? PR_TglBukaRekening { get; set; }
        public JenisTabungan PR_JenisTabungan { get; set; }
        public string PR_NoRekening { get; set; }
        public string PR_NoCif { get; set; }
        public string PR_NamaNasabah { get; set; }
        public string PR_KodePromosi { get; set; }
        public string PR_Cabang { get; set; }

        public string NamaCabang { get; set; }
        public DateTime? PR_StartDate { get; set; }
        public DateTime? PR_MaturityDate { get; set; }
        public decimal PR_Nominal { get; set; }
        public string PR_PRId { get; set; }
        public DateTime? PR_PRDate { get; set; }
        public string PR_DraftPRId { get; set; }
        public DateTime? PR_DraftPRDate { get; set; }
        public string PR_AttachmentSPNasabah { get; set; }
        public string PR_Requester { get; set; }
        public decimal PR_RewardBudget { get; set; }
        public string PR_AttachmentMemoDireksi { get; set; }
        public string PR_CatatanCabang { get; set; }
        public string PR_CatatanFProduct { get; set; }
        public int? PR_DetailBarangId { get; set; }
        public string PR_ApproveBy2 { get; set; }
        public DateTime? PR_ApproveDate2 { get; set; }
        public StatusData PR_StatusData2 { get; set; }


        public virtual PaymentRequest PaymentRequestMod { get; set; }
        public virtual PurchaseReceive PurchaseReceiveMod { get; set; }
        public List<AmortisasiRequestDetailViewModel> jurnalDetail { get; set; }

        public List<KartuAmortisasiViewModel> ListKartuAmortisasi { get; set; }
        public int MyProperty { get; set; }

        public string CreateBy { get; set; }
        public DateTime? CreateDate { get; set; }
        public string UpdateBy { get; set; }
        public DateTime? UpdateDate { get; set; }
        public string ApproveBy { get; set; }
        public DateTime? ApproveDate { get; set; }
        public StatusData StatusData { get; set; }

        public int? POId { get; set; }

        

        public void CreateMappings(IConfiguration configuration)
        {
            configuration.CreateMap<AmortisasiRequestViewModel, AmortisasiRequest>();
                //.ForAllMembers(opt => opt.Condition(srs => !srs.IsSourceValueNull)); 
            configuration.CreateMap<AmortisasiRequest, AmortisasiRequestViewModel>()
                //.ForMember(dto => dto.Do_PurchaseOrderId, opt => opt.MapFrom(s => s.DeliveryOrderMod.PurchaseOrderId))
                //.ForMember(dto => dto.Do_DeliveryOrderId,  opt => opt.MapFrom(s => s.DeliveryOrderMod.DeliveryOrderId))
                //.ForMember(dto => dto.Do_DeliveryOrderDate,  opt => opt.MapFrom(s => s.DeliveryOrderMod.DeliveryOrderDate))
                //.ForMember(dto => dto.Do_StatusBarang,  opt => opt.MapFrom(s => s.DeliveryOrderMod.StatusBarang))
                //.ForMember(dto => dto.Do_Receiver,  opt => opt.MapFrom(s => s.DeliveryOrderMod.Receiver))
                //.ForMember(dto => dto.Do_Condition,  opt => opt.MapFrom(s => s.DeliveryOrderMod.Condition))
                //.ForMember(dto => dto.Do_attachmentTandaTerima,  opt => opt.MapFrom(s => s.DeliveryOrderMod.attachmentTandaTerima))
                //.ForMember(dto => dto.Do_Description,  opt => opt.MapFrom(s => s.DeliveryOrderMod.Description))
                
                .ForMember(dto => dto.PO_EnquiryId,  opt => opt.MapFrom(s => s.PurchaseOrder.EnquiryId))
                .ForMember(dto => dto.PO_DetailBarangId,  opt => opt.MapFrom(s => s.PurchaseOrder.DetailBarangId))
                //.ForMember(dto => dto.PO_POId,  opt => opt.MapFrom(s => s.PurchaseOrder.POId))
                .ForMember(dto => dto.PO_POId, opt => opt.MapFrom(s => s.PurchaseOrder.POId))
                .ForMember(dto => dto.PO_PODate,  opt => opt.MapFrom(s => s.PurchaseOrder.PODate))
                .ForMember(dto => dto.PO_POGroupId,  opt => opt.MapFrom(s => s.PurchaseOrder.POGroupId))
                .ForMember(dto => dto.PO_CategoryId,  opt => opt.MapFrom(s => s.PurchaseOrder.CategoryId))
                .ForMember(dto => dto.PO_PolaId,  opt => opt.MapFrom(s => s.PurchaseOrder.PolaId))
                .ForMember(dto => dto.PO_UnitId,  opt => opt.MapFrom(s => s.PurchaseOrder.UnitId))
                .ForMember(dto => dto.PO_TypeId,  opt => opt.MapFrom(s => s.PurchaseOrder.TypeId))
                .ForMember(dto => dto.PO_PaymentMethod,  opt => opt.MapFrom(s => s.PurchaseOrder.PaymentMethod))
                .ForMember(dto => dto.PO_PaymentType,  opt => opt.MapFrom(s => s.PurchaseOrder.PaymentType))
                .ForMember(dto => dto.PO_DPAmount,  opt => opt.MapFrom(s => s.PurchaseOrder.DPAmount))
                .ForMember(dto => dto.PO_Quantity,  opt => opt.MapFrom(s => s.PurchaseOrder.Quantity))
                .ForMember(dto => dto.PO_Currency,  opt => opt.MapFrom(s => s.PurchaseOrder.Currency))
                .ForMember(dto => dto.PO_NominalBarang,  opt => opt.MapFrom(s => s.PurchaseOrder.NominalBarang))
                .ForMember(dto => dto.PO_NominalPurchase,  opt => opt.MapFrom(s => s.PurchaseOrder.NominalPurchase))
                .ForMember(dto => dto.PO_TotalPurchase,  opt => opt.MapFrom(s => s.PurchaseOrder.TotalPurchase))
                .ForMember(dto => dto.PO_SupplierId,  opt => opt.MapFrom(s => s.PurchaseOrder.SupplierId))
                .ForMember(dto => dto.PO_NilaiBuku,  opt => opt.MapFrom(s => s.PurchaseOrder.NilaiBuku))
                .ForMember(dto => dto.PO_NikEmp,  opt => opt.MapFrom(s => s.PurchaseOrder.NikEmp))
                .ForMember(dto => dto.PO_DeptId,  opt => opt.MapFrom(s => s.PurchaseOrder.DeptId))
                .ForMember(dto => dto.PO_VendorQuotationNo,  opt => opt.MapFrom(s => s.PurchaseOrder.VendorQuotationNo))
                .ForMember(dto => dto.PO_VendorQuotationDate,  opt => opt.MapFrom(s => s.PurchaseOrder.VendorQuotationDate))
                .ForMember(dto => dto.PO_VendorQuotationAmount,  opt => opt.MapFrom(s => s.PurchaseOrder.VendorQuotationAmount))
                .ForMember(dto => dto.PO_VendorInvoiceNo,  opt => opt.MapFrom(s => s.PurchaseOrder.VendorInvoiceNo))
                .ForMember(dto => dto.PO_VendorInvoiceDate,  opt => opt.MapFrom(s => s.PurchaseOrder.VendorInvoiceDate))
                .ForMember(dto => dto.PO_VendorInvoiceAmount,  opt => opt.MapFrom(s => s.PurchaseOrder.VendorInvoiceAmount))
                .ForMember(dto => dto.PO_PODescription,  opt => opt.MapFrom(s => s.PurchaseOrder.PODescription))
                .ForMember(dto => dto.PO_ApproveBy2,  opt => opt.MapFrom(s => s.PurchaseOrder.ApproveBy2))
                .ForMember(dto => dto.PO_ApproveDate2,  opt => opt.MapFrom(s => s.PurchaseOrder.ApproveDate2))
                .ForMember(dto => dto.PO_StatusData2,  opt => opt.MapFrom(s => s.PurchaseOrder.StatusData2))
                
                .ForMember(dto => dto.DB_EnquiryId,  opt => opt.MapFrom(s => s.PurchaseOrder.DetailBarang.EnquiryId))
                .ForMember(dto => dto.DB_PromotionCode,  opt => opt.MapFrom(s => s.PurchaseOrder.DetailBarang.PromotionCode))
                .ForMember(dto => dto.DB_KategoriBarang,  opt => opt.MapFrom(s => s.PurchaseOrder.DetailBarang.KategoriBarang))
                .ForMember(dto => dto.DB_TypeBarang,  opt => opt.MapFrom(s => s.PurchaseOrder.DetailBarang.TypeBarang))
                .ForMember(dto => dto.DB_Merek,  opt => opt.MapFrom(s => s.PurchaseOrder.DetailBarang.Merek))
                .ForMember(dto => dto.DB_Penalty,  opt => opt.MapFrom(s => s.PurchaseOrder.DetailBarang.Penalty))
                .ForMember(dto => dto.DB_Quantity,  opt => opt.MapFrom(s => s.PurchaseOrder.DetailBarang.Quantity))
                .ForMember(dto => dto.DB_Warna, opt => opt.MapFrom(s => s.PurchaseOrder.DetailBarang.Warna))

                .ForMember(dto => dto.PR_TglBukaRekening,  opt => opt.MapFrom(s => s.PurchaseOrder.EnquiryTabunganInput.TglBukaRekening))
                .ForMember(dto => dto.PR_JenisTabungan,  opt => opt.MapFrom(s => s.PurchaseOrder.EnquiryTabunganInput.JenisTabungan))
                .ForMember(dto => dto.PR_NoRekening,  opt => opt.MapFrom(s => s.PurchaseOrder.EnquiryTabunganInput.NoRekening))
                .ForMember(dto => dto.PR_NoCif,  opt => opt.MapFrom(s => s.PurchaseOrder.EnquiryTabunganInput.NoCif))
                .ForMember(dto => dto.PR_NamaNasabah,  opt => opt.MapFrom(s => s.PurchaseOrder.EnquiryTabunganInput.NamaNasabah))
                .ForMember(dto => dto.PR_KodePromosi,  opt => opt.MapFrom(s => s.PurchaseOrder.EnquiryTabunganInput.KodePromosi))
                .ForMember(dto => dto.PR_Cabang,  opt => opt.MapFrom(s => s.PurchaseOrder.EnquiryTabunganInput.Cabang))
                .ForMember(dto => dto.PR_StartDate,  opt => opt.MapFrom(s => s.PurchaseOrder.EnquiryTabunganInput.StartDate))
                .ForMember(dto => dto.PR_MaturityDate,  opt => opt.MapFrom(s => s.PurchaseOrder.EnquiryTabunganInput.MaturityDate))
                .ForMember(dto => dto.PR_Nominal,  opt => opt.MapFrom(s => s.PurchaseOrder.EnquiryTabunganInput.Nominal))
                .ForMember(dto => dto.PR_PRId,  opt => opt.MapFrom(s => s.PurchaseOrder.EnquiryTabunganInput.PRId))
                .ForMember(dto => dto.PR_PRDate,  opt => opt.MapFrom(s => s.PurchaseOrder.EnquiryTabunganInput.PRDate))
                .ForMember(dto => dto.PR_DraftPRId,  opt => opt.MapFrom(s => s.PurchaseOrder.EnquiryTabunganInput.DraftPRId))
                .ForMember(dto => dto.PR_DraftPRDate,  opt => opt.MapFrom(s => s.PurchaseOrder.EnquiryTabunganInput.DraftPRDate))
                .ForMember(dto => dto.PR_AttachmentSPNasabah,  opt => opt.MapFrom(s => s.PurchaseOrder.EnquiryTabunganInput.AttachmentSPNasabah))
                .ForMember(dto => dto.PR_Requester,  opt => opt.MapFrom(s => s.PurchaseOrder.EnquiryTabunganInput.Requester))
                .ForMember(dto => dto.PR_RewardBudget,  opt => opt.MapFrom(s => s.PurchaseOrder.EnquiryTabunganInput.RewardBudget))
                .ForMember(dto => dto.PR_AttachmentMemoDireksi,  opt => opt.MapFrom(s => s.PurchaseOrder.EnquiryTabunganInput.AttachmentMemoDireksi))
                .ForMember(dto => dto.PR_CatatanCabang,  opt => opt.MapFrom(s => s.PurchaseOrder.EnquiryTabunganInput.CatatanCabang))
                .ForMember(dto => dto.PR_CatatanFProduct,  opt => opt.MapFrom(s => s.PurchaseOrder.EnquiryTabunganInput.CatatanFProduct))
                .ForMember(dto => dto.PR_DetailBarangId,  opt => opt.MapFrom(s => s.PurchaseOrder.EnquiryTabunganInput.DetailBarangId))
                .ForMember(dto => dto.PR_ApproveBy2,  opt => opt.MapFrom(s => s.PurchaseOrder.EnquiryTabunganInput.ApproveBy2))
                .ForMember(dto => dto.PR_ApproveDate2,  opt => opt.MapFrom(s => s.PurchaseOrder.EnquiryTabunganInput.ApproveDate2))
                .ForMember(dto => dto.PR_StatusData2,  opt => opt.MapFrom(s => s.PurchaseOrder.EnquiryTabunganInput.StatusData2))

                .ForMember(dto => dto.NoRekening, opt => opt.MapFrom(s => s.PurchaseOrder.EnquiryTabunganInput.NoRekening))
                //.ForMember(dto => dto.CreateBy, m => m.Ignore())
                //.ForMember(dto => dto.UpdateBy, m => m.Ignore())
                .AfterMap((ent, dto) =>                                                             
                {
                    //if (ent.PurchaseOrder != null)
                    //{
                    //    dto.PO_EnquiryId = ent.PurchaseOrder.EnquiryId;
                    //    dto.PO_DetailBarangId = ent.PurchaseOrder.DetailBarangId;
                    //    dto.PO_POId = ent.PurchaseOrder.POId;
                    //    dto.PO_PODate = ent.PurchaseOrder.PODate;
                    //    dto.PO_POGroupId = ent.PurchaseOrder.POGroupId;
                    //    dto.PO_CategoryId = ent.PurchaseOrder.CategoryId;
                    //    dto.PO_PolaId = ent.PurchaseOrder.PolaId;
                    //    dto.PO_UnitId = ent.PurchaseOrder.UnitId;
                    //    dto.PO_TypeId = ent.PurchaseOrder.TypeId;
                    //    dto.PO_PaymentMethod = ent.PurchaseOrder.PaymentMethod;
                    //    dto.PO_PaymentType = ent.PurchaseOrder.PaymentType;
                    //    dto.PO_DPAmount = ent.PurchaseOrder.DPAmount;
                    //    dto.PO_Quantity = ent.PurchaseOrder.Quantity;
                    //    dto.PO_Currency = ent.PurchaseOrder.Currency;
                    //    dto.PO_NominalBarang = ent.PurchaseOrder.NominalBarang;
                    //    dto.PO_NominalPurchase = ent.PurchaseOrder.NominalPurchase;
                    //    dto.PO_TotalPurchase = ent.PurchaseOrder.TotalPurchase;
                    //    dto.PO_SupplierId = ent.PurchaseOrder.SupplierId;
                    //    dto.PO_NilaiBuku = ent.PurchaseOrder.NilaiBuku ?? 0;
                    //    dto.PO_NikEmp = ent.PurchaseOrder.NikEmp;
                    //    dto.PO_DeptId = ent.PurchaseOrder.DeptId;
                    //    dto.PO_VendorQuotationNo = ent.PurchaseOrder.VendorQuotationNo;
                    //    dto.PO_VendorQuotationDate = ent.PurchaseOrder.VendorQuotationDate;
                    //    dto.PO_VendorQuotationAmount = ent.PurchaseOrder.VendorQuotationAmount;
                    //    dto.PO_VendorInvoiceNo = ent.PurchaseOrder.VendorInvoiceNo;
                    //    dto.PO_VendorInvoiceDate = ent.PurchaseOrder.VendorInvoiceDate;
                    //    dto.PO_VendorInvoiceAmount = ent.PurchaseOrder.VendorInvoiceAmount;
                    //    dto.PO_PODescription = ent.PurchaseOrder.PODescription;
                    //    dto.PO_ApproveBy2 = ent.PurchaseOrder.ApproveBy2;
                    //    dto.PO_ApproveDate2 = ent.PurchaseOrder.ApproveDate2;
                    //    dto.PO_StatusData2 = ent.PurchaseOrder.StatusData2;

                    //    dto.DB_EnquiryId = ent.PurchaseOrder.DetailBarang.EnquiryId;
                    //    dto.DB_PromotionCode = ent.PurchaseOrder.DetailBarang.PromotionCode;
                    //    dto.DB_KategoriBarang  = ent.PurchaseOrder.DetailBarang.KategoriBarang.ToString();
                    //    dto.DB_TypeBarang = ent.PurchaseOrder.DetailBarang.TypeBarang;
                    //    dto.DB_Merek = ent.PurchaseOrder.DetailBarang.Merek;
                    //    dto.DB_Penalty = ent.PurchaseOrder.DetailBarang.Penalty;
                    //    dto.DB_Quantity = ent.PurchaseOrder.DetailBarang.Quantity;
                    //    dto.DB_Warna = ent.PurchaseOrder.DetailBarang.Warna;

                    //    dto.PR_TglBukaRekening = ent.PurchaseOrder.EnquiryTabunganInput.TglBukaRekening;
                    //    dto.PR_JenisTabungan = ent.PurchaseOrder.EnquiryTabunganInput.JenisTabungan;
                    //    dto.PR_NoRekening = ent.PurchaseOrder.EnquiryTabunganInput.NoRekening;
                    //    dto.PR_NoCif = ent.PurchaseOrder.EnquiryTabunganInput.NoCif;
                    //    dto.PR_NamaNasabah = ent.PurchaseOrder.EnquiryTabunganInput.NamaNasabah;
                    //    dto.PR_KodePromosi = ent.PurchaseOrder.EnquiryTabunganInput.KodePromosi;
                    //    dto.PR_Cabang = ent.PurchaseOrder.EnquiryTabunganInput.Cabang;
                    //    dto.PR_StartDate = ent.PurchaseOrder.EnquiryTabunganInput.StartDate;
                    //    dto.PR_MaturityDate = ent.PurchaseOrder.EnquiryTabunganInput.MaturityDate;
                    //    dto.PR_Nominal  = ent.PurchaseOrder.EnquiryTabunganInput.Nominal;
                    //    dto.PR_PRId = ent.PurchaseOrder.EnquiryTabunganInput.PRId;
                    //    dto.PR_PRDate = ent.PurchaseOrder.EnquiryTabunganInput.PRDate;
                    //    dto.PR_DraftPRId = ent.PurchaseOrder.EnquiryTabunganInput.DraftPRId;
                    //    dto.PR_DraftPRDate = ent.PurchaseOrder.EnquiryTabunganInput.DraftPRDate;
                    //    dto.PR_AttachmentSPNasabah = ent.PurchaseOrder.EnquiryTabunganInput.AttachmentSPNasabah;
                    //    dto.PR_Requester = ent.PurchaseOrder.EnquiryTabunganInput.Requester;
                    //    dto.PR_RewardBudget = ent.PurchaseOrder.EnquiryTabunganInput.RewardBudget;
                    //    dto.PR_AttachmentMemoDireksi = ent.PurchaseOrder.EnquiryTabunganInput.AttachmentMemoDireksi;
                    //    dto.PR_CatatanCabang  = ent.PurchaseOrder.EnquiryTabunganInput.CatatanCabang;
                    //    dto.PR_CatatanFProduct = ent.PurchaseOrder.EnquiryTabunganInput.CatatanFProduct;
                    //    dto.PR_DetailBarangId = ent.PurchaseOrder.EnquiryTabunganInput.DetailBarangId;
                    //    dto.PR_ApproveBy2 = ent.PurchaseOrder.EnquiryTabunganInput.ApproveBy2;
                    //    dto.PR_ApproveDate2 = ent.PurchaseOrder.EnquiryTabunganInput.ApproveDate2;
                    //    dto.PR_StatusData2 = ent.PurchaseOrder.EnquiryTabunganInput.StatusData2;
                    //}

                    if (!string.IsNullOrEmpty(ent.CreateBy))
                        dto.CreateBy = ent.UserManager.GetUser(ent.CreateBy).UserName;
                    if (!string.IsNullOrEmpty(ent.UpdateBy))
                        dto.UpdateBy = ent.UserManager.GetUser(ent.UpdateBy).UserName;
                    if (!string.IsNullOrEmpty(ent.ApproveBy))
                        dto.ApproveBy = ent.UserManager.GetUser(ent.ApproveBy).UserName;

                });
        }
	}
}

