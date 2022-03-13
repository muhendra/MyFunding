namespace MyWeb.Migrations.SqlFunding
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class migrateBreakAmortisasi002 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.BreakAmortisasiRequest", "TransactionCode", c => c.String());
            AddColumn("dbo.BreakAmortisasiRequest", "JurnalName", c => c.String());
            AddColumn("dbo.BreakAmortisasiRequest", "Memo", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.BreakAmortisasiRequest", "Memo");
            DropColumn("dbo.BreakAmortisasiRequest", "JurnalName");
            DropColumn("dbo.BreakAmortisasiRequest", "TransactionCode");
        }
    }
}
