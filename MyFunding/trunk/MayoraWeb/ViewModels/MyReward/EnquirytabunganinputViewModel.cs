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
    public class EnquirytabunganinputViewModel : IMapFrom<EnquiryTabunganInput>, IHaveCustomMappings
	{
        public int Id {get; set;}
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
         [DataType(DataType.MultilineText)]
        public string CatatanCabang { get; set; }
         [DataType(DataType.MultilineText)]
        public string CatatanFProduct { get; set; }
        public int? DetailBarangId { get; set; }
        public List<DetailBarang> DetailBarangList { get; set; }
        public List<UploadNasabah> DetailUploadList { get; set; }
        public string CreateBy { get; set; }
        public DateTime? CreateDate { get; set; }
        public string UpdateBy { get; set; }
        public DateTime? UpdateDate { get; set; }
        public string ApproveBy { get; set; }
        public DateTime? ApproveDate { get; set; }
        public StatusData StatusData { get; set; }
        public string ApproveBy2 { get; set; }
        public DateTime? ApproveDate2 { get; set; }
        public StatusData StatusData2 { get; set; }

        public string RejectBy2 { get; set; }
        public DateTime? RejectDate2 { get; set; }

        public void CreateMappings(IConfiguration configuration)
        {
            configuration.CreateMap<EnquirytabunganinputViewModel, EnquiryTabunganInput>();
                //.ForAllMembers(opt => opt.Condition(srs => !srs.IsSourceValueNull)); 
            configuration.CreateMap<EnquiryTabunganInput, EnquirytabunganinputViewModel>()
                //.ForMember(dto => dto.CreateBy, m => m.Ignore())
                //.ForMember(dto => dto.UpdateBy, m => m.Ignore())
                .AfterMap((ent, dto) => {                    
                        dto.CreateBy = ent.UserManager.GetUser(ent.CreateBy).UserName;
                        if(!string.IsNullOrEmpty(ent.UpdateBy))
                            dto.UpdateBy = ent.UserManager.GetUser(ent.UpdateBy).UserName;
               });         
        }
        //20200710, Eka, BEGIN
        public string AttachmentPenyimpangan { get; set; }
        public PenyimpanganProgram PenyimpanganProgram { get; set; }
        //20200710, Eka, END
    }
}

