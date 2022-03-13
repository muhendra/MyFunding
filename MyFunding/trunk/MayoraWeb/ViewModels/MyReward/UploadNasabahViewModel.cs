using System.ComponentModel.DataAnnotations;
using Heroic.AutoMapper;
using System;
using AutoMapper;
using Core.Web.Utilities;
using MyWeb.Models;
using MyWeb.Models.Reward;
using System.Collections.Generic;
using MyWeb.DataLayer.SqlFunding;
using MyWeb.Controllers.Reward;


namespace MyWeb.ViewModels.Reward
{
    public class UploadNasabahViewModel : IMapFrom<UploadNasabah>, IHaveCustomMappings
    {
        public int Id { get; set; }
        public string NoRekening { get; set; }
        public string AttachmentSPNasabah { get; set; }
        //20200710, eka, BEGIN
        public string AttachmentPenyimpangan { get; set; }
        //20200710, eka, END
        public string CreateBy { get; set; }
        public DateTime? CreateDate { get; set; }
        public StatusData StatusData { get; set; }

        public void CreateMappings(IConfiguration configuration)
        {
            configuration.CreateMap<UploadNasabahViewModel, UploadNasabah>();
            //.ForAllMembers(opt => opt.Condition(srs => !srs.IsSourceValueNull)); 
            configuration.CreateMap<UploadNasabah, UploadNasabahViewModel>()
                //.ForMember(dto => dto.CreateBy, m => m.Ignore())
                //.ForMember(dto => dto.UpdateBy, m => m.Ignore())
                .AfterMap((ent, dto) =>
                {
                    dto.CreateBy = ent.UserManager.GetUser(ent.CreateBy).UserName;
                    
                });
        }
    }
}

