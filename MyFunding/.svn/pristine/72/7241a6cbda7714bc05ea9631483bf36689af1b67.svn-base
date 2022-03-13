namespace MyWeb.Migrations.SqlStatement
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialSqlFunding : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.MasterProduct", "BirthDate", c => c.DateTime(storeType: "date"));
            AddColumn("dbo.MasterProduct", "Email", c => c.String(maxLength: 255));
        }
        
        public override void Down()
        {
            DropColumn("dbo.MasterProduct", "Email");
            DropColumn("dbo.MasterProduct", "BirthDate");
        }
    }
}
