using MyWeb.Models.Statement;
using System;
using System.Collections.Generic;
using System.Data.Entity.ModelConfiguration;
using System.Linq;
using System.Web;

namespace MyWeb.DataLayer.Statement
{
    public class MasterEmailTemplateConfiguration:EntityTypeConfiguration<MasterEmailTemplate>
    {
        public MasterEmailTemplateConfiguration()
        {
            ToTable("MasterEmailTemplate");
        }
    }
}