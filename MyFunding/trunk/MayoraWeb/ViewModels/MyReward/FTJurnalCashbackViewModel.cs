using AutoMapper;
using Core.Web.Utilities;
using Heroic.AutoMapper;
using MyWeb.Models;
using MyWeb.Models.Reward;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace MyWeb.ViewModels.Reward
{
    public class FTJurnalCashbackViewModel
    {
        public string AccountDebet { get; set; }
        public string CCYDebet { get; set; }
        public decimal Nominal { get; set; }
        public string AccountKredit { get; set; }
        public string CCYKredit { get; set; }
        public string KodeCabang { get; set; }
        public string PODescription { get; set; }
        public string CostCenter { get; set; }
        public string AdditionalInfoDetailItem { get; set; }
    }
}