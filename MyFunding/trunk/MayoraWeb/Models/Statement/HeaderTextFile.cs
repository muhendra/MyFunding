using Core.Web.Models.Applications;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace MyWeb.Models.Statement
{
    public class HeaderTextFile : EntityBase
    {
        public HeaderTextFile()
        {
            this.DetailFooters = new List<DetailFooter>();
            this.DetailBodies = new List<DetailBody>();
        }
        [Key]
        public int ID { get; set; }
        [StringLength(20), Column(TypeName = "VARCHAR")]
        public string Periode { get; set; }
        [StringLength(25), Column(TypeName = "VARCHAR")]
        public string CIF { get; set; }
        [StringLength(25), Column(TypeName = "VARCHAR")]
        public string AccountNo { get; set; }
        [StringLength(100), Column(TypeName = "VARCHAR")]
        public string AccountName { get; set; }
        [StringLength(30), Column(TypeName = "VARCHAR")]
        public string Currency { get; set; }
        [StringLength(250), Column(TypeName = "VARCHAR")]
        public string Alamat1 { get; set; }
        [StringLength(250), Column(TypeName = "VARCHAR")]
        public string Alamat2 { get; set; }
        [StringLength(250), Column(TypeName = "VARCHAR")]
        public string Alamat3 { get; set; }
        [StringLength(50), Column(TypeName = "VARCHAR")]
        public string NPWP { get; set; }
        [StringLength(30), Column(TypeName = "VARCHAR")]
        public string OldAcctNo { get; set; }
        [StringLength(30), Column(TypeName = "VARCHAR")]
        public string cabang { get; set; }
        [StringLength(50), Column(TypeName = "VARCHAR")]
        public string TypeAccount { get; set; }
        public List<DetailFooter> DetailFooters { get; set; }
        public List<DetailBody> DetailBodies { get; set; }

    }

    public class DetailFooter : EntityBase
    {
        [Key]
        public int ID { get; set; }
        public int IDHeader { get; set; }
        [StringLength(4), Column(TypeName = "VARCHAR")]
        public string NoHalaman { get; set; }
        [StringLength(30), Column(TypeName = "VARCHAR")]
        public string SaldoAwal { get; set; }
        [StringLength(30), Column(TypeName = "VARCHAR")]
        public string SaldoAkhir { get; set; }
        [StringLength(30), Column(TypeName = "VARCHAR")]
        public string TotalDebet { get; set; }
        [StringLength(30), Column(TypeName = "VARCHAR")]
        public string TotalKredit { get; set; }
        [StringLength(5), Column(TypeName = "VARCHAR")]
        public string FrekuensiDebet { get; set; }
        [StringLength(5), Column(TypeName = "VARCHAR")]
        public string FrekuensiKredit { get; set; }
        [StringLength(30), Column(TypeName = "VARCHAR")]
        public string SaldoTerendah { get; set; }
        [StringLength(30), Column(TypeName = "VARCHAR")]
        public string SaldoTertinggi { get; set; }
        
        [ForeignKey("IDHeader")]
        public virtual HeaderTextFile HeaderTextFile { get; set; }
    }

    public class DetailBody : EntityBase
    {
        [Key]
        public int ID { get; set; }
        public int IDHeader { get; set; }
        [StringLength(150), Column(TypeName = "VARCHAR")]
        public string Detail { get; set; }
        [StringLength(10), Column(TypeName = "VARCHAR")]
        public string Tanggal { get; set; }
        [StringLength(10), Column(TypeName = "VARCHAR")]
        public string Valuta { get; set; }
        [StringLength(250), Column(TypeName = "VARCHAR")]
        public string Narative { get; set; }
        [StringLength(30), Column(TypeName = "VARCHAR")]
        public string NoRef { get; set; }
        [StringLength(30), Column(TypeName = "VARCHAR")]
        public string Debet { get; set; }
        [StringLength(30), Column(TypeName = "VARCHAR")]
        public string Kredit { get; set; }
        [StringLength(30), Column(TypeName = "VARCHAR")]
        public string Saldo { get; set; }
        [ForeignKey("IDHeader")]
        public virtual HeaderTextFile HeaderTextFile { get; set; }
    }
}