namespace MyWeb.Migrations.SqlFunding
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddEnquiryTabungan_RejectBy2 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.EnquiryTabunganInput", "RejectBy2", c => c.String());
            AddColumn("dbo.EnquiryTabunganInput", "RejectDate2", c => c.DateTime());
        }
        
        public override void Down()
        {
            DropColumn("dbo.EnquiryTabunganInput", "RejectDate2");
            DropColumn("dbo.EnquiryTabunganInput", "RejectBy2");
        }
    }
}
