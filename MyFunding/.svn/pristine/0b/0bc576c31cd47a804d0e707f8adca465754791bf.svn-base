namespace MyWeb.Migrations.SqlFunding
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class modifyuploadPO : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.PurchaseOrder", "UploadPO", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.PurchaseOrder", "UploadPO");
        }
    }
}
