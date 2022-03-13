namespace MyWeb.Migrations.SqlFunding
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class RejectReason : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.EnquiryTabunganInput", "RejectReason2", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.EnquiryTabunganInput", "RejectReason2");
        }
    }
}
