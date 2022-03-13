namespace MyWeb.Migrations.SqlFunding
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class modifyenquiryinput : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.EnquiryTabunganInput", "JenisTabungan", c => c.Int(nullable: false));
        }
        
        public override void Down()
        {
            AlterColumn("dbo.EnquiryTabunganInput", "JenisTabungan", c => c.String());
        }
    }
}
