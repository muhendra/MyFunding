using GetDataPDF.Configuration;
using GetDataPDF.Model;
using GetDataPDF.ViewModel;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Core.Objects;
using System.Data.Entity.Infrastructure;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GetDataPDF
{
    class DataContext : DbContext
    {
        public DataContext() : base("SqlMyStatementConnection")
        {
            Database.SetInitializer<DataContext>(null);
        }
        public DbSet<MasterParameterModel> MasterParameterSet { get; set; }
        public DbSet<MasterPDFModel> MasterPdFSet { get; set; }
        public DbSet<HeaderTextFileModel> HeaderTextFileSet { get; set; }
        public DbSet<DetailBodyModel> DetailBodySet { get; set; }
        public DbSet<DetailFooterModel> DetailFooterSet { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Configurations.Add(new MasterParametersConfiguration());
            modelBuilder.Configurations.Add(new MasterPDFConfiguration());
            modelBuilder.Configurations.Add(new HeaderTextFileConfiguration());
            modelBuilder.Configurations.Add(new DetailBodyConfiguration());
            modelBuilder.Configurations.Add(new DetailFooterConfiguration());
        }

        public virtual ObjectResult<GetDistinctHeaderTextFileByAccountNo> DistinctHeaderSet(string cabang, string periode)
        {
            var Params = new object[] { 
                new SqlParameter("@cabang", cabang),
                new SqlParameter("@periode", periode),
                
            };
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<GetDistinctHeaderTextFileByAccountNo>("Get_Distinct_HeaderTextFile_By_AccountNo @cabang, @periode", @Params);
        }

        public virtual ObjectResult<GetHeaderTextFileToPDF> HeaderTextFileToPDFSet(string accountno, string periode)
        {
            var Params = new object[] { 
                new SqlParameter("@AccountNo", accountno),
                new SqlParameter("@periode", periode)
            };
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<GetHeaderTextFileToPDF>("Get_Header_TextFile_ToPDF @AccountNo, @periode", @Params);
        }

        public virtual ObjectResult<BodyTextFileViewModel> BodyTextFileToPdfSet(int ID)
        {
            var Params = new object[] { 
                new SqlParameter("@IDHeader", ID),
            };
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<BodyTextFileViewModel>("Get_Body_TextFile_ToPDF @IDHeader", @Params);
        }

        public virtual ObjectResult<Nullable<System.DateTime>> Check_EOM(DateTime? tanggal)
        {
            var Params = new object[] { 
                new SqlParameter("@tanggal", tanggal),
            };
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<Nullable<System.DateTime>>("Check_EOM @tanggal", @Params);
        }
        public virtual ObjectResult<ParameterViewModel> ParamatersSet(int? ID)
        {
            var Params = new object[] { 
                new SqlParameter("@Id", ID),
            };
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<ParameterViewModel>("MasterParameter_GetPage @Id", @Params);
        }
        public virtual ObjectResult<InsertLogViewModel> InsertLog(string error, string timespend, string module, string process)
        {
            var Params = new object[] { 
                new SqlParameter("@module", module),
                new SqlParameter("@process", process),
                new SqlParameter("@logmessage", error),
                new SqlParameter("@timespend", timespend),
                new SqlParameter("@nik", "System"),
            };
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<InsertLogViewModel>("[InsertLog1] @module,@process,@logmessage, @timespend, @nik", @Params);
        }
        public virtual ObjectResult<InsertLogViewModel> SendEmailLogError(string status, string logerror)
        {
            var Params = new object[] { 
                new SqlParameter("@status", status),
                new SqlParameter("@logerror", logerror),
            };
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<InsertLogViewModel>("[Send_Email_Error_Log] @status,@logerror", @Params);
        }
        public virtual ObjectResult<GetHeaderTextFileToPDF> DeleteDataHeaderTextExists(string periode, string cabang)
        {
            var Params = new object[] { 
                new SqlParameter("@periode", periode),
                new SqlParameter("@cabang", cabang),
            };
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<GetHeaderTextFileToPDF>("[DeleteDataHeaderTextExists] @periode,@cabang", @Params);
        }
    }
}
