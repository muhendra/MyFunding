using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace SendEmail
{
    public class Program
    {
        static void Main(string[] args)
        {
            SendEmail sendemail = new SendEmail();
            sendemail.SendemailPDF();
            //sendemail.sendemail();

        }

    }
}
