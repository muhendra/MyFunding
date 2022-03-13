using AutoMapper;
using Heroic.AutoMapper;
using MyWeb.Models.Statement;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyWeb.ViewModels.Statement
{
    public class HeaderTextFileViewModel : IMapFrom<HeaderTextFile>, IHaveCustomMappings
    {
        public HeaderTextFileViewModel()
        {
            this.DetailFooters = new List<DetailFooterViewModel>();
            this.DetailBodies = new List<DetailBodyViewModel>();
        }
        public int ID { get; set; }
        public string Periode { get; set; }
        public string CIF { get; set; }
        public string AccountNo { get; set; }
        public string AccountName { get; set; }
        public string Currency { get; set; }
        public string Alamat1 { get; set; }
        public string Alamat2 { get; set; }
        public string Alamat3 { get; set; }
        public string NPWP { get; set; }
        public string OldAcctNo { get; set; }
        public string cabang { get; set; }
        public string TypeAccount { get; set; }
        public string CreateBy { get; set; }
        public DateTime? CreateDate { get; set; }
        public string UpdateBy { get; set; }
        public DateTime? UpdateDate { get; set; }
        public List<DetailFooterViewModel> DetailFooters { get; set; }
        public List<DetailBodyViewModel> DetailBodies { get; set; }

        public void CreateMappings(IConfiguration configuration)
        {
            configuration.CreateMap<HeaderTextFileViewModel, HeaderTextFile>();
            //.ForAllMembers(opt => opt.Condition(srs => !srs.IsSourceValueNull)); 
            configuration.CreateMap<HeaderTextFile, HeaderTextFileViewModel>()
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

    public class DetailFooterViewModel : IMapFrom<DetailFooter>, IHaveCustomMappings
    {
        public int ID { get; set; }
        public int IDHeader { get; set; }
        public string NoHalaman { get; set; }
        public string SaldoAwal { get; set; }
        public string SaldoAkhir { get; set; }
        public string TotalDebet { get; set; }
        public string TotalKredit { get; set; }
        public string FrekuensiDebet { get; set; }
        public string FrekuensiKredit { get; set; }
        public string SaldoTerendah { get; set; }
        public string SaldoTertinggi { get; set; }
        public string CreateBy { get; set; }
        public DateTime? CreateDate { get; set; }
        public string UpdateBy { get; set; }
        public DateTime? UpdateDate { get; set; }

        public virtual HeaderTextFileViewModel HeaderTextFile { get; set; }

        public void CreateMappings(IConfiguration configuration)
        {
            configuration.CreateMap<DetailFooterViewModel, DetailFooter>();
            //.ForAllMembers(opt => opt.Condition(srs => !srs.IsSourceValueNull)); 
            configuration.CreateMap<DetailFooter, DetailFooterViewModel>()
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

    public class DetailBodyViewModel : IMapFrom<DetailBody>, IHaveCustomMappings
    {
        public int ID { get; set; }
        public int IDHeader { get; set; }
        public string Detail { get; set; }
        public string Tanggal { get; set; }
        public string Valuta { get; set; }
        public string Narative { get; set; }
        public string NoRef { get; set; }
        public string Debet { get; set; }
        public string Kredit { get; set; }
        public string Saldo { get; set; }
        public string CreateBy { get; set; }
        public DateTime? CreateDate { get; set; }
        public string UpdateBy { get; set; }
        public DateTime? UpdateDate { get; set; }
        public virtual HeaderTextFileViewModel HeaderTextFile { get; set; }
        public void CreateMappings(IConfiguration configuration)
        {
            configuration.CreateMap<DetailBodyViewModel, DetailBody>();
            //.ForAllMembers(opt => opt.Condition(srs => !srs.IsSourceValueNull)); 
            configuration.CreateMap<DetailBody, DetailBodyViewModel>()
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

    public class GetDistinctHeaderTextFileByAccountNo
    {
        public string AccountNo { get; set; }

        public string AccountName { get; set; }
        public string BirthDate { get; set; }
        public string StatementPeriod { get; set; }
        public string Cabang { get; set; }
        public string Content { get; set; }
        public string Subject { get; set; }
        public string Product { get; set; }
        
    }

    public class CheckStatementPeriod
    {
        public string StatementPeriod { get; set; }
    }

    public class GetHeaderTextFileToPDF
    {
        public int ID { get; set; }
        public string AccountNo { get; set; }
        public string CIF { get; set; }
        public string Periode { get; set; }
        public string AccountName { get; set; }
        public string Currency { get; set; }
        public string Alamat1 { get; set; }
        public string Alamat2 { get; set; }
        public string Alamat3 { get; set; }
        public string NPWP { get; set; }
        public string OldAcctNo { get; set; }
        public string cabang { get; set; }
        public string NoHalaman { get; set; }
        public string TypeAccount { get; set; }
        public int LastNumber { get; set; }
        public string SaldoAwal { get; set; }
        public string TotalDebet { get; set; }
        public string TotalKredit { get; set; }
        public string SaldoAkhir { get; set; }
        public string FrekuensiDebet { get; set; }
        public string FrekuensiKredit { get; set; }
        public string SaldoTerendah { get; set; }
        public string SaldoTertinggi { get; set; }
        public string Promotion { get; set; }
    }
}