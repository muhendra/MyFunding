namespace MyWeb.Migrations.SqlFunding
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class modifytanggaldraft : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.EnquiryTabunganInput", "PRDate", c => c.DateTime());
            AlterColumn("dbo.EnquiryTabunganInput", "DraftPRDate", c => c.DateTime());
        }
        
        public override void Down()
        {
            AlterColumn("dbo.EnquiryTabunganInput", "DraftPRDate", c => c.String());
            AlterColumn("dbo.EnquiryTabunganInput", "PRDate", c => c.String());
        }
    }
}
