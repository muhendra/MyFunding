namespace MyWeb.Migrations.SqlFunding
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class addrequester : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.EnquiryTabunganInput", "Requester", c => c.String());
            AlterColumn("dbo.DetailBarang", "Penalty", c => c.Decimal(nullable: false, precision: 18, scale: 2));
            AlterColumn("dbo.DetailBarang", "Quantity", c => c.Int());
        }
        
        public override void Down()
        {
            AlterColumn("dbo.DetailBarang", "Quantity", c => c.String());
            AlterColumn("dbo.DetailBarang", "Penalty", c => c.String());
            DropColumn("dbo.EnquiryTabunganInput", "Requester");
        }
    }
}
