namespace MyWeb.Migrations.SqlFunding
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class updatedeliveryorder : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.DeliveryOrder",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        PurchaseOrderId = c.Int(nullable: false),
                        DeliveryOrderId = c.String(),
                        DeliveryOrderDate = c.DateTime(),
                        StatusBarang = c.Int(nullable: false),
                        Receiver = c.String(),
                        Condition = c.Int(nullable: false),
                        attachmentTandaTerima = c.String(),
                        Description = c.String(),
                        CreateBy = c.String(),
                        CreateDate = c.DateTime(),
                        UpdateBy = c.String(),
                        UpdateDate = c.DateTime(),
                        ApproveBy = c.String(),
                        ApproveDate = c.DateTime(),
                        RejectBy = c.String(),
                        RejectDate = c.DateTime(),
                        RejectReason = c.String(),
                        CompanyId = c.Int(),
                        BranchId = c.Int(),
                        StatusData = c.Int(nullable: false),
                        IsDelete = c.Boolean(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.PurchaseOrder", t => t.PurchaseOrderId, cascadeDelete: true)
                .Index(t => t.PurchaseOrderId);
            
            AlterColumn("dbo.JurnalPelunasan", "DebetKredit", c => c.Int(nullable: false));
            AlterColumn("dbo.JurnalPembayaran", "DebetKredit", c => c.Int(nullable: false));
            //AlterColumn("dbo.Katalog", "Kode_Promo", c => c.String(nullable: false));
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.DeliveryOrder", "PurchaseOrderId", "dbo.PurchaseOrder");
            DropIndex("dbo.DeliveryOrder", new[] { "PurchaseOrderId" });
            //AlterColumn("dbo.Katalog", "Kode_Promo", c => c.String());
            AlterColumn("dbo.JurnalPembayaran", "DebetKredit", c => c.String());
            AlterColumn("dbo.JurnalPelunasan", "DebetKredit", c => c.String());
            DropTable("dbo.DeliveryOrder");
        }
    }
}
