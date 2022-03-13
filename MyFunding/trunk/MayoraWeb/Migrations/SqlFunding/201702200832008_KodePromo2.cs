namespace MyWeb.Migrations.SqlFunding
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class KodePromo2 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Katalog", "Kode_Promo2", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.Katalog", "Kode_Promo2");
        }
    }
}
