using GetDataPDF.Model;
using System;
using System.Collections.Generic;
using System.Data.Entity.ModelConfiguration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GetDataPDF.Configuration
{
    public class DetailFooterConfiguration : EntityTypeConfiguration<DetailFooterModel>
    {
        public DetailFooterConfiguration()
        {
            ToTable("DetailFooter");
        }
    }
}
