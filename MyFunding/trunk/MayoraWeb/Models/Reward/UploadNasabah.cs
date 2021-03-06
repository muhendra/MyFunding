using Core.Web.Models.Applications;
using Core.Web.Utilities;
using MyWeb.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace MyWeb.Models.Reward
{
    public class UploadNasabah : EntityBase
    {
        public int Id { get; set; }
        public string NoRekening { get; set; }
        public string AttachmentSPNasabah { get; set; }
    }

    //20200710, Eka, BEGIN
    public class UploadPenyimpangan : EntityBase
    {
        public int id { get; set; }
        public string NoRekening { get; set; }
        public string AttachmentPenyimpangan { get; set; }
    }
    //20200710, Eka, END
}