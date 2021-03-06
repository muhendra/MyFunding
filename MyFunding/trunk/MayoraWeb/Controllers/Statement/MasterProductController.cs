using AutoMapper;
using AutoMapper.QueryableExtensions;
using Core.Web.Controllers;
using Core.Web.Helpers;
using Core.Web.Infrastructure;
using Core.Web.Utilities;
using Microsoft.Reporting.WebForms;
using MyWeb.DataLayer;
using MyWeb.Infrastructure.Applications;
using MyWeb.ViewModels.Statement;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Linq.Dynamic;
using System.Threading.Tasks;
using System.Web.Mvc;


namespace MyWeb.Controllers.Statement
{
    public class MasterProductController : CoreControllerBase
    {
        private ApplicationDbContext _applicationDbContext;
        private ICurrentUser _currentUser;
        private SqlHelper _query = new SqlHelper("SqlMyStatementConnection");
        //
        // GET: /MasterProduct/

        public MasterProductController(ApplicationDbContext context, ICurrentUser currentUser)
        {
            _applicationDbContext = context;
            _currentUser = currentUser;
        }
        public ActionResult Index()
        {
            return View();
        }

        public async Task<JsonResult> All(string sortBy = "ProductCode", string sortDirection = "asc")
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
                {
                    var a = _query.ExecDataTableProc("MasterProduct_GetPage");
                    var b = a.ToList<MasterProduct>();
                    int totalitems = b.Count();
                    var data = b.AsQueryable().ToArray();
                    return JsonSuccess(new { totalItems = totalitems, data = data });
                });
        }
        public async Task<JsonResult> GetPage(string searchText = "",int pageNumber = 1, int pageSize = 10, string sortBy = "ProductCode", string sortDirection = "asc")
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                var a = _query.ExecDataTableProc("[MasterProduct_GetPage]", "@searchtext", searchText);

                var b = a.ToList<MasterProduct>();

                int totalitems = b.Count();
                var c = b.AsQueryable()
                    .Skip((pageNumber - 1) * pageSize)
                    .Take(pageSize)
                    .ToArray();
                return JsonSuccess(new { totalItems = totalitems, data = c });
            });
        }

        public async Task<JsonResult> GetPageCategoryTemenos(string searchText = "", int pageNumber = 1, int pageSize = 10)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                var a = _query.ExecDataTableProc("[GetPageCategoryTemenos]", "@searchtext", searchText);

                var b = a.ToList<GetCategoryTemenos>();

                int totalitems = b.Count();
                var c = b.AsQueryable()
                    .Skip((pageNumber - 1) * pageSize)
                    .Take(pageSize)
                    .ToArray();
                return JsonSuccess(new { totalItems = totalitems, data = c });
            });
        }

        public async Task<JsonResult> Add(MasterProduct form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                try
                {
                    string createby = _currentUser.User.Id;
                    int? companyid = _currentUser.User.CompanyId;
                    int? branchid = _currentUser.User.BranchId;

                    _query.ExecDataTableProc("[MasterProduct_Add]", "@ProductCode", form.Code, "@ProductName", form.ProductName, "@IsActive", form.IsActive,"@Description",form.Description, "@createby", createby, "@companyid", companyid, "@branchid", branchid);

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

        public async Task<JsonResult> Update(MasterProduct form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                try
                {
                    string createby = _currentUser.User.Id;
                    int? companyid = _currentUser.User.CompanyId;
                    int? branchid = _currentUser.User.BranchId;

                    _query.ExecDataTableProc("[MasterProduct_Update]", "@ProductCode", form.Code, "@ProductName", form.ProductName, "@IsActive", form.IsActive, "@Description", form.Description, "@updateby", createby, "@companyid", companyid, "@branchid", branchid,"@Id",form.Id);

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
        public async Task<JsonResult> Delete(MasterProduct form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                try
                {
                    string createby = _currentUser.User.Id;
                    int? companyid = _currentUser.User.CompanyId;
                    int? branchid = _currentUser.User.BranchId;

                    _query.ExecDataTableProc("[MasterProduct_Delete]", "@updateby", createby, "@companyid", companyid, "@branchid", branchid, "@Id", form.Id);

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