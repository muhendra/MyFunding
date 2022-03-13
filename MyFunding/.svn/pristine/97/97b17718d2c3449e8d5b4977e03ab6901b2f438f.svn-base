namespace MyWeb.Migrations.SqlFunding
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddKartuAmortisasi : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.KartuAmortisasi",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        AmortisasiRequestId = c.Int(nullable: false),
                        Periode = c.Int(nullable: false),
                        ValueDate = c.DateTime(nullable: false),
                        AmortizeAmount = c.Decimal(nullable: false, precision: 18, scale: 2),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.AmortisasiRequest", t => t.AmortisasiRequestId, cascadeDelete: true)
                .Index(t => t.AmortisasiRequestId);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.KartuAmortisasi", "AmortisasiRequestId", "dbo.AmortisasiRequest");
            DropIndex("dbo.KartuAmortisasi", new[] { "AmortisasiRequestId" });
            DropTable("dbo.KartuAmortisasi");
        }
    }
}
