using Core.Web.Models.Applications;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace MyWeb.Models.Statement
{
    public class RegisteredAccount : EntityBase
    {
        [Key]
        public int ID { get; set; }
        [StringLength(6)]
        public string StatementPeriod { get; set; }
        [StringLength(8)]
        public string CIF { get; set; }
        [StringLength(15)]
        public string AccountNo { get; set; }
        [Column(TypeName = "Date")]
        public DateTime? BirthDate { get; set; }
        [StringLength(255)]
        public string Email { get; set; }
        public int ProductCategory { get; set; }
        
    }
}