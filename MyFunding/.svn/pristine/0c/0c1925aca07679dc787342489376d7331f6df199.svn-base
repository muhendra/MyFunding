namespace MyWeb.Migrations.SqlStatement
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class _Migrate_005 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.MasterPDF", "PDF", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.MasterPDF", "PDF");
        }
    }
}
