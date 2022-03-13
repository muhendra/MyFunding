namespace MyWeb.Migrations.SqlFunding
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddApprove2 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.EnquiryTabunganInput", "ApproveBy2", c => c.String());
            AddColumn("dbo.EnquiryTabunganInput", "ApproveDate2", c => c.DateTime());
            AddColumn("dbo.EnquiryTabunganInput", "StatusData2", c => c.Int(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.EnquiryTabunganInput", "StatusData2");
            DropColumn("dbo.EnquiryTabunganInput", "ApproveDate2");
            DropColumn("dbo.EnquiryTabunganInput", "ApproveBy2");
        }
    }
}
