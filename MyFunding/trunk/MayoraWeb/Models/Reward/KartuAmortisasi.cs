using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace MyWeb.Models.Reward
{
    public class KartuAmortisasi
    {
        public int Id { get; set; }
        public int AmortisasiRequestId { get; set; }
        public int Periode { get; set; }
        public DateTime ValueDate { get; set; }
        public decimal AmortizeAmount { get; set; }
        public bool IsProceed { get; set; }
        public DateTime? ProceedDateTime { get; set; }
        public string ProceedBy { get; set; }

        [ForeignKey("AmortisasiRequestId")]
        public virtual AmortisasiRequest AmortisasiRequest { get; set; }


    }
}