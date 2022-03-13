namespace MyWeb.Migrations.SqlFunding
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class migratePencadangan001 : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Pencadangan",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        RequestId = c.String(),
                        POId = c.Int(nullable: false),
                        JPId = c.Int(),
                        PecadanganDate = c.DateTime(nullable: false),
                        PembalikanDate = c.DateTime(),
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
                .ForeignKey("dbo.JurnalPelunasan", t => t.JPId)
                .ForeignKey("dbo.PurchaseOrder", t => t.POId, cascadeDelete: true)
                .Index(t => t.POId)
                .Index(t => t.JPId);
            
            CreateTable(
                "dbo.PencadanganTransaksi",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        PencadanganId = c.Int(nullable: false),
                        Value_date = c.DateTime(nullable: false),
                        ref_code = c.String(),
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
                .ForeignKey("dbo.Pencadangan", t => t.PencadanganId, cascadeDelete: true)
                .Index(t => t.PencadanganId);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Pencadangan", "POId", "dbo.PurchaseOrder");
            DropForeignKey("dbo.PencadanganTransaksi", "PencadanganId", "dbo.Pencadangan");
            DropForeignKey("dbo.Pencadangan", "JPId", "dbo.JurnalPelunasan");
            DropIndex("dbo.PencadanganTransaksi", new[] { "PencadanganId" });
            DropIndex("dbo.Pencadangan", new[] { "JPId" });
            DropIndex("dbo.Pencadangan", new[] { "POId" });
            DropTable("dbo.PencadanganTransaksi");
            DropTable("dbo.Pencadangan");
        }
    }
}
