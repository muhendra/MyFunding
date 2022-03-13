namespace MyWeb.Migrations.SqlStatement
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Migrate_010 : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.DetailBody", "Detail", c => c.String(maxLength: 70, unicode: false));
            AlterColumn("dbo.DetailBody", "Tanggal", c => c.String(maxLength: 8, unicode: false));
            AlterColumn("dbo.DetailBody", "Valuta", c => c.String(maxLength: 8, unicode: false));
            AlterColumn("dbo.DetailBody", "Narative", c => c.String(maxLength: 100, unicode: false));
            AlterColumn("dbo.DetailBody", "NoRef", c => c.String(maxLength: 22, unicode: false));
            AlterColumn("dbo.DetailBody", "Debet", c => c.String(maxLength: 25, unicode: false));
            AlterColumn("dbo.DetailBody", "Kredit", c => c.String(maxLength: 25, unicode: false));
            AlterColumn("dbo.DetailBody", "Saldo", c => c.String(maxLength: 25, unicode: false));
            AlterColumn("dbo.HeaderTextFile", "Periode", c => c.String(maxLength: 20, unicode: false));
            AlterColumn("dbo.HeaderTextFile", "CIF", c => c.String(maxLength: 20, unicode: false));
            AlterColumn("dbo.HeaderTextFile", "AccountNo", c => c.String(maxLength: 20, unicode: false));
            AlterColumn("dbo.HeaderTextFile", "AccountName", c => c.String(maxLength: 100, unicode: false));
            AlterColumn("dbo.HeaderTextFile", "Currency", c => c.String(maxLength: 20, unicode: false));
            AlterColumn("dbo.HeaderTextFile", "Alamat1", c => c.String(maxLength: 100, unicode: false));
            AlterColumn("dbo.HeaderTextFile", "Alamat2", c => c.String(maxLength: 100, unicode: false));
            AlterColumn("dbo.HeaderTextFile", "Alamat3", c => c.String(maxLength: 100, unicode: false));
            AlterColumn("dbo.HeaderTextFile", "NPWP", c => c.String(maxLength: 50, unicode: false));
            AlterColumn("dbo.HeaderTextFile", "OldAcctNo", c => c.String(maxLength: 20, unicode: false));
            AlterColumn("dbo.HeaderTextFile", "cabang", c => c.String(maxLength: 30, unicode: false));
            AlterColumn("dbo.HeaderTextFile", "TypeAccount", c => c.String(maxLength: 40, unicode: false));
            AlterColumn("dbo.DetailFooter", "NoHalaman", c => c.String(maxLength: 3, unicode: false));
            AlterColumn("dbo.DetailFooter", "SaldoAwal", c => c.String(maxLength: 25, unicode: false));
            AlterColumn("dbo.DetailFooter", "SaldoAkhir", c => c.String(maxLength: 25, unicode: false));
            AlterColumn("dbo.DetailFooter", "TotalDebet", c => c.String(maxLength: 25, unicode: false));
            AlterColumn("dbo.DetailFooter", "TotalKredit", c => c.String(maxLength: 25, unicode: false));
            AlterColumn("dbo.DetailFooter", "FrekuensiDebet", c => c.String(maxLength: 3, unicode: false));
            AlterColumn("dbo.DetailFooter", "FrekuensiKredit", c => c.String(maxLength: 3, unicode: false));
            AlterColumn("dbo.DetailFooter", "SaldoTerendah", c => c.String(maxLength: 25, unicode: false));
            AlterColumn("dbo.DetailFooter", "SaldoTertinggi", c => c.String(maxLength: 25, unicode: false));
        }
        
        public override void Down()
        {
            AlterColumn("dbo.DetailFooter", "SaldoTertinggi", c => c.String());
            AlterColumn("dbo.DetailFooter", "SaldoTerendah", c => c.String());
            AlterColumn("dbo.DetailFooter", "FrekuensiKredit", c => c.String());
            AlterColumn("dbo.DetailFooter", "FrekuensiDebet", c => c.String());
            AlterColumn("dbo.DetailFooter", "TotalKredit", c => c.String());
            AlterColumn("dbo.DetailFooter", "TotalDebet", c => c.String());
            AlterColumn("dbo.DetailFooter", "SaldoAkhir", c => c.String());
            AlterColumn("dbo.DetailFooter", "SaldoAwal", c => c.String());
            AlterColumn("dbo.DetailFooter", "NoHalaman", c => c.String());
            AlterColumn("dbo.HeaderTextFile", "TypeAccount", c => c.String());
            AlterColumn("dbo.HeaderTextFile", "cabang", c => c.String());
            AlterColumn("dbo.HeaderTextFile", "OldAcctNo", c => c.String());
            AlterColumn("dbo.HeaderTextFile", "NPWP", c => c.String());
            AlterColumn("dbo.HeaderTextFile", "Alamat3", c => c.String());
            AlterColumn("dbo.HeaderTextFile", "Alamat2", c => c.String());
            AlterColumn("dbo.HeaderTextFile", "Alamat1", c => c.String());
            AlterColumn("dbo.HeaderTextFile", "Currency", c => c.String());
            AlterColumn("dbo.HeaderTextFile", "AccountName", c => c.String());
            AlterColumn("dbo.HeaderTextFile", "AccountNo", c => c.String());
            AlterColumn("dbo.HeaderTextFile", "CIF", c => c.String());
            AlterColumn("dbo.HeaderTextFile", "Periode", c => c.String());
            AlterColumn("dbo.DetailBody", "Saldo", c => c.String());
            AlterColumn("dbo.DetailBody", "Kredit", c => c.String());
            AlterColumn("dbo.DetailBody", "Debet", c => c.String());
            AlterColumn("dbo.DetailBody", "NoRef", c => c.String());
            AlterColumn("dbo.DetailBody", "Narative", c => c.String());
            AlterColumn("dbo.DetailBody", "Valuta", c => c.String());
            AlterColumn("dbo.DetailBody", "Tanggal", c => c.String());
            AlterColumn("dbo.DetailBody", "Detail", c => c.String());
        }
    }
}
