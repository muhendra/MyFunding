using MyWeb.ViewModels.Statement;
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

    
    }
}
