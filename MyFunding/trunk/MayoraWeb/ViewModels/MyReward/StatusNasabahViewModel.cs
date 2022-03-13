using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyWeb.ViewModels.MyReward
{
    public class StatusNasabahViewModel
    {
        public string NoRekening { get; set; }
        public string NoCif { get; set; }
        public string NamaNasabah { get; set; }
        public int CategoryCode { get; set; }
        public string KodePromosi { get; set; }
        public int JenisTabungan { get; set; }
        public string Cabang { get; set; }
        public string NamaCabang { get; set; }
        public DateTime TglBukaRekening { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime MaturityDate { get; set; }
        //20200710, Eka, BEGIN
        public string DraftPurchaseId { get; set; }
        public DateTime? ApproveDate { get; set; }
        public string DPRStatus { get; set; }
        public string PurchaseRequestId { get; set; }
        public string PRStatus { get; set; }
        public string PurchaseOrderId { get; set; }
        public string POStatus { get; set; }
        public string StatusPenyimpangan { get; set; }
        public string ApproverDPR { get; set; }
        //20200710, Eka, END
        public string AmortisasiRequestId { get; set; }
        public string PaymentRequestId { get; set; }
        public string PurchaseReceiveId { get; set; }
        public string PelunasanId { get; set; }
        public string DeliveryOrderId { get; set; }
    }
}