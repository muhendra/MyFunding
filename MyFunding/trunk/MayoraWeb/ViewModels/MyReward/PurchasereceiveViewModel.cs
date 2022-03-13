using System.ComponentModel.DataAnnotations;
using Heroic.AutoMapper;
using System;
using AutoMapper;
using Core.Web.Utilities;
using MyWeb.Models;
using MyWeb.Models.Reward;
using System.Collections.Generic;


namespace MyWeb.ViewModels.Reward
{
    public class PurchaseReceiveViewModel : IMapFrom<PurchaseReceive>, IHaveCustomMappings
	{
        public int Id { get; set; }
        public int PurchaseOrderId { get; set; }
        public string PurchaseReceiveId { get; set; }
        public DateTime? PurchaseReceiveDate { get; set; }
        public string Receiver { get; set; }
        public Condition Condition { get; set; }
        public string PelunasanId { get; set; }
        public DateTime? JurnalValueDate { get; set; }
        public string PoId { get; set; }
        public DateTime? PoDate { get; set; }
        public string PaymentRequestId { get; set; }
        public DateTime? PaymentRequestDate { get; set; }
        public PaymentMethod PaymentMethod { get; set; }
        public string PromotionCode { get; set; }
        public string TypeBarang { get; set; }
        public string Merek { get; set; }
        public string Warna { get; set; }
        public int? Quantity { get; set; }
        public decimal DPAmount { get; set; }
        public decimal TotalPurchase { get; set; }
        public decimal pajak { get; set; }
        public decimal SisaPembayaran { get; set; }
        public List<JurnalPelunasan> JurnalPelunasanList { get; set; }
        public string CreateBy { get; set; }
        public DateTime? CreateDate { get; set; }
        public string UpdateBy { get; set; }
        public DateTime? UpdateDate { get; set; }
        public string ApproveBy { get; set; }
        public DateTime? ApproveDate { get; set; }
        public StatusData StatusData { get; set; }
        public DateTime? ApproveReceiveDateTime { get; set; }
        public string ApproveReceiveBy { get; set; }

        public string JurnalName { get; set; }

        public string VendorInvoiceNo { get; set; }

        public DateTime? VendorInvoiceDate { get; set; }

        public decimal VendorInvoiceAmount { get; set; }

        public PaymentRequestType? PaymentRequestType { get; set; }

        public string ApproveByPaymentRequest { get; set; }

        public void CreateMappings(IConfiguration configuration)
        {
            configuration.CreateMap<PurchaseReceiveViewModel, PurchaseReceive>();
                //.ForAllMembers(opt => opt.Condition(srs => !srs.IsSourceValueNull)); 
            configuration.CreateMap<PurchaseReceive, PurchaseReceiveViewModel>()
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

