using AutoMapper;
using Core.Web.Controllers;
using Core.Web.Helpers;
using Core.Web.Infrastructure;
using Core.Web.Utilities;
using MyWeb.Controllers.Applications;
using MyWeb.DataLayer;
using MyWeb.DataLayer.SqlFunding;
using MyWeb.Infrastructure.Applications;
using MyWeb.Models.Reward;
using MyWeb.ViewModels.MyReward;
using MyWeb.ViewModels.Reward;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Linq.Dynamic;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace MyWeb.Controllers.Reward
{
    public class AmortisasiRequestController : CoreControllerBase
    {

        private ApplicationDbContext _applicationDbContext;
        private ICurrentUser _currentUser;
        private SqlHelper _query = new SqlHelper("SqlFundingConnection");
        private string _category = "Amortisasi";
        //private string _attachmentAmortisasiRequest = "~/Files/AmortisasiRequest/";
        private string _attachmentAmortisasiRequestTemp = "~/Files/AmortisasiRequest/Temp/";


        public AmortisasiRequestController(ApplicationDbContext context, ICurrentUser currentUser)
        {
            _applicationDbContext = context;
            _currentUser = currentUser;
        }


        public ActionResult Index()
        {
            return View();
        }


        //[MyAuthorize(Roles = "Reward_SpvCabang,SupervisorReward")]
        public ActionResult Authorize()
        {
            return View();
        }


        //[MyAuthorize(Roles = "Reward_SpvCabang.SupervisorReward")]
        public async Task<JsonResult> Reject(AmortisasiRequestViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                if (!ModelState.IsValid)
                {
                    return JsonValidationError();
                }

                using (var ctx = new SqlFundingDbContext())
                {
                    var target = ctx.AmortisasiRequestSet.FirstOrDefault(c => c.Id == form.Id);
                    if (target == null)
                    {
                        return JsonError("Data tidak ada di database!");
                    }
                    target.StatusData = StatusData.Rejected;
                    target.UpdateBy = _currentUser.User.Id;
                    target.UpdateDate = DateTime.Now;
                    await ctx.SaveChangesAsync();

                    return JsonSuccess("Data Rejected");
                }
            });
        }

        private async Task<string> GetNo()
        {
            string noPurchase = (string)await _query.ExecScalarProcAsync("SP_GENERATE_NOMOR", "@Category", _category);
            return noPurchase;
        }


        public async Task<JsonResult> GenerateNo()
        {
            string noPurchase = (string)await GetNo();
            return JsonSuccess(noPurchase);
        }


        public async Task<JsonResult> GetIntAccOrCategoryDesc(string id)
        {
            string Var = (string)await _query.ExecScalarProcAsync("SP_GET_INTACCORCATTDESC", "@id", id);
            return JsonSuccess(Var);
        }


        public async Task<JsonResult> GetBranceDesc(string id)
        {
            string Var = (string)await _query.ExecScalarProcAsync("SP_GET_BRANCEDESC", "@id", id);
            return JsonSuccess(Var);
        }


        [AllowAnonymous]
        public async Task<JsonResult> GetPage(string searchText = "", int pageNumber = 1, int pageSize = 10, string sortBy = "CreateDate", string sortDirection = "desc")
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {

                    int totalItems = await Task.FromResult<int>(ctx.GetPageAmortisasiRequest(_currentUser.Branch.BranchCodeT24, "GETDATA", searchText).Count());

                    var models = await Task.FromResult<IEnumerable<AmortisasiRequestViewModel>>(ctx.GetPageAmortisasiRequest(_currentUser.Branch.BranchCodeT24, "GETDATA", searchText).AsQueryable()
                        .OrderBy(sortBy + " " + sortDirection)
                        .Skip((pageNumber - 1) * pageSize)
                        .Take(pageSize));

                    IList<AmortisasiRequestViewModel> list = models.ToList();
                    foreach (var item in list)
                    {
                        item.jurnalDetail = Mapper.Map<List<AmortisasiRequestDetail>, List<AmortisasiRequestDetailViewModel>>(await ctx.AmortisasiRequestDetailSet.Where(x => x.AmortisasiRequestId == item.Id).ToListAsync());
                        item.ListKartuAmortisasi = Mapper.Map<List<KartuAmortisasi>, List<KartuAmortisasiViewModel>>(await ctx.KartuAmortisasiSet.Where(x => x.AmortisasiRequestId == item.Id).ToListAsync());
                    }

                    return JsonSuccess(new { totalItems = 0, data = list.ToArray() });
                }
            });
        }


        [AllowAnonymous]
        public async Task<JsonResult> AuthorizeGetPage(string searchText = "", int pageNumber = 1, int pageSize = 10, string sortBy = "CreateDate", string sortDirection = "desc")
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    int totalItems = await Task.FromResult<int>(ctx.GetPageAmortisasiRequest(_currentUser.Branch.BranchCodeT24, "APPROVE", searchText).Count());

                    var models = await Task.FromResult<IEnumerable<AmortisasiRequestViewModel>>(ctx.GetPageAmortisasiRequest(_currentUser.Branch.BranchCodeT24, "APPROVE", searchText).AsQueryable()
                        .OrderBy(sortBy + " " + sortDirection)
                        .Skip((pageNumber - 1) * pageSize)
                        .Take(pageSize));

                    IList<AmortisasiRequestViewModel> list = models.ToList();
                    foreach (var item in list)
                    {
                        item.jurnalDetail = Mapper.Map<List<AmortisasiRequestDetail>, List<AmortisasiRequestDetailViewModel>>(await ctx.AmortisasiRequestDetailSet.Where(x => x.AmortisasiRequestId == item.Id).ToListAsync());
                        item.ListKartuAmortisasi = Mapper.Map<List<KartuAmortisasi>, List<KartuAmortisasiViewModel>>(await ctx.KartuAmortisasiSet.Where(x => x.AmortisasiRequestId == item.Id).ToListAsync());
                    }
                    return JsonSuccess(new { totalItems = totalItems, data = list.ToArray() });
                }
            });
        }


        [AllowAnonymous]
        public async Task<JsonResult> getDeliveryOrder(string searchText = "", int pageNumber = 1, int pageSize = 10, string sortBy = "CreateDate", string sortDirection = "desc")
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {

                    var array = ctx.AmortisasiRequestSet.Where(x => x.IsDelete == false).Select(x => x.DOid).ToArray();
                    int totalItems = await ctx.DeliveryOrderSet
                        .CountAsync(x => x.IsDelete == false && x.StatusBarang == Models.StatusBarang.Customer && !array.Contains(x.Id) &&
                            (
                                string.IsNullOrEmpty(searchText) ||
                                (
                                    x.DeliveryOrderId.Contains(searchText) ||
                                    x.Receiver.Contains(searchText) ||
                                    //x.DeliveryOrderDate.Value.ToString("dd/MM/yyyy").Contains(searchText) ||
                                    x.PurchaseOrder.POId.Contains(searchText) ||
                                    //x.PurchaseOrder.PODate.Value.ToString("dd/MM/yyyy").Contains(searchText) ||
                                    x.PurchaseOrder.NominalBarang.ToString().Contains(searchText) ||
                                    x.PurchaseOrder.NominalPurchase.ToString().Contains(searchText) ||
                                    x.PurchaseOrder.TotalPurchase.ToString().Contains(searchText) ||
                                    x.PurchaseOrder.NilaiBuku.ToString().Contains(searchText) ||
                                    x.PurchaseOrder.DetailBarang.Merek.Contains(searchText) ||
                                    x.PurchaseOrder.DetailBarang.Penalty.ToString().Contains(searchText) ||
                                    x.PurchaseOrder.DetailBarang.PromotionCode.Contains(searchText) ||
                                    x.PurchaseOrder.DetailBarang.Quantity.ToString().Contains(searchText) ||
                                    x.PurchaseOrder.DetailBarang.TypeBarang.Contains(searchText) ||
                                    x.PurchaseOrder.DetailBarang.Warna.Contains(searchText)
                                )
                            )
                    );

                    var models = await ctx.DeliveryOrderSet
                        .Where(x => x.IsDelete == false && x.StatusBarang == Models.StatusBarang.Customer && !array.Contains(x.Id) &&
                            (
                                string.IsNullOrEmpty(searchText) ||
                                (
                                    x.DeliveryOrderId.Contains(searchText) ||
                                    x.Receiver.Contains(searchText) ||
                            //(String.IsNullOrEmpty(x.DeliveryOrderDate.ToString()) ? true : x.DeliveryOrderDate.Value.ToString("dd/MM/yyyy").Contains(searchText)) ||
                                    x.PurchaseOrder.POId.Contains(searchText) ||
                            //(String.IsNullOrEmpty(x.PurchaseOrder.PODate.ToString()) ? true : x.PurchaseOrder.PODate.Value.ToString("dd/MM/yyyy").Contains(searchText)) ||
                                    x.PurchaseOrder.NominalBarang.ToString().Contains(searchText) ||
                                    x.PurchaseOrder.NominalPurchase.ToString().Contains(searchText) ||
                                    x.PurchaseOrder.TotalPurchase.ToString().Contains(searchText) ||
                                    x.PurchaseOrder.NilaiBuku.ToString().Contains(searchText) ||
                                    x.PurchaseOrder.DetailBarang.Merek.Contains(searchText) ||
                                    x.PurchaseOrder.DetailBarang.Penalty.ToString().Contains(searchText) ||
                                    x.PurchaseOrder.DetailBarang.PromotionCode.Contains(searchText) ||
                                    x.PurchaseOrder.DetailBarang.Quantity.ToString().Contains(searchText) ||
                                    x.PurchaseOrder.DetailBarang.TypeBarang.Contains(searchText) ||
                                    x.PurchaseOrder.DetailBarang.Warna.Contains(searchText)
                                )
                            )
                    )
                    .OrderBy(sortBy + " " + sortDirection)
                    .Skip((pageNumber - 1) * pageSize)
                    .Take(pageSize)
                    .ToListAsync();

                    IList<DeliveryOrderAmViewModel> list = Mapper.Map<IList<DeliveryOrderAmViewModel>>(models);

                    return JsonSuccess(new { totalItems = totalItems, data = list.ToArray() });
                }
            });
        }

        [AllowAnonymous]
        //public async Task<JsonResult> getPurchaseOrder(string searchText = "", int pageNumber = 1, int pageSize = 10, string sortBy = "CreateDate", string sortDirection = "desc")
        //{
        //    return await ExecuteFaultHandledOperationAsync(async () =>
        //    {
        //        using (var ctx = new SqlFundingDbContext())
        //        {

        //            var array = ctx.AmortisasiRequestSet.Where(x => x.IsDelete == false).Select(x => x.POId).ToArray();
        //            int totalItems = await ctx.PurchaseOrderSet.Include(x => x.purchaserequestInput)
        //                .CountAsync(x => x.IsDelete == false && x.ApproveBy != null && !array.Contains(x.Id) && x.purchaserequestInput.Cabang == _currentUser.Branch.BranchCodeT24 &&
        //                    (
        //                        string.IsNullOrEmpty(searchText) ||
        //                        (
        //                            //x.DeliveryOrderId.Contains(searchText) ||
        //                            //x.Receiver.Contains(searchText) ||
        //                            //x.DeliveryOrderDate.Value.ToString("dd/MM/yyyy").Contains(searchText) ||
        //                            x.POId.Contains(searchText) ||
        //                            //x.PurchaseOrder.PODate.Value.ToString("dd/MM/yyyy").Contains(searchText) ||
        //                            x.NominalBarang.ToString().Contains(searchText) ||
        //                            x.NominalPurchase.ToString().Contains(searchText) ||
        //                            x.TotalPurchase.ToString().Contains(searchText) ||
        //                            x.NilaiBuku.ToString().Contains(searchText) ||
        //                            x.DetailBarang.Merek.Contains(searchText) ||
        //                            x.DetailBarang.Penalty.ToString().Contains(searchText) ||
        //                            x.DetailBarang.PromotionCode.Contains(searchText) ||
        //                            x.DetailBarang.Quantity.ToString().Contains(searchText) ||
        //                            x.DetailBarang.TypeBarang.Contains(searchText) ||
        //                            x.DetailBarang.Warna.Contains(searchText)
        //                        )
        //                    )
        //            );

        //            var models = await ctx.PurchaseOrderSet
        //                .Where(x => x.IsDelete == false && x.ApproveBy != null && !array.Contains(x.Id) && x.purchaserequestInput.Cabang == _currentUser.Branch.BranchCodeT24 &&
        //                    (
        //                        string.IsNullOrEmpty(searchText) ||
        //                        (
        //                            //x.DeliveryOrderId.Contains(searchText) ||
        //                            //x.Receiver.Contains(searchText) ||
        //                    //(String.IsNullOrEmpty(x.DeliveryOrderDate.ToString()) ? true : x.DeliveryOrderDate.Value.ToString("dd/MM/yyyy").Contains(searchText)) ||
        //                            x.POId.Contains(searchText) ||
        //                    //(String.IsNullOrEmpty(x.PurchaseOrder.PODate.ToString()) ? true : x.PurchaseOrder.PODate.Value.ToString("dd/MM/yyyy").Contains(searchText)) ||
        //                            x.NominalBarang.ToString().Contains(searchText) ||
        //                            x.NominalPurchase.ToString().Contains(searchText) ||
        //                            x.TotalPurchase.ToString().Contains(searchText) ||
        //                            x.NilaiBuku.ToString().Contains(searchText) ||
        //                            x.DetailBarang.Merek.Contains(searchText) ||
        //                            x.DetailBarang.Penalty.ToString().Contains(searchText) ||
        //                            x.DetailBarang.PromotionCode.Contains(searchText) ||
        //                            x.DetailBarang.Quantity.ToString().Contains(searchText) ||
        //                            x.DetailBarang.TypeBarang.Contains(searchText) ||
        //                            x.DetailBarang.Warna.Contains(searchText)
        //                        )
        //                    )
        //            )
        //            .OrderBy(sortBy + " " + sortDirection)
        //            .Skip((pageNumber - 1) * pageSize)
        //            .Take(pageSize)
        //            .ToListAsync();

        //            IList<PurchaseOrderViewModel> list = Mapper.Map<IList<PurchaseOrderViewModel>>(models);

        //            return JsonSuccess(new { totalItems = totalItems, data = list.ToArray() });
        //        }
        //    });
        //}

        public async Task<JsonResult> getPurchaseOrder(string searchText = "", int pageNumber = 1, int pageSize = 10, string sortBy = "CreateDate", string sortDirection = "desc")
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    int totalItems = await Task.FromResult<int>(ctx.GetPageAmortisasiRequestPurchaseOrder(_currentUser.Branch.BranchCodeT24, "GETDATAPURCHASE", searchText).Count());

                    var models = await Task.FromResult<IEnumerable<PurchaseOrderViewModel>>(ctx.GetPageAmortisasiRequestPurchaseOrder(_currentUser.Branch.BranchCodeT24, "GETDATAPURCHASE", searchText).AsQueryable()
                        .OrderBy(sortBy + " " + sortDirection)
                        .Skip((pageNumber - 1) * pageSize)
                        .Take(pageSize));

                    IList<PurchaseOrderViewModel> list = models.ToList();
                    //var array = ctx.AmortisasiRequestSet.Where(x => x.IsDelete == false).Select(x => x.POId).ToArray();
                    //int totalItems = await ctx.PurchaseOrderSet.Include(x => x.purchaserequestInput)
                    //    .CountAsync(x => x.IsDelete == false && x.ApproveBy != null && !array.Contains(x.Id) && x.purchaserequestInput.Cabang == _currentUser.Branch.BranchCodeT24 &&
                    //        (
                    //            string.IsNullOrEmpty(searchText) ||
                    //            (
                    //                //x.DeliveryOrderId.Contains(searchText) ||
                    //                //x.Receiver.Contains(searchText) ||
                    //        //x.DeliveryOrderDate.Value.ToString("dd/MM/yyyy").Contains(searchText) ||
                    //                x.POId.Contains(searchText) ||
                    //        //x.PurchaseOrder.PODate.Value.ToString("dd/MM/yyyy").Contains(searchText) ||
                    //                x.NominalBarang.ToString().Contains(searchText) ||
                    //                x.NominalPurchase.ToString().Contains(searchText) ||
                    //                x.TotalPurchase.ToString().Contains(searchText) ||
                    //                x.NilaiBuku.ToString().Contains(searchText) ||
                    //                x.DetailBarang.Merek.Contains(searchText) ||
                    //                x.DetailBarang.Penalty.ToString().Contains(searchText) ||
                    //                x.DetailBarang.PromotionCode.Contains(searchText) ||
                    //                x.DetailBarang.Quantity.ToString().Contains(searchText) ||
                    //                x.DetailBarang.TypeBarang.Contains(searchText) ||
                    //                x.DetailBarang.Warna.Contains(searchText)
                    //            )
                    //        )
                    //);

                    //var models = await ctx.PurchaseOrderSet
                    //    .Where(x => x.IsDelete == false && x.ApproveBy != null && !array.Contains(x.Id) && x.purchaserequestInput.Cabang == _currentUser.Branch.BranchCodeT24 &&
                    //        (
                    //            string.IsNullOrEmpty(searchText) ||
                    //            (
                    //                //x.DeliveryOrderId.Contains(searchText) ||
                    //                //x.Receiver.Contains(searchText) ||
                    //        //(String.IsNullOrEmpty(x.DeliveryOrderDate.ToString()) ? true : x.DeliveryOrderDate.Value.ToString("dd/MM/yyyy").Contains(searchText)) ||
                    //                x.POId.Contains(searchText) ||
                    //        //(String.IsNullOrEmpty(x.PurchaseOrder.PODate.ToString()) ? true : x.PurchaseOrder.PODate.Value.ToString("dd/MM/yyyy").Contains(searchText)) ||
                    //                x.NominalBarang.ToString().Contains(searchText) ||
                    //                x.NominalPurchase.ToString().Contains(searchText) ||
                    //                x.TotalPurchase.ToString().Contains(searchText) ||
                    //                x.NilaiBuku.ToString().Contains(searchText) ||
                    //                x.DetailBarang.Merek.Contains(searchText) ||
                    //                x.DetailBarang.Penalty.ToString().Contains(searchText) ||
                    //                x.DetailBarang.PromotionCode.Contains(searchText) ||
                    //                x.DetailBarang.Quantity.ToString().Contains(searchText) ||
                    //                x.DetailBarang.TypeBarang.Contains(searchText) ||
                    //                x.DetailBarang.Warna.Contains(searchText)
                    //            )
                    //        )
                    //)
                    //.OrderBy(sortBy + " " + sortDirection)
                    //.Skip((pageNumber - 1) * pageSize)
                    //.Take(pageSize)
                    //.ToListAsync();

                    //IList<PurchaseOrderViewModel> list = Mapper.Map<IList<PurchaseOrderViewModel>>(models);

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
                    var models = await ctx.AmortisasiRequestSet
                               .Where(x => x.IsDelete == false)
                               .OrderByDescending(x => x.CreateDate)
                               .ToListAsync();

                    IList<AmortisasiRequestViewModel> list = Mapper.Map<IList<AmortisasiRequest>, IList<AmortisasiRequestViewModel>>(models);

                    return JsonSuccess(new { data = list.ToArray() });
                }
            });
        }


        public async Task<JsonResult> Add(AmortisasiRequestViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                if (!ModelState.IsValid)
                {
                    return JsonValidationError();
                }

                AmortisasiRequest model = Mapper.Map<AmortisasiRequest>(form);
                List<AmortisasiRequestDetail> details = Mapper.Map<List<AmortisasiRequestDetail>>(form.jurnalDetail);
                List<KartuAmortisasi> kartuAmortisasi = Mapper.Map<List<KartuAmortisasi>>(form.ListKartuAmortisasi);
                using (var ctx = new SqlFundingDbContext())
                {
                    model.StatusData = StatusData.New;
                    model.RequestId = (string)await GetNo();
                    ctx.AmortisasiRequestSet.Add(model);
                    await ctx.SaveChangesAsync();
                    var refCodeList = details.Select(grp => grp.ref_code).Distinct().ToArray();

                    var purchaseOrder = ctx.PurchaseOrderSet.Find(form.POId);
                    purchaseOrder.NilaiBuku = form.PO_NilaiBuku;
                    await ctx.SaveChangesAsync();

                    int i = 0;
                    if (details.Count() > 0)
                    {
                        foreach (var item in details)
                        {
                            item.ref_code = model.RequestId + //(i + 1).ToString();
                            (Array.IndexOf(refCodeList, item.ref_code)+1).ToString();
                            item.AmortisasiRequestId = model.Id;
                            item.Narative = "Amortisasi " + model.RequestId;
                            i++;
                        }
                        ctx.AmortisasiRequestDetailSet.AddRange(details);
                        await ctx.SaveChangesAsync();
                    }

                    if (kartuAmortisasi.Count() > 0)
                    {
                        foreach (var item in kartuAmortisasi)
                        {
                            if (item.Periode == 1)
                            {
                                item.IsProceed = true;
                                item.ProceedBy = _currentUser.Username;
                                item.ProceedDateTime = DateTime.Now;
                            }
                            item.AmortisasiRequestId = model.Id;
                            item.AmortizeAmount = Decimal.Round(item.AmortizeAmount, 2);

                        }
                        ctx.KartuAmortisasiSet.AddRange(kartuAmortisasi);
                        await ctx.SaveChangesAsync();
                    }

                    return JsonSuccess("Success");
                }
            });
        }

        public async Task<JsonResult> Update(AmortisasiRequestViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                List<AmortisasiRequestDetail> listDet = Mapper.Map<List<AmortisasiRequestDetail>>(form.jurnalDetail);
                List<KartuAmortisasi> kartuAmortisasi = Mapper.Map<List<KartuAmortisasi>>(form.ListKartuAmortisasi);

                var refCodeList = listDet.Select(grp => grp.ref_code).Distinct().ToArray();
                int i = 0;
                foreach (var item in listDet)
                {
                    item.ref_code = form.RequestId + //(i + 1).ToString();
                                (Array.IndexOf(refCodeList, item.ref_code) + 1).ToString();
                    item.AmortisasiRequestId = form.Id;
                    item.Narative = "Amortisasi " + form.RequestId;
                    item.StatusData = StatusData.New;
                    item.CreateBy = _currentUser.User.Id;
                    i++;
                }
                using (var ctx = new SqlFundingDbContext())
                {
                    var existingModel = ctx.AmortisasiRequestSet.Find(form.Id);
                    if (existingModel == null)
                    {
                        return JsonError("Data Tidak Ditemukan di database!");
                    }
                    Mapper.Map(form, existingModel);
                    await ctx.SaveChangesAsync();

                    var purchaseOrder = ctx.PurchaseOrderSet.Find(form.POId);
                    purchaseOrder.NilaiBuku = form.PO_NilaiBuku;
                    await ctx.SaveChangesAsync();

                    var OldDetail = ctx.AmortisasiRequestDetailSet.Where(x => x.AmortisasiRequestId == form.Id);
                    ctx.AmortisasiRequestDetailSet.RemoveRange(OldDetail);
                    if (listDet.Count() > 0) ctx.AmortisasiRequestDetailSet.AddRange(listDet);
                    await ctx.SaveChangesAsync();

                    var OldKartu = ctx.KartuAmortisasiSet.Where(x => x.AmortisasiRequestId == form.Id);
                    ctx.KartuAmortisasiSet.RemoveRange(OldKartu);                  

                    if (kartuAmortisasi.Count() > 0)
                    {
                        foreach (var item in kartuAmortisasi)
                        {
                            if (item.Periode == 1)
                            {
                                item.IsProceed = true;
                                item.ProceedBy = _currentUser.Username;
                                item.ProceedDateTime = DateTime.Now;
                            }
                            item.AmortisasiRequestId = form.Id;
                            item.AmortizeAmount = Decimal.Round(item.AmortizeAmount, 2);
                        }
                        ctx.KartuAmortisasiSet.AddRange(kartuAmortisasi);
                        await ctx.SaveChangesAsync();
                    }

                    return JsonSuccess("Update Success");
                }
            });
        }

        //[MyAuthorize(Roles = "Reward_SpvCabang,SupervisorReward")]
        public async Task<JsonResult> Approve(AmortisasiRequestViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    var target = ctx.AmortisasiRequestSet.Find(form.Id);
                    if (target == null)
                    {
                        return JsonError("Data Tidak Ditemukan di database!");
                    }
                    target.ApproveBy = _currentUser.User.Id;

                    target.ApproveDate = DateTime.Now;
                    //target.IsDelete = true;
                    target.StatusData = StatusData.Approved;
                    await ctx.SaveChangesAsync();

                    //var Params = new object[] { 
                    //    new SqlParameter("@id", form.Id)
                    //};
                    //await _query.ExecNonQueryAsync("SP_INSERTPAYMENTAMORTISASI @id", Params);

                    Guid id = Guid.NewGuid();

                    var Params1 = new object[] { 
                        new SqlParameter("@id", form.Id),
                        new SqlParameter("@flag", 1),
                        new SqlParameter("@guid", id),
                        new SqlParameter("@user", _currentUser.User.UserName)
                    };
                    await _query.ExecNonQueryAsync("[SP_INSERTAUTHORIZEAMORTISASI] @id, @flag, @guid, @user", Params1);

                    var Params2 = new object[] { 
                        new SqlParameter("@id", form.Id),
                        new SqlParameter("@flag", 2),
                        new SqlParameter("@guid", id),
                        new SqlParameter("@user", _currentUser.User.UserName)
                    };
                    await _query.ExecNonQueryAsync("[SP_INSERTAUTHORIZEAMORTISASI] @id, @flag, @guid, @user", Params2);

                    return JsonSuccess("Delete Success!");
                }
            });
        }

        public async Task<JsonResult> Delete(AmortisasiRequestViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    var target = ctx.AmortisasiRequestSet.Find(form.Id);
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

        /// <summary>
        /// Uji Coba
        /// </summary>
        /// <returns></returns>
        /// 

        public JsonResult SendMailNotifikasi()
        {
            try
            {
                EmailFunding newEmail = new EmailFunding();
                newEmail.addRecipients("ade.arman@bankmayora.co.id");
                newEmail.addRecipients("yaditya.jonathan@bankmayora.co.id"); 
                newEmail.addBlind_copy_recipients("haydi.loraine@bankmayora.co.id");
                newEmail.addBlind_copy_recipients("yaditya.jonathan@bankmayora.co.id");
                newEmail.addCopy_recipients("ade.arman@bankmayora.co.id");
                newEmail.addCopy_recipients("ichwan.yasir@bankmayora.co.id");
                newEmail.subject = "Test Email Library Framework";
                newEmail.body = "<p>Dear All,</p><p>Dengan surat ini saya coba fitur kirim email dg library</p><br><p>Terima Kasih Sudah meminjamkan emailnya Untuk Uji Coba fitur,</p><br><br><p>Best Regards,</p><br><br><p>Achmad Ichwan Yasir,</p><div class=\"btn btn-primary\"><a href=\"http://10.10.2.20/MyCredit/BMPK_Laporan/index\" target=\"_blank\">Klik disini </a></div>";
                newEmail.setUseHtmlFormatBody(true);
                newEmail.Send();
                return JsonSuccess("Email Terkirim!");
            }
            catch (Exception ex)
            {
                return JsonError(ex.InnerException.Message);
            }
        }


        public JsonResult UploadAmortisasiRequest()
        {
            string path = Server.MapPath(_attachmentAmortisasiRequestTemp);
            System.IO.DirectoryInfo di = new DirectoryInfo(path);
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }

            string filename = string.Empty;
            try
            {
                foreach (string file in Request.Files)
                {
                    var fileContent = Request.Files[file];
                    if (fileContent != null && fileContent.ContentLength > 0)
                    {
                        filename = Guid.NewGuid() + "-" + fileContent.FileName;
                        string nameAndLocation = _attachmentAmortisasiRequestTemp + filename;
                        fileContent.SaveAs(Server.MapPath(nameAndLocation));
                        break;
                    }
                }
            }
            catch (RetryLimitExceededException /* dex */)
            {
                //Log the error (uncomment dex variable name and add a line here to write a log.
                return JsonError("Unable to upload Attachment AmortisasiRequest. Try again, and if the problem persists see your system administrator.");
            }
            return JsonSuccess(filename);
        }


        public JsonResult ResetData(string namaFile)
        {
            try
            {
                string path = Server.MapPath(_attachmentAmortisasiRequestTemp + namaFile);
                if (System.IO.File.Exists(path))
                {
                    System.IO.FileInfo fl = new FileInfo(path);
                    fl.Delete();
                }
                return JsonSuccess("Success");
            }
            catch (RetryLimitExceededException /* dex */)
            {
                //Log the error (uncomment dex variable name and add a line here to write a log.
                return JsonError("Unable to upload Attachment AmortisasiRequest. Try again, and if the problem persists see your system administrator.");
            }
        }

        public async Task<JsonResult> ProcessJurnalOtomatis(string poNo, string narrative)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {              
                   
                    var models = await Task.FromResult<IEnumerable<MasterJurnalOtomatisViewModel>>(ctx.GetJurnalOtomatisSet("Amortisasi", poNo, narrative).AsQueryable());

                    IList<MasterJurnalOtomatisViewModel> list = models.ToList();

                    return JsonSuccess(new { data = list.ToArray() });
                }
            });
        }


    }
}