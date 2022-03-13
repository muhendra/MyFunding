using Core.Web.Models.Applications;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace MyWeb.Models.Statement
{
    public class MasterPromotion : EntityBase
    {
        [Key]
        public int ID { get; set; }
        [Column(TypeName = "VARCHAR")]
        [StringLength(200)]
        public string Name { get; set; }
        [Column(TypeName = "VARCHAR")]
        [StringLength(10)]
        public string ProductCode { get; set; }
        [Column(TypeName = "VARCHAR")]
        [StringLength(300)]
        public string Message { get; set; }
        [Column(TypeName = "DATE")]
        public DateTime PeriodFrom { get; set; }
        [Column(TypeName = "DATE")]
        public DateTime? PeriodTo { get; set; }
    }
}