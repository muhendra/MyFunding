namespace MyWeb.Migrations.SqlFunding
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Enhance_002 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.PaymentRequest", "VendorInvoiceNo", c => c.String());
            AddColumn("dbo.PaymentRequest", "VendorInvoiceDate", c => c.DateTime());
            AddColumn("dbo.PaymentRequest", "VendorInvoiceAmount", c => c.Decimal(nullable: false, precision: 18, scale: 2));
            AlterColumn("dbo.PurchaseOrder", "Pajak", c => c.Decimal(precision: 18, scale: 2));
            AlterColumn("dbo.PurchaseOrder", "NilaiBuku", c => c.Decimal(precision: 18, scale: 2));
        }
        
        public override void Down()
        {
            AlterColumn("dbo.PurchaseOrder", "NilaiBuku", c => c.Decimal(nullable: false, precision: 18, scale: 2));
            AlterColumn("dbo.PurchaseOrder", "Pajak", c => c.Decimal(nullable: false, precision: 18, scale: 2));
            DropColumn("dbo.PaymentRequest", "VendorInvoiceAmount");
            DropColumn("dbo.PaymentRequest", "VendorInvoiceDate");
            DropColumn("dbo.PaymentRequest", "VendorInvoiceNo");
        }
    }
}
