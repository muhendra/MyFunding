using Core.Web.Models.Applications;
using Core.Web.Utilities;
using MyWeb.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace MyWeb.Models.Reward
{
    public class EnquiryTabunganInput : EntityBase
    {
        public int Id { get; set; }
        public DateTime? TglBukaRekening { get; set; }
        public JenisTabungan JenisTabungan { get; set; }
        public string NoRekening { get; set; }
        public string NoCif { get; set; }
        public string NamaNasabah { get; set; }
        public string KodePromosi { get; set; }
        public string Cabang { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? MaturityDate { get; set; }
        public decimal Nominal { get; set; }
        public string PRId { get; set; }
        public DateTime? PRDate { get; set; }
        public string DraftPRId { get; set; }
        public DateTime? DraftPRDate { get; set; }
        public string AttachmentSPNasabah { get; set; }
        public string Requester { get; set; }
        public decimal RewardBudget { get; set; }
        public string AttachmentMemoDireksi { get; set; }
        public string CatatanCabang { get; set; }
        public string CatatanFProduct { get; set; }
        public int? DetailBarangId { get; set; }
        [ForeignKey("DetailBarangId")]
        public virtual DetailBarang DetailBarang { get; set; }
        public string ApproveBy2 { get; set; }
        public DateTime? ApproveDate2 { get; set; }
        public StatusData StatusData2 { get; set; }
        //20200710, Eka, BEGIN
        public PenyimpanganProgram? PenyimpanganProgram { get; set; }
        public string AttachmentPenyimpangan { get; set; }
        //20200710, Eka, END
        public string RejectBy2 { get; set; }
        public string RejectReason { get; set; }
        public string RejectReason2 { get; set; }
        public DateTime? RejectDate2 { get; set; }
        
    }
}