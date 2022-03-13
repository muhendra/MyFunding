using AutoMapper;
using Core.Web.Controllers;
using Core.Web.Helpers;
using Core.Web.Infrastructure;
using Core.Web.Utilities;
using MyWeb.DataLayer;
using MyWeb.DataLayer.SqlFunding;
using MyWeb.Infrastructure.Applications;
using MyWeb.Models;
using MyWeb.Models.Reward;
using MyWeb.ViewModels.MyReward;
using MyWeb.ViewModels.Reward;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.IO;
using System.Linq;
using System.Linq.Dynamic;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace MyWeb.Controllers.Reward
{
    public class StatusNasabahController : CoreControllerBase
    {

        private ApplicationDbContext _applicationDbContext;
        private ICurrentUser _currentUser;
        private SqlHelper _query = new SqlHelper("SqlFundingConnection");
        private string _category = "Enquiry";
        private string _attachmentSPNasabah = "~/Files/enquirytabungan/";
        private string _attachmentSPNasabahTemp = "~/Files/enquirytabungan/Temp/";


        public StatusNasabahController(ApplicationDbContext context, ICurrentUser currentUser)
        {
            _applicationDbContext = context;
            _currentUser = currentUser;
        }


        public ActionResult Index()
        {
            return View();
        }


        //[MyAuthorize(Roles = "Reward_SpvCabang,SupervisorReward,Reward_SpvGA,SupervisorProduk")]
        public ActionResult Authorize()
        {
            return View();
        }


        //[MyAuthorize(Roles = "Reward_SpvCabang,SupervisorReward,Reward_SpvGA,SupervisorProduk")]
       
        [AllowAnonymous]
        //20190117, jeni, BEGIN
        //public async Task<JsonResult> GetPage(DateTime? Tanggal, int pageNumber = 1, int pageSize = 10, string sortBy = "NoRekening", string sortDirection = "desc")
        public async Task<JsonResult> GetPage(DateTime? Tanggal, string NoRekening, string NoCIF, string Cabang, int pageNumber = 1, int pageSize = 10, string sortBy = "NoRekening", string sortDirection = "desc")
        //20190117, jeni, END
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    //string cabangUser = _currentUser.Branch.BranchCode;
                    //20190117, jeni, BEGIN
                    //int totalItems = await Task.FromResult<int>(ctx.SP_GetMenuStatusNasabah().Count());
                    int totalItems = await Task.FromResult<int>(ctx.SP_GetMenuStatusNasabah(NoRekening, NoCIF, Cabang).Count());
                    //20190117, jeni, BEGIN
                    //20190117, jeni, BEGIN
                    //var models = await Task.FromResult<IEnumerable<StatusNasabahViewModel>>(ctx.SP_GetMenuStatusNasabah().AsQueryable()
                    var models = await Task.FromResult<IEnumerable<StatusNasabahViewModel>>(ctx.SP_GetMenuStatusNasabah(NoRekening, NoCIF, Cabang).AsQueryable()
                    //20190117, jeni, END
                        .OrderBy(sortBy + " " + sortDirection)
                        .Skip((pageNumber - 1) * pageSize)
                        .Take(pageSize));

                    IList<StatusNasabahViewModel> list = models.ToList();

                    return JsonSuccess(new { totalItems = totalItems, data = list.ToArray() });
                }
            });
        }

        [AllowAnonymous]
        //20190117, jeni, BEGIN
        //public async Task<JsonResult> GetPage(DateTime? Tanggal, int pageNumber = 1, int pageSize = 10, string sortBy = "NoRekening", string sortDirection = "desc")
        public async Task<JsonResult> GetAll(DateTime? Tanggal, string NoRekening, string NoCIF, string Cabang, int pageNumber = 1, int pageSize = 10, string sortBy = "NoRekening", string sortDirection = "desc")
        //20190117, jeni, END
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    //string cabangUser = _currentUser.Branch.BranchCode;
                    //20190117, jeni, BEGIN
                    //int totalItems = await Task.FromResult<int>(ctx.SP_GetMenuStatusNasabah().Count());
                    int totalItems = await Task.FromResult<int>(ctx.SP_GetMenuStatusNasabah(NoRekening, NoCIF, Cabang).Count());
                    //20190117, jeni, BEGIN
                    //20190117, jeni, BEGIN
                    //var models = await Task.FromResult<IEnumerable<StatusNasabahViewModel>>(ctx.SP_GetMenuStatusNasabah().AsQueryable()
                    var models = await Task.FromResult<IEnumerable<StatusNasabahViewModel>>(ctx.SP_GetMenuStatusNasabah(NoRekening, NoCIF, Cabang).AsQueryable()
                        //20190117, jeni, END
                        .OrderBy(sortBy + " " + sortDirection)
                        //.Skip((pageNumber - 1) * pageSize)
                        //.Take(pageSize)
                        );

                    IList<StatusNasabahViewModel> list = models.ToList();

                    return JsonSuccess(new { totalItems = totalItems, data = list.ToArray() });
                }
            });
        }

        [AllowAnonymous]
        public async Task<JsonResult> GetBranchUserLogin()
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                if (_currentUser.Branch != null)
                {
                    if (_currentUser.Branch.BranchCode == "200" || _currentUser.Branch.BranchCode == "202" || _currentUser.Branch.BranchCode == "510" || _currentUser.Branch.BranchCode == "511" || _currentUser.Branch.BranchCode == "400" || _currentUser.Branch.BranchCode == "401") /*non kpno*/
                    {
                        return JsonSuccess(new { branchId = _currentUser.Branch.BranchId, branchName = _currentUser.Branch.BranchNameT24, branchCode = _currentUser.Branch.BranchCode, isKpno = "no", branchCodeT24 = _currentUser.Branch.BranchCodeT24, userFullName = _currentUser.User.FullName });
                    }
                    else
                    {
                        return JsonSuccess(new { branchId = _currentUser.Branch.BranchId, branchName = _currentUser.Branch.BranchNameT24, branchCode = _currentUser.Branch.BranchCode, isKpno = "yes", branchCodeT24 = _currentUser.Branch.BranchCodeT24, userFullName = _currentUser.User.FullName });
                    }
                }
                else
                    return JsonSuccess(new { branchId = "", branchName = "", branchCode = "", isKpno = "yes", branchCodeT24 = "", userFullName = _currentUser.User.FullName });
            });
        }
    }
}