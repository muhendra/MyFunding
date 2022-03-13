using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GetDataPDF.ViewModel
{
    public class InsertLogViewModel 
    {
        public int Id { get; set; }
        public string ProcessLog { get; set; }
        public string TimeSpend { get; set; }
        public string CreateBy { get; set; }
        public DateTime? CreateDate { get; set; }
    }
}
