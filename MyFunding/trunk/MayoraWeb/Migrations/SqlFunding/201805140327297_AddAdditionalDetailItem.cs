namespace MyWeb.Migrations.SqlFunding
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddAdditionalDetailItem : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.PurchaseOrder", "AdditionalInfoDetailItem", c => c.String());
            AddColumn("dbo.PurchaseOrder", "NamaBank", c => c.String());
            AddColumn("dbo.PurchaseOrder", "NomorRekeningVendor", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.PurchaseOrder", "NomorRekeningVendor");
            DropColumn("dbo.PurchaseOrder", "NamaBank");
            DropColumn("dbo.PurchaseOrder", "AdditionalInfoDetailItem");
        }
    }
}
