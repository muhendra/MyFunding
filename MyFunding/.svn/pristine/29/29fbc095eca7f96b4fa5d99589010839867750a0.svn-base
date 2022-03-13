namespace MyWeb.Migrations.SqlStatement
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Migrate_012 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.MasterPDF", "Success", c => c.Int(nullable: false));
            AddColumn("dbo.MasterPDF", "Failure", c => c.Int(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.MasterPDF", "Failure");
            DropColumn("dbo.MasterPDF", "Success");
        }
    }
}
