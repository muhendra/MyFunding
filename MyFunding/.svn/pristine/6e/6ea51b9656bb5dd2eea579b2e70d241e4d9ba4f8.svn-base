using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GetDataPDF.Model
{
    public class DetailFooterModel
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
