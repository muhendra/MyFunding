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
    public class EnquirytabunganViewModel : IMapFrom<EnquiryTabungan>, IHaveCustomMappings
    {
        public int Id { get; set; }
        public DateTime? TglBukaRekening { get; set; }
        public JenisTabungan JenisTabungan { get; set; }
        public string NoRekening { get; set; }
        public string NoCif { get; set; }
        public string NamaNasabah { get; set; }
        public string KodePromosi { get; set; }
        public string Cabang { get; set; }
        public string NamaCabang { get; set; }
        [Required(ErrorMessage = "Tanggal Start Date tidak boleh kosong!, karena akan mempengaruhi proses pecadangan")]
        public DateTime? StartDate { get; set; }

        [Required(ErrorMessage = "Tanggal Maturity tidak boleh kosong!, karena akan mempengaruhi proses pecadangan")]
        public DateTime? MaturityDate { get; set; }
        public decimal Nominal { get; set; }
        public string PRId { get; set; }
        public DateTime? PRDate { get; set; }
        public string DraftPRId { get; set; }
        public DateTime? DraftPRDate { get; set; }
        public string AttachmentSPNasabah { get; set; }
        public string POId { get; set; }
        public string POGroupId { get; set; }
        public string Requester { get; set; }
        public decimal RewardBudget { get; set; }
        public string AttachmentMemoDireksi { get; set; }
        [DataType(DataType.MultilineText)]
        public string CatatanCabang { get; set; }
        [DataType(DataType.MultilineText)]
        public string CatatanFProduct { get; set; }
        public int? DetailBarangId { get; set; }
        //20200708, eka, BEGIN
        public PenyimpanganProgram PenyimpanganProgram { get; set; }
        public string AttachmentPenyimpangan { get; set; }
        //20200708, eka, END

        /// <summary>
        /// Tamabahan buat enquery dari sp
        /// </summary>
        public KategoriKatalog? Kategory { get; set; }
        public string Keterangan { get; set; }
        public string Merk { get; set; }
        public string Type { get; set; }
        public decimal? Penalty { get; set; }

        public string Warna { get; set; }

        public string TypeCashback { get; set; }

        /// <summary>
        /// End Tambahan
        /// </summary>

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
        //20190116, jeni, BEGIN
        [DataType(DataType.MultilineText)]
        //[Required(ErrorMessage = "Reject Reason tidak boleh kosong!")]
        public string RejectReason { get; set; }

        [DataType(DataType.MultilineText)]
        //[Required(ErrorMessage = "Reject Reason tidak boleh kosong!")]
        public string RejectReason2 { get; set; }
        //20190116, jeni, END
        public string RejectBy { get; set; }
        public int? EnquiryId { get; set; }
        public void CreateMappings(IConfiguration configuration)
        {
            configuration.CreateMap<EnquirytabunganViewModel, EnquiryTabunganInput>();

            configuration.CreateMap<EnquiryTabunganInput, EnquirytabunganViewModel>()
                .AfterMap((ent, dto) =>
                {
                    CompanyTemenosController ctc = new CompanyTemenosController();
                    dto.NamaCabang = ctc.GetBranchName(ent.Cabang);
                });

                //.ForMember(dto => dto.CreateBy, m => m.Ignore())
                //.ForMember(dto => dto.UpdateBy, m => m.Ignore())

            configuration.CreateMap<EnquirytabunganViewModel, EnquiryTabungan>();
            //.ForAllMembers(opt => opt.Condition(srs => !srs.IsSourceValueNull)); 
            configuration.CreateMap<EnquiryTabungan, EnquirytabunganViewModel>()
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

