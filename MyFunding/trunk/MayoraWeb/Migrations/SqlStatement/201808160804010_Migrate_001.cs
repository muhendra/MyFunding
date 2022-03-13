namespace MyWeb.Migrations.SqlStatement
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Migrate_001 : DbMigration
    {
        public override void Up()
        {
            DropColumn("dbo.MasterProduct", "BirthDate");
            DropColumn("dbo.MasterProduct", "Email");
        }
        
        public override void Down()
        {
            AddColumn("dbo.MasterProduct", "Email", c => c.String(maxLength: 255));
            AddColumn("dbo.MasterProduct", "BirthDate", c => c.DateTime(storeType: "date"));
        }
    }
}
