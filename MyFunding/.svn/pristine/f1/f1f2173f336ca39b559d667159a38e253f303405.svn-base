namespace MyWeb.Migrations.SqlStatement
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class _Migrate_009 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.MasterPDF", "Content", c => c.String(unicode: false, storeType: "text"));
        }
        
        public override void Down()
        {
            DropColumn("dbo.MasterPDF", "Content");
        }
    }
}
