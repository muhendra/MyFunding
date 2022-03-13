namespace MyWeb.Migrations.SqlFunding
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class migrateBreakAmortisasi001 : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.BreakAmortisasiRequestDetail",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        BreakAmortisasiRequestId = c.Int(nullable: false),
                        Value_date = c.DateTime(nullable: false),
                        BranchId = c.String(),
                        BranchName = c.String(),
                        IntAccCategoryId = c.String(),
                        IntAccCategoryName = c.String(),
                        DebitKredit = c.Int(nullable: false),
                        Narative = c.String(),
                        Currency = c.String(),
                        Amount = c.Decimal(nullable: false, precision: 18, scale: 2),
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
                        StatusData = c.Int(nullable: false),
                        IsDelete = c.Boolean(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.BreakAmortisasiRequest", t => t.BreakAmortisasiRequestId, cascadeDelete: true)
                .Index(t => t.BreakAmortisasiRequestId);
            
            CreateTable(
                "dbo.BreakAmortisasiRequest",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        RequestId = c.String(),
                        TTid = c.Int(nullable: false),
                        RequestDate = c.DateTime(nullable: false),
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
                .ForeignKey("dbo.AmortisasiRequest", t => t.TTid, cascadeDelete: true)
                .Index(t => t.TTid);
            
            AddColumn("dbo.AmortisasiRequest", "IsBreak", c => c.Boolean(nullable: false));
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.BreakAmortisasiRequest", "TTid", "dbo.AmortisasiRequest");
            DropForeignKey("dbo.BreakAmortisasiRequestDetail", "BreakAmortisasiRequestId", "dbo.BreakAmortisasiRequest");
            DropIndex("dbo.BreakAmortisasiRequest", new[] { "TTid" });
            DropIndex("dbo.BreakAmortisasiRequestDetail", new[] { "BreakAmortisasiRequestId" });
            DropColumn("dbo.AmortisasiRequest", "IsBreak");
            DropTable("dbo.BreakAmortisasiRequest");
            DropTable("dbo.BreakAmortisasiRequestDetail");
        }
    }
}
