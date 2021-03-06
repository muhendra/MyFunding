using System.ComponentModel.DataAnnotations;
using Heroic.AutoMapper;
using System;
using AutoMapper;
using Core.Web.Utilities;
using MyWeb.Models;
using MyWeb.Models.Reward;


namespace MyWeb.ViewModels.Reward
{
    public class DetailbarangViewModel : IMapFrom<DetailBarang>, IHaveCustomMappings
	{
        public int Id { get; set; }
        public int? EnquiryId { get; set; }
        [Display(Name = "Kode Promosi")]
        public string PromotionCode { get; set; }
        [Display(Name = "Keterangan")]
        public string PromotionCode2 { get; set; }
        public KategoriKatalog KategoriBarang { get; set; }
        public string TypeBarang { get; set; }
        public string Merek { get; set; }
        public decimal Penalty { get; set; }
        [Required]
        [Range(typeof(int), "1", "1000000")]      
        public int? Quantity { get; set; }
        //[Required]
        [Display(Name = "Warna / Jenis")]
        public string Warna { get; set; }
        public string CreateBy { get; set; }
        public DateTime? CreateDate { get; set; }
        public string UpdateBy { get; set; }
        public DateTime? UpdateDate { get; set; }
        public string AuthorizeBy { get; set; }
        public DateTime? AuthorizeDate { get; set; }
        public StatusData StatusData { get; set; }

        public string Keterangan { get; set; }
        public void CreateMappings(IConfiguration configuration)
        {
            configuration.CreateMap<DetailbarangViewModel, DetailBarang>();
                //.ForAllMembers(opt => opt.Condition(srs => !srs.IsSourceValueNull)); 
            configuration.CreateMap<DetailBarang, DetailbarangViewModel>()
                //.ForMember(dto => dto.CreateBy, m => m.Ignore())
                //.ForMember(dto => dto.UpdateBy, m => m.Ignore())
                .AfterMap((ent, dto) => {
                    if (!string.IsNullOrEmpty(ent.CreateBy))
                            dto.CreateBy = ent.UserManager.GetUser(ent.CreateBy).UserName;
                        if(!string.IsNullOrEmpty(ent.UpdateBy))
                            dto.UpdateBy = ent.UserManager.GetUser(ent.UpdateBy).UserName;
               });         
        }
	}
}

