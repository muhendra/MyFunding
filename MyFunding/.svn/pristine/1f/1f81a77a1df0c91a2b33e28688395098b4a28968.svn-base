namespace MyWeb.Migrations.SqlFunding
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class purchasereceive : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.PurchaseReceive",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        PurchaseOrderId = c.Int(nullable: false),
                        PurchaseReceiveId = c.String(),
                        PurchaseReceiveDate = c.DateTime(),
                        Receiver = c.String(),
                        Condition = c.Int(nullable: false),
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
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.PurchaseReceive", "PurchaseOrderId", "dbo.PurchaseOrder");
            DropIndex("dbo.PurchaseReceive", new[] { "PurchaseOrderId" });
            DropTable("dbo.PurchaseReceive");
        }
    }
}
