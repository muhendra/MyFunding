using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;

namespace MyWeb.Controllers.Statement.Lib
{
    public class EmailTemplate
    {
        public static string ConvertContentToEmailTemplate(string content, string period, string accountname, string accountno, string product)
        {
            DateTime date = DateTime.ParseExact(period, "yyyyMM", CultureInfo.InvariantCulture);
            string todate = date.ToString("MMM yyyy");

            if (content.Contains("[CUST_NAME]"))
            {
                content = content.Replace("[CUST_NAME]", accountname); 
            }
            if (content.Contains("[PERIOD]"))
            {
                content = content.Replace("[PERIOD]", todate); 
            }
            if (content.Contains("[ACC_NO]"))
            {
                content = content.Replace("[ACC_NO]", accountno);
            }
            if (content.Contains("[PRODUCT]"))
            {
                content = content.Replace("[PRODUCT]", product);
            }
            return content;
        }

        public static string ConvertSubject(string subject, string period)
        {
            DateTime date = DateTime.ParseExact(period, "yyyyMM", CultureInfo.InvariantCulture);
            string todate = date.ToString("MMM yyyy");
            if (subject.Contains("[PERIOD]"))
            {
                subject = subject.Replace("[PERIOD]", todate);
            }
            return subject;
        }
    }
}