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
    public class PencadanganTransaksi : EntityBase
    {
        [Key]
        public int Id { get; set; }
        public int PencadanganId { get; set; }
        [ForeignKey("PencadanganId")]
        public virtual Pencadangan Pencadangan { get; set; }
        public DateTime Value_date { get; set; }
        public string ref_code { get; set; }
        public string BranchId { get; set; }
        public string BranchName { get; set; }
        public string IntAccCategoryId { get; set; }
        public string IntAccCategoryName { get; set; }
        public DebetKredit DebitKredit { get; set; }
        public string Narative { get; set; }
        public string Currency { get; set; }
        public decimal Amount { get; set; }
       
    }
}