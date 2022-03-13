using Core.Web.Models.Applications;
using MyWeb.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace MyWeb.Models.Reward
{
    public class JurnalPembayaran : EntityBase
    {
        public int Id { get; set; }
        public int? PaymentRequestId { get; set; }
        [ForeignKey("PaymentRequestId")]
        public virtual PaymentRequest PaymentRequest { get; set; }
        public DateTime? ValueDate { get; set; }
        public string BranchId { get; set; }
        public string BranchName { get; set; }
        public string InternalAccount { get; set; }
        public string InternalAccountName { get; set; }
        public string NamaCabang { get; set; }
               
        public DebetKredit DebetKredit { get; set; }
        public string Narrative { get; set; }
        public decimal Amount { get; set; }
    }
    

    

    

}