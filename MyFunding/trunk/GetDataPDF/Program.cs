using GetDataPDF.Lib;
using GetDataPDF.Model;
using GetDataPDF.ViewModel;
using MigraDoc.DocumentObjectModel;
using MigraDoc.Rendering;
using MyWeb.Migrations.SqlStatement;
using PdfSharp.Pdf;
using Renci.SshNet;
using Renci.SshNet.Sftp;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Diagnostics;

namespace GetDataPDF
{
    class Program
    {
        private DataContext dbContext = new DataContext();
        private ConfigKeyViewModel configkey = new ConfigKeyViewModel();
        //private string _attachmentfile = "Files\\PDF\\";
        //private string dest = "Files\\PDF\\Temp\\";
        //private string targetPath = "Files\\UjiCoba\\";
        private string log = "";
        private string pathserver = "";
        //private string log = Path.GetFullPath("Files\\PDF\\log") + "\\" + DateTime.Now.ToString("MM_dd_yyyy") + "_Log.txt";

        public Program()
        {
            pathserver = dbContext.ParamatersSet(9).FirstOrDefault().Value;
            //pathserver = @"E:\Application Master\MyFunding\";
            log = Path.GetFullPath(@pathserver + configkey.PathLog) + "\\" + DateTime.Now.ToString("MM_dd_yyyy") + "_Log.txt";
        }
        static void Main(string[] args)
        {
            Program c = new Program();
            c.GetDataFromFTP();
        }

        public void GetDataFromFTP()
        {
            var a = dbContext.ParamatersSet(2).FirstOrDefault();
            string ReceivedValue = a.Value;
            string Date = DateTime.Now.ToString("yyyyMMdd");
            DateTime getdatenow = DateTime.ParseExact((Date.Substring(0, 6) + ReceivedValue), "yyyyMMdd",
            CultureInfo.InvariantCulture).AddMonths(-1);
            DateTime getdateeom = new DateTime(getdatenow.Year, getdatenow.Month, DateTime.DaysInMonth(getdatenow.Year, getdatenow.Month));
            string destination = @pathserver + configkey.Pathtemppdf;

            //string uri = "172.30.20.11";
            //string username = "ftpmyr2";
            //string source = "/home/t24/myrprod/bnk.interface/ACC.STMT";
            //string pwd = "m@y0r@";

            SftpClient client = new SftpClient(configkey.Hostftp, configkey.Usernameftp, configkey.Pwdftp);
            //CalvinStart
            Stopwatch sw = new Stopwatch();
            sw.Start();
            dbContext.InsertLog("Start Get files from sFTP server", "0", "Generate PDF", "Get FTP Files").FirstOrDefault();
            //CalvinEnd
            try
            {
                if (Date.Substring(6, 2) == ReceivedValue)
                {
                    if (!File.Exists(log))
                    {
                        var mylog = File.Create(log);
                        mylog.Close();
                    }
                    client.Connect();
                    Console.WriteLine("SFTP Connected Success");
                    File.AppendAllText(log, "SFTP Connected Success \n");
                    client.ChangeDirectory("/home");
                    string getdate = dbContext.Check_EOM(getdateeom).FirstOrDefault().Value.ToString("yyyyMMdd");
                    var files = client.ListDirectory(configkey.Sourceftp);
                    bool recursiveDownload = true;

                    DownloadDirectory(
                        client,
                        configkey.Sourceftp,
                        destination,
                        getdate,
                        recursiveDownload
                    );
                    //Iterate over them
                    client.Disconnect();
                    MoveFileFromTemp(destination + getdate);
                }
            }
            catch (Exception e)
            {
                String status = e.ToString();
                //CalvinStart
                sw.Stop();
                String timespend = sw.Elapsed.ToString("hh\\:mm\\:ss");
                dbContext.InsertLog("Failed Get files from sFTP server. Reason" + status, timespend, "Generate PDF", "Get FTP Files").FirstOrDefault();
                dbContext.SendEmailLogError("Get FTP Files", status).FirstOrDefault();
                //CalvinEnd
                Console.WriteLine(status);
                File.AppendAllText(log, status);
                Thread.Sleep(5000);
            }
            finally
            {
                //CalvinStart
                sw.Stop();
                String timespend1 = sw.Elapsed.ToString();
                dbContext.InsertLog("Finish Get files from sFTP  server", timespend1, "Generate PDF", "Get FTP Files").FirstOrDefault();
                //CalvinEnd
            }
        }

