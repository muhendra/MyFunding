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
    public class JurnalpelunasanViewModel : IMapFrom<JurnalPelunasan>, IHaveCustomMappings
	{
        public int Id { get; set; }
        public int? EnquiryId { get; set; }
        [ForeignKey("EnquiryId")]
        public virtual EnquiryTabunganInput EnquiryTabunganInput { get; set; }
        public int? PurchaseReceiveId { get; set; }
        [ForeignKey("PurchaseReceiveId")]
        public virtual PurchaseReceive PurchaseReceive { get; set; }
        public DateTime? ValueDate { get; set; }
        public string BranchId { get; set; }
        public string BranchName { get; set; }
        [Required]
        public string InternalAccount { get; set; }
        [Required]
        public string InternalAccountName { get; set; }
        public DebetKredit DebetKredit { get; set; }
        public string Narrative { get; set; }
        public decimal Amount { get; set; }
        public string CreateBy { get; set; }
        public DateTime? CreateDate { get; set; }
        public string UpdateBy { get; set; }
        public string NamaCabang { get; set; }
        public DateTime? UpdateDate { get; set; }
        public string AuthorizeBy { get; set; }
        public DateTime? AuthorizeDate { get; set; }
        public StatusData StatusData { get; set; }
        public void CreateMappings(IConfiguration configuration)
        {
            configuration.CreateMap<JurnalpelunasanViewModel, JurnalPelunasan>();
                //.ForAllMembers(opt => opt.Condition(srs => !srs.IsSourceValueNull)); 
            configuration.CreateMap<JurnalPelunasan, JurnalpelunasanViewModel>()
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

