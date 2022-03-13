using System;
using System.Collections.Generic;
using System.Data.Entity.ModelConfiguration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GetDataPDF.Configuration
{
    public class MasterParametersConfiguration : EntityTypeConfiguration<MasterParameterModel>
    {
        public MasterParametersConfiguration()
        {
            ToTable("MasterParameter");
        }
    }
}
