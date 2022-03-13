namespace MyWeb.Migrations.SqlFunding
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class migrateAmortisasi002 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.AmortisasiRequestDetail", "IntAccCategoryId", c => c.String());
            AddColumn("dbo.AmortisasiRequestDetail", "IntAccCategoryName", c => c.String());
            AlterColumn("dbo.AmortisasiRequestDetail", "DebitKredit", c => c.Int(nullable: false));
            DropColumn("dbo.AmortisasiRequestDetail", "AccCategoryId");
        }
        
        public override void Down()
        {
            AddColumn("dbo.AmortisasiRequestDetail", "AccCategoryId", c => c.String());
            AlterColumn("dbo.AmortisasiRequestDetail", "DebitKredit", c => c.String());
            DropColumn("dbo.AmortisasiRequestDetail", "IntAccCategoryName");
            DropColumn("dbo.AmortisasiRequestDetail", "IntAccCategoryId");
        }
    }
}
