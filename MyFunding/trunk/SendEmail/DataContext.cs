using SendEmailVM;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Core.Objects;
using System.Data.Entity.Infrastructure;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SendEmail
{
    public class DataContext : DbContext
    {
        public DataContext()
            : base("SqlMyStatementConnection")
        {
            Database.SetInitializer<DataContext>(null);
        }

        public virtual ObjectResult<GetListUserByEmailAndMonthViewModel> SendEmailSet()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<GetListUserByEmailAndMonthViewModel>("GetListUserByEmailAndMonth");
        }

        public virtual ObjectResult<ParameterViewModel> ParamatersSet(int ID)
        {
            var Params = new object[] { 
                new SqlParameter("@ID", ID),
            };
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<ParameterViewModel>("MasterParameter_GetPage @ID", @Params);
        }

        public virtual ObjectResult<ParameterViewModel> UpdateActionEmail(string accountno, int param)
        {
            var Params = new object[] { 
                new SqlParameter("@AccountNo", accountno),
                 new SqlParameter("@Params", param),
            };
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<ParameterViewModel>("[UpdateActionEMail] @AccountNo,@Params", @Params);
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
    }
}
