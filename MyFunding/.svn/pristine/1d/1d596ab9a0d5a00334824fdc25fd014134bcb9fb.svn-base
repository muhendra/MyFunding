using Core.Web.Controllers;
using Core.Web.Helpers;
using MyWeb.DataLayer;
using Core.Web.Utilities;
using MyWeb.Infrastructure.Applications;
using MyWeb.ViewModels.Statement;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace MyWeb.Controllers.Statement
{
    public class InsertLogController : CoreControllerBase
    {
        private ApplicationDbContext _applicationDbContext;
        private ICurrentUser _iCurrentUser;
        private SqlHelper _query = new SqlHelper("SqlMyStatementConnection");
        public InsertLogController(ApplicationDbContext context, ICurrentUser currentUser)
        {
            _applicationDbContext = context;
            _iCurrentUser = currentUser;
        }
        //
        // GET: /MasterParameter/
        public ActionResult Index()
        {
            return View();
        }

        public async Task<JsonResult> Getpage(string searchText, int pageNumber = 1, int pageSize = 10, string sortBy = "Id", string sortDirection = "asc")
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                var a = _query.ExecDataTableProc("[InsertLog_GetPage]","@searchtext",searchText);
                var b = a.ToList<InsertLogViewModel>();
                int totalitems = b.Count();
                var c = b.AsQueryable()
                    .Skip((pageNumber - 1) * pageSize)
                    .Take(pageSize)
                    .ToArray();
                return JsonSuccess(new { totalItems = totalitems, data = c });
            });

        }
	}
}