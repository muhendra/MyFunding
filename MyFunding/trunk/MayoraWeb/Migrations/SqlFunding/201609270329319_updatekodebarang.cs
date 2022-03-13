namespace MyWeb.Migrations.SqlFunding
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class updatekodebarang : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.DetailBarang", "KategoriBarang", c => c.Int(nullable: false));
        }
        
        public override void Down()
        {
            AlterColumn("dbo.DetailBarang", "KategoriBarang", c => c.String());
        }
    }
}
