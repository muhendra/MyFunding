using ARSoft.Tools.Net.Dns;
using AutoMapper;
using Core.Web.Controllers;
using Core.Web.Helpers;
using Core.Web.Infrastructure;
using Core.Web.Utilities;
using MigraDoc.DocumentObjectModel;
using MigraDoc.DocumentObjectModel.Shapes;
using MigraDoc.DocumentObjectModel.Tables;
using MigraDoc.Rendering;
using MyWeb.Controllers.Statement.Lib;
using MyWeb.DataLayer;
using MyWeb.Infrastructure.Applications;
using MyWeb.Migrations.SqlStatement;
using MyWeb.Models.Statement;
using MyWeb.ViewModels.Statement;
using PdfSharp.Pdf;
using Renci.SshNet;
using Renci.SshNet.Sftp;
using SendEmail;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Net.Security;
using System.Net.Sockets;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mail;
using System.Web.Mvc;

namespace MyWeb.Controllers.Statement
{
    public class ListEmailController : CoreControllerBase
    {
        private ApplicationDbContext _applicationDbContext;
        private ICurrentUser _currentUser;
        private SqlHelper _query = new SqlHelper("SqlMyStatementConnection");
        private string _attachmentfile = System.Configuration.ConfigurationManager.AppSettings["pathAttachmentPDF"].ToString();
        private string from = System.Configuration.ConfigurationManager.AppSettings["EmailExternal"].ToString();
        private string username = System.Configuration.ConfigurationManager.AppSettings["UsenameEmail"].ToString();
        private string password = System.Configuration.ConfigurationManager.AppSettings["PasswordEmail"].ToString();
        private string mailserver = System.Configuration.ConfigurationManager.AppSettings["MailServerExternal"].ToString();
        private int port = int.Parse(System.Configuration.ConfigurationManager.AppSettings["PortEmail"]);
        private DataContext db = new DataContext();

        public ListEmailController(ICurrentUser currentUser, ApplicationDbContext context)
        {
            _applicationDbContext = context;
            _currentUser = currentUser;
        }
        //
        // GET: /ListEmail/
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult IndexProcessed()
        {
            return View();
        }

