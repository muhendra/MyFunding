using System.ComponentModel.DataAnnotations;
using Heroic.AutoMapper;
using System;
using AutoMapper;
using Core.Web.Utilities;
using MyWeb.Models;
using MyWeb.Models.Reward;
using System.Collections.Generic;
using MyWeb.ViewModels.MyReward;

namespace MyWeb.ViewModels.Reward
{
    public class BreakAmortisasiRequestViewModel : IMapFrom<BreakAmortisasiRequest>, IHaveCustomMappings
	{

        public int Id { get; set; }
        public string RequestId { get; set; }
        public int TTid { get; set; }
        public DateTime RequestDate { get; set; }
        public string TransactionCode { get; set; }
        public string JurnalName { get; set; }
        public string Memo { get; set; }

        public string Transaksi { get; set; }

        /// <summary>
        /// Amortize Request (TT)
        /// </summary>
        public string TT_RequestId { get; set; }
        public int TT_DOid { get; set; }
        [Display(Name="Amortisasi Jurnal Value Date")]
        public DateTime TT_RequestDate { get; set; }
        public bool TT_IsBreak { get; set; }

        /// <summary>
        /// Do View
        /// </summary>
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
        public string PO_POId { get; set; }
        public DateTime? PO_PODate { get; set; }
        public string PO_POGroupId { get; set; }
        public string PO_CategoryId { get; set; }
        public string PO_PolaId { get; set; }
        public UnitId PO_UnitId { get; set; }
        public string PO_TypeId { get; set; }
        public PaymentMethod PO_PaymentMethod { get; set; }
        public PaymentType PO_PaymentType { get; set; }
        public decimal? PO_DPAmount { get; set; }
        public int? PO_Quantity { get; set; }
        public Currency PO_Currency { get; set; }
        public decimal? PO_NominalBarang { get; set; }
        public decimal? PO_NominalPurchase { get; set; }
        public decimal? PO_TotalPurchase { get; set; }
        public string PO_SupplierId { get; set; }
        public decimal? PO_NilaiBuku { get; set; }
        public string PO_NikEmp { get; set; }
        public string PO_DeptId { get; set; }
        public string PO_VendorQuotationNo { get; set; }
        public DateTime? PO_VendorQuotationDate { get; set; }
        public decimal? PO_VendorQuotationAmount { get; set; }
        public string PO_VendorInvoiceNo { get; set; }
        public DateTime? PO_VendorInvoiceDate { get; set; }
        public decimal? PO_VendorInvoiceAmount { get; set; }
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
        public decimal? DB_Penalty { get; set; }
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
        public decimal? PR_Nominal { get; set; }
        public string PR_PRId { get; set; }
        public DateTime? PR_PRDate { get; set; }
        public string PR_DraftPRId { get; set; }
        public DateTime? PR_DraftPRDate { get; set; }
        public string PR_AttachmentSPNasabah { get; set; }
        public string PR_Requester { get; set; }
        public decimal? PR_RewardBudget { get; set; }
        public string PR_AttachmentMemoDireksi { get; set; }
        public string PR_CatatanCabang { get; set; }
        public string PR_CatatanFProduct { get; set; }
        public int? PR_DetailBarangId { get; set; }
        public string PR_ApproveBy2 { get; set; }
        public DateTime? PR_ApproveDate2 { get; set; }
        public StatusData PR_StatusData2 { get; set; }


        public virtual PaymentRequest PaymentRequestMod { get; set; }
        public virtual PurchaseReceive PurchaseReceiveMod { get; set; }
        public List<BreakAmortisasiRequestDetailViewModel> jurnalDetail { get; set; }

        public List<KartuAmortisasiViewModel> ListKartuAmortisasi { get; set; }

