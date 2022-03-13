namespace MyWeb.Migrations.SqlFunding
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class addenquirytabungan : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.EnquiryTabunganInput",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        TglBukaRekening = c.DateTime(),
                        JenisTabungan = c.String(),
                        NoRekening = c.String(),
                        NoCif = c.String(),
                        NamaNasabah = c.String(),
                        KodePromosi = c.String(),
                        Cabang = c.String(),
                        StartDate = c.DateTime(),
                        MaturityDate = c.DateTime(),
                        Nominal = c.Decimal(nullable: false, precision: 18, scale: 2),
                        PRId = c.String(),
                        PRDate = c.String(),
                        DraftPRId = c.String(),
                        DraftPRDate = c.String(),
                        AttachmentSPNasabah = c.String(),
                        RewardBudget = c.String(),
                        AttachmentMemoDireksi = c.String(),
                        CatatanCabang = c.String(),
                        CatatanFProduct = c.String(),
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
            DropTable("dbo.EnquiryTabunganInput");
        }
    }
}
