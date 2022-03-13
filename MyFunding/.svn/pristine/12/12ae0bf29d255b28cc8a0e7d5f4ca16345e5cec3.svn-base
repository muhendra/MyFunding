using MyWeb.DataLayer.Statement;
using MyWeb.Models.Statement;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace MyWeb.Migrations.SqlStatement
{
    public class SqlStatementDbContext : DbContext
    {
        public SqlStatementDbContext()
            : base("SqlMyStatementConnection")
        {
            Database.SetInitializer<SqlStatementDbContext>(null);
        }

        public DbSet<MasterPDF> MasterPDFSet { get; set; }
        public DbSet<UploadTextFile> UploadTextFileSet { get; set; }
        public DbSet<HeaderTextFile> HeaderTextFileSet { get; set; }
        public DbSet<DetailFooter> DetailFooterSet { get; set; }
        public DbSet<DetailBody> DetailBodySet { get; set; }
        public DbSet<MasterProduct> MasterProductSet { get; set; }
        public DbSet<MasterPromotion> MasterPromotionSet { get; set; }
        public DbSet<MasterParameter> MasterParameterSet { get; set; }
        public DbSet<MasterEmailTemplate> MasterEmailTemplateSet { get; set; }
        public DbSet<RegisteredAccount> RegisteredAccountSet { get; set; }
        public DbSet<InsertLog> InsertLogSet { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Configurations.Add(new MasterPDFConfiguration());
            modelBuilder.Configurations.Add(new MasterProductConfiguration());
            modelBuilder.Configurations.Add(new UploadTextFileConfiguration());
            modelBuilder.Configurations.Add(new HeaderTextFileConfiguration());
            modelBuilder.Configurations.Add(new DetailFooterFileConfiguration());
            modelBuilder.Configurations.Add(new DetailBodyFileConfiguration());
            modelBuilder.Configurations.Add(new MasterEmailTemplateConfiguration());
            modelBuilder.Configurations.Add(new MasterParameterConfiguration());
            modelBuilder.Configurations.Add(new MasterPromotionConfiguration());
            modelBuilder.Configurations.Add(new RegisteredAccountConfiguration());
            modelBuilder.Configurations.Add(new InsertLogConfiguration());
        }
    }
}