using AutoMapper;
using Core.Web.Helpers;
using Core.Web.Utilities;
using MigraDoc.DocumentObjectModel;
using MigraDoc.Rendering;
using MyWeb.Controllers.Statement.Lib;
using MyWeb.Migrations.SqlStatement;
using MyWeb.Models.Statement;
using MyWeb.ViewModels.Statement;
using PdfSharp.Pdf;
using Quartz;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Linq;
using MigraDoc.DocumentObjectModel.Tables;
using MigraDoc.DocumentObjectModel.Shapes;
using Renci.SshNet;
using Renci.SshNet.Sftp;
using System.Globalization;


namespace MyWeb.Scheduler
{
    public class GetdataAndCreatePdf :IJob
    {
        private SqlHelper _query = new SqlHelper("SqlMyStatementConnection");
        //private System.Web.HttpServerUtility server = new System.Web.HttpServerUtility();
        private string _attachmentfile = "~/Files/PDf/";
        private string dest = "~/Files/PDf/Temp";
        public void Execute(IJobExecutionContext context)
        {
            using (var ctx = new SqlStatementDbContext())
            {
                var a = (from Parameter in ctx.MasterParameterSet
                         where Parameter.ID == 2
                         select new { Parameter }
                         ).FirstOrDefault();
                string ReceivedValue = a.Parameter.Value;
                string Date = DateTime.Now.ToString("yyyyMMdd");
                DateTime getdatenow = DateTime.ParseExact((Date.Substring(0, 6) + ReceivedValue), "yyyyMMdd",
                CultureInfo.InvariantCulture).AddMonths(-1);
                string getdate = new DateTime(getdatenow.Year, getdatenow.Month, DateTime.DaysInMonth(getdatenow.Year, getdatenow.Month)).ToString("yyyyMMdd");
                string destination = System.Web.Hosting.HostingEnvironment.MapPath(dest);

                string uri = "172.30.20.11";
                string username = "ftpmyr2";
                string source = "/home/t24/myrprod/bnk.interface/ACC.STMT";
                string pwd = "m@y0r@";

                SftpClient client = new SftpClient(uri, username, pwd);
                try
                {
                    if (Date.Substring(6,2) == ReceivedValue)
                    {
                        client.Connect();
                        Console.WriteLine("SFTP Connected");
                        client.ChangeDirectory("/home");
                        //var files = client.ListDirectory(source);
                        bool recursiveDownload = true;

                        // Start download of the directory
                        DownloadDirectory(
                            client,
                            source,
                            destination,
                            getdate,
                            recursiveDownload
                        );
                        // Iterate over them


                        client.Disconnect();
                        MoveFileFromTemp(destination);
                    }
                }
                catch (Exception e)
                {
                    String status = e.ToString();
                }
            }
        }

        private void DownloadDirectory(SftpClient client, string source, string destination, string getdate, bool recursive = false)
        {
            // List the files and folders of the directory
            var files = client.ListDirectory(source);

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
            } 
            
        }

        private void DownloadFile(SftpClient client, SftpFile file, string directory)
        {
            //Console.WriteLine("Downloading {0}", file.FullName);
            try
            {
                using (Stream fileStream = System.IO.File.OpenWrite(Path.Combine(directory, file.Name)))
                {
                    client.DownloadFile(file.FullName, fileStream);
                }
            }
            catch (Exception ex)
            {

                if (ex is System.Threading.ThreadAbortException)
                {
                    //do nothing
                    return;
                }
                else
                {
                    String status = ex.ToString();
                }
            }
            
        }

        private void MoveFileFromTemp(string sourcePath)
        {
            using (var ctx = new SqlStatementDbContext())
            {
                MasterPDFViewModel savepdf = new MasterPDFViewModel();
                var a = (from parameter in ctx.MasterParameterSet
                         where parameter.ID == 6
                         select new { parameter }
                         ).FirstOrDefault();
                string rootpdf = a.parameter.Value;
                string targetPath = "~/Files/UjiCoba/";
                //string sourcePath = @"D:\tes\20180831";
                string[] listFile = Directory.GetFiles(sourcePath, "*.STMT");
                string createFolderName = Path.GetFileName(sourcePath).Substring(0, 4) + "-" + Path.GetFileName(sourcePath).Substring(4, 2);
                string folderPathPDF = Path.Combine(System.Web.Hosting.HostingEnvironment.MapPath(_attachmentfile+rootpdf), createFolderName);
                foreach (var file in listFile)
                {
                    if (!System.IO.File.Exists(folderPathPDF))
                    {
                        System.IO.Directory.CreateDirectory(folderPathPDF);
                    }
                    ProsesFile proses = new ProsesFile(file);


                    List<HeaderTextFile> result = Mapper.Map<List<HeaderTextFile>>(proses.getHeaderTextFile());
                    string periode = result.First().Periode;
                    string cabang = result.First().cabang;
                    ctx.HeaderTextFileSet.AddRange(result);
                    ctx.SaveChanges();
                    List<GetDistinctHeaderTextFileByAccountNo> getdata = _query.ExecDataTableProc("Get_Distinct_HeaderTextFile_By_AccountNo", "@cabang", cabang, "@periode", periode).ToList<GetDistinctHeaderTextFileByAccountNo>();
                    foreach (var data in getdata)
                    {

                        Document document = CreateDocument.CreatePDF(data.AccountNo);
                        document.UseCmykColor = true;
                        const bool unicode = false;
                        const PdfFontEmbedding embedding = PdfFontEmbedding.Always;
                        PdfDocumentRenderer pdfRenderer = new PdfDocumentRenderer(unicode, embedding);
                        pdfRenderer.Document = document;
                        pdfRenderer.RenderDocument();

                        pdfRenderer.PdfDocument.SecuritySettings.UserPassword = data.BirthDate;
                        pdfRenderer.PdfDocument.Save(folderPathPDF + "/" + data.AccountNo + "_" + data.StatementPeriod + ".pdf");
                        savepdf.Content = data.Content;
                        savepdf.Subject = data.Subject;
                        savepdf.AccountNo = data.AccountNo;
                        savepdf.Period = data.StatementPeriod;
                        savepdf.Branch = result.First().cabang;
                        savepdf.Root = rootpdf;
                        savepdf.Folder = createFolderName;
                        savepdf.File = data.AccountNo + "_" + data.StatementPeriod + ".pdf";

                        MasterPDF MasterPDFSave = Mapper.Map<MasterPDF>(savepdf);
                        ctx.MasterPDFSet.Add(MasterPDFSave);
                        ctx.SaveChanges();
                    }
                    string fileName = Path.GetFileName(file);
                    string destFile = Path.Combine(System.Web.Hosting.HostingEnvironment.MapPath(targetPath), fileName);
                    System.IO.File.Move(file, destFile);
                }
            }
        }
    }
}