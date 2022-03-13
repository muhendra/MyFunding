namespace MyWeb.Migrations.SqlStatement
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Migrate_10 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.MasterPDF", "Subject", c => c.String(maxLength: 30, unicode: false));
            AlterColumn("dbo.MasterEmailTemplate", "Description", c => c.String(maxLength: 30, unicode: false));
        }
        
        public override void Down()
        {
            AlterColumn("dbo.MasterEmailTemplate", "Description", c => c.String(maxLength: 500, unicode: false));
            DropColumn("dbo.MasterPDF", "Subject");
        }
    }
}
