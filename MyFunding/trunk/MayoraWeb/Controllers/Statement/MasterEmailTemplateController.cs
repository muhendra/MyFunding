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
using Core.Web.Controllers;

namespace MyWeb.Controllers.Statement
{
    public class MasterEmailTemplateController : CoreControllerBase
    {
        private ApplicationDbContext _applicationDbContext;
        private ICurrentUser _currentUser;
        private SqlHelper _query = new SqlHelper("SqlMyStatementConnection");

        public MasterEmailTemplateController(ApplicationDbContext context, ICurrentUser currentUser)
        {
            _applicationDbContext = context;
            _currentUser = currentUser;
        }
        //
        // GET: /MasterEmailTemplate/
        public ActionResult Index()
        {
            return View();
        }

        public async Task<JsonResult> All(string sortBy = "ID", string sortDirection = "asc")
        {
            return await ExecuteFaultHandledOperationAsync(async()=>
                {
                    var data = _query.ExecDataTableProc("MasterEmailTemplate_GetPage").ToList<MasterEmailTemplateViewModel>().AsQueryable().ToArray();
                    int totalitems = data.Count();
                    return JsonSuccess(new {totalItems =  totalitems, data=data }); 
                });
        }
        public async Task<JsonResult> Add(MasterEmailTemplateViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                try
                {
                    string createby = _currentUser.User.Id;
                    int? companyid = _currentUser.User.CompanyId;
                    int? branchid = _currentUser.User.BranchId;
                    _query.ExecDataTableProc("MasterEmailTemplate_Add", "@Name", form.Name, "@ProductCode", form.ProductCode, "@Description", form.Description, "@Content", form.Content, "@createby", createby, "@companyid", companyid, "@branchid", branchid);
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

        public async Task<JsonResult> Update(MasterEmailTemplateViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                try
                {
                    string updateby = _currentUser.User.Id;
                    int? companyid = _currentUser.User.CompanyId;
                    int? branchid = _currentUser.User.BranchId;
                    _query.ExecDataTableProc("MasterEmailTemplate_Update", "@Name", form.Name, "@ProductCode", form.ProductCode, "@Description", form.Description, "@Content", form.Content, "@updateby", updateby, "@companyid", companyid, "@branchid", branchid, "@ID", form.ID);
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

        public async Task<JsonResult> Delete(MasterEmailTemplateViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                try
                {
                    string updateby = _currentUser.User.Id;
                    int? companyid = _currentUser.User.CompanyId;
                    int? branchid = _currentUser.User.BranchId;
                    _query.ExecDataTableProc("MasterEmailTemplate_Delete", "@updateby", updateby, "@companyid", companyid, "@branchid", branchid, "@ID", form.ID);
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

        public async Task<JsonResult> Getpage(int pageNumber = 1, int pageSize = 10, string sortBy = "ID", string sortDirection = "asc")
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                var a = _query.ExecDataTableProc("[MasterEmailTemplate_GetPage]");

                var b = a.ToList<MasterEmailTemplateViewModel>();

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