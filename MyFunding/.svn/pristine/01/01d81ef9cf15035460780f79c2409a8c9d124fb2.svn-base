using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SendEmailVM
{
    public class SendEmailPDFViewModel
    {
        private int _Port { get; set; }
        public int Port { 
            get {
                if (_Port == null || _Port == 0)
                { 
                    _Port = int.Parse(ConfigurationManager.AppSettings["PortEmail"]); 
                }
                return _Port;
            }
        }
        private string _Mailserver { get; set; }
        public string Mailserver {
            get
            {
                if (String.IsNullOrEmpty(_Mailserver))
                {
                    _Mailserver = ConfigurationManager.AppSettings["MailServerExternal"];
                }
                return _Mailserver;
            }
        }
        private string _Username { get; set; }
        public string Username { 
            get {
                if (String.IsNullOrEmpty(_Username))
                {
                    _Username = ConfigurationManager.AppSettings["UsenameEmail"];
                }
                return _Username;
            }
        }
        private string _Password { get; set; }
        public string Password {
            get {
                if (String.IsNullOrEmpty(_Password))
                {
                    _Password = ConfigurationManager.AppSettings["PasswordEmail"];
                }
                return _Password;
            }
            
        }
        public string BodyEmail { get; set; }
        public string To { get; set; }
        public string File { get; set; }
        private string _From { get; set; }
        public string From {
            get
            {
                if (String.IsNullOrEmpty(_From))
                {
                    _From = ConfigurationManager.AppSettings["EmailExternal"];
                }
                return _From;
            }
            
        }
    }

    public class ConfigEmail
    {
        private string _UrlSmtp;
        public string UrlSmtp
        {
            get
            {
                if (String.IsNullOrEmpty(_UrlSmtp))
                {
                    _UrlSmtp = "http://schemas.microsoft.com/cdo/configuration/smtpserver";
                }
                return _UrlSmtp;
            }
        }
        private string _UrlSmtpport;
        public string UrlSmtpport
        {
            get
            {
                if (String.IsNullOrEmpty(_UrlSmtpport))
                {
                    _UrlSmtpport = "http://schemas.microsoft.com/cdo/configuration/smtpserverport";
                }
                return _UrlSmtpport;
            }
        }
        private string _UrlSendUsing;
        public string UrlSendUsing
        {
            get
            {
                if (String.IsNullOrEmpty(_UrlSendUsing))
                {
                    _UrlSendUsing = "http://schemas.microsoft.com/cdo/configuration/sendusing";
                }
                return _UrlSendUsing;
            }
        }
        private string _UrlSmtpAuthenticate;
        public string UrlSmtpAuthenticate
        {
            get
            {
                if (String.IsNullOrEmpty(_UrlSmtpAuthenticate))
                {
                    _UrlSmtpAuthenticate = "http://schemas.microsoft.com/cdo/configuration/smtpauthenticate";
                }
                return _UrlSmtpAuthenticate;
            }
        }
        private string _UrlSendUsername;
        public string UrlSendUsername 
        {
            get
            {
                if (String.IsNullOrEmpty(_UrlSendUsername))
                {
                    _UrlSendUsername = "http://schemas.microsoft.com/cdo/configuration/sendusername";
                }
                return _UrlSendUsername;
            }
        }
        private string _UrlSendPassword;
        public string UrlSendPassword 
        {
            get
            {
                if (String.IsNullOrEmpty(_UrlSendPassword))
                {
                    _UrlSendPassword = "http://schemas.microsoft.com/cdo/configuration/sendpassword";
                }
                return _UrlSendPassword;
            }
        }
        private string _UrlUseSSl;
        public string UrlUseSSl
        {
            get
            {
                if (String.IsNullOrEmpty(_UrlUseSSl))
                {
                    _UrlUseSSl = "http://schemas.microsoft.com/cdo/configuration/smtpusessl";
                }
                return _UrlUseSSl;
            }
        }
    }

    public class GetListUserByEmailAndMonthViewModel
    {
        public int Id { get; set; }
        public string AccountNo { get; set; }
        public string AccountName { get; set; }
        public string Email { get; set; }
        public string PathPdf { get; set; }
        public string Content { get; set; }
        public string Subject { get; set; }
        public int Success { get; set; }
        public int Failure { get; set; }
    }
    public class ParameterViewModel
    {
        public int ID { get; set; }
        public string  Name { get; set; }
        public string Value { get; set; }
    }
    public class InsertLogViewModel
    {
        public int Id { get; set; }
        public string ProcessLog { get; set; }
        public string TimeSpend { get; set; }
        public string CreateBy { get; set; }
        public DateTime? CreateDate { get; set; }
    }
}
