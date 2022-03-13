namespace MyWeb.Migrations.SqlFunding
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class BjadiP : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.MasterJurnalOtomatis", "FPBeforeReceive", c => c.String());
            AddColumn("dbo.MasterJurnalOtomatis", "FPAfterReceive", c => c.String());
            DropColumn("dbo.MasterJurnalOtomatis", "FBBeforeReceive");
            DropColumn("dbo.MasterJurnalOtomatis", "FBAfterReceive");
        }
        
        public override void Down()
        {
            AddColumn("dbo.MasterJurnalOtomatis", "FBAfterReceive", c => c.String());
            AddColumn("dbo.MasterJurnalOtomatis", "FBBeforeReceive", c => c.String());
            DropColumn("dbo.MasterJurnalOtomatis", "FPAfterReceive");
            DropColumn("dbo.MasterJurnalOtomatis", "FPBeforeReceive");
        }
    }
}
