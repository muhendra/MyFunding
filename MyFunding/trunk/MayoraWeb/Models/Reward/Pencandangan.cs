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
    public class Pencadangan : EntityBase
    {
        [Key]
        public int Id { get; set; }
        public string RequestId { get; set; }
        public int POId { get; set; }
        [ForeignKey("POId")]
        public virtual PurchaseOrder PurchaseOrder { get; set; }
        public string JPId { get; set; }
        public DateTime PecadanganDate { get; set; }
        public decimal NominalPencadangan { get; set; }
        public DateTime startDate { get; set; }
        public DateTime maturityDate { get; set; }
        public DateTime? PembalikanDate { get; set; }
        public virtual ICollection<PencadanganTransaksi> PencadanganTransaksi { get; set; }
    }
}