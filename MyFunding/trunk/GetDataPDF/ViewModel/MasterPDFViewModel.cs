using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GetDataPDF.ViewModel
{
    public class MasterPDFViewModel 
    {
        public int ID { get; set; }
        public string Folder { get; set; }
        public string Root { get; set; }
        public string File { get; set; }
        public string AccountNo { get; set; }
        public string Period { get; set; }
        public string Branch { get; set; }
        public string PDF { get; set; }
        public string CreateBy { get; set; }
        public DateTime? CreateDate { get; set; }
        public string UpdateBy { get; set; }
        public string Content { get; set; }
        public string Subject { get; set; }
        public DateTime? UpdateDate { get; set; }
       
    }
}
