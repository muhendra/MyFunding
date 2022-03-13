using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GetDataPDF.Model
{
    public class DetailBodyModel
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
        public string ApproveBy { get; set; }
        public DateTime? ApproveDate { get; set; }
        public int? BranchId { get; set; }
        public int? CompanyId { get; set; }
        public string CreateBy { get; set; }
        public DateTime? CreateDate { get; set; }
        public bool IsDelete { get; set; }
        public string RejectBy { get; set; }
        public DateTime? RejectDate { get; set; }
        public string RejectReason { get; set; }
        public int StatusData { get; set; }
        public string UpdateBy { get; set; }
        public DateTime? UpdateDate { get; set; }
        [ForeignKey("IDHeader")]
        public virtual HeaderTextFileModel HeaderTextFile { get; set; }
    }
}
