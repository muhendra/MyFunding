using Core.Web.Models.Applications;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace MyWeb.Models.Statement
{
    public class InsertLog:EntityBase
    {
        [Key]
        public int Id { get; set; }
        public string Module { get; set; }
        public string Process { get; set; }
        public string LogMessage { get; set; }
        public string TimeSpend { get; set; }
    }
}