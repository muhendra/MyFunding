using Core.Web.Models.Applications;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MyWeb.Models.Reward
{
    public class AmortisasiRequestDetail : EntityBase
    {
        [Key]
        public int Id { get; set; }
        public int AmortisasiRequestId { get; set; }
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
        [ForeignKey("AmortisasiRequestId")]
        public virtual AmortisasiRequest AmortisasiRequest { get; set; }
    }
    public enum DbitKredit
    {
        Debit = 0,
        Kredit = 1
    }
}