using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyWeb.ViewModels.Reward
{
    public class SupplierViewModel
    {
        public string Supp_ID { get; set; }
        public string Nm_Supp { get; set; }
        public string Alamat1 { get; set; }
        public string Alamat2 { get; set; }
        public string Alamat3 { get; set; }
        public string Kota { get; set; }
        public string Zip_ID { get; set; }
        public string Kabupaten { get; set; }
        public string Provinsi { get; set; }
        public string Owner { get; set; }
        public string Telp_Owner { get; set; }
        public string HP_Owner { get; set; }
        public string PIC { get; set; }
        public string Telp_PIC { get; set; }
        public string HP_PIC { get; set; }
        public string Fax_No { get; set; }
        public string Email { get; set; }
        public string NoRek { get; set; }
        public string Nm_Bank { get; set; }
        public string User_ID { get; set; }
        public DateTime? Tgl_Input { get; set; }
        public string TermOfPayment { get; set; }        

    }
}