namespace MyWeb.Migrations.SqlStatement
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class TambahTableInsertLog3 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.InsertLog", "TimeSpend", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.InsertLog", "TimeSpend");
        }
    }
}
