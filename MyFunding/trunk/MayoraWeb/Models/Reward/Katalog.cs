using Core.Web.Models.Applications;
using MyWeb.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace MyWeb.Models.Reward
{
    public class Katalog : EntityBase
    {
        [Key]
        public int Id { get; set; }
        
        public string Kode_Promo { get; set; }
        public string IDKode_Promo2 { get; set; }
        public string Keterangan { get; set; }
        [Required]
        public KategoriKatalog Kategory { get; set; }
        public string Merk { get; set; }
        public string Type { get; set; }
        public int JangkaWaktu { get; set; }
        [Required]
        public JangkaWaktu MonthsYears { get; set; }
        public decimal NominalHold { get; set; }
        public decimal Penalty { get; set; }
        [Required]
        public ProgramReward ProgramName { get; set; }
        public string AttachmentKatalog { get; set; }

    }
    
    public enum KategoriKatalog
    {
        Gadget = 1,
        HomeAppliance = 2,
        Kendaraan = 3,
        Voucher = 4,
        Electronic = 5,
        Tupperware = 6,
        LogamMulia = 7,
        Cashback = 8,
        Lainnya = 99
    }
    
    public enum JangkaWaktu
    {
        Month = 0,
        Year = 1
    }
    
    public enum ProgramReward
    {
        [Description("Pilih Sendiri Hadiahmu")]
        PilihSendiriHadiahMu = 0,
        Voucher = 1,
        [Description("Reward Sipucuk")]
        RewardSipucuk = 2
    }

}