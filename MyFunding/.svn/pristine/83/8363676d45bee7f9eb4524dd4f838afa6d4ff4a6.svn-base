namespace MyWeb.Migrations.SqlFunding
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class modifypaymentrequest : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.PaymentRequest", "PaymentRequestId", c => c.String());
        }
        
        public override void Down()
        {
            AlterColumn("dbo.PaymentRequest", "PaymentRequestId", c => c.Int());
        }
    }
}
