namespace MyWeb.Migrations.SqlStatement
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class _Migrate_006 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.MasterPDF", "Folder", c => c.String());
            AddColumn("dbo.MasterPDF", "File", c => c.String());
            DropColumn("dbo.MasterPDF", "CIF");
            DropColumn("dbo.MasterPDF", "PDF");
        }
        
        public override void Down()
        {
            AddColumn("dbo.MasterPDF", "PDF", c => c.String());
            AddColumn("dbo.MasterPDF", "CIF", c => c.String(maxLength: 20, unicode: false));
            DropColumn("dbo.MasterPDF", "File");
            DropColumn("dbo.MasterPDF", "Folder");
        }
    }
}
