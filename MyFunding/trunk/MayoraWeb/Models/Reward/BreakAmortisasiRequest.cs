using Core.Web.Models.Applications;
using MyWeb.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace MyWeb.Models.Reward
{
    public class BreakAmortisasiRequest : EntityBase
    {
        [Key]
        public int Id { get; set; }
        public string RequestId { get; set; }
        public int TTid { get; set; }
        public DateTime RequestDate { get; set; }
        public string TransactionCode { get; set; }
        public string JurnalName { get; set; }
        public string Memo { get; set; }
        [ForeignKey("TTid")]
        public virtual AmortisasiRequest AmorisasiRequestMod { get; set; }
        public virtual ICollection<BreakAmortisasiRequestDetail> BreakAmortisasiRequestDetail { get; set; }
    }
}