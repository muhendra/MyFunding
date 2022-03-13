using Core.Web.Controllers;
using Core.Web.Helpers;
using Core.Web.Infrastructure;
using Core.Web.Utilities;
using MyWeb.DataLayer;
using MyWeb.Infrastructure.Applications;
using MyWeb.Migrations.SqlStatement;
using MyWeb.ViewModels.Statement;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace MyWeb.Controllers.Statement
{
    public class RegisteredAccountController : CoreControllerBase
    {
        private ApplicationDbContext _applicationDbContext;
        private ICurrentUser _currentUser;
        private SqlHelper _query = new SqlHelper("SqlMyStatementConnection");
        public RegisteredAccountController(ICurrentUser currentUser, ApplicationDbContext context)
        {
            _applicationDbContext = context;
            _currentUser = currentUser;
        }
        //
        // GET: /RegisteredAccount/
        public ActionResult Index()
        {
            return View();
        }

        public async Task<JsonResult> All(DateTime? Period = null)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                var data = _query.ExecDataTableProc("RegisteredAccount_GetPage", "@Period", Period, "@niklogin", _currentUser.User.NIK, "@module","List Account","@process","Get Account").ToList<RegisteredAccountViewModel>().AsQueryable().ToArray();
                int totalitems = data.Count();
                
                return JsonSuccess(new { totalItems = totalitems, data = data });
            });
        }

        public async Task<JsonResult> GetPage(DateTime? Period = null, string searchText = "", int pageNumber = 1, int pageSize = 10, string cif = "", string accountNo = "", string email = "", string productCategory = "", string remark = "")
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                try
                {
                    var a = _query.ExecDataTableProc("RegisteredAccount_GetPage", "@Period", Period, "@niklogin", _currentUser.User.NIK, "@module", "List Account", "@process", "Get Account");
                    var b = a.ToList<RegisteredAccountViewModel>().Where(x => (string.IsNullOrEmpty(searchText) ||
                                 (x.CIF.Contains(searchText)) ||
                                 (x.AccountNo.Contains(searchText)) ||
                                 (x.Email.Contains(searchText)) ||
                                 (x.ProductCategory.Contains(searchText)) ||
                                 (x.Remark.Contains(searchText)))
                                 );
                    //var b = a.ToList<RegisteredAccountViewModel>().Where(x => (string.IsNullOrEmpty(cif) ||
                    //             x.CIF.Contains(cif)) && (string.IsNullOrEmpty(accountNo) ||
                    //             x.AccountNo.Contains(accountNo)) && (string.IsNullOrEmpty(email) ||
                    //             x.Email.Contains(email)) && (string.IsNullOrEmpty(productCategory) ||
                    //             x.ProductCategory.Contains(productCategory)) && (string.IsNullOrEmpty(remark) ||
                    //             x.Remark.Contains(remark))
                    //             );
                    int totalitems = b.Count();
                    var c = b.AsQueryable()
                        .Skip((pageNumber - 1) * pageSize)
                        .Take(pageSize)
                        .ToArray();
                    return JsonSuccess(new { totalItems = totalitems, data = c });
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
        public async Task<JsonResult> GetDepartment()
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlStatementDbContext())
                {
                    var a = _currentUser.Department.Id;

                    return JsonSuccess(a);
                }
            });
        }
        public async Task<JsonResult> Update(DateTime? period)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                //if (_currentUser.User.Branch.BranchCodeT24 != "ID0010001")
                //{
                //    return JsonError("Anda Tidak Memiliki Akses!");
                //}

                try
                {
                    _query.ExecDataTableProc("[Update_RegisteredAccount_From_Temenos]", "@tanggal", period, "@niklogin", _currentUser.User.NIK, "@module", "List Account", "@process", "Get Account");

                    return JsonSuccess(new { success = true, Messages = "Success" });
                }
                catch (Exception ex)
                {

                    if (ex.InnerException != null)
                    {
                        return JsonError(Convert.ToString(ex.InnerException));
                        _query.ExecDataTableProc("[Send_Email_Error_Log]", "@status", "Get Account", "@logerror", ex.Message);
                    }
                    else
                    {
                        return JsonError(Convert.ToString(ex.Message));
                        _query.ExecDataTableProc("[Send_Email_Error_Log]", "@status", "Get Account", "@logerror", ex.Message);
                    }
                }
            });
        }

        public async Task<JsonResult> Delete(int Id)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                try
                {
                    _query.ExecDataTableProc("[Delete_RegisteredAccount]", "@ID", Id, "@niklogin", _currentUser.User.NIK, "@module", "List Account", "@process", "Delete Account");

                    return JsonSuccess(new { success = true, Messages = "Success" });
                }
                catch (Exception ex)
                {

                    if (ex.InnerException != null)
                    {
                        return JsonError(Convert.ToString(ex.InnerException));
                        _query.ExecDataTableProc("[Send_Email_Error_Log]", "@status", "Delete Account", "@logerror", ex.InnerException);
                    }
                    else
                    {
                        return JsonError(Convert.ToString(ex.Message));
                        _query.ExecDataTableProc("[Send_Email_Error_Log]", "@status", "Delete Account", "@logerror", ex.Message);
                    }
                }
            });
        }
	}
}