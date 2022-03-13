namespace MyWeb.Migrations.SqlFunding
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class migrateamortisasi001 : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.AmortisasiRequest", "POid", "dbo.PurchaseOrder");
            DropIndex("dbo.AmortisasiRequest", new[] { "POid" });
            AddColumn("dbo.AmortisasiRequest", "DOid", c => c.Int(nullable: false));
            CreateIndex("dbo.AmortisasiRequest", "DOid");
            AddForeignKey("dbo.AmortisasiRequest", "DOid", "dbo.DeliveryOrder", "Id", cascadeDelete: true);
            DropColumn("dbo.AmortisasiRequest", "POid");
        }
        
        public override void Down()
        {
            AddColumn("dbo.AmortisasiRequest", "POid", c => c.Int(nullable: false));
            DropForeignKey("dbo.AmortisasiRequest", "DOid", "dbo.DeliveryOrder");
            DropIndex("dbo.AmortisasiRequest", new[] { "DOid" });
            DropColumn("dbo.AmortisasiRequest", "DOid");
            CreateIndex("dbo.AmortisasiRequest", "POid");
            AddForeignKey("dbo.AmortisasiRequest", "POid", "dbo.PurchaseOrder", "Id", cascadeDelete: true);
        }
    }
}
