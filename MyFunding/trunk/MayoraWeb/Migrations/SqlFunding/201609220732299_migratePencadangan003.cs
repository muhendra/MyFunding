namespace MyWeb.Migrations.SqlFunding
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class migratePencadangan003 : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.Pencadangan", "JPId", "dbo.JurnalPelunasan");
            DropIndex("dbo.Pencadangan", new[] { "JPId" });
            AlterColumn("dbo.Pencadangan", "JPId", c => c.String());
        }
        
        public override void Down()
        {
            AlterColumn("dbo.Pencadangan", "JPId", c => c.Int());
            CreateIndex("dbo.Pencadangan", "JPId");
            AddForeignKey("dbo.Pencadangan", "JPId", "dbo.JurnalPelunasan", "Id");
        }
    }
}
