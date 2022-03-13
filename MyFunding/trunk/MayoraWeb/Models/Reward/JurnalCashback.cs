using Core.Web.Models.Applications;
using Core.Web.Utilities;
using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace MyWeb.Models.Reward
{
    public class JurnalCashback : EntityBase
    {
        public int Id { get; set; }

        public int EnquiryId { get; set; }

        [ForeignKey("EnquiryId")]
        public virtual EnquiryTabunganInput EnquiryTabunganInput { get; set; }

        public string POId { get; set; }

        public string POGroupId { get; set; }

        public string KodeCabang { get; set; }

        public string AccountKredit { get; set; }

        public string AccountDebet { get; set; }

        public string Nominal { get; set; }
    }
}