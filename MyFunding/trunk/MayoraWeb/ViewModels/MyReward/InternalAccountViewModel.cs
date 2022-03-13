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
    public class InternalAccountViewModel : IMapFrom<InternalAccount>, IHaveCustomMappings
    {
        public int Id { get; set; }
        public string NomorIA { get; set; }
                     
        public string Deskripsi { get; set; }
        public int Category { get; set; }
        public string MataUang { get; set; }
        public string NamaCabang { get; set; }
        
    
        public string CreateBy { get; set; }
        public DateTime? CreateDate { get; set; }
        public string UpdateBy { get; set; }
        public DateTime? UpdateDate { get; set; }
        public string ApproveBy { get; set; }
        public DateTime? ApproveDate { get; set; }
        public StatusData StatusData { get; set; }

        
        public void CreateMappings(IConfiguration configuration)
        {
            configuration.CreateMap<InternalAccountViewModel, InternalAccount>();
                //.ForAllMembers(opt => opt.Condition(srs => !srs.IsSourceValueNull)); 
            configuration.CreateMap<InternalAccount, InternalAccountViewModel>()
                //.ForMember(dto => dto.CreateBy, m => m.Ignore())
                //.ForMember(dto => dto.UpdateBy, m => m.Ignore())
                .AfterMap((ent, dto) => {                    
                        dto.CreateBy = ent.UserManager.GetUser(ent.CreateBy).UserName;
                        if(!string.IsNullOrEmpty(ent.UpdateBy))
                            dto.UpdateBy = ent.UserManager.GetUser(ent.UpdateBy).UserName;
               });     
        
        }
	}


    public class get_internal_account
    {
        public string NomorIA { get; set; }
        public string Deskripsi { get; set; }
        public string MataUang { get; set; }
        public string NamaCabang { get; set; }
    }

}

