using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace MyWeb.Models
{

    public enum ReceiveBy
    {
        [Display(Name = "Funding Product")]
        FundingProduct,
        [Display(Name = "General Affair (GA)")]
        GeneralAffairGA,
        [Display(Name = "Cabang")]
        Cabang,
        [Display(Name = "Nasabah")]
        Nasabah
    }
    
}