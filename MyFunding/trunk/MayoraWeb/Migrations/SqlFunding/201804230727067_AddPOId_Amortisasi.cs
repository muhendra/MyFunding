namespace MyWeb.Migrations.SqlFunding
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddPOId_Amortisasi : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.AmortisasiRequest", "DOid", "dbo.DeliveryOrder");
            DropIndex("dbo.AmortisasiRequest", new[] { "DOid" });
            AddColumn("dbo.AmortisasiRequest", "POId", c => c.Int());
            AlterColumn("dbo.AmortisasiRequest", "DOid", c => c.Int());
            CreateIndex("dbo.AmortisasiRequest", "DOid");
            CreateIndex("dbo.AmortisasiRequest", "POId");
            AddForeignKey("dbo.AmortisasiRequest", "POId", "dbo.PurchaseOrder", "Id");
            AddForeignKey("dbo.AmortisasiRequest", "DOid", "dbo.DeliveryOrder", "Id");
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.AmortisasiRequest", "DOid", "dbo.DeliveryOrder");
            DropForeignKey("dbo.AmortisasiRequest", "POId", "dbo.PurchaseOrder");
            DropIndex("dbo.AmortisasiRequest", new[] { "POId" });
            DropIndex("dbo.AmortisasiRequest", new[] { "DOid" });
            AlterColumn("dbo.AmortisasiRequest", "DOid", c => c.Int(nullable: false));
            DropColumn("dbo.AmortisasiRequest", "POId");
            CreateIndex("dbo.AmortisasiRequest", "DOid");
            AddForeignKey("dbo.AmortisasiRequest", "DOid", "dbo.DeliveryOrder", "Id", cascadeDelete: true);
        }
    }
}
