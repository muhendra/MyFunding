namespace MyWeb.Migrations.SqlFunding
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class migrateKatalog0012 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Katalog", "Keterangan", c => c.String());
            DropColumn("dbo.Katalog", "Kode_Promo2");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Katalog", "Kode_Promo2", c => c.String());
            DropColumn("dbo.Katalog", "Keterangan");
        }
    }
}
