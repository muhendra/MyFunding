namespace MyWeb.Migrations.SqlFunding
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class migrateAmortisai003 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.AmortisasiRequestDetail", "ref_code", c => c.String());
            AddColumn("dbo.BreakAmortisasiRequestDetail", "ref_code", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.BreakAmortisasiRequestDetail", "ref_code");
            DropColumn("dbo.AmortisasiRequestDetail", "ref_code");
        }
    }
}
