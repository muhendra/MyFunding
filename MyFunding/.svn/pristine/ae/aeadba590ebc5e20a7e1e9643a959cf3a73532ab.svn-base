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
    public class DeliveryOrderViewModel : IMapFrom<DeliveryOrder>, IHaveCustomMappings
	{
        public int Id { get; set; }
        public int PurchaseOrderId { get; set; }
        public string POId { get; set; }
        public DateTime? PODate { get; set; }
        public string DeliveryOrderId { get; set; }
        public DateTime? DeliveryOrderDate { get; set; }
        public StatusBarang StatusBarang { get; set; }
        public string Receiver { get; set; }
        public Condition Condition { get; set; }
        public string attachmentTandaTerima { get; set; }
        public string Description { get; set; }
        public string PurchaseReceiveId { get; set; }
        public DateTime? PurchaseReceiveDate { get; set; }
        public string PromotionCode { get; set; }
        public string TypeBarang { get; set; }
        public string Merek { get; set; }
        public string Warna { get; set; }
        public int? Quantity { get; set; }
        public string CreateBy { get; set; }
        public DateTime? CreateDate { get; set; }
        public string UpdateBy { get; set; }
        public DateTime? UpdateDate { get; set; }
        public string ApproveBy { get; set; }
        public DateTime? ApproveDate { get; set; }
        public StatusData StatusData { get; set; }
        public void CreateMappings(IConfiguration configuration)
        {
            configuration.CreateMap<DeliveryOrderViewModel, DeliveryOrder>();
                //.ForAllMembers(opt => opt.Condition(srs => !srs.IsSourceValueNull)); 
            configuration.CreateMap<DeliveryOrder, DeliveryOrderViewModel>()
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

