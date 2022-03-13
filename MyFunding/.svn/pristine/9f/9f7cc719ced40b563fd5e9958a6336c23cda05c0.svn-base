using System.ComponentModel.DataAnnotations;
using Heroic.AutoMapper;
using System;
using AutoMapper;
using Core.Web.Utilities;
using MyWeb.Models;
using MyWeb.Models.Reward;
using System.ComponentModel.DataAnnotations.Schema;


namespace MyWeb.ViewModels.Reward
{
    public class KatalogViewModel : IMapFrom<Katalog>, IHaveCustomMappings
    {
        public int Id { get; set; }
    
        public string Kode_Promo { get; set; }
        
        public string IDKode_Promo2 { get; set; }
        [Display(Name="Keterangan")]
        public string Keterangan { get; set; }
        [Required]
        public KategoriKatalog Kategory { get; set; }
        [Required]
        public string Merk { get; set; }
        [Required]
        public string Type { get; set; }
        public int? JangkaWaktu { get; set; }
        [Required]
        public JangkaWaktu MonthsYears { get; set; }
        public decimal NominalHold { get; set; }
        public decimal Penalty { get; set; }
        [Required]
        public ProgramReward ProgramName { get; set; }
        public string AttachmentKatalog { get; set; }
        public string CreateBy { get; set; }
        public DateTime? CreateDate { get; set; }
        public string UpdateBy { get; set; }
        public DateTime? UpdateDate { get; set; }
        public string AuthorizeBy { get; set; }
        public DateTime? AuthorizeDate { get; set; }
        public StatusData StatusData { get; set; }
        public void CreateMappings(IConfiguration configuration)
        {
            configuration.CreateMap<KatalogViewModel, Katalog>();
                //.ForAllMembers(opt => opt.Condition(srs => !srs.IsSourceValueNull)); 
            configuration.CreateMap<Katalog, KatalogViewModel>()
                //.ForMember(dto => dto.CreateBy, m => m.Ignore())
                //.ForMember(dto => dto.UpdateBy, m => m.Ignore())
                .AfterMap((ent, dto) => {                    
                        //dto.CreateBy = ent.UserManager.GetUser(ent.CreateBy).UserName;
                        //if(!string.IsNullOrEmpty(ent.UpdateBy))
                        //    dto.UpdateBy = ent.UserManager.GetUser(ent.UpdateBy).UserName;
               });         
        }
	}
    public class GetKatalog 
    {
        public string ID { get; set; }
        public string Description { get; set; }
    }

    public class GetKatalog2
    {
        public int? Id { get; set; }
        public string Kode_Promo { get; set; }
        public int? Kategory { get; set; }
    }

}

