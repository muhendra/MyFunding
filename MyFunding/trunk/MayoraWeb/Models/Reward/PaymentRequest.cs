using Core.Web.Models.Applications;
using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace MyWeb.Models.Reward
{
    public class PaymentRequest : EntityBase
    {
        public int Id { get; set; }
        public int PurchaseOrderId { get; set; }
        [ForeignKey("PurchaseOrderId")]
        public virtual PurchaseOrder PurchaseOrder { get; set; }
        public string PaymentRequestId { get; set; }
        public DateTime? PaymentRequestDate { get; set; }
        public DateTime? JurnalValueDate { get; set; }
        public string JurnalName { get; set; }
        public string TransactionCode { get; set; }
        public string VendorInvoiceNo { get; set; }
        public DateTime? VendorInvoiceDate { get; set; }
        public decimal VendorInvoiceAmount { get; set; }
        public PaymentRequestType? PaymentRequestType { get; set; }
    }
}