namespace MyWeb.Migrations.SqlFunding
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class UpdateDebetKredit : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.JurnalPelunasan", "DebetKredit", c => c.Int(nullable: false));
            AlterColumn("dbo.JurnalPembayaran", "DebetKredit", c => c.Int(nullable: false));
        }
        
        public override void Down()
        {
            AlterColumn("dbo.JurnalPembayaran", "DebetKredit", c => c.String());
            AlterColumn("dbo.JurnalPelunasan", "DebetKredit", c => c.String());
        }
    }
}
