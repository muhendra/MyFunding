namespace MyWeb.Migrations.SqlStatement
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class TambahTableInsertLog21 : DbMigration
    {
        public override void Up()
        {
            DropColumn("dbo.InsertLog", "Nik");
            DropColumn("dbo.InsertLog", "TanggalProcess");
            DropColumn("dbo.InsertLog", "UpdateBy");
            DropColumn("dbo.InsertLog", "UpdateDate");
            DropColumn("dbo.InsertLog", "ApproveBy");
            DropColumn("dbo.InsertLog", "ApproveDate");
            DropColumn("dbo.InsertLog", "RejectBy");
            DropColumn("dbo.InsertLog", "RejectDate");
            DropColumn("dbo.InsertLog", "RejectReason");
            DropColumn("dbo.InsertLog", "CompanyId");
            DropColumn("dbo.InsertLog", "BranchId");
            DropColumn("dbo.InsertLog", "StatusData");
            DropColumn("dbo.InsertLog", "IsDelete");
        }
        
        public override void Down()
        {
            AddColumn("dbo.InsertLog", "TanggalProcess", c => c.DateTime(nullable: false));
            AddColumn("dbo.InsertLog", "Nik", c => c.String());
        }
    }
}
