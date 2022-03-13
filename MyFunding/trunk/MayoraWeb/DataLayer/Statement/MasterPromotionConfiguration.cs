using MyWeb.Models.Statement;
using System;
using System.Collections.Generic;
using System.Data.Entity.ModelConfiguration;
using System.Linq;
using System.Web;

namespace MyWeb.DataLayer.Statement
{
    public class MasterPromotionConfiguration :EntityTypeConfiguration<MasterPromotion>
    {
        public MasterPromotionConfiguration ()
	    {
            ToTable("MasterPromotion");
	    }
        
    }
}