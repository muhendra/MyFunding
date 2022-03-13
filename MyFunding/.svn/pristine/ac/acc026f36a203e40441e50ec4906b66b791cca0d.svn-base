using AutoMapper;
using Heroic.AutoMapper;
using MyWeb.Models.Reward;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyWeb.ViewModels.MyReward
{
    public class KartuAmortisasiViewModel : IMapFrom<KartuAmortisasi>, IHaveCustomMappings
    {
        public int Id { get; set; }
        public int AmortisasiRequestId { get; set; }
        public int Periode { get; set; }
        public DateTime ValueDate { get; set; }
        public decimal AmortizeAmount { get; set; }
        public bool IsProceed { get; set; }

        public DateTime? ProceedDateTime { get; set; }
        public string ProceedBy { get; set; }

        public void CreateMappings(IConfiguration configuration)
        {
            configuration.CreateMap<KartuAmortisasiViewModel, KartuAmortisasi>();
            //.ForAllMembers(opt => opt.Condition(srs => !srs.IsSourceValueNull)); 
            configuration.CreateMap<KartuAmortisasi, KartuAmortisasiViewModel>()
                //.ForMember(dto => dto.CreateBy, m => m.Ignore())
                //.ForMember(dto => dto.UpdateBy, m => m.Ignore())
                .AfterMap((ent, dto) =>
                {

                });
        }
    
    }
}