using ARSoft.Tools.Net.Dns;
using SendEmailVM;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace SendEmail
{
    public class SendEmail
    {
        private DataContext db = new DataContext();
        private SendEmailPDFViewModel sendEmail = new SendEmailPDFViewModel();
        private ConfigEmail ConfigEmail = new ConfigEmail();
        public bool CheckEmail(string Email)
        {
            bool isemail = true;
            if (Email.ToLower().Contains(','))
            {
                String[] adresses = Email.Split(',');
                foreach (String adress in adresses)
                {
                    isemail = Regex.IsMatch(adress, @"\A(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?)\Z|^[a-zA-Z0-9]+$", RegexOptions.IgnoreCase);
                    Console.WriteLine(isemail.ToString());
                    if (isemail == false)
                    {
                        return isemail;

                    }
                }
            }
            else
            {
                isemail = Regex.IsMatch(Email, @"\A(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?)\Z|^[a-zA-Z0-9]+$", RegexOptions.IgnoreCase);
            }
            return isemail;
        }
        public void SendemailPDF()
        {
            Stopwatch sw = new Stopwatch();
            var data = db.SendEmailSet().ToList();
            var totaldata = data.Count();
            if (totaldata > 0)
            {
                try
                {
                    //var data = db.SendEmailSet().ToList();
                    string pathserver = db.ParamatersSet(9).FirstOrDefault().Value;
                    int no = 1;
                    //CalvinStart
                    sw.Start();
                    //CalvinEnd
                    foreach (var item in data)
                    {
                        int action = 0;
                        sendEmail.BodyEmail = item.Content;
                        sendEmail.File = @pathserver.Trim() + item.PathPdf;
                        sendEmail.To = item.Email.Trim();

                        System.Web.Mail.MailMessage myMail = new System.Web.Mail.MailMessage();
                        myMail.Fields.Add
                            (ConfigEmail.UrlSmtp, sendEmail.Mailserver);
                        myMail.Fields.Add
                            (ConfigEmail.UrlSmtpport, sendEmail.Port);
                        myMail.Fields.Add
                            (ConfigEmail.UrlSendUsing, "2");

                        myMail.Fields.Add
                        (ConfigEmail.UrlSmtpAuthenticate, "1");
                        //Use 0 for anonymous
                        myMail.Fields.Add
                        (ConfigEmail.UrlSendUsername, sendEmail.Username);
                        myMail.Fields.Add
                        (ConfigEmail.UrlSendPassword, sendEmail.Password);
                        myMail.Fields.Add
                        (ConfigEmail.UrlUseSSl, "true");
                        myMail.From = sendEmail.From;
                        myMail.To = sendEmail.To.Trim();
                        myMail.Subject = item.Subject;
                        myMail.Body = sendEmail.BodyEmail;
                        myMail.BodyFormat = System.Web.Mail.MailFormat.Html;
                        //bool isEmail = Regex.IsMatch(sendEmail.To, @"\A(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?)\Z|^[a-zA-Z0-9]+$", RegexOptions.IgnoreCase);
                        bool isEmail = CheckEmail(sendEmail.To);
                        if (isEmail)
                        {
                        //    Console.WriteLine("Tess");
                            //string[] host = (sendEmail.To.Split('@'));
                            string hostname = "bankmayora.co.id";
                            var resolver = new DnsStubResolver();
                            var records = resolver.Resolve<MxRecord>(hostname, RecordType.Mx);
                            if (records.Count > 0)
                            {
                                Console.WriteLine("Sending Email To : " + item.Email + "............" + no + " to " + data.Count());
                                if (sendEmail.File.Trim() != "")
                                {
                                    System.Web.Mail.MailAttachment MyAttachment = new System.Web.Mail.MailAttachment(sendEmail.File);
                                    myMail.Attachments.Add(MyAttachment);
                                    System.Web.Mail.SmtpMail.SmtpServer = "mail.bankmayora.com:465";
                                    System.Web.Mail.SmtpMail.Send(myMail);
                                    action = 1;
                                    Console.WriteLine("Success");
                                    //myMail.Priority = System.Web.Mail.MailPriority.High;
                                    db.UpdateActionEmail(item.AccountNo, action).FirstOrDefault();
                                }
                                else
                                {
                                    //item.Failure = item.Failure + 1;
                                    action = 2;
                                    db.UpdateActionEmail(item.AccountNo, action).FirstOrDefault();
                                    Console.WriteLine("File PDF is empty");
                                    db.SendEmailLogError("Send Batch Email", item.AccountNo + " File PDF is empty").FirstOrDefault();
                                }
                            }
                            else
                            {
                                action = 2;
                                //item.Failure = 2;
                                db.UpdateActionEmail(item.AccountNo, action).FirstOrDefault();
                                Console.WriteLine("Failure Send Email");
                                db.SendEmailLogError("Send Batch Email", item.AccountNo + " Failure Send Email").FirstOrDefault();
                                //break;
                            }
                        }
                        else
                        {
                            action = 2;
                            //item.Failure = 2;
                            db.UpdateActionEmail(item.AccountNo, action).FirstOrDefault();
                            Console.WriteLine("Format Email Is Not Valid Or Empty");
                            db.SendEmailLogError("Send Batch Email", item.AccountNo + " Format Email Is Not Valid Or Empty").FirstOrDefault();
                        }
                        no++;
                    }
                }
                catch (Exception ex)
                {
                    string e = ex.InnerException.ToString();
                    Console.WriteLine("Error : " + e);
                    db.SendEmailLogError("Send Batch Email", e).FirstOrDefault();
                }
                finally
                {
                    //CalvinStart
                    var success = data.Where(x => x.Success == 1).Count();
                    var failed = data.Where(x => x.Failure != 0).Count();
                    sw.Stop();
                    String timespend = sw.Elapsed.ToString("hh\\:mm\\:ss");
                    db.InsertLog(+totaldata + "Email has been processed. " + success + " email sent. " + failed + " email failed", timespend, "List Email", "Send Batch Email").FirstOrDefault();
                    //CalvinEnd
                } 
            }
        }
    }
}
