namespace MyWeb.Migrations.SqlFunding
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddVendorInvoice_Pelunasan : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.PurchaseReceive", "VendorInvoiceNo", c => c.String());
            AddColumn("dbo.PurchaseReceive", "VendorInvoiceDate", c => c.DateTime());
            AddColumn("dbo.PurchaseReceive", "VendorInvoiceAmount", c => c.Decimal(nullable: false, precision: 18, scale: 2));
            AddColumn("dbo.PaymentRequest", "PaymentRequestType", c => c.Int());
        }
        
        public override void Down()
        {
            DropColumn("dbo.PaymentRequest", "PaymentRequestType");
            DropColumn("dbo.PurchaseReceive", "VendorInvoiceAmount");
            DropColumn("dbo.PurchaseReceive", "VendorInvoiceDate");
            DropColumn("dbo.PurchaseReceive", "VendorInvoiceNo");
        }
    }
}
