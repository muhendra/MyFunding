namespace MyWeb.Migrations.SqlFunding
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Enhance_001 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.PurchaseOrder", "Pajak", c => c.Decimal(nullable: false, precision: 18, scale: 2));
        }
        
        public override void Down()
        {
            DropColumn("dbo.PurchaseOrder", "Pajak");
        }
    }
}
