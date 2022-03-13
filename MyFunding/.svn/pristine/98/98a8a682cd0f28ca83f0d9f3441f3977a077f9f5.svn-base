using AutoMapper;
using Core.Web.Controllers;
using Core.Web.Helpers;
using Core.Web.Infrastructure;
using Core.Web.Utilities;
using MyWeb.Controllers.Applications;
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
    public class ParameterEmailController : CoreControllerBase
    {
        private ApplicationDbContext _applicationDbContext;
        private ICurrentUser _currentUser;
        private SqlHelper _query = new SqlHelper("SqlFundingConnection");
        private SqlFundingDbContext ctx = new SqlFundingDbContext();

        public ParameterEmailController(ApplicationDbContext context, ICurrentUser currentUser)
        {
            _applicationDbContext = context;
            _currentUser = currentUser;
        }


        public ActionResult Index()
        {
            return View();
        }

        [AllowAnonymous]
        public async Task<JsonResult> GetPage(string searchText = "", int pageNumber = 1, int pageSize = 10, string sortBy = "CreateDate", string sortDirection = "desc")
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    searchText = searchText.ToLower();

                    int totalItems = await ctx.ParameterEmailSet
                        .CountAsync(x => x.IsDelete == false &&
                            (
                                string.IsNullOrEmpty(searchText) ||
                                (
                                    x.Group.ToLower().Contains(searchText) ||
                                    x.Email.ToLower().Contains(searchText)                                 
                                )
                            )
                    );

                    var models = await ctx.ParameterEmailSet
                        .Where(x => x.IsDelete == false &&
                            (
                                string.IsNullOrEmpty(searchText) ||
                                (
                                   x.Group.ToLower().Contains(searchText) ||
                                    x.Email.ToLower().Contains(searchText)                                     
                                )
                            )
                    )
                    .OrderBy(sortBy + " " + sortDirection)
                    .Skip((pageNumber - 1) * pageSize)
                    .Take(pageSize)
                    .ToListAsync();

                    IList<ParameterEmailViewModel> list = Mapper.Map<IList<ParameterEmailViewModel>>(models);

                    return JsonSuccess(new { totalItems = totalItems, data = list.ToArray() });
                }
            });
        }

        [AllowAnonymous]
        public async Task<JsonResult> All()
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    var models = await ctx.ParameterEmailSet
                               .Where(x => x.IsDelete == false)
                               .OrderByDescending(x => x.CreateDate)
                               .ToListAsync();

                    IList<ParameterEmailViewModel> list = Mapper.Map<IList<ParameterEmail>, IList<ParameterEmailViewModel>>(models);

                    return JsonSuccess(new { data = list.ToArray() });
                }
            });

        }

        public async Task<JsonResult> Add(ParameterEmailViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                if (!ModelState.IsValid)
                {
                    return JsonValidationError();
                }

                ParameterEmail model = Mapper.Map<ParameterEmail>(form);

                using (var ctx = new SqlFundingDbContext())
                {
                    var existingModel = ctx.ParameterEmailSet.Where(x => x.Group == form.Group && x.IsDelete == false).FirstOrDefault();
                    if (existingModel != null)
                    {
                        return JsonError(string.Format("Group {0} sudah ada di database!", form.Group));
                    }
                    model.CreateBy = _currentUser.User.UserName;
                    model.CreateDate = DateTime.Now;

                    model.StatusData = StatusData.New;
                    ctx.ParameterEmailSet.Add(model);
                    await ctx.SaveChangesAsync();        
                    return JsonSuccess("Succes");
                }
            });
        }

        public async Task<JsonResult> Update(ParameterEmailViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    var existingModel = ctx.ParameterEmailSet.Find(form.Id);
                    if (existingModel == null)
                    {
                        return JsonError("Data Tidak Ditemukan di database!");
                    }

                    existingModel.UpdateBy = _currentUser.User.UserName;
                    existingModel.UpdateDate = DateTime.Now;
                   
                    Mapper.Map(form, existingModel);
                    await ctx.SaveChangesAsync();

                    return JsonSuccess("Update Success");
                }
            });
        }

        public async Task<JsonResult> Delete(ParameterEmailViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    var target = ctx.ParameterEmailSet.Find(form.Id);
                    if (target == null)
                    {
                        return JsonError("Data Tidak Ditemukan di database!");
                    }

                    target.IsDelete = true;
                    target.StatusData = StatusData.Deleted;
                    await ctx.SaveChangesAsync();



                    return JsonSuccess("Delete Success!");
                }
            });
        }


    }
}