using Core.Web.Models.Applications;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace MyWeb.Models.Statement
{
    public class MasterPDF : EntityBase
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
        //public int Failed { get; set; }
        [Column(TypeName = "TEXT")]
        public string Content { get; set; }
        [StringLength(30), Column(TypeName = "VARCHAR")]
        public string Subject { get; set; }
        public int Success { get; set; }
        public int Failure { get; set; }
        public string Remark { get; set; }
    }
}