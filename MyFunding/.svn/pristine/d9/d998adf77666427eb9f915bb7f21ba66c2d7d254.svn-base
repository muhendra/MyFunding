namespace MyWeb.Migrations.SqlFunding
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class detailbarang : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.DetailBarang",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        EnquiryId = c.Int(),
                        PromotionCode = c.String(),
                        KategoriBarang = c.String(),
                        TypeBarang = c.String(),
                        Penalty = c.String(),
                        Quantity = c.String(),
                        Warna = c.String(),
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
            
            AddColumn("dbo.EnquiryTabunganInput", "DetailBarangId", c => c.Int());
            CreateIndex("dbo.EnquiryTabunganInput", "DetailBarangId");
            AddForeignKey("dbo.EnquiryTabunganInput", "DetailBarangId", "dbo.DetailBarang", "Id");
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.EnquiryTabunganInput", "DetailBarangId", "dbo.DetailBarang");
            DropIndex("dbo.EnquiryTabunganInput", new[] { "DetailBarangId" });
            DropColumn("dbo.EnquiryTabunganInput", "DetailBarangId");
            DropTable("dbo.DetailBarang");
        }
    }
}
