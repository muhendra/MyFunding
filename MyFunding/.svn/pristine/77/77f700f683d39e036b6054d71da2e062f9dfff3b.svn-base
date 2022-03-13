namespace MyWeb.Migrations.SqlStatement
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Migrate_003 : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.RegisteredAccount",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        StatementPeriod = c.String(maxLength: 6),
                        CIF = c.String(maxLength: 8),
                        AccountNo = c.String(maxLength: 15),
                        BirthDate = c.DateTime(storeType: "date"),
                        Email = c.String(maxLength: 255),
                        ProductCategory = c.Int(nullable: false),
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
            DropTable("dbo.RegisteredAccount");
        }
    }
}
