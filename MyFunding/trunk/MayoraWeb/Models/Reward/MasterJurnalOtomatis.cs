using Core.Web.Models.Applications;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyWeb.Models.Reward
{
    public class MasterJurnalOtomatis : EntityBase
    {
        public int Id { get; set; }
        public string Transaksi { get; set; }
        public string JurnalType { get; set; }
        public DebetKredit DebetKredit { get; set; }
        public string InternalAccountName { get; set; }
        public string InternalAccount { get; set; }

        public string UangMuka { get; set; }
        public string FPBeforeReceive { get; set; }
        public string FPAfterReceive { get; set; }     
    }
}