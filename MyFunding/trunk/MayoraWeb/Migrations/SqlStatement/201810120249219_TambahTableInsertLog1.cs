namespace MyWeb.Migrations.SqlStatement
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class TambahTableInsertLog1 : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.InsertLog",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Nik = c.String(),
                        ProcessLog = c.String(),
                        TanggalProcess = c.DateTime(nullable: false),
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
            DropTable("dbo.InsertLog");
        }
    }
}
