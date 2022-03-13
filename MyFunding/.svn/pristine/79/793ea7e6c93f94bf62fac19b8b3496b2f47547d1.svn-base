namespace MyWeb.Migrations.SqlStatement
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class _Migrate_004 : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.MasterPDF",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        CIF = c.String(maxLength: 20, unicode: false),
                        AccountNo = c.String(maxLength: 20, unicode: false),
                        Period = c.String(maxLength: 20, unicode: false),
                        Branch = c.String(maxLength: 50, unicode: false),
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
            
        }
        
        public override void Down()
        {
            DropTable("dbo.MasterPDF");
        }
    }
}
