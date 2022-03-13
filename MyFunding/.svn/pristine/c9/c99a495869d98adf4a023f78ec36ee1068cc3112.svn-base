namespace MyWeb.Migrations.SqlFunding
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddIsProceed : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.KartuAmortisasi", "IsProceed", c => c.Boolean(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.KartuAmortisasi", "IsProceed");
        }
    }
}
