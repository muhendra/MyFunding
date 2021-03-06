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
    public class POGroupIDViewModel
    {
        public string POGroupId { get; set; }
        public string POId { get; set; }
        //public int EnquiryId { get; set; }
        public string Keterangan { get; set; }
        public PaymentType PaymentType { get; set; }
        //public CCYDebet? CCYDebet { get; set; }
        //public CCYKredit? CCYKredit { get; set; }
        public string CatatanPO { get; set; }
        public string NamaBank { get; set; }
        public string NomorRekeningVendor { get; set; }        
        public DateTime? PODate { get; set; }
    }
}