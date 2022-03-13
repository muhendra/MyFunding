namespace MyWeb.Migrations.SqlFunding
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class modifydetailbarang : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.DetailBarang", "Merek", c => c.String());
            AlterColumn("dbo.EnquiryTabunganInput", "RewardBudget", c => c.Decimal(nullable: false, precision: 18, scale: 2));
        }
        
        public override void Down()
        {
            AlterColumn("dbo.EnquiryTabunganInput", "RewardBudget", c => c.String());
            DropColumn("dbo.DetailBarang", "Merek");
        }
    }
}
