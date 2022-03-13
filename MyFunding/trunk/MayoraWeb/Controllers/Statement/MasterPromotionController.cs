using Core.Web.Controllers;
using Core.Web.Helpers;
using Core.Web.Utilities;
using MyWeb.DataLayer;
using MyWeb.Infrastructure.Applications;
using MyWeb.ViewModels.Statement;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using System.Data;
using System.Data.Entity;
using System.Linq.Dynamic;

namespace MyWeb.Controllers.Statement
{
    public class MasterPromotionController : CoreControllerBase
    {
        private ApplicationDbContext _applicationDbContext;
        private ICurrentUser _currentUser;
        private SqlHelper _query = new SqlHelper("SqlMyStatementConnection");

        public MasterPromotionController(ApplicationDbContext context, ICurrentUser currentuser)
        {
            _applicationDbContext = context;
            _currentUser = currentuser;
        }
        //
        // GET: /MasterPromotion/
        public ActionResult Index()
        {
            return View();
        }
        public async Task<JsonResult> GetAll(string sortBy = "ID", string sortDirection = "asc")
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
                {
                    var data = _query.ExecDataTableProc("MasterPromotion_GetPage").ToList<MasterPromotionViewModel>().AsQueryable().ToArray();
                    int totalitems = data.Count();
                    return JsonSuccess(new { totalItems = totalitems, data = data });
                });
        }
        public async Task<JsonResult> Getpage(int pageNumber = 1, int pageSize = 10, string sortBy = "ID", string sortDirection = "asc")
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                var a = _query.ExecDataTableProc("[MasterPromotion_GetPage]");

                var b = a.ToList<MasterPromotionViewModel>();

                int totalitems = b.Count();
                var c = b.AsQueryable()
                    .Skip((pageNumber - 1) * pageSize)
                    .Take(pageSize)
                    .ToArray();
                return JsonSuccess(new { totalItems = totalitems, data = c });
            });

        }


        public async Task<JsonResult> add(MasterPromotionViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async() =>
            {
                try 
	            {	        
		            string createby = _currentUser.User.Id;
                    int? companyid = _currentUser.User.CompanyId;
                    int? branchid = _currentUser.User.BranchId;
                    _query.ExecDataTableProc("MasterPromotion_Add", "@Name", form.Name, "@ProductCode", form.ProductCode, "@Message", form.Message, "@PeriodFrom", form.PeriodFrom, "@PeriodTo", form.PeriodTo == null ? Convert.ToDateTime("9999-12-31"):form.PeriodTo, "@createby", createby, "@companyid", companyid, "@branchid", branchid);
                    return JsonSuccess(new { success = true, Messages = "Success" });
	            }
	            catch (Exception ex)
	            {
		
		            if (ex.InnerException != null)
                    {
                        return JsonError(Convert.ToString(ex.InnerException));
                    }
                    else
                    {
                        return JsonError(Convert.ToString(ex.Message));
                    }
	            }
            });
        }

        public async Task<JsonResult> Update(MasterPromotionViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                try
                {
                    string upadteby = _currentUser.User.Id;
                    int? companyid = _currentUser.User.CompanyId;
                    int? branchid = _currentUser.User.BranchId;

                    _query.ExecDataTableProc("[MasterPromotion_Update]", "@ProductCode", form.ProductCode, "@Name", form.Name, "@Message", form.Message, "@PeriodFrom", form.PeriodFrom, "@PeriodTo", form.PeriodTo == null ? Convert.ToDateTime("9999-12-31") : form.PeriodTo, "@updateby", upadteby, "@companyid", companyid, "@branchid", branchid, "@Id", form.ID);

                    return JsonSuccess(new { success = true, Messages = "Success" });
                }
                catch (Exception ex)
                {

                    if (ex.InnerException != null)
                    {
                        return JsonError(Convert.ToString(ex.InnerException));
                    }
                    else
                    {
                        return JsonError(Convert.ToString(ex.Message));
                    }
                }
            });
        }

        public async Task<JsonResult> Delete(MasterPromotionViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                try
                {
                    string upadteby = _currentUser.User.Id;
                    int? companyid = _currentUser.User.CompanyId;
                    int? branchid = _currentUser.User.BranchId;

                    _query.ExecDataTableProc("[MasterPromotion_Delete]", "@updateby", upadteby, "@companyid", companyid, "@branchid", branchid, "@Id", form.ID);

                    return JsonSuccess(new { success = true, Messages = "Success" });
                }
                catch (Exception ex)
                {

                    if (ex.InnerException != null)
                    {
                        return JsonError(Convert.ToString(ex.InnerException));
                    }
                    else
                    {
                        return JsonError(Convert.ToString(ex.Message));
                    }
                }
            });
        }
	}
}