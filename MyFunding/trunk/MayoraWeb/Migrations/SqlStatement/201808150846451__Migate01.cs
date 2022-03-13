namespace MyWeb.Migrations.SqlStatement
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class _Migate01 : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.DetailBody",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        IDHeader = c.Int(nullable: false),
                        Detail = c.String(),
                        Tanggal = c.String(),
                        Valuta = c.String(),
                        Narative = c.String(),
                        NoRef = c.String(),
                        Debet = c.String(),
                        Kredit = c.String(),
                        Saldo = c.String(),
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
                .PrimaryKey(t => t.ID)
                .ForeignKey("dbo.HeaderTextFile", t => t.IDHeader, cascadeDelete: true)
                .Index(t => t.IDHeader);
            
            CreateTable(
                "dbo.HeaderTextFile",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        Periode = c.String(),
                        CIF = c.String(),
                        AccountNo = c.String(),
                        AccountName = c.String(),
                        Currency = c.String(),
                        Alamat1 = c.String(),
                        Alamat2 = c.String(),
                        Alamat3 = c.String(),
                        NPWP = c.String(),
                        OldAcctNo = c.String(),
                        cabang = c.String(),
                        TypeAccount = c.String(),
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
                .PrimaryKey(t => t.ID);
            
            CreateTable(
                "dbo.DetailFooter",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        IDHeader = c.Int(nullable: false),
                        NoHalaman = c.String(),
                        SaldoAwal = c.String(),
                        SaldoAkhir = c.String(),
                        TotalDebet = c.String(),
                        TotalKredit = c.String(),
                        FrekuensiDebet = c.String(),
                        FrekuensiKredit = c.String(),
                        SaldoTerendah = c.String(),
                        SaldoTertinggi = c.String(),
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
                .PrimaryKey(t => t.ID)
                .ForeignKey("dbo.HeaderTextFile", t => t.IDHeader, cascadeDelete: true)
                .Index(t => t.IDHeader);
            
            CreateTable(
                "dbo.MasterEmailTemplate",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        Name = c.String(maxLength: 100, unicode: false),
                        Description = c.String(maxLength: 500, unicode: false),
                        Content = c.String(maxLength: 8000, unicode: false),
                        ProductCode = c.String(maxLength: 10, unicode: false),
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
                .PrimaryKey(t => t.ID);
            
            CreateTable(
                "dbo.MasterParameter",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        Name = c.String(maxLength: 100, unicode: false),
                        Value = c.String(maxLength: 8000, unicode: false),
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
                .PrimaryKey(t => t.ID);
            
            CreateTable(
                "dbo.MasterProduct",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Code = c.String(maxLength: 10),
                        ProductName = c.String(maxLength: 300),
                        IsActive = c.Boolean(nullable: false),
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
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.MasterPromotion",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        Name = c.String(maxLength: 200, unicode: false),
                        ProductCode = c.String(maxLength: 10, unicode: false),
                        Message = c.String(maxLength: 300, unicode: false),
                        PeriodFrom = c.DateTime(nullable: false, storeType: "date"),
                        PeriodTo = c.DateTime(storeType: "date"),
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
                .PrimaryKey(t => t.ID);
            
            CreateTable(
                "dbo.MasterTextFile",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        NameFile = c.String(),
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
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.DetailFooter", "IDHeader", "dbo.HeaderTextFile");
            DropForeignKey("dbo.DetailBody", "IDHeader", "dbo.HeaderTextFile");
            DropIndex("dbo.DetailFooter", new[] { "IDHeader" });
            DropIndex("dbo.DetailBody", new[] { "IDHeader" });
            DropTable("dbo.MasterTextFile");
            DropTable("dbo.MasterPromotion");
            DropTable("dbo.MasterProduct");
            DropTable("dbo.MasterParameter");
            DropTable("dbo.MasterEmailTemplate");
            DropTable("dbo.DetailFooter");
            DropTable("dbo.HeaderTextFile");
            DropTable("dbo.DetailBody");
        }
    }
}
