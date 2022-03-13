namespace MyWeb.Migrations.SqlFunding
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class addPurchaseRequest : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.PurchaseOrder",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        EnquiryId = c.Int(nullable: false),
                        DetailBarangId = c.Int(),
                        POId = c.String(),
                        PODate = c.DateTime(),
                        POGroupId = c.String(),
                        CategoryId = c.String(),
                        PolaId = c.String(),
                        UnitId = c.Int(nullable: false),
                        TypeId = c.String(),
                        PaymentMethod = c.Int(nullable: false),
                        PaymentType = c.Int(nullable: false),
                        DPAmount = c.Decimal(nullable: false, precision: 18, scale: 2),
                        Quantity = c.Int(),
                        Currency = c.Int(nullable: false),
                        NominalBarang = c.Decimal(nullable: false, precision: 18, scale: 2),
                        NominalPurchase = c.Decimal(nullable: false, precision: 18, scale: 2),
                        TotalPurchase = c.Decimal(nullable: false, precision: 18, scale: 2),
                        SupplierId = c.String(),
                        NilaiBuku = c.Decimal(nullable: false, precision: 18, scale: 2),
                        NikEmp = c.String(),
                        DeptId = c.String(),
                        VendorQuotationNo = c.String(),
                        VendorQuotationDate = c.DateTime(),
                        VendorQuotationAmount = c.Decimal(nullable: false, precision: 18, scale: 2),
                        VendorInvoiceNo = c.String(),
                        VendorInvoiceDate = c.DateTime(),
                        VendorInvoiceAmount = c.Decimal(nullable: false, precision: 18, scale: 2),
                        PODescription = c.String(),
                        ApproveBy2 = c.String(),
                        ApproveDate2 = c.DateTime(),
                        StatusData2 = c.Int(nullable: false),
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
                .ForeignKey("dbo.DetailBarang", t => t.DetailBarangId)
                .ForeignKey("dbo.EnquiryTabunganInput", t => t.EnquiryId, cascadeDelete: true)
                .Index(t => t.EnquiryId)
                .Index(t => t.DetailBarangId);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.PurchaseOrder", "EnquiryId", "dbo.EnquiryTabunganInput");
            DropForeignKey("dbo.PurchaseOrder", "DetailBarangId", "dbo.DetailBarang");
            DropIndex("dbo.PurchaseOrder", new[] { "DetailBarangId" });
            DropIndex("dbo.PurchaseOrder", new[] { "EnquiryId" });
            DropTable("dbo.PurchaseOrder");
        }
    }
}