        private void DownloadDirectory(SftpClient client, string source, string destination, string getdate, bool recursive = false)
        {
            // List the files and folders of the directory
            var files = client.ListDirectory(source);
            //CalvinStart
            Stopwatch sw = new Stopwatch();
            sw.Start();
            dbContext.InsertLog("Start generating PDF files", "0", "Generate PDF", "Process PDF").FirstOrDefault();
            //CalvinEnd
            // Iterate over them
            try
            {
                foreach (SftpFile file in files)
                {
                    // If is a file, download it
                    if (!file.IsDirectory && !file.IsSymbolicLink && file.Name.EndsWith("STMT"))
                    {
                        DownloadFile(client, file, destination);
                    }
                    // If it's a symbolic link, ignore it
                    else if (file.IsSymbolicLink)
                    {
                        Console.WriteLine("Symbolic link ignored: {0}", file.FullName);
                    }
                    // If its a directory, create it locally (and ignore the .. and .=) 
                    //. is the current folder
                    //.. is the folder above the current folder -the folder that contains the current folder.
                    else if (file.Name != "." && file.Name != "..")
                    {
                        if (file.FullName == source + "/" + getdate)
                        {
                            var dir = Directory.CreateDirectory(Path.Combine(destination, file.Name));
                            // and start downloading it's content recursively :) in case it's required
                            if (recursive)
                            {
                                DownloadDirectory(client, file.FullName, dir.FullName, getdate, true);
                            }
                        }
                    }
                }
            }
            catch (Exception e)
            {
                String status = e.ToString();
                //CalvinStart
                sw.Stop();
                String timespend = sw.Elapsed.ToString();
                //dbContext.InsertLog("Failed Get files from sFTP server. Reason" + status, timespend).FirstOrDefault();
                //CalvinEnd
                dbContext.SendEmailLogError("Process PDF", status).FirstOrDefault();
                Console.WriteLine(status);
                File.AppendAllText(log, status);
                Thread.Sleep(5000);
            }
            finally
            {
                //CalvinStart
                sw.Stop();
                String timespend1 = sw.Elapsed.ToString();
                //dbContext.InsertLog("Finish Get files from sFTP  server", timespend1, "Generate PDF", "Process PDF").FirstOrDefault();
                //CalvinEnd
            }
        }

        private void DownloadFile(SftpClient client, SftpFile file, string directory)
        {
            Console.WriteLine("Downloading {0}", file.FullName);
            try
            {
                if (!System.IO.File.Exists(Path.Combine(directory, file.Name)))
                {
                    using (Stream fileStream = System.IO.File.OpenWrite(Path.Combine(directory, file.Name)))
                    {
                        client.DownloadFile(file.FullName, fileStream);
                    }
                }
            }
            catch (Exception ex)
            {

                String status = ex.ToString();
                Console.WriteLine("Error :" + status);
                dbContext.SendEmailLogError("Process PDF", status).FirstOrDefault();
                File.AppendAllText(log, status);
                Thread.Sleep(5000);
            }
        }

