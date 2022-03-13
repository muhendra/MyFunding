using Core.Web.Helpers;
using Core.Web.Utilities;
using MyWeb.Migrations.SqlStatement;
using MyWeb.ViewModels.Statement;
using Quartz;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;

namespace MyWeb.Scheduler
{
    public class SendPdfToEmailUser:IJob
    {
        private SqlHelper _query = new SqlHelper("SqlMyStatementConnection");
        public void Execute(IJobExecutionContext context)
        {
            try
            {
                SendEmailPdfViewModel SendEmail = new SendEmailPdfViewModel();

                SendEmail.From = "no-reply@bankmayora.com";
                SendEmail.Username = "no-reply@bankmayora.com";
                SendEmail.Password = "estatement@bankmayora.com";
                SendEmail.Mailserver = "mail.bankmayora.com";
                SendEmail.Port = 465;

                var a = _query.ExecDataTableProc("[GetListUserByEmailAndMonth]").ToList<GetListUserByEmailAndMonthViewModel>();
                foreach (var data in a)
                {
                    SendEmail.BodyEmail = data.Content;
                    SendEmail.File = data.PathPdf;
                    SendEmail.To = data.Email;
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
                    myMail.To = SendEmail.To;
                    myMail.Subject = data.Subject;
                    myMail.Body = SendEmail.BodyEmail;
                    bool isEmail = Regex.IsMatch(SendEmail.To, @"\A(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?)\Z", RegexOptions.IgnoreCase);

                    if (isEmail)
                    {
                        if (SendEmail.File.Trim() != "")
                        {
                            System.Web.Mail.MailAttachment MyAttachment = new System.Web.Mail.MailAttachment(SendEmail.File);
                            myMail.Attachments.Add(MyAttachment);
                            //myMail.Priority = System.Web.Mail.MailPriority.High;
                        }
                        System.Web.Mail.SmtpMail.SmtpServer = "mail.bankmayora.com:465";
                        System.Web.Mail.SmtpMail.Send(myMail);
                    }
                    
                }
            }
            catch (System.Exception)
            {
                
                throw;
            }
            
        }
    }
}