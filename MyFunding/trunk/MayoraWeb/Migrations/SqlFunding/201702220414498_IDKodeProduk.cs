namespace MyWeb.Migrations.SqlFunding
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class IDKodeProduk : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Katalog", "IDKode_Promo2", c => c.String());
            AlterColumn("dbo.Katalog", "Kode_Promo", c => c.String());
        }
        
        public override void Down()
        {
            AlterColumn("dbo.Katalog", "Kode_Promo", c => c.String(nullable: false));
            DropColumn("dbo.Katalog", "IDKode_Promo2");
        }
    }
}
