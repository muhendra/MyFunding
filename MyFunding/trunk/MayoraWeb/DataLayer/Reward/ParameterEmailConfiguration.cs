using MyWeb.Models.Reward;
using System;
using System.Collections.Generic;
using System.Data.Entity.ModelConfiguration;
using System.Linq;
using System.Web;

namespace MyWeb.DataLayer.Reward
{
    public class ParameterEmailConfiguration : EntityTypeConfiguration<ParameterEmail>
    {
        public ParameterEmailConfiguration()
        {
            ToTable("ParameterEmail");
        }
    }
}