        private void MoveFileFromTemp(string sourcePath)
        {
            try
            {
                Console.WriteLine("Process move and get data from file stmt to pdf...");
                MasterPDFModel savepdf = new MasterPDFModel();
                var a = dbContext.ParamatersSet(6).FirstOrDefault();
                string rootpdf = a.Value;

                //string sourcePath = @"D:\tes\20180831";
                var listFile = Directory.GetFiles(sourcePath, "*.STMT");
                string createFolderName = Path.GetFileName(sourcePath).Substring(0, 4) + "-" + Path.GetFileName(sourcePath).Substring(4, 2);
                string folderPathPDF = Path.Combine(@pathserver + rootpdf, createFolderName);
                int countfile = 1;
                foreach (var file in listFile)
                {
                    Console.Write("Saving File " + Path.GetFileName(file) + "......");
                    File.AppendAllText(log, "Saving File " + Path.GetFileName(file) + "......\n");
                    if (!System.IO.File.Exists(folderPathPDF))
                    {
                        System.IO.Directory.CreateDirectory(folderPathPDF);
                    }
                    ProsesConvertToPDF proses = new ProsesConvertToPDF(file);

                    List<HeaderTextFileModel> result = new List<HeaderTextFileModel>(proses.getHeaderTextFile());
                    string periode = result.First().Periode;
                    string cabang = result.First().cabang;

                    //var test = dbContext.HeaderTextFileSet.FirstOrDefault(c => c.Periode == periode && c.cabang == cabang);
                    //if (test == null)
                    //{
                    dbContext.DeleteDataHeaderTextExists(cabang, periode).ToList();

                    //string acc = result.First().AccountNo;
                    //var target = dbContext.HeaderTextFileSet.FirstOrDefault(c => c.Periode == periode && c.AccountNo == acc);
                    //if (target != null)
                    //{
                    //    target.Periode = result.First().Periode;
                    //    target.CIF = result.First().CIF;
                    //    target.AccountNo = result.First().AccountNo;
                    //    target.AccountName = result.First().AccountName;
                    //    target.Currency = result.First().Currency;
                    //    target.Alamat1 = result.First().Alamat1;
                    //    target.Alamat2 = result.First().Alamat2;
                    //    target.Alamat3 = result.First().Alamat3;
                    //    target.NPWP = result.First().NPWP;
                    //    target.OldAcctNo = result.First().OldAcctNo;
                    //    target.cabang = result.First().cabang;
                    //    target.TypeAccount = result.First().TypeAccount;
                    //    target.CreateBy = "System";
                    //    target.CreateDate = DateTime.Now;
                    //    dbContext.SaveChanges();
                    //}
                    //else
                    //{
                    dbContext.HeaderTextFileSet.AddRange(result);
                    dbContext.SaveChanges();
                    //}
                    Console.WriteLine("Success");
                    File.AppendAllText(log, "Success...\n");
                    var getdata = dbContext.DistinctHeaderSet(cabang, periode).ToList(); ;
                    //List<GetDistinctHeaderTextFileByAccountNo> getdata = _query.ExecDataTableProc("Get_Distinct_HeaderTextFile_By_AccountNo", "@cabang", cabang, "@periode", periode).ToList<GetDistinctHeaderTextFileByAccountNo>();
                    int count = 1;
                    foreach (var data in getdata)
                    {

                        Document document = CreateDocument.CreatePDF(data.AccountNo, periode, @pathserver);
                        document.UseCmykColor = true;
                        const bool unicode = false;
                        const PdfFontEmbedding embedding = PdfFontEmbedding.Always;
                        PdfDocumentRenderer pdfRenderer = new PdfDocumentRenderer(unicode, embedding);
                        pdfRenderer.Document = document;
                        pdfRenderer.RenderDocument();

                        pdfRenderer.PdfDocument.SecuritySettings.UserPassword = data.BirthDate;
                        pdfRenderer.PdfDocument.Save(folderPathPDF + "/" + data.AccountNo + "_" + data.StatementPeriod + ".pdf");
                        savepdf.Content = CreateEmailTemplate.CreateBodyEmail(data.Content, data.StatementPeriod, data.AccountName, data.AccountNo, data.Product);
                        savepdf.Subject = CreateEmailTemplate.CreateSubjectEmail(data.Subject, data.StatementPeriod);
                        savepdf.AccountNo = data.AccountNo;
                        savepdf.Period = data.StatementPeriod;
                        savepdf.Branch = result.First().cabang;
                        savepdf.Root = rootpdf;
                        savepdf.Folder = createFolderName;
                        savepdf.File = data.AccountNo + "_" + data.StatementPeriod + ".pdf";

                        dbContext.MasterPdFSet.Add(savepdf);
                        dbContext.SaveChanges();
                        Console.WriteLine("Create PDF From File " + Path.GetFileName(file) + " :" + count + " of " + getdata.Count());
                        File.AppendAllText(log, "Create PDF From File " + Path.GetFileName(file) + " :" + count + " of " + getdata.Count() + "\n");
                        count++;
                    }
                    string fileName = Path.GetFileName(file);
                    string destFile = Path.Combine(@pathserver + configkey.Pathstmt, fileName);

                    if (!System.IO.File.Exists(destFile))
                    {
                        System.IO.File.Move(file, destFile);
                    }
                    Console.WriteLine("File " + Path.GetFileName(file) + " Has Been Moved :" + countfile + " of " + listFile.Count());
                    File.AppendAllText(log, "File " + Path.GetFileName(file) + " Has Been Moved :" + countfile + " of " + listFile.Count() + "\n");
                    countfile++;
                    //}
                }
            }
            catch (Exception ex)
            {
                String status = ex.ToString();
                Console.WriteLine("Error :" + status);
                dbContext.SendEmailLogError("Process PDF", status).FirstOrDefault();
                File.AppendAllText(log, status);
                Thread.Sleep(5000);
            }
        }
    }
}
