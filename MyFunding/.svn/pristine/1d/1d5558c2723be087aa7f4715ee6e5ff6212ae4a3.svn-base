namespace MyWeb.Migrations.SqlFunding
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddMasterJurnalOtomatis : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.MasterJurnalOtomatis",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Transaksi = c.String(),
                        JurnalType = c.String(),
                        DebetKredit = c.Int(nullable: false),
                        InternalAccountName = c.String(),
                        InternalAccount = c.String(),
                        UangMuka = c.String(),
                        FBBeforeReceive = c.String(),
                        FBAfterReceive = c.String(),
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
            DropTable("dbo.MasterJurnalOtomatis");
        }
    }
}
