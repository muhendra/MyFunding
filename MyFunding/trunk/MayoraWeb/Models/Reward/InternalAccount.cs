using Core.Web.Models.Applications;
using MyWeb.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace MyWeb.Models.Reward
{
    public class InternalAccount : EntityBase
    {
        public int Id { get; set; }
        public string NomorIA { get; set; }
                     
        public string Deskripsi { get; set; }
        public int Category { get; set; }
        public string MataUang { get; set; }
        public string NamaCabang { get; set; }
        
    }
    

    

    

}