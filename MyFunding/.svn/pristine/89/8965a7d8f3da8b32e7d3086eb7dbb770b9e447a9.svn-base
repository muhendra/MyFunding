namespace MyWeb.Migrations.SqlFunding
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class migratePencadangan002 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Pencadangan", "NominalPencadangan", c => c.Decimal(nullable: false, precision: 18, scale: 2));
            AddColumn("dbo.Pencadangan", "startDate", c => c.DateTime(nullable: false));
            AddColumn("dbo.Pencadangan", "maturityDate", c => c.DateTime(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.Pencadangan", "maturityDate");
            DropColumn("dbo.Pencadangan", "startDate");
            DropColumn("dbo.Pencadangan", "NominalPencadangan");
        }
    }
}
