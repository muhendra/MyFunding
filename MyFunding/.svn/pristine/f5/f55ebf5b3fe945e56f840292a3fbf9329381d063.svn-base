namespace MyWeb.Migrations.SqlFunding
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddJurnalName : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.PurchaseReceive", "JurnalName", c => c.String());
            AddColumn("dbo.ParameterEmail", "CreateBy", c => c.String());
            AddColumn("dbo.ParameterEmail", "CreateDate", c => c.DateTime());
            AddColumn("dbo.ParameterEmail", "UpdateBy", c => c.String());
            AddColumn("dbo.ParameterEmail", "UpdateDate", c => c.DateTime());
            AddColumn("dbo.ParameterEmail", "ApproveBy", c => c.String());
            AddColumn("dbo.ParameterEmail", "ApproveDate", c => c.DateTime());
            AddColumn("dbo.ParameterEmail", "RejectBy", c => c.String());
            AddColumn("dbo.ParameterEmail", "RejectDate", c => c.DateTime());
            AddColumn("dbo.ParameterEmail", "RejectReason", c => c.String());
            AddColumn("dbo.ParameterEmail", "CompanyId", c => c.Int());
            AddColumn("dbo.ParameterEmail", "BranchId", c => c.Int());
            AddColumn("dbo.ParameterEmail", "StatusData", c => c.Int(nullable: false));
            AddColumn("dbo.ParameterEmail", "IsDelete", c => c.Boolean(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.ParameterEmail", "IsDelete");
            DropColumn("dbo.ParameterEmail", "StatusData");
            DropColumn("dbo.ParameterEmail", "BranchId");
            DropColumn("dbo.ParameterEmail", "CompanyId");
            DropColumn("dbo.ParameterEmail", "RejectReason");
            DropColumn("dbo.ParameterEmail", "RejectDate");
            DropColumn("dbo.ParameterEmail", "RejectBy");
            DropColumn("dbo.ParameterEmail", "ApproveDate");
            DropColumn("dbo.ParameterEmail", "ApproveBy");
            DropColumn("dbo.ParameterEmail", "UpdateDate");
            DropColumn("dbo.ParameterEmail", "UpdateBy");
            DropColumn("dbo.ParameterEmail", "CreateDate");
            DropColumn("dbo.ParameterEmail", "CreateBy");
            DropColumn("dbo.PurchaseReceive", "JurnalName");
        }
    }
}
