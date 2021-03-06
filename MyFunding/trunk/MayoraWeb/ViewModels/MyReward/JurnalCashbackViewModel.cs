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
    public class JurnalCashbackViewModel
    {
        public int EnquiryId { get; set; }
        //public string POId { get; set; }
        public decimal TotalPurchase { get; set; }
        public string AccountDebet { get; set; }
        public string AccountKredit { get; set; }
        public decimal Nominal { get; set; }
        public string KdCabang { get; set; }
        public string NamaCabang { get; set; }
        public string CCYDebet { get; set; }
        public string CCYKredit { get; set; }
        public string Keterangan { get; set; }
        public string NoBatch { get; set; }
        public string CostCenter { get; set; }
    }
}