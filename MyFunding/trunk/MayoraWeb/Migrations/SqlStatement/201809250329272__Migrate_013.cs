namespace MyWeb.Migrations.SqlStatement
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class _Migrate_013 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.MasterPDF", "Remark", c => c.String());
            DropColumn("dbo.MasterPDF", "Failed");
        }
        
        public override void Down()
        {
            AddColumn("dbo.MasterPDF", "Failed", c => c.Int(nullable: false));
            DropColumn("dbo.MasterPDF", "Remark");
        }
    }
}
