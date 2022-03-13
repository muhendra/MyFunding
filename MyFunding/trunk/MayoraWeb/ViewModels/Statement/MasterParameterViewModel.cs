using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MyWeb.ViewModels.Statement
{
    public class MasterParameterViewModel
    {
        public int ID { get; set; }
        [StringLength(100)]
        public string Name { get; set; }
        public string Value { get; set; }
    }
}