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
    public class AmortisasiRequest : EntityBase
    {
        [Key]
        public int Id { get; set; }
        public string RequestId { get; set; }
        public int? DOid { get; set; }
        public DateTime RequestDate { get; set; }
        public bool IsBreak { get; set; }
        [ForeignKey("DOid")]
        public virtual DeliveryOrder DeliveryOrderMod { get; set; }
        public virtual ICollection<AmortisasiRequestDetail> AmortisasiRequestDetail { get; set; }
        public int? POId { get; set; }
        [ForeignKey("POId")]
        public virtual PurchaseOrder PurchaseOrder { get; set; }

    }
}