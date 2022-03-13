using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MyWeb.ViewModels.Statement
{
    public class MasterEmailTemplateViewModel
    {
        public int ID { get; set; }
        [Required]
        public string Name { get; set; }
        [Required, StringLength(30), Display(Name="Subject")]
        public string Description { get; set; }
        [Required, DataType(DataType.MultilineText)]
        public string Content { get; set; }
        public string ProductCode { get; set; }
        public string ProductName { get; set; }
        
    }
}