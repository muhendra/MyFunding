using AutoMapper;
using Core.Web.Utilities;
using Heroic.AutoMapper;
using MyWeb.Models;
using MyWeb.Models.Reward;
using System;
using System.Collections.Generic;


namespace MyWeb.ViewModels.Reward
{
    public class PaymentRequestViewModel : IMapFrom<PaymentRequest>, IHaveCustomMappings
	{
        public int Id { get; set; }
        //public string no { get; set; }
        //public DateTime? tanggal { get; set; }
        //public JenisTabungan jenistabungan { get; set; }
        //public string cabang { get; set; }
        public int PurchaseOrderId { get; set; }
        public string PaymentRequestId { get; set; }
        public JenisTabungan Jenistabungan { get; set; }
        public DateTime? PaymentRequestDate { get; set; }
        public DateTime? JurnalValueDate { get; set; }
        public string JurnalName { get; set; }
        public string TransactionCode { get; set; }
        public string poid { get; set; }
        public DateTime? PODate { get; set; }
        public PaymentMethod PaymentMethod { get; set; }
        public string CategoryId { get; set; }
        public string Merek { get; set; }
        public string Warna { get; set; }
        public string TypeBarang { get; set; }
        public int? Quantity { get; set; }
        public decimal Amount { get; set; }
        public string Cabang { get; set; }
        public string NamaCabang { get; set; }
        public string CreateBy { get; set; }
        /// <summary>
        /// Penambahan Requester
        /// </summary>
        public string Requester { get; set; }
        public decimal DPAmount { get; set; }
        public decimal TotalPurchase { get; set; }
        public List<JurnalPembayaran> JurnalPembayaranList { get; set; }
        public DateTime? CreateDate { get; set; }
        public string UpdateBy { get; set; }
        public DateTime? UpdateDate { get; set; }
        public string ApproveBy { get; set; }
        public DateTime? ApproveDate { get; set; }
        public StatusData StatusData { get; set; }
        public string VendorInvoiceNo { get; set; }
        public DateTime? VendorInvoiceDate { get; set; }
        public decimal VendorInvoiceAmount { get; set; }
        public string NoRekSupplier { get; set; }
        public string AccountTitle { get; set; }
        public string AccountCabang { get; set; }
        public PaymentRequestType PaymentRequestType { get; set; }
        public void CreateMappings(IConfiguration configuration)
        {
            configuration.CreateMap<PaymentRequestViewModel, PaymentRequest>();
            //.ForAllMembers(opt => opt.Condition(srs => !srs.IsSourceValueNull)); 
            configuration.CreateMap<PaymentRequest, PaymentRequestViewModel>()
            //.ForMember(dto => dto.CreateBy, m => m.Ignore())
            //.ForMember(dto => dto.UpdateBy, m => m.Ignore())
            .AfterMap((ent, dto) => {                    
                    dto.CreateBy = ent.UserManager.GetUser(ent.CreateBy).UserName;
                    if(!string.IsNullOrEmpty(ent.UpdateBy))
                        dto.UpdateBy = ent.UserManager.GetUser(ent.UpdateBy).UserName;
            });         
        }
	}
}

