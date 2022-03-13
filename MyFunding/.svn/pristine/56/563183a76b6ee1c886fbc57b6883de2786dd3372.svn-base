using Core.Web.Models.Applications;
using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace MyWeb.Models.Reward
{
    public class DeliveryOrder : EntityBase
    {
        public int Id { get; set; }
        public int PurchaseOrderId { get; set; }
        [ForeignKey("PurchaseOrderId")]
        public virtual PurchaseOrder PurchaseOrder { get; set; }
        public string DeliveryOrderId { get; set; }
        public DateTime? DeliveryOrderDate { get; set; }
        public StatusBarang StatusBarang { get; set; }
        public string Receiver { get; set; }
        public Condition Condition { get; set; }
        public string attachmentTandaTerima { get; set; }
        public string Description { get; set; }
    }
}