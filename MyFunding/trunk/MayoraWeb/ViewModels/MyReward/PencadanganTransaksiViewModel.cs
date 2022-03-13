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
    public class PencadanganTransaksiViewModel : IMapFrom<PencadanganTransaksi>, IHaveCustomMappings
    {
        public int Id { get; set; }
        public int PencadanganId { get; set; }
        public string PCId { get; set; }
        public DateTime Value_date { get; set; }
        public string ref_code { get; set; }
        public string BranchId { get; set; }
        [Required(ErrorMessage = "Branch Not identified please try another Branch Id")]
        public string BranchName { get; set; }
        [Display(Name = "Int Acc / Category Id")]
        public string IntAccCategoryId { get; set; }
        [Required(ErrorMessage = "Internal Account or Category Not identified, please try another Internal Account or Category Id"), Display(Name = "Int Acc / Category Name")]
        public string IntAccCategoryName { get; set; }
        public DebetKredit DebitKredit { get; set; }
        public string Narative { get; set; }
        public string Currency { get; set; }
        public decimal Amount { get; set; }
        public string CreateBy { get; set; }
        public DateTime? CreateDate { get; set; }
        public string UpdateBy { get; set; }
        public DateTime? UpdateDate { get; set; }
        public string ApproveBy { get; set; }
        public DateTime? ApproveDate { get; set; }
        public StatusData StatusData { get; set; }
        public void CreateMappings(IConfiguration configuration)
        {
            configuration.CreateMap<PencadanganTransaksiViewModel, PencadanganTransaksi>();
                //.ForAllMembers(opt => opt.Condition(srs => !srs.IsSourceValueNull)); 
            configuration.CreateMap<PencadanganTransaksi, PencadanganTransaksiViewModel>()
                .ForMember(dto => dto.PCId, opt => opt.MapFrom(s => s.Pencadangan.RequestId))
                .AfterMap((ent, dto) => {
                        //dto.CreateBy = ent.UserManager.GetUser(ent.CreateBy).UserName;
                        //if(!string.IsNullOrEmpty(ent.UpdateBy))
                        //    dto.UpdateBy = ent.UserManager.GetUser(ent.UpdateBy).UserName;
               });         
        }
	}
}

