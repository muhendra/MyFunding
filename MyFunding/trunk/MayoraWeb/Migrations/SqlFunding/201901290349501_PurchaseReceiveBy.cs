namespace MyWeb.Migrations.SqlFunding
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class PurchaseReceiveBy : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.PurchaseOrder", "PurchaseReceiveBy", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.PurchaseOrder", "PurchaseReceiveBy");
        }
    }
}
