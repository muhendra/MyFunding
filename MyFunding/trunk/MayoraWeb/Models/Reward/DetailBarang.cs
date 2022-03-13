using Core.Web.Models.Applications;
using MyWeb.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace MyWeb.Models.Reward
{
    public class DetailBarang : EntityBase
    {
        public int Id { get; set; }
        public int? EnquiryId { get; set; }
        //[ForeignKey("EnquiryId")]
        //public virtual EnquiryTabungan EnquiryTabungan { get; set; }
        public string PromotionCode { get; set; }
        //public virtual EnquiryTabungan EnquiryTabungan { get; set; }
        public KategoriKatalog KategoriBarang { get; set; }
        public string TypeBarang { get; set; }
        public string Merek { get; set; }
        public decimal Penalty { get; set; }
        public int? Quantity { get; set; }
        public string Warna { get; set; }
        public string Keterangan { get; set; }
        
    }
}