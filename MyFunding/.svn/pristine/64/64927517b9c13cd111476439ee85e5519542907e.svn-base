using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GetDataPDF.Model
{
    public class MasterPDFModel
    {
        [Key]
        public int ID { get; set; }
        [StringLength(20), Column(TypeName = "VARCHAR")]
        public string AccountNo { get; set; }
        [StringLength(20), Column(TypeName = "VARCHAR")]
        public string Period { get; set; }
        [StringLength(50), Column(TypeName = "VARCHAR")]
        public string Branch { get; set; }
        public string Folder { get; set; }
        public string Root { get; set; }
        public string File { get; set; }
        public int Failure { get; set; }
        public int Success { get; set; }
        public int Remark { get; set; }
        [Column(TypeName = "TEXT")]
        public string Content { get; set; }
        [StringLength(30), Column(TypeName = "VARCHAR")]
        public string Subject { get; set; }
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
    }
}
