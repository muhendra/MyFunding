namespace MyWeb.Migrations.SqlFunding
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddApproveReceive : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.PurchaseReceive", "ApproveReceiveDateTime", c => c.DateTime());
            AddColumn("dbo.PurchaseReceive", "ApproveReceiveBy", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.PurchaseReceive", "ApproveReceiveBy");
            DropColumn("dbo.PurchaseReceive", "ApproveReceiveDateTime");
        }
    }
}
