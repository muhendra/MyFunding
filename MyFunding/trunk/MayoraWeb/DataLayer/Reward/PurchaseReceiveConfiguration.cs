﻿using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.Infrastructure.Annotations;
using System.Data.Entity.ModelConfiguration;
using System.Linq;
using System.Web;
using MyWeb.Models.Reward;

namespace MyWeb.DataLayer.Reward
{
    public class PurchaseReceiveConfiguration : EntityTypeConfiguration<PurchaseReceive>
    {
        public PurchaseReceiveConfiguration()
        {
            ToTable("PurchaseReceive");
        }
    }
}