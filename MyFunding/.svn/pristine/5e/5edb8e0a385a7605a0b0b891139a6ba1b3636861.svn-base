using Core.Web.Helpers;
using MyWeb.Controllers.Applications;
using System;
using System.Collections.Generic;
using System.Data;
using System.Reflection;
namespace MyWeb.Controllers.Reward
{
    public static class NotificationLib
    {
        private static SqlHelper _query = new SqlHelper("SqlFundingConnection");

        private static List<T> ConvertDataTable<T>(DataTable dt)
        {
            List<T> data = new List<T>();
            foreach (DataRow row in dt.Rows)
            {
                T item = GetItem<T>(row);
                data.Add(item);
            }
            return data;
        }

        private static T GetItem<T>(DataRow dr)
        {
            Type temp = typeof(T);
            T obj = Activator.CreateInstance<T>();

            foreach (DataColumn column in dr.Table.Columns)
            {
                foreach (PropertyInfo pro in temp.GetProperties())
                {
                    if (pro.Name == column.ColumnName)
                        pro.SetValue(obj, dr[column.ColumnName], null);
                    else
                        continue;
                }
            }
            return obj;
        }

        public static void sendNotifikasi(string dear, string Cabang, string NoDokumen, DateTime? TglDokumen, string JenisDokumen, string JenisPembuatan, string link)
        {
            try
            {
                EmailFunding newEmail = new EmailFunding();
                if (dear == "Head Product")
                {
                    //List<string> email = new List<string>();
                    //email.Add("imboh.sembodo@bankmayora.co.id");
                    newEmail.addRecipients("ronald.yonathan@bankmayora.co.id");
                    //newEmail.addRecipients(email);
                    //newEmail.addRecipients("imboh.sembodo@bankmayora.co.id");
                }
                else if (dear == "All GA")
                {
                    List<string> email = new List<string>();
                    email.Add("ga@bankmayora.co.id");
                    email.Add("funding@bankmayora.co.id");
                    newEmail.addRecipients(email);
                    //newEmail.addRecipients("funding@bankmayora.co.id");
                }
                else if (dear == "Head GA")
                {
                    newEmail.addRecipients("rini@bankmayora.co.id");
                }
                else if (dear == "Head Cabang")
                {
                    newEmail.addRecipients("imboh.sembodo@bankmayora.co.id");
                }
                else if (dear == "All Product")
                {
                    //newEmail.addRecipients("ronald.yonathan@bankmayora.co.id");
                    newEmail.addRecipients("funding@bankmayora.co.id");
                }
                else if (dear == "All Cabang")
                {
                    newEmail.addRecipients("ronald.yonathan@bankmayora.co.id");
                }
                //newEmail.addBlind_copy_recipients("yaditya.jonathan@bankmayora.co.id");
                //newEmail.addCopy_recipients("ade.arman@bankmayora.co.id");
                //newEmail.addCopy_recipients("ichwan.yasir@bankmayora.co.id");
                newEmail.subject = "Notification My Funding";
                string TanggalDokument = TglDokumen == null ? "" : Convert.ToDateTime(TglDokumen).ToString("dd MMMM yyyy");
                string bodymail = "<p>Dear " + dear + ",</p><br><br>";
                bodymail += String.Format("<p>Sekedar Informasi, terdapat permintaan {0}, berdasarkan data Sebagai Berikut:</p><br>", JenisPembuatan);
                bodymail += String.Format("<table border=\"0\">");
                bodymail += String.Format("<tr><td>Cabang</td><td>: {0}</td></tr>", Cabang);
                bodymail += String.Format("<tr><td>No Dokumen</td><td>: {0}</td></tr>", NoDokumen);
                bodymail += String.Format("<tr><td>Jenis Dokumen</td><td>: {0}</td></tr>", JenisDokumen);
                bodymail += String.Format("<tr><td>Tanggal Dokumen</td><td>: {0}</td></tr>", TanggalDokument);
                bodymail += String.Format("<tr><td>Jenis Permintaan</td><td>: {0}</td></tr>", JenisPembuatan);
                bodymail += String.Format("</table border=\"0\">");
                bodymail += String.Format("<br><br><p>Dimohon permintaan ini segera di konfirmasi</p><br><br><br><p>Terima kasih</p><br><p>MyRewArd System Application</p><br><div class=\"btn btn-primary\"><a href=\"http://10.10.2.199/MyFunding/" + link + "\">Klik disini </a></div>");
                newEmail.body = bodymail;
                newEmail.setUseHtmlFormatBody(true);
                newEmail.Send();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// gak dipake
        /// </summary>
        /// <param name="Cabang"></param>
        /// <param name="NoDokumen"></param>
        /// <param name="TglDokumen"></param>
        /// <param name="JenisDokumen"></param>
        /// <param name="JenisPembuatan"></param>
        /// <param name="link"></param>

        //public static void sendNotifikasi(string Cabang, string NoDokumen, DateTime? TglDokumen, string JenisDokumen, string JenisPembuatan, string link)
        //{
        //    try
        //    {
        //            EmailFunding newEmail = new EmailFunding();
        //            newEmail.addRecipients("ga@bankmayora.co.id");
        //            //newEmail.addRecipients("ichwan.yasir@bankmayora.co.id");
        //            //newEmail.addRecipients("monika.pramana@bankmayora.co.id");
        //            //newEmail.addRecipients("ivan.stevanus@bankmayora.co.id");
        //            //newEmail.addBlind_copy_recipients("yaditya.jonathan@bankmayora.co.id");
        //            //newEmail.addCopy_recipients("ade.arman@bankmayora.co.id");
        //            //newEmail.addCopy_recipients("ichwan.yasir@bankmayora.co.id");
        //            newEmail.subject = "Notification My Funding";
        //            string TanggalDokument = TglDokumen == null ? "" : Convert.ToDateTime(TglDokumen).ToString("dd MMMM yyyy");
        //            string bodymail = "<p>Dear All GA,</p><br><br>";
        //            bodymail += String.Format("<p>Sekedar Informasi, terdapat permintaan {0}, berdasarkan data Sebagai Berikut:</p><br>", JenisPembuatan);
        //            bodymail += String.Format("<table border=\"0\">");
        //            bodymail += String.Format("<tr><td>Cabang</td><td>: {0}</td></tr>", Cabang);
        //            bodymail += String.Format("<tr><td>No Dokumen</td><td>: {0}</td></tr>", NoDokumen);
        //            bodymail += String.Format("<tr><td>Jenis Dokumen</td><td>: {0}</td></tr>", JenisDokumen);
        //            bodymail += String.Format("<tr><td>Tanggal Dokumen</td><td>: {0}</td></tr>", TanggalDokument);
        //            bodymail += String.Format("<tr><td>Jenis Permintaan</td><td>: {0}</td></tr>", JenisPembuatan);
        //            bodymail += String.Format("</table border=\"0\">");
        //            bodymail += String.Format("<br><br><p>Dimohon permintaan ini segera di konfirmasi</p><br><br><br><p>Terima kasih</p><br><p>MyRewArd System Application</p><br><div class=\"btn btn-primary\"><a href=\"http://10.10.2.199/MyFunding/" + link + "\">Klik disini </a></div>");
        //            newEmail.body = bodymail;
        //            newEmail.setUseHtmlFormatBody(true);
        //            newEmail.Send();
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}
        //public static void sendNotifikasi(string Cabang, string NoDokumen, DateTime? TglDokumen, string JenisDokumen, string JenisPembuatan, string link, string roleName)
        //{
        //    try
        //    {
        //        EmailFunding newEmail = new EmailFunding();
        //        List<string> ListEmail = new List<string>();
        //        using (var ctx = new SqlFundingDbContext())
        //        {
                    
        //            var Params = new object[] { 
        //                new SqlParameter("@rolename", roleName)
        //            };
        //            DataTable model = _query.ExecDataTable("SP_GETLISTEMAIL_BY_ROLE @rolename",Params);
        //            ListEmail = ConvertDataTable<string>(model);
        //        }
        //        newEmail.addRecipients(ListEmail);
        //        newEmail.subject = "Notification My Funding";
        //        string TanggalDokument = TglDokumen == null ? "" : Convert.ToDateTime(TglDokumen).ToString("dd MMMM yyyy");
        //        string bodymail = "<p>Dear All GA,</p><br><br>";
        //        bodymail += String.Format("<p>Sekedar Informasi, terdapat permintaan {0}, berdasarkan data Sebagai Berikut:</p><br>", JenisPembuatan);
        //        bodymail += String.Format("<table border=\"0\">");
        //        bodymail += String.Format("<tr><td>Cabang</td><td>: {0}</td></tr>", Cabang);
        //        bodymail += String.Format("<tr><td>No Dokumen</td><td>: {0}</td></tr>", NoDokumen);
        //        bodymail += String.Format("<tr><td>Jenis Dokumen</td><td>: {0}</td></tr>", JenisDokumen);
        //        bodymail += String.Format("<tr><td>Tanggal Dokumen</td><td>: {0}</td></tr>", TanggalDokument);
        //        bodymail += String.Format("<tr><td>Jenis Permintaan</td><td>: {0}</td></tr>", JenisPembuatan);
        //        bodymail += String.Format("</table border=\"0\">");
        //        bodymail += String.Format("<br><br><p>Dimohon permintaan ini segera di konfirmasi</p><br><br><br><p>Terima kasih</p><br><p>MyRewArd System Application</p><br><div class=\"btn btn-primary\"><a href=\"http://10.10.2.199/MyFunding/" + link + "\">Klik disini </a></div>");
        //        newEmail.body = bodymail;
        //        newEmail.setUseHtmlFormatBody(true);
        //        newEmail.Send();
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}
        //public static void sendNotifikasi(string Cabang, string NoDokumen, DateTime? TglDokumen, string JenisDokumen, string JenisPembuatan, string link, List<string> Recipients)
        //{
        //    try
        //    {
        //        EmailFunding newEmail = new EmailFunding();
        //        newEmail.addRecipients("ichwan.yasir@bankmayora.co.id");
        //        newEmail.addRecipients("monika.pramana@bankmayora.co.id");
        //        //newEmail.addBlind_copy_recipients("yaditya.jonathan@bankmayora.co.id");
        //        //newEmail.addCopy_recipients("ade.arman@bankmayora.co.id");
        //        //newEmail.addCopy_recipients("ichwan.yasir@bankmayora.co.id");
        //        newEmail.subject = "Notification My Funding";
        //        string TanggalDokument = TglDokumen == null ? "" : Convert.ToDateTime(TglDokumen).ToString("dd MMMM yyyy");
        //        string bodymail = "<p>Dear All GA,</p><br><br>";
        //        bodymail += String.Format("<p>Sekedar Informasi, terdapat permintaan {0}, berdasarkan data Sebagai Berikut:</p><br>", JenisPembuatan);
        //        bodymail += String.Format("<table border=\"0\">");
        //        bodymail += String.Format("<tr><td>Cabang</td><td>: {0}</td></tr>", Cabang);
        //        bodymail += String.Format("<tr><td>No Dokumen</td><td>: {0}</td></tr>", NoDokumen);
        //        bodymail += String.Format("<tr><td>Jenis Dokumen</td><td>: {0}</td></tr>", JenisDokumen);
        //        bodymail += String.Format("<tr><td>Tanggal Dokumen</td><td>: {0}</td></tr>", TanggalDokument);
        //        bodymail += String.Format("<tr><td>Jenis Permintaan</td><td>: {0}</td></tr>", JenisPembuatan);
        //        bodymail += String.Format("</table border=\"0\">");
        //        bodymail += String.Format("<br><br><p>Dimohon permintaan ini segera di konfirmasi</p><br><br><br><p>Terima kasih</p><br><p>MyReword System Application</p><br><div class=\"btn btn-primary\"><a href=\"http://10.10.2.199/MyFunding/" + link + "\">Klik disini </a></div>");
        //        newEmail.body = bodymail;
        //        newEmail.setUseHtmlFormatBody(true);
        //        newEmail.Send();
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}
        //public static void sendNotifikasi(string Cabang, string NoDokumen, DateTime? TglDokumen, string JenisDokumen, string JenisPembuatan, string link, List<string> Recipients, List<string> Copy_recipients)
        //{
        //    try
        //    {
        //        EmailFunding newEmail = new EmailFunding();
        //        newEmail.addRecipients("ichwan.yasir@bankmayora.co.id");
        //        newEmail.addRecipients("monika.pramana@bankmayora.co.id");
        //        //newEmail.addBlind_copy_recipients("yaditya.jonathan@bankmayora.co.id");
        //        //newEmail.addCopy_recipients("ade.arman@bankmayora.co.id");
        //        //newEmail.addCopy_recipients("ichwan.yasir@bankmayora.co.id");
        //        newEmail.subject = "Notification My Funding";
        //        string TanggalDokument = TglDokumen == null ? "" : Convert.ToDateTime(TglDokumen).ToString("dd MMMM yyyy");
        //        string bodymail = "<p>Dear All GA,</p><br><br>";
        //        bodymail += String.Format("<p>Sekedar Informasi,  terdapat permintaan {0}, berdasarkan data Sebagai Berikut:</p><br>", JenisPembuatan);
        //        bodymail += String.Format("<table border=\"0\">");
        //        bodymail += String.Format("<tr><td>Cabang</td><td>: {0}</td></tr>", Cabang);
        //        bodymail += String.Format("<tr><td>No Dokumen</td><td>: {0}</td></tr>", NoDokumen);
        //        bodymail += String.Format("<tr><td>Jenis Dokumen</td><td>: {0}</td></tr>", JenisDokumen);
        //        bodymail += String.Format("<tr><td>Tanggal Dokumen</td><td>: {0}</td></tr>", TanggalDokument);
        //        bodymail += String.Format("<tr><td>Jenis Permintaan</td><td>: {0}</td></tr>", JenisPembuatan);
        //        bodymail += String.Format("</table border=\"0\">");
        //        bodymail += String.Format("<br><br><p>Dimohon permintaan ini segera di konfirmasi</p><br><br><br><p>Terima kasih</p><br><p>MyReword System Application</p><br><div class=\"btn btn-primary\"><a href=\"http://10.10.2.199/MyFunding/" + link + "\">Klik disini </a></div>");
        //        newEmail.body = bodymail;
        //        newEmail.setUseHtmlFormatBody(true);
        //        newEmail.Send();
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}
        //public static void sendNotifikasi(string Cabang, string NoDokumen, DateTime? TglDokumen, string JenisDokumen, string JenisPembuatan, string link, List<string> Recipients, List<string> Copy_recipients, List<string> Blind_copy_recipients)
        //{
        //    try
        //    {
        //        EmailFunding newEmail = new EmailFunding();
        //        newEmail.addRecipients("ichwan.yasir@bankmayora.co.id");
        //        newEmail.addRecipients("monika.pramana@bankmayora.co.id");
        //        //newEmail.addBlind_copy_recipients("yaditya.jonathan@bankmayora.co.id");
        //        //newEmail.addCopy_recipients("ade.arman@bankmayora.co.id");
        //        //newEmail.addCopy_recipients("ichwan.yasir@bankmayora.co.id");
        //        newEmail.subject = "Notification My Funding";
        //        string TanggalDokument = TglDokumen == null ? "" : Convert.ToDateTime(TglDokumen).ToString("dd MMMM yyyy");
        //        string bodymail = "<p>Dear All GA,</p><br><br>";
        //        bodymail += String.Format("<p>Sekedar Informasi,  terdapat permintaan {0}, berdasarkan data Sebagai Berikut:</p><br>", JenisPembuatan);
        //        bodymail += String.Format("<table border=\"0\">");
        //        bodymail += String.Format("<tr><td>Cabang</td><td>: {0}</td></tr>", Cabang);
        //        bodymail += String.Format("<tr><td>No Dokumen</td><td>: {0}</td></tr>", NoDokumen);
        //        bodymail += String.Format("<tr><td>Jenis Dokumen</td><td>: {0}</td></tr>", JenisDokumen);
        //        bodymail += String.Format("<tr><td>Tanggal Dokumen</td><td>: {0}</td></tr>", TanggalDokument);
        //        bodymail += String.Format("<tr><td>Jenis Permintaan</td><td>: {0}</td></tr>", JenisPembuatan);
        //        bodymail += String.Format("</table border=\"0\">");
        //        bodymail += String.Format("<br><br><p>Dimohon permintaan ini segera di konfirmasi</p><br><br><br><p>Terima kasih</p><br><p>MyReword System Application</p><br><div class=\"btn btn-primary\"><a href=\"http://10.10.2.199/MyFunding/" + link + "\">Klik disini </a></div>");
        //        newEmail.body = bodymail;
        //        newEmail.setUseHtmlFormatBody(true);
        //        newEmail.Send();
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}
    }
}