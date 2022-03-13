using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GetDataPDF.ViewModel
{
    public class ConfigKeyViewModel
    {
        private string _Pathfolderpdf { get; set; }
        public string Pathfolderpdf
        {
            get
            {
                return _Pathfolderpdf = ConfigurationManager.AppSettings["pathfolderpdf"].ToString();
            }
        }
        private string _Pathtemppdf { get; set; }
        public string  Pathtemppdf 
        {
            get
            {
                return _Pathtemppdf = ConfigurationManager.AppSettings["pathtemppdf"].ToString();
            }
        }

        private string _Pathstmt { get; set; }
        public string Pathstmt 
        {
            get
            {
                return _Pathstmt = ConfigurationManager.AppSettings["pathstmt"].ToString();
            }
        }

        public string _PathLog { get; set; }
        public string  PathLog 
        {
            get
            {
                return _PathLog = ConfigurationManager.AppSettings["pathlog"].ToString();
            }

        }

        private string _Hostftp { get; set; }
        public string Hostftp 
        {
            get
            {
                return _Hostftp = ConfigurationManager.AppSettings["hostftp"].ToString();
            }
        }

        private string _Usernameftp { get; set; }
        public string Usernameftp
        {
            get
            {
                return _Usernameftp = ConfigurationManager.AppSettings["usernameftp"].ToString();
            }
        }

        private string _Pwdftp { get; set; }
        public string Pwdftp
        {
            get
            {
                return _Pwdftp = ConfigurationManager.AppSettings["pwdftp"].ToString();
            }
        }

        private string _Sourceftp { get; set; }
        public string Sourceftp
        {
            get
            {
                return _Sourceftp = ConfigurationManager.AppSettings["sourceftp"].ToString();
            }
        }
    }
}
