using AutoMapper;
using Heroic.AutoMapper;
using MyWeb.Models.Statement;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyWeb.ViewModels.Statement
{
    public class MasterPDFViewModel : IMapFrom<MasterPDF>, IHaveCustomMappings
    {
        public int ID { get; set; }
        public string Folder { get; set; }
        public string Root { get; set; }
        public string File { get; set; }
        public string AccountNo { get; set; }
        public string Period { get; set; }
        public string Branch { get; set; }
        public string PDF { get; set; }
        public string CreateBy { get; set; }
        public DateTime? CreateDate { get; set; }
        public string UpdateBy { get; set; }
        public string Content { get; set; }
        public string Subject { get; set; }
        public DateTime? UpdateDate { get; set; }
        public void CreateMappings(IConfiguration configuration)
        {
            configuration.CreateMap<MasterPDFViewModel, MasterPDF>();
            //.ForAllMembers(opt => opt.Condition(srs => !srs.IsSourceValueNull)); 
            configuration.CreateMap<MasterPDF, MasterPDFViewModel>()
                //.ForMember(dto => dto.CreateBy, m => m.Ignore())
                //.ForMember(dto => dto.UpdateBy, m => m.Ignore())
                .AfterMap((ent, dto) =>
                {
                    dto.CreateBy = ent.UserManager.GetUser(ent.CreateBy).UserName;
                    if (!string.IsNullOrEmpty(ent.UpdateBy))
                        dto.UpdateBy = ent.UserManager.GetUser(ent.UpdateBy).UserName;
                });
        }
    }
}