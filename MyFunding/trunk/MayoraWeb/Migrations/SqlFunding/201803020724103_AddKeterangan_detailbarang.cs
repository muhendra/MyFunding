namespace MyWeb.Migrations.SqlFunding
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddKeterangan_detailbarang : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.DetailBarang", "Keterangan", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.DetailBarang", "Keterangan");
        }
    }
}
