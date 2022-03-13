using Core.Web.Models.Applications;
using Core.Web.Utilities;
using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace MyWeb.Models.Reward
{
    public class PurchaseOrder : EntityBase
    {
        public int Id { get; set; }

        public int EnquiryId { get; set; }

        [ForeignKey("EnquiryId")]
        public virtual EnquiryTabunganInput EnquiryTabunganInput { get; set; }

        public int? DetailBarangId { get; set; }

        [ForeignKey("DetailBarangId")]
        public virtual DetailBarang DetailBarang { get; set; }

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

        public decimal NominalBarang { get; set; }

        public decimal NominalPurchase { get; set; }

        public decimal TotalPurchase { get; set; }

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

        public string PODescription { get; set; }

        public string UploadPO {  get; set;}

        public string ApproveBy2 { get; set; }

        public DateTime? ApproveDate2 { get; set; }

        public StatusData StatusData2 { get; set; }

        public string AdditionalInfoDetailItem { get; set; }

        public string NamaBank { get; set; }

        public string NomorRekeningVendor { get; set; }
        //20190129, jeni, BEGIN
        public string PurchaseReceiveBy { get; set; }
        public string RejectReason { get; set; }
        //20190129, jeni, END
        public CCYKredit? CCYKredit { get; set; }
        public CCYDebet? CCYDebet { get; set; }
        public string CatatanPO { get; set; }
    }
}