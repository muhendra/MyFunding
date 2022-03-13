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
    public class CompanyTemenosController : CoreControllerBase
    {
        private ApplicationDbContext _applicationDbContext;
        private ICurrentUser _currentUser;
        private SqlHelper _query = new SqlHelper("SqlFundingConnection");
        private SqlFundingDbContext ctx = new SqlFundingDbContext();

        public CompanyTemenosController(ApplicationDbContext context, ICurrentUser currentUser)
        {
            _applicationDbContext = context;
            _currentUser = currentUser;
        }

        public CompanyTemenosController()
        {
            //_applicationDbContext = context;
            //_currentUser = currentUser;
        }

        public ActionResult Index()
        {
            return View();
        }

        public async Task<JsonResult> GetPage(string searchText, int pageNumber = 1, int pageSize = 10, string sortBy = "Id", string sortDirection = "asc")
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    int totalItems = 0;
                    searchText = searchText.ToUpper();

                    totalItems = ctx.CompanyTemenosSet().AsQueryable()
                    .Count(x => string.IsNullOrEmpty(searchText) ||
                             (
                                x.Id.Contains(searchText)
                                || x.company_name.Contains(searchText)
                                || x.name_address.Contains(searchText)
                            )
                    );

                    var listModels = await Task.FromResult < IEnumerable < CompanyViewModel >> (ctx.CompanyTemenosSet().AsQueryable()
                   .Where(x => string.IsNullOrEmpty(searchText) ||
                           (x.Id.Contains(searchText)
                           || x.company_name.Contains(searchText)
                           || x.name_address.Contains(searchText)
                           )
                   )
                   .OrderBy(sortBy + " " + sortDirection)
                   .Skip((pageNumber - 1) * pageSize)
                   .Take(pageSize)
                   );

                    IList<CompanyViewModel> list = listModels.ToList();

                    return JsonSuccess(new { totalItems = totalItems, data = list.ToArray() });
                }
             
            });
        }

        public async Task<JsonResult> All(string searchText, string sortBy = "Id", string sortDirection = "asc")
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    var models = ctx.CompanyTemenosSet().AsQueryable()
                    .Where(x => string.IsNullOrEmpty(searchText) ||
                            (
                             x.Id.Contains(searchText) ||
                             x.company_name.Contains(searchText) ||
                             x.name_address.Contains(searchText)
                            )
                    );

                    int totalItems = await models.CountAsync();

                    var listModels = await models
                    .OrderBy(sortBy + " " + sortDirection)
                    .ToListAsync();


                    return JsonSuccess(new { totalItems = totalItems, data = models.ToArray() });
                }
            });

        }

        public string GetBranchName(string branchCode)
        {
            using (var ctx = new SqlFundingDbContext())
            {
                var entity = ctx.CompanyTemenosSet().Where(x => x.Id == branchCode).FirstOrDefault();
                if (entity != null)
                {
                    return entity.company_name;
                }
            }

            return string.Empty;
        }

    }
}