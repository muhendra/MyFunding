using MyWeb.Models.Statement;
using System;
using System.Collections.Generic;
using System.Data.Entity.ModelConfiguration;
using System.Linq;
using System.Web;

namespace MyWeb.DataLayer.Statement
{
    public class MasterPDFConfiguration : EntityTypeConfiguration<MasterPDF>
    {
        public MasterPDFConfiguration()
        {
            ToTable("MasterPDF");
        }
    }
}