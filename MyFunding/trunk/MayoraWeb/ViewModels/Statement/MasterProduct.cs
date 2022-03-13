using AutoMapper;
using Core.Web.Controllers;
using Core.Web.Helpers;
using Core.Web.Infrastructure;
using Core.Web.Utilities;
using MyWeb.Controllers.Applications;
using MyWeb.DataLayer;
using MyWeb.DataLayer.SqlFunding;
using MyWeb.Infrastructure.Applications;
using MyWeb.Models.Reward;
using MyWeb.ViewModels.Reward;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Linq.Dynamic;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace MyWeb.ViewModels.Statement
{
    public class MasterProduct
    {
        public int Id { get; set; }
        [Display(Name="Product Code")]
        public string Code { get; set; }
        [Display(Name = "Product Name"),Required]
        public string ProductName { get; set; }
        [Display(Name = "Is Active")]
        public bool IsActive { get; set; }
        [Display(Name = "Description")]
        public string Description { get; set; }
        
    }

    public class GetCategoryTemenos
    {
        [Display(Name = "Product Code")]
        public string Code { get; set; }
        [Display(Name = "Product Name")]
        public string ProductName { get; set; }
        
    }
}