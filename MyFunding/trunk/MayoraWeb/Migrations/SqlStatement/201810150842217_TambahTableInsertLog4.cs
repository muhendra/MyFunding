namespace MyWeb.Migrations.SqlStatement
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class TambahTableInsertLog4 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.InsertLog", "Module", c => c.String());
            AddColumn("dbo.InsertLog", "Process", c => c.String());
            AddColumn("dbo.InsertLog", "LogMessage", c => c.String());
            DropColumn("dbo.InsertLog", "ProcessLog");
        }
        
        public override void Down()
        {
            AddColumn("dbo.InsertLog", "ProcessLog", c => c.String());
            DropColumn("dbo.InsertLog", "LogMessage");
            DropColumn("dbo.InsertLog", "Process");
            DropColumn("dbo.InsertLog", "Module");
        }
    }
}
