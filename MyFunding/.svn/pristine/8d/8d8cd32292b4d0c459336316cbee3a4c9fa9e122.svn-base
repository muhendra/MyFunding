using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GetDataPDF.ViewModel
{
    public class HeaderTextFileViewModel
    {
        public HeaderTextFileViewModel()
        {
            this.DetailFooters = new List<DetailFooterViewModel>();
            this.DetailBodies = new List<DetailBodyViewModel>();
        }
        public int ID { get; set; }
        public string Periode { get; set; }
        public string CIF { get; set; }
        public string AccountNo { get; set; }
        public string AccountName { get; set; }
        public string Currency { get; set; }
        public string Alamat1 { get; set; }
        public string Alamat2 { get; set; }
        public string Alamat3 { get; set; }
        public string NPWP { get; set; }
        public string OldAcctNo { get; set; }
        public string cabang { get; set; }
        public string TypeAccount { get; set; }
        public string CreateBy { get; set; }
        public DateTime? CreateDate { get; set; }
        public string UpdateBy { get; set; }
        public DateTime? UpdateDate { get; set; }
        public List<DetailFooterViewModel> DetailFooters { get; set; }
        public List<DetailBodyViewModel> DetailBodies { get; set; }

    }

    public class DetailFooterViewModel
    {
        public int ID { get; set; }
        public int IDHeader { get; set; }
        public string NoHalaman { get; set; }
        public string SaldoAwal { get; set; }
        public string SaldoAkhir { get; set; }
        public string TotalDebet { get; set; }
        public string TotalKredit { get; set; }
        public string FrekuensiDebet { get; set; }
        public string FrekuensiKredit { get; set; }
        public string SaldoTerendah { get; set; }
        public string SaldoTertinggi { get; set; }
        public string CreateBy { get; set; }
        public DateTime? CreateDate { get; set; }
        public string UpdateBy { get; set; }
        public DateTime? UpdateDate { get; set; }

        public virtual HeaderTextFileViewModel HeaderTextFile { get; set; }

    }

    public class DetailBodyViewModel
    {
        public int ID { get; set; }
        public int IDHeader { get; set; }
        public string Detail { get; set; }
        public string Tanggal { get; set; }
        public string Valuta { get; set; }
        public string Narative { get; set; }
        public string NoRef { get; set; }
        public string Debet { get; set; }
        public string Kredit { get; set; }
        public string Saldo { get; set; }
        public string CreateBy { get; set; }
        public DateTime? CreateDate { get; set; }
        public string UpdateBy { get; set; }
        public DateTime? UpdateDate { get; set; }
        public virtual HeaderTextFileViewModel HeaderTextFile { get; set; }
    }

    public class GetDistinctHeaderTextFileByAccountNo
    {
        public string AccountNo { get; set; }

        public string AccountName { get; set; }
        public string BirthDate { get; set; }
        public string StatementPeriod { get; set; }
        public string Cabang { get; set; }
        public string Content { get; set; }
        public string Subject { get; set; }
        public string Product { get; set; }

    }
    public class GetHeaderTextFileToPDF
    {
        public int ID { get; set; }
        public string AccountNo { get; set; }
        public string CIF { get; set; }
        public string Periode { get; set; }
        public string AccountName { get; set; }
        public string Currency { get; set; }
        public string Alamat1 { get; set; }
        public string Alamat2 { get; set; }
        public string Alamat3 { get; set; }
        public string NPWP { get; set; }
        public string OldAcctNo { get; set; }
        public string cabang { get; set; }
        public string NoHalaman { get; set; }
        public string TypeAccount { get; set; }
        public int LastNumber { get; set; }
        public string SaldoAwal { get; set; }
        public string TotalDebet { get; set; }
        public string TotalKredit { get; set; }
        public string SaldoAkhir { get; set; }
        public string FrekuensiDebet { get; set; }
        public string FrekuensiKredit { get; set; }
        public string SaldoTerendah { get; set; }
        public string SaldoTertinggi { get; set; }
        public string Promotion { get; set; }
    }

    public class BodyTextFileViewModel
    {
        public int ID { get; set; }
        public string Detail { get; set; }
        public string Tanggal { get; set; }
        public string Valuta { get; set; }
        public string Narative { get; set; }
        public string NoRef { get; set; }
        public string Debet { get; set; }
        public string Kredit { get; set; }
        public string Saldo { get; set; }
    }
}
