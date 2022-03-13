namespace MyWeb.Migrations.SqlFunding
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class jurnalpembayaran : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.JurnalPembayaran",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        POId = c.Int(),
                        ValueDate = c.DateTime(),
                        BranchId = c.String(),
                        BranchName = c.String(),
                        InternalAccount = c.String(),
                        InternalAccountName = c.String(),
                        DebetKredit = c.String(),
                        Narrative = c.String(),
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
                .ForeignKey("dbo.PurchaseOrder", t => t.POId)
                .Index(t => t.POId);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.JurnalPembayaran", "POId", "dbo.PurchaseOrder");
            DropIndex("dbo.JurnalPembayaran", new[] { "POId" });
            DropTable("dbo.JurnalPembayaran");
        }
    }
}
