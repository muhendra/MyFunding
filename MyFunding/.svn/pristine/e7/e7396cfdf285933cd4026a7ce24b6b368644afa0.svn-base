namespace MyWeb.Migrations.SqlFunding
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class migrateFunding002 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.AmortisasiRequest", "POid", c => c.Int(nullable: false));
            CreateIndex("dbo.AmortisasiRequest", "POid");
            AddForeignKey("dbo.AmortisasiRequest", "POid", "dbo.PurchaseOrder", "Id", cascadeDelete: true);
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.AmortisasiRequest", "POid", "dbo.PurchaseOrder");
            DropIndex("dbo.AmortisasiRequest", new[] { "POid" });
            DropColumn("dbo.AmortisasiRequest", "POid");
        }
    }
}
