namespace MyWeb.Migrations.SqlFunding
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class updatejurnalpembayaran : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.JurnalPembayaran", "POId", "dbo.PurchaseOrder");
            DropIndex("dbo.JurnalPembayaran", new[] { "POId" });
            AddColumn("dbo.JurnalPembayaran", "PaymentRequestId", c => c.Int());
            CreateIndex("dbo.JurnalPembayaran", "PaymentRequestId");
            AddForeignKey("dbo.JurnalPembayaran", "PaymentRequestId", "dbo.PaymentRequest", "Id");
            DropColumn("dbo.JurnalPembayaran", "POId");
        }
        
        public override void Down()
        {
            AddColumn("dbo.JurnalPembayaran", "POId", c => c.Int());
            DropForeignKey("dbo.JurnalPembayaran", "PaymentRequestId", "dbo.PaymentRequest");
            DropIndex("dbo.JurnalPembayaran", new[] { "PaymentRequestId" });
            DropColumn("dbo.JurnalPembayaran", "PaymentRequestId");
            CreateIndex("dbo.JurnalPembayaran", "POId");
            AddForeignKey("dbo.JurnalPembayaran", "POId", "dbo.PurchaseOrder", "Id");
        }
    }
}
