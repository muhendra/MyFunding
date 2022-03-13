namespace MyWeb.Migrations.SqlStatement
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class _Migrate_007 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.MasterPDF", "Failed", c => c.Int(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.MasterPDF", "Failed");
        }
    }
}
