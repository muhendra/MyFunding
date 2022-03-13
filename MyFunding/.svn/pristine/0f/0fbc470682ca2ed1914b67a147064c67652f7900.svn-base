using Core.Web.Models.Applications;
using MyWeb.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace MyWeb.Models.Reward
{
    [Table("JurnalPelunasan")]
    public class JurnalPelunasan : EntityBase
    {
        public int Id { get; set; }
        public int? POId { get; set; }
        [ForeignKey("POId")]
        public virtual PurchaseOrder PurchaseOrder { get; set; }
        public int? PCRId { get; set; }
        [ForeignKey("PCRId")]
        public virtual PurchaseReceive PurchaseReceive { get; set; }
        public DateTime? ValueDate { get; set; }
        public string BranchId { get; set; }
        public string BranchName { get; set; }
        public string InternalAccount { get; set; }
        public string NamaCabang { get; set; }
        public string InternalAccountName { get; set; }
        public DebetKredit DebetKredit { get; set; }
        public string Narrative { get; set; }
        public decimal Amount { get; set; }
        
    }
}