using Core.Web.Models.Applications;
using MyWeb.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace MyWeb.Models.Reward
{
    public class PurchaseReceive : EntityBase
    {
        public int Id { get; set; }
        public int PurchaseOrderId { get; set; }
        [ForeignKey("PurchaseOrderId")]
        public virtual PurchaseOrder PurchaseOrder { get; set; }
        public string PurchaseReceiveId { get; set; }
        public DateTime? PurchaseReceiveDate { get; set; }
        public string Receiver { get; set; }
        public Condition Condition { get; set; }
        public string PelunasanId { get; set; }
        public DateTime? JurnalValueDate { get; set; }
        public DateTime? ApproveReceiveDateTime { get; set; }
        public string ApproveReceiveBy { get; set; }

        public string JurnalName { get; set; }

        public string VendorInvoiceNo { get; set; }

        public DateTime? VendorInvoiceDate { get; set; }

        public decimal VendorInvoiceAmount { get; set; }
    }
}