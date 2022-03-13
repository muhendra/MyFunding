using System.ComponentModel.DataAnnotations;
using Heroic.AutoMapper;
using System;
using AutoMapper;
using Core.Web.Utilities;
using MyWeb.Models;
using MyWeb.Models.Reward;
using System.ComponentModel.DataAnnotations.Schema;

namespace MyWeb.ViewModels.MyReward
{
    public class ParameterEmailViewModel : IMapFrom<ParameterEmail>, IHaveCustomMappings
    {
        public int Id { get; set; }
        public string Group { get; set; }
        public string Email { get; set; }
        public bool IsActive { get; set; }

        public string CreateBy { get; set; }
        public DateTime? CreateDate { get; set; }
        public string UpdateBy { get; set; }
        public DateTime? UpdateDate { get; set; }  
        public StatusData StatusData { get; set; }

        public void CreateMappings(IConfiguration configuration)
        {
            configuration.CreateMap<ParameterEmailViewModel, ParameterEmail>();
            //.ForAllMembers(opt => opt.Condition(srs => !srs.IsSourceValueNull)); 
            configuration.CreateMap<ParameterEmail, ParameterEmailViewModel>()
                //.ForMember(dto => dto.CreateBy, m => m.Ignore())
                //.ForMember(dto => dto.UpdateBy, m => m.Ignore())
                .AfterMap((ent, dto) =>
                {
                   
                });
        }
    }
}