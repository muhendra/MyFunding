namespace MyWeb.Migrations.SqlFunding
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Add_AmortisasiRequest001 : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.AmortisasiRequest",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        RequestId = c.String(),
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
                .PrimaryKey(t => t.Id);

            CreateTable(
                "dbo.AmortisasiRequestDetail",
                c => new
                {
                    Id = c.Int(nullable: false, identity: true),
                    AmortisasiRequestId = c.Int(nullable: false),
                    Value_date = c.DateTime(nullable: false),
                    BranchId = c.String(),
                    BranchName = c.String(),
                    AccCategoryId = c.String(),
                    DebitKredit = c.String(),
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
                .ForeignKey("dbo.AmortisasiRequest", t => t.AmortisasiRequestId, cascadeDelete: true)
                .Index(t => t.AmortisasiRequestId);
            
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.AmortisasiRequestDetail", "AmortisasiRequestId", "dbo.AmortisasiRequest");
            DropIndex("dbo.AmortisasiRequestDetail", new[] { "AmortisasiRequestId" });
            DropTable("dbo.AmortisasiRequestDetail");
            DropTable("dbo.AmortisasiRequest");
        }
    }
}
