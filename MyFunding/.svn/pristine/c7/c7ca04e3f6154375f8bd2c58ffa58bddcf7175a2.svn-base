namespace MyWeb.Migrations.SqlFunding
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class migrateKatalog0011 : DbMigration
    {
        public override void Up()
        {
            //DropForeignKey("dbo.DeliveryOrder", "POId", "dbo.PurchaseOrder");
            //DropIndex("dbo.DeliveryOrder", new[] { "POId" });
            CreateTable(
                "dbo.Katalog",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Kode_Promo = c.String(),
                        Kategory = c.Int(nullable: false),
                        Merk = c.String(),
                        Type = c.String(),
                        JangkaWaktu = c.Int(nullable: false),
                        MonthsYears = c.Int(nullable: false),
                        NominalHold = c.Decimal(nullable: false, precision: 18, scale: 2),
                        Penalty = c.Decimal(nullable: false, precision: 18, scale: 2),
                        ProgramName = c.Int(nullable: false),
                        AttachmentKatalog = c.String(),
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
                .PrimaryKey(t => t.Id);
            
            //AlterColumn("dbo.JurnalPelunasan", "DebetKredit", c => c.String());
            //AlterColumn("dbo.JurnalPembayaran", "DebetKredit", c => c.String());
            //DropTable("dbo.DeliveryOrder");
        }
        
        public override void Down()
        {
            //CreateTable(
            //    "dbo.DeliveryOrder",
            //    c => new
            //        {
            //            Id = c.Int(nullable: false, identity: true),
            //            POId = c.Int(nullable: false),
            //            DeliveryOrderId = c.String(),
            //            DeliveryOrderDate = c.DateTime(),
            //            StatusBarang = c.Int(nullable: false),
            //            Receiver = c.String(),
            //            Condition = c.Int(nullable: false),
            //            attachmentTandaTerima = c.String(),
            //            Description = c.String(),
            //            CreateBy = c.String(),
            //            CreateDate = c.DateTime(),
            //            UpdateBy = c.String(),
            //            UpdateDate = c.DateTime(),
            //            ApproveBy = c.String(),
            //            ApproveDate = c.DateTime(),
            //            RejectBy = c.String(),
            //            RejectDate = c.DateTime(),
            //            RejectReason = c.String(),
            //            CompanyId = c.Int(),
            //            BranchId = c.Int(),
            //            StatusData = c.Int(nullable: false),
            //            IsDelete = c.Boolean(nullable: false),
            //        })
            //    .PrimaryKey(t => t.Id);
            
            //AlterColumn("dbo.JurnalPembayaran", "DebetKredit", c => c.Int(nullable: false));
            //AlterColumn("dbo.JurnalPelunasan", "DebetKredit", c => c.Int(nullable: false));
            DropTable("dbo.Katalog");
            //CreateIndex("dbo.DeliveryOrder", "POId");
            //AddForeignKey("dbo.DeliveryOrder", "POId", "dbo.PurchaseOrder", "Id", cascadeDelete: true);
        }
    }
}