        public async Task<JsonResult> All(DateTime? Period = null, string sortBy = "Number", string sortDirection = "asc")
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                var a = _query.ExecDataTableProc("GetListEmailPending", "@Period", Period);
                var b = a.ToList<ListEmailPendingViewModel>();
                int totalitems = b.Count();
                var c = b.AsQueryable()
                    .ToArray();
                return JsonSuccess(new { totalItems = totalitems, data = c });
            });

        }

        public async Task<JsonResult> ListEmailProcessedGetAll(DateTime? Period = null, int param = 0, string sortBy = "Number", string sortDirection = "asc")
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                var a = _query.ExecDataTableProc("ListEmailProcessedGetPage", "@Period", Period, "@Param", param);
                var b = a.ToList<ListEmailProcessedViewModel>();
                int totalitems = b.Count();
                var c = b.AsQueryable()
                    .ToArray();
                return JsonSuccess(new { totalItems = totalitems, data = c });
            });

        }

        public async Task<JsonResult> GetListEmailPending(string searchText, DateTime? Period = null, int pageNumber = 1, int pageSize = 10, string accountName = "", string accountNo = "", string category = "", string email = "")
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                var a = _query.ExecDataTableProc("GetListEmailPending", "@Period", Period);
                var b = a.ToList<ListEmailPendingViewModel>().Where(x => (string.IsNullOrEmpty(searchText) ||
                                 (x.AccountName.Contains(searchText.ToLower())) ||
                                 (x.AccountNo.Contains(searchText.ToLower())) ||
                                 (x.Email.Contains(searchText.ToLower())) ||
                                 (x.Category.Contains(searchText.ToLower())))
                                 );
                //var b = a.ToList<ListEmailPendingViewModel>().Where(x => (string.IsNullOrEmpty(accountName) ||
                //             x.AccountName.Contains(accountName)) && (string.IsNullOrEmpty(accountNo) ||
                //             x.AccountNo.Contains(accountNo)) && (string.IsNullOrEmpty(category) ||
                //             x.Category.Contains(category)) && (string.IsNullOrEmpty(email) ||
                //             x.Email.Contains(email))
                //            );
                int totalitems = b.Count();
                var c = b.AsQueryable()
                    .Skip((pageNumber - 1) * pageSize)
                    .Take(pageSize)
                    .ToArray();
                return JsonSuccess(new { totalItems = totalitems, data = c });
            });
        }

        public async Task<JsonResult> ListEmailProcessedGetPage(string searchText, DateTime? Period = null, int param = 0, int pageNumber = 1, int pageSize = 10, string accountName = "", string accountNo = "", string category = "", string email = "", string remark = "")
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                var a = _query.ExecDataTableProc("ListEmailProcessedGetPage", "@Period", Period, "@Param", param, "@searchText", searchText);
                var b = a.ToList<ListEmailProcessedViewModel>();
                //var b = a.ToList<ListEmailProcessedViewModel>().Where(x => (string.IsNullOrEmpty(searchText) ||
                //             x.AccountName.Contains(searchText)) && (string.IsNullOrEmpty(searchText) ||
                //             x.AccountNo.Contains(searchText)) && (string.IsNullOrEmpty(searchText) ||
                //             x.Category.Contains(searchText)) && (string.IsNullOrEmpty(searchText) ||
                //             x.Email.Contains(searchText)) && (string.IsNullOrEmpty(searchText) ||
                //             x.Remark.Contains(searchText))
                //             );
                int totalitems = b.Count();
                var c = b.AsQueryable()
                    .Skip((pageNumber - 1) * pageSize)
                    .Take(pageSize)
                    .ToArray();
                return JsonSuccess(new { totalItems = totalitems, data = c });
            });
        }

        public PartialViewResult Contents(int id)
        {
            using (var ctx = new SqlStatementDbContext())
            {
                var a = ctx.MasterPDFSet.FirstOrDefault(c => c.ID == id);
                ViewBag.html = a.Content;
                return PartialView("Contents", ViewBag.html);
            }
        }

        //public async Task<JsonResult> SendEmail(int? id = null)
        //{
        //    return await ExecuteFaultHandledOperationAsync(async () =>
        //    {
        //        var a = _query.ExecDataTableProc("Send_Email_EStatement", "@Id", id);

        //        return JsonSuccess(new { success = true, Messages = "Success" });
        //    });
        //}

        public async Task<JsonResult> SendEmail(int? id = null)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlStatementDbContext())
                {
                    SendEmailPdfViewModel SendEmail = new SendEmailPdfViewModel();
                    var SendEmailQuery = (from masterpdf in ctx.MasterPDFSet
                                          join registeredaccount in ctx.RegisteredAccountSet on masterpdf.AccountNo equals registeredaccount.AccountNo
                                          where masterpdf.ID == id
                                          where masterpdf.Period == registeredaccount.StatementPeriod
                                          select new { registeredaccount, masterpdf }).AsEnumerable().FirstOrDefault();

                    SendEmail.BodyEmail = SendEmailQuery.masterpdf.Content;
                    //SendEmail.File = @"D:\tes\BEKASI.txt";
                    //E:\Application Master\MyFunding\
                    string pathserver = db.ParamatersSet(9).FirstOrDefault().Value;
                    SendEmail.File = @pathserver.Trim() + SendEmailQuery.masterpdf.Root + @"\" + SendEmailQuery.masterpdf.Folder + @"\" + SendEmailQuery.masterpdf.File;
                    SendEmail.To = SendEmailQuery.registeredaccount.Email;
                    SendEmail.From = from;
                    SendEmail.Username = username;
                    SendEmail.Password = password;
                    SendEmail.Mailserver = mailserver;
                    SendEmail.Port = port;
                    SendEmail.Subject = SendEmailQuery.masterpdf.Subject;
                    string messagges = "";
                    //CalvinStart
                    Stopwatch sw = new Stopwatch();
                    sw.Start();
                    //CalvinEnd
                    bool networkUp = System.Net.NetworkInformation.NetworkInterface.GetIsNetworkAvailable();
                    if (networkUp)
                    {

                        //string[] host = (SendEmail.To.Trim().Split('@'));
                        string hostname = "bankmayora.co.id";//host[1];
                        var resolver = new DnsStubResolver();
                        var records = resolver.Resolve<MxRecord>(hostname, RecordType.Mx);
                        if (records.Count > 0)
                        {
                            System.Web.Mail.MailMessage myMail = new System.Web.Mail.MailMessage();
                            myMail.Fields.Add
                                ("http://schemas.microsoft.com/cdo/configuration/smtpserver",
                                              SendEmail.Mailserver);
                            myMail.Fields.Add
                                ("http://schemas.microsoft.com/cdo/configuration/smtpserverport",
                                              SendEmail.Port);
                            myMail.Fields.Add
                                ("http://schemas.microsoft.com/cdo/configuration/sendusing",
                                              "2");

                            myMail.Fields.Add
                            ("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate", "1");
                            //Use 0 for anonymous
                            myMail.Fields.Add
                            ("http://schemas.microsoft.com/cdo/configuration/sendusername",
                                SendEmail.Username);
                            myMail.Fields.Add
                            ("http://schemas.microsoft.com/cdo/configuration/sendpassword",
                                 SendEmail.Password);
                            myMail.Fields.Add
                            ("http://schemas.microsoft.com/cdo/configuration/smtpusessl",
                                 "true");
                            myMail.From = SendEmail.From;
                            myMail.To = SendEmail.To.Trim();
                            myMail.Subject = SendEmail.Subject;
                            myMail.Body = SendEmail.BodyEmail;
                            myMail.BodyFormat = System.Web.Mail.MailFormat.Html;
                            if (SendEmail.File.Trim() != "")
                            {
                                System.Web.Mail.MailAttachment MyAttachment = new System.Web.Mail.MailAttachment(SendEmail.File);
                                myMail.Attachments.Add(MyAttachment);
                                //myMail.Priority = System.Web.Mail.MailPriority.High;
                            }
                            try
                            {
                                System.Web.Mail.SmtpMail.SmtpServer = mailserver + ":" + port;
                                System.Web.Mail.SmtpMail.Send(myMail);
                                SendEmailQuery.masterpdf.Success = 1;
                                SendEmailQuery.masterpdf.UpdateBy = _currentUser.User.Id;
                                SendEmailQuery.masterpdf.UpdateDate = DateTime.Now;
                                SendEmailQuery.masterpdf.Remark += "[" + DateTime.Now.ToString("dd MMM yyyy") + "] Success;";
                                messagges = "Success";
                                ctx.SaveChanges();
                                //CalvinStart
                                sw.Stop();
                                String timespend = sw.Elapsed.ToString("hh\\:mm\\:ss");
                                _query.ExecDataTableProc("[dbo].[InsertLog1]", "@module", "List Email", "@process", "Send Email", "@logmessage", "Email sent to" + SendEmailQuery.registeredaccount.Email + " ( Acc. No " + SendEmailQuery.masterpdf.AccountNo + " - Period " + SendEmailQuery.masterpdf.Period + ")", "@timespend", timespend, "@nik", _currentUser.User.NIK);
                                //CalvinEnd
                            }
                            catch (System.Exception ex)
                            {
                                SendEmailQuery.masterpdf.Failure = SendEmailQuery.masterpdf.Failure + 1;
                                SendEmailQuery.masterpdf.UpdateBy = _currentUser.User.Id;
                                SendEmailQuery.masterpdf.UpdateDate = DateTime.Now;
                                SendEmailQuery.masterpdf.Remark += "[" + DateTime.Now.ToString("dd MMM yyyy") + "] " + ex.InnerException + ";";
                                messagges = ex.InnerException.ToString();
                                ctx.SaveChanges();
                                return JsonError(messagges);
                            }
                        }
                        else
                        {
                            SendEmailQuery.masterpdf.Failure = SendEmailQuery.masterpdf.Failure + 1;
                            SendEmailQuery.masterpdf.UpdateBy = _currentUser.User.Id;
                            SendEmailQuery.masterpdf.UpdateDate = DateTime.Now;
                            SendEmailQuery.masterpdf.Remark += "[" + DateTime.Now.ToString("dd MMM yyyy") + "] Email Rebound, Message 'Blocked by recipient';";
                            messagges = "Email Rebound, Message 'Blocked by recipient'";
                            ctx.SaveChanges();
                            return JsonError(messagges);
                        }
                    }
                    else
                    {
                        SendEmailQuery.masterpdf.Failure = SendEmailQuery.masterpdf.Failure + 1;
                        SendEmailQuery.masterpdf.UpdateBy = _currentUser.User.Id;
                        SendEmailQuery.masterpdf.UpdateDate = DateTime.Now;
                        SendEmailQuery.masterpdf.Remark += "[" + DateTime.Now.ToString("dd MMM yyyy") + "] Network Failure;";
                        messagges = "Network Failure";
                        ctx.SaveChanges();
                        return JsonError(messagges);
                    }
                    return JsonSuccess(new { success = true, Messages = messagges });
                }
            });
        }
    }
}