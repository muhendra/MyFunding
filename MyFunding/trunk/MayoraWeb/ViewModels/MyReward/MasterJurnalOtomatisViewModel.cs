using MyWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyWeb.ViewModels.MyReward
{
    public class MasterJurnalOtomatisViewModel
    {
        public DateTime ValueDate { get; set; }

        public string BranchId { get; set; }
        public string BranchName { get; set; }
        public DebetKredit DebetKredit { get; set; }
        public string InternalAccountName { get; set; }
        public string InternalAccount { get; set; }

        public string Narrative { get; set; }
        public decimal Amount { get; set; }

        public DateTime Value_date { get; set; }
        public string IntAccCategoryId { get; set; }
        public string IntAccCategoryName { get; set; }
        public DebetKredit DebitKredit { get; set; }
        public string Narative { get; set; }

        public string Currency { get; set; }



    }
}