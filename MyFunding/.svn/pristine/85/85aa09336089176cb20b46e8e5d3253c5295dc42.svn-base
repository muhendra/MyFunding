using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GetDataPDF
{
    public class MasterParameterModel
    {
        [Key]
        public int ID { get; set; }
        [StringLength(100), Column(TypeName = "VARCHAR")]
        public string Name { get; set; }
        [Column(TypeName = "VARCHAR")]
        public string Value { get; set; }

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
