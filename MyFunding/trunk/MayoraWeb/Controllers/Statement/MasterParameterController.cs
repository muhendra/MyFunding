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
using MyWeb.DataLayer.SqlFunding;
using MyWeb.Migrations.SqlStatement;

namespace MyWeb.Controllers.Statement
{
    public class MasterParameterController : CoreControllerBase
    {
        private ApplicationDbContext _applicationDbContext;
        private ICurrentUser _iCurrentUser;
        private SqlHelper _query = new SqlHelper("SqlMyStatementConnection");
        private SqlStatementDbContext _sqlStatementDbContext = new SqlStatementDbContext();
        public MasterParameterController(ApplicationDbContext context, ICurrentUser currentUser)
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

        public async Task<JsonResult> Getpage(int? id=null, int pageNumber = 1, int pageSize = 10, string sortBy = "ID", string sortDirection = "asc")
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                var a = _query.ExecDataTableProc("[MasterParameter_GetPage]","@Id",id);

                var b = a.ToList<MasterParameterViewModel>();

                int totalitems = b.Count();
                var c = b.AsQueryable()
                    .Skip((pageNumber - 1) * pageSize)
                    .Take(pageSize)
                    .ToArray();
                return JsonSuccess(new { totalItems = totalitems, data = c });
            });

        }

        //public async Task<JsonResult> Add(MasterParameterViewModel form)
        //{
        //    return await ExecuteFaultHandledOperationAsync(async () =>
        //    {
        //        try
        //        {
        //            string CreateBy = _iCurrentUser.User.Id;
        //            int? BranchId = _iCurrentUser.User.BranchId;
        //            int? CompanyId = _iCurrentUser.User.CompanyId;

        //            _query.ExecDataTableProc("MasterParameter_Add", "@Name", form.Name, "@Value", form.Value, "@CreateBy", CreateBy, "@BranchId", BranchId, "@CompanyId", CompanyId);
        //            return JsonSuccess(new { success = true, Messages = "Success" });
        //        }
        //        catch (Exception ex)
        //        {
        //            if (ex.InnerException !=null)
        //            {
        //                return JsonError(Convert.ToString(ex.InnerException.Message));
        //            }
        //            else
        //            {
        //                return JsonError(Convert.ToString(ex.Message));
        //            }
        //        }
        //    });
        //}

        public async Task<JsonResult> Update(MasterParameterViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                try
                {
                    using (var ctx = new SqlStatementDbContext())
                    {
                        
                        //if (form.ID == 2)
                        //{
                        //    var target = ctx.MasterParameterSet.FirstOrDefault(d => d.ID == 10);

                        //    int valueGetAccountDate = Int32.Parse(target.Value);
                        //    int valueReceivedDate = Int32.Parse(form.Value);

                        //    if (valueReceivedDate < valueGetAccountDate)
                        //    {
                        //        return JsonError("Tanggal Received Date tidak dapat kurang dari Tanggal Get Account Date!");
                        //    }
                        //}
                        //else if (form.ID == 10)
                        //{
                        //    var target = ctx.MasterParameterSet.FirstOrDefault(d => d.ID == 2);

                        //    int valueReceivedDate = Int32.Parse(target.Value);
                        //    int valueGetAccountDate = Int32.Parse(form.Value);

                        //    if (valueReceivedDate < valueGetAccountDate)
                        //    {
                        //        return JsonError("Tanggal Get Account Date tidak dapat melebihi Tanggal Received Date!");
                        //    }
                        //}

                        string UpdateBy = _iCurrentUser.User.Id;
                        int? BranchId = _iCurrentUser.User.BranchId;
                        int? CompanyId = _iCurrentUser.User.CompanyId;

                        _query.ExecDataTableProc("MasterParameter_Update", "@Name", form.Name, "@Value", form.Value, "@UpdateBy", UpdateBy, "@BranchId", BranchId, "@CompanyId", CompanyId, "@ID", form.ID);
                        return JsonSuccess(new { success = true, Messages = "Success" });
                    }
                }
                catch (Exception ex)
                {
                    if (ex.InnerException != null)
                    {
                        return JsonError(Convert.ToString(ex.InnerException.Message));
                    }
                    else
                    {
                        return JsonError(Convert.ToString(ex.Message));
                    }
                }
            });
        }

        public async Task<JsonResult> Delete(MasterParameterViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                try
                {
                    string UpdateBy = _iCurrentUser.User.Id;
                    int? BranchId = _iCurrentUser.User.BranchId;
                    int? CompanyId = _iCurrentUser.User.CompanyId;

                    _query.ExecDataTableProc("MasterParameter_Delete", "@UpdateBy", UpdateBy, "@BranchId", BranchId, "@CompanyId", CompanyId, "@ID", form.ID);
                    return JsonSuccess(new { success = true, Messages = "Success" });
                }
                catch (Exception ex)
                {
                    if (ex.InnerException != null)
                    {
                        return JsonError(Convert.ToString(ex.InnerException.Message));
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