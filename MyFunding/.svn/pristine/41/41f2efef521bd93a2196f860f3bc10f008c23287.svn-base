using Core.Web.Models.Applications;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace MyWeb.Models.Statement
{
    public class MasterParameter:EntityBase
    {
        [Key]
        public int ID { get; set; }
        [StringLength(100),Column(TypeName="VARCHAR")]
        public string Name { get; set; }
        [Column(TypeName="VARCHAR")]
        public string Value { get; set; }
    }
}