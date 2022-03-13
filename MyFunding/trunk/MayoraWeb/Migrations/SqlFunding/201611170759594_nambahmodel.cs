namespace MyWeb.Migrations.SqlFunding
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class nambahmodel : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.JurnalPelunasan", "NamaCabang", c => c.String());
            AddColumn("dbo.JurnalPembayaran", "NamaCabang", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.JurnalPembayaran", "NamaCabang");
            DropColumn("dbo.JurnalPelunasan", "NamaCabang");
        }
    }
}
