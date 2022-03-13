using MyWeb.Models.Statement;
using MyWeb.ViewModels.Statement;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace MyWeb.Controllers.Statement.Lib
{
    public class ProsesFile
    {
        private int LinePerPage = 56;
        private List<HeaderTextFileViewModel> headertext = new List<HeaderTextFileViewModel>();
        private string Pathfile { get; set; }
        public ProsesFile(string pathFile)
        {
            this.Pathfile = pathFile;
        }
        public List<HeaderTextFileViewModel> getHeaderTextFile()
        {
            var AllFile = File.ReadAllLines(this.Pathfile);
            try
            {
                for (int i = 0; i < AllFile.Count(); i += LinePerPage)
                {
                    HeaderTextFileViewModel item = new HeaderTextFileViewModel();
                    item.Periode = AllFile[i + 2].Trim();
                    item.cabang = AllFile[i + 3].Trim();
                    item.TypeAccount = AllFile[i + 4].Trim();
                    item.CIF = AllFile[i + 5].Trim();
                    item.AccountName = AllFile[i + 6].Substring(0, 84).Trim();
                    item.AccountNo = AllFile[i + 6].Substring(84).Trim();
                    if (AllFile[i + 7].Length >=84)
                    {
                        item.Alamat1 = AllFile[i + 7].Substring(0, 84).Trim();
                        item.Currency = AllFile[i + 7].Substring(84, AllFile[i + 7].Length - 84).Trim();
                    }
                    else
                    {
                        item.Alamat1 = AllFile[i + 7].Trim();
                    }
                    item.Alamat2 = AllFile[i + 8].Trim();
                    if (AllFile[i + 9].Length >= 84)
                    {
                        item.Alamat3 = AllFile[i + 9].Substring(0, 84).Trim();
                        item.NPWP = AllFile[i + 9].Substring(84).Trim();
                    }
                    else
                    {
                        item.Alamat3 = AllFile[i + 9].Trim();
                    }
                   
                    
                    if (AllFile[i + 10].Length == 34)
                    {
                        item.OldAcctNo = AllFile[i + 10].Substring(24, 10);
                    }

                    DetailFooterViewModel footer = new DetailFooterViewModel();
                    footer.NoHalaman = AllFile[i + 1].Trim();
                    item.DetailFooters.Add(footer);
                    //Read All Details
                    item.DetailBodies = getDetail(AllFile, i);

                    footer.SaldoAwal = AllFile[i + 13].Substring(AllFile[i + 13].Length - 22, 22).Trim();
                    footer.SaldoAkhir = AllFile[i + 39].Substring(AllFile[i + 39].Length - 22, 22).Trim();
                    footer.TotalDebet = AllFile[i + 38].Substring(67, 20).Trim();
                    footer.TotalKredit = AllFile[i + 38].Substring(88, 18).Trim();
                    footer.FrekuensiDebet = AllFile[i + 40].Substring(AllFile[i + 40].IndexOf(':')+1, AllFile[i + 40].Length - AllFile[i + 40].IndexOf(':')-1);
                    footer.FrekuensiKredit = AllFile[i + 41].Substring(AllFile[i + 41].IndexOf(':') + 1, AllFile[i + 41].Length - AllFile[i + 41].IndexOf(':') - 1);
                    footer.SaldoTerendah = AllFile[i + 42].Substring(AllFile[i + 42].IndexOf(':') + 1, AllFile[i + 42].Length - AllFile[i + 42].IndexOf(':') - 1).Trim();
                    footer.SaldoTertinggi = AllFile[i + 43].Substring(AllFile[i + 43].IndexOf(':') + 1, AllFile[i + 43].Length - AllFile[i + 43].IndexOf(':') - 1).Trim();
                    this.headertext.Add(item);
                }
            }
            catch (Exception)
            {
                
                throw;
            }
            
            return this.headertext;
        }

        private List<DetailBodyViewModel> getDetail(string[] allFile, int startindex)
        {
            List<DetailBodyViewModel> listBody = new List<DetailBodyViewModel>();
            for (int i = startindex + 14 ; i < startindex + 37; i++)
            {

                DetailBodyViewModel body = new DetailBodyViewModel();
                if (allFile[i].Length == 130)
                {
                   
                    body.Detail = allFile[i].Substring(24, 28).Trim();
                    body.NoRef = allFile[i].Substring(52, 15).Trim();
                    body.Debet = allFile[i].Substring(68, 19).Trim();
                    body.Kredit = allFile[i].Substring(88, 20).Trim();
                    body.Saldo = allFile[i].Substring(109, 21).Trim();
                    body.Tanggal = allFile[i].Substring(4, 8).Trim();
                    body.Valuta = allFile[i].Substring(13, 8).Trim();
                    listBody.Add(body);
                    
                }
                else if (allFile[i].Length != 130 && allFile[i].Length != 0)
                {
                    try
                    {
                        listBody[listBody.Count-1].Narative = allFile[i].Trim();
                        
                    }
                    catch (System.Exception)
                    {
                        throw;
                    }
                }
               
                
            }
            return listBody;
        }
    }
}