        public string CreateBy { get; set; }
        public DateTime? CreateDate { get; set; }
        public string UpdateBy { get; set; }
        public DateTime? UpdateDate { get; set; }
        public string ApproveBy { get; set; }
        public DateTime? ApproveDate { get; set; }
        public StatusData StatusData { get; set; }
        public void CreateMappings(IConfiguration configuration)
        {
            configuration.CreateMap<BreakAmortisasiRequestViewModel, BreakAmortisasiRequest>();
                //.ForAllMembers(opt => opt.Condition(srs => !srs.IsSourceValueNull)); 
            configuration.CreateMap<BreakAmortisasiRequest, BreakAmortisasiRequestViewModel>()
                .ForMember(dto => dto.Do_PurchaseOrderId, opt => opt.MapFrom(s => s.AmorisasiRequestMod.DeliveryOrderMod.PurchaseOrderId))
                .ForMember(dto => dto.Do_DeliveryOrderId,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.DeliveryOrderMod.DeliveryOrderId))
                .ForMember(dto => dto.Do_DeliveryOrderDate,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.DeliveryOrderMod.DeliveryOrderDate))
                .ForMember(dto => dto.Do_StatusBarang,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.DeliveryOrderMod.StatusBarang))
                .ForMember(dto => dto.Do_Receiver,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.DeliveryOrderMod.Receiver))
                .ForMember(dto => dto.Do_Condition,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.DeliveryOrderMod.Condition))
                .ForMember(dto => dto.Do_attachmentTandaTerima,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.DeliveryOrderMod.attachmentTandaTerima))
                .ForMember(dto => dto.Do_Description,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.DeliveryOrderMod.Description))
                
                .ForMember(dto => dto.PO_EnquiryId,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.EnquiryId))
                .ForMember(dto => dto.PO_DetailBarangId,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.DetailBarangId))
                .ForMember(dto => dto.PO_POId,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.POId))
                .ForMember(dto => dto.PO_PODate,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.PODate))
                .ForMember(dto => dto.PO_POGroupId,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.POGroupId))
                .ForMember(dto => dto.PO_CategoryId,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.CategoryId))
                .ForMember(dto => dto.PO_PolaId,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.PolaId))
                .ForMember(dto => dto.PO_UnitId,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.UnitId))
                .ForMember(dto => dto.PO_TypeId,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.TypeId))
                .ForMember(dto => dto.PO_PaymentMethod,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.PaymentMethod))
                .ForMember(dto => dto.PO_PaymentType,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.PaymentType))
                .ForMember(dto => dto.PO_DPAmount,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.DPAmount))
                .ForMember(dto => dto.PO_Quantity,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.Quantity))
                .ForMember(dto => dto.PO_Currency,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.Currency))
                .ForMember(dto => dto.PO_NominalBarang,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.NominalBarang))
                .ForMember(dto => dto.PO_NominalPurchase,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.NominalPurchase))
                .ForMember(dto => dto.PO_TotalPurchase,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.TotalPurchase))
                .ForMember(dto => dto.PO_SupplierId,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.SupplierId))
                .ForMember(dto => dto.PO_NilaiBuku,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.NilaiBuku))
                .ForMember(dto => dto.PO_NikEmp,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.NikEmp))
                .ForMember(dto => dto.PO_DeptId,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.DeptId))
                .ForMember(dto => dto.PO_VendorQuotationNo,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.VendorQuotationNo))
                .ForMember(dto => dto.PO_VendorQuotationDate,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.VendorQuotationDate))
                .ForMember(dto => dto.PO_VendorQuotationAmount,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.VendorQuotationAmount))
                .ForMember(dto => dto.PO_VendorInvoiceNo,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.VendorInvoiceNo))
                .ForMember(dto => dto.PO_VendorInvoiceDate,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.VendorInvoiceDate))
                .ForMember(dto => dto.PO_VendorInvoiceAmount,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.VendorInvoiceAmount))
                .ForMember(dto => dto.PO_PODescription,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.PODescription))
                .ForMember(dto => dto.PO_ApproveBy2,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.ApproveBy2))
                .ForMember(dto => dto.PO_ApproveDate2,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.ApproveDate2))
                .ForMember(dto => dto.PO_StatusData2,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.StatusData2))
                
                .ForMember(dto => dto.DB_EnquiryId,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.DetailBarang.EnquiryId))
                .ForMember(dto => dto.DB_PromotionCode,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.DetailBarang.PromotionCode))
                .ForMember(dto => dto.DB_KategoriBarang,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.DetailBarang.KategoriBarang))
                .ForMember(dto => dto.DB_TypeBarang,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.DetailBarang.TypeBarang))
                .ForMember(dto => dto.DB_Merek,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.DetailBarang.Merek))
                .ForMember(dto => dto.DB_Penalty,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.DetailBarang.Penalty))
                .ForMember(dto => dto.DB_Quantity,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.DetailBarang.Quantity))
                .ForMember(dto => dto.DB_Warna, opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.DetailBarang.Warna))

                .ForMember(dto => dto.PR_TglBukaRekening,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.EnquiryTabunganInput.TglBukaRekening))
                .ForMember(dto => dto.PR_JenisTabungan,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.EnquiryTabunganInput.JenisTabungan))
                .ForMember(dto => dto.PR_NoRekening,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.EnquiryTabunganInput.NoRekening))
                .ForMember(dto => dto.PR_NoCif,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.EnquiryTabunganInput.NoCif))
                .ForMember(dto => dto.PR_NamaNasabah,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.EnquiryTabunganInput.NamaNasabah))
                .ForMember(dto => dto.PR_KodePromosi,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.EnquiryTabunganInput.KodePromosi))
                .ForMember(dto => dto.PR_Cabang,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.EnquiryTabunganInput.Cabang))
                .ForMember(dto => dto.PR_StartDate,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.EnquiryTabunganInput.StartDate))
                .ForMember(dto => dto.PR_MaturityDate,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.EnquiryTabunganInput.MaturityDate))
                .ForMember(dto => dto.PR_Nominal,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.EnquiryTabunganInput.Nominal))
                .ForMember(dto => dto.PR_PRId,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.EnquiryTabunganInput.PRId))
                .ForMember(dto => dto.PR_PRDate,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.EnquiryTabunganInput.PRDate))
                .ForMember(dto => dto.PR_DraftPRId,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.EnquiryTabunganInput.DraftPRId))
                .ForMember(dto => dto.PR_DraftPRDate,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.EnquiryTabunganInput.DraftPRDate))
                .ForMember(dto => dto.PR_AttachmentSPNasabah,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.EnquiryTabunganInput.AttachmentSPNasabah))
                .ForMember(dto => dto.PR_Requester,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.EnquiryTabunganInput.Requester))
                .ForMember(dto => dto.PR_RewardBudget,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.EnquiryTabunganInput.RewardBudget))
                .ForMember(dto => dto.PR_AttachmentMemoDireksi,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.EnquiryTabunganInput.AttachmentMemoDireksi))
                .ForMember(dto => dto.PR_CatatanCabang,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.EnquiryTabunganInput.CatatanCabang))
                .ForMember(dto => dto.PR_CatatanFProduct,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.EnquiryTabunganInput.CatatanFProduct))
                .ForMember(dto => dto.PR_DetailBarangId,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.EnquiryTabunganInput.DetailBarangId))
                .ForMember(dto => dto.PR_ApproveBy2,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.EnquiryTabunganInput.ApproveBy2))
                .ForMember(dto => dto.PR_ApproveDate2,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.EnquiryTabunganInput.ApproveDate2))
                .ForMember(dto => dto.PR_StatusData2,  opt => opt.MapFrom(s => s.AmorisasiRequestMod.PurchaseOrder.EnquiryTabunganInput.StatusData2))
                //.ForMember(dto => dto.CreateBy, m => m.Ignore())
                //.ForMember(dto => dto.UpdateBy, m => m.Ignore())
                .AfterMap((ent, dto) =>
                {
                    dto.CreateBy = ent.UserManager.GetUser(ent.CreateBy).UserName;
                    if (!string.IsNullOrEmpty(ent.UpdateBy))
                        dto.UpdateBy = ent.UserManager.GetUser(ent.UpdateBy).UserName;
                    if (!string.IsNullOrEmpty(ent.ApproveBy))
                        dto.ApproveBy = ent.UserManager.GetUser(ent.ApproveBy).UserName;
                });
        }
	}
}

