using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MyWeb.ViewModels.Statement
{
    public class RegisteredAccountViewModel
    {
        [Display(Name="No")]
        public int Number { get; set; }
        public int ID { get; set; }
        [Display(Name="Statement Period")]
        public string StatementPeriod { get; set; }
        [Display(Name = "CIF")]
        public string CIF { get; set; }
        [Display(Name = "Account No")]
        public string AccountNo { get; set; }
        [Display(Name = "Email")]
        public string Email { get; set; }
        [Display(Name = "Product Category")]
        public string ProductCategory { get; set; }
        public string Remark { get; set; }
    }
}