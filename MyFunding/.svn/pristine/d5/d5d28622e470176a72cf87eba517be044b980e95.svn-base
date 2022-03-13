namespace MyWeb.Migrations.SqlFunding
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class migrateKatalog001 : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Katalog",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Kode_Promo = c.String(),
                        Kategory = c.Int(nullable: false),
                        Merk = c.String(),
                        Type = c.String(),
                        JangkaWaktu = c.Int(nullable: false),
                        MonthsYears = c.Int(nullable: false),
                        NominalHold = c.Decimal(nullable: false, precision: 18, scale: 2),
                        Penalty = c.Decimal(nullable: false, precision: 18, scale: 2),
                        ProgramName = c.Int(nullable: false),
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
            DropTable("dbo.Katalog");
        }
    }
}
