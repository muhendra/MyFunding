namespace MyWeb.Migrations.SqlFunding
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddProceedby : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.KartuAmortisasi", "ProceedDateTime", c => c.DateTime());
            AddColumn("dbo.KartuAmortisasi", "ProceedBy", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.KartuAmortisasi", "ProceedBy");
            DropColumn("dbo.KartuAmortisasi", "ProceedDateTime");
        }
    }
}
