using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MyWeb.ViewModels.Statement
{
    public class MasterPromotionViewModel
    {
        public int ID { get; set; }
        [Required]
        public string Name { get; set; }
        public string ProductCode { get; set; }
        [Required, DataType(DataType.MultilineText)]
        public string Message { get; set; }
        [Required,DataType(DataType.Date)]
        public DateTime PeriodFrom { get; set; }
        [DataType(DataType.Date)]
        public DateTime? PeriodTo { get; set; }
        public string  ProductName { get; set; }
    }
}