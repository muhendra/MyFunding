using AutoMapper;
using Core.Web.Utilities;
using Heroic.AutoMapper;
using MyWeb.Models;
using MyWeb.Models.Reward;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;


namespace MyWeb.ViewModels.Reward
{
    public class PurchaseOrderViewModel : IMapFrom<PurchaseOrder>, IHaveCustomMappings
	{
        public int Id { get; set; }

        public int EnquiryId { get; set; }

        public DateTime? TglBukaRekening { get; set; }

        public JenisTabungan JenisTabungan { get; set; }

        public string Cabang { get; set; }

        public string NamaCabang { get; set; }

        public string NoRekening { get; set; }

        public string NamaNasabah { get; set; }

        public string DraftPRId { get; set; }

        public DateTime? DraftPRDate { get; set; }

        public string PromotionCode { get; set; }

        public KategoriKatalog KategoriBarang { get; set; }

        public string TypeBarang { get; set; }

        public string Merek { get; set; }

        public int? QuantityBarang { get; set; }

        public string Warna { get; set; }

        public decimal Penalty { get; set; }

        public DateTime? StartDate { get; set; }

        public DateTime? MaturityDate { get; set; }

        public string Requester { get; set; }

        public string PRId { get; set; }

        public DateTime? PRDate { get; set; }

        public decimal RewardBudget { get; set; }

        public string AttachmentSPNasabah { get; set; }

        public string AttachmentMemoDireksi { get; set; }

        public int? DetailBarangId { get; set; }

        public List<DetailBarang> DetailBarangList { get; set; }

        public string POId { get; set; }

        public DateTime? PODate { get; set; }

        public string POGroupId { get; set; }
        
        public string CategoryId { get; set; }

        public string PolaId { get; set; }

        public UnitId UnitId { get; set; }

        public string TypeId { get; set; }

        public PaymentMethod PaymentMethod { get; set; }

        public PaymentType PaymentType { get; set; }

        public decimal DPAmount { get; set; }

        public int? Quantity { get; set; }

        public Currency Currency { get; set; }

        [Display(Name = "CCYKredit")]
        public CCYKredit CCYKredit { get; set; }
        [Display(Name = "CCYDebet")]
        public CCYDebet CCYDebet { get; set; }
        public string TypeCashback { get; set; }
        public int totalpo { get; set; }
        public string CatatanPO { get; set; }
        public decimal NominalBarang { get; set; }

        [Display(Name= "Lain-lain")]
        public decimal NominalPurchase { get; set; }

        public decimal TotalPurchase { get; set; }

        [Display(Name = "Pajak (%)")]
        public decimal? Pajak { get; set; }

        public string SupplierId { get; set; }

        public decimal? NilaiBuku { get; set; }

        public string NikEmp { get; set; }

        public string DeptId { get; set; }

        public string VendorQuotationNo { get; set; }

        public DateTime? VendorQuotationDate { get; set; }

        public decimal VendorQuotationAmount { get; set; }

        public string VendorInvoiceNo { get; set; }

        public DateTime? VendorInvoiceDate { get; set; }

        public decimal VendorInvoiceAmount { get; set; }

        [DataType(DataType.MultilineText)]
        public string PODescription { get; set; }

        public string UploadPO { get; set; }

        public string CreateBy { get; set; }

        public DateTime? CreateDate { get; set; }

        public string UpdateBy { get; set; }

        public DateTime? UpdateDate { get; set; }

        public string ApproveBy { get; set; }

        public DateTime? ApproveDate { get; set; }

        public StatusData StatusData { get; set; }

        public string ApproveBy2 { get; set; }

        public DateTime? ApproveDate2 { get; set; }

        public StatusData StatusData2 { get; set; }

        public string NoCif { get; set; }
        //public string NoRekening { get; set; }
        //public string NamaNasabah { get; set; }
        //public string JenisTabungan { get; set; }
        public string JenisTabunganName { get; set; }
        //public string Cabang { get; set; }
        public string company_name { get; set; }
        public DateTime? TglBukuRekening { get; set; }
        //public DateTime? StartDate { get; set; }
        //public DateTime? MaturityDate { get; set; }
        //public string Requester { get; set; }
        [DataType(DataType.MultilineText)]
        public string CatatanCabang { get; set; }
        public string KodePromosi { get; set; }
        public int? KategoriBarangID { get; set; }
        public string Nama { get; set; }

        public string SupplierName { get; set; }
        public string AlamatSupplier { get; set; }

        public string Keterangan { get; set; }

        
        [DataType(DataType.MultilineText)]
        public string AdditionalInfoDetailItem { get; set; }

        public string NamaBank { get; set; }

        //[Required(ErrorMessage = "Nomor Rekening Vendor Harus Diisi!")]
        public string NomorRekeningVendor { get; set; }

        //20190129, jeni, BEGIN
        public ReceiveBy PurchaseReceiveBy { get; set; }
        [DataType(DataType.MultilineText)]
        public string RejectReason { get; set; }
        //20190129, jeni, END
        public List<JurnalCashbackListViewModel> ListJurnalCashback { get; set; }
        //public string Merek { get; set; }
        //public string TypeBarang { get; set; }
        //public int? QuantityDetailBarang { get; set; }
        //public string Warna { get; set; }

        public void CreateMappings(IConfiguration configuration)
        {
            configuration.CreateMap<PurchaseOrderViewModel, PurchaseOrder>();
                //.ForAllMembers(opt => opt.Condition(srs => !srs.IsSourceValueNull)); 
            configuration.CreateMap<PurchaseOrder, PurchaseOrderViewModel>()
                //.ForMember(dto => dto.CreateBy, m => m.Ignore())
                //.ForMember(dto => dto.UpdateBy, m => m.Ignore())
                .AfterMap((ent, dto) => {                    
                        dto.CreateBy = ent.UserManager.GetUser(ent.CreateBy).UserName;
                        if(!string.IsNullOrEmpty(ent.UpdateBy))
                            dto.UpdateBy = ent.UserManager.GetUser(ent.UpdateBy).UserName;
               });         
        }


	}
}

