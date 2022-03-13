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
    public class POGroupListViewModel
    {
        public DateTime? PODate { get; set; }
        public DateTime? TglBukaRekening { get; set; }
        public string POGroupId { get; set; }
        public string POId { get; set; }
        public string NoRekening { get; set; }
        public string NamaNasabah { get; set; }
        public string Keterangan { get; set; }
        public decimal? Penalty { get; set; }
        public string Currency { get; set; }
        public decimal? RewardBudget { get; set; }
    }
}