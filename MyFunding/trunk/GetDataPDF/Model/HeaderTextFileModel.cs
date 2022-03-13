using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GetDataPDF.Model
{
    public class HeaderTextFileModel
    {
        public HeaderTextFileModel()
        {
            this.DetailFooters = new List<DetailFooterModel>();
            this.DetailBodies = new List<DetailBodyModel>();
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
        public List<DetailFooterModel> DetailFooters { get; set; }
        public List<DetailBodyModel> DetailBodies { get; set; }
    }
}
