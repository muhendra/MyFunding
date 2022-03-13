using Core.Web.Models.Applications;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MyWeb.Models.Statement
{
    public class UploadTextFile : EntityBase
    {
        [Key]
        public int Id { get; set; }
        public string NameFile { get; set; }
    }
}