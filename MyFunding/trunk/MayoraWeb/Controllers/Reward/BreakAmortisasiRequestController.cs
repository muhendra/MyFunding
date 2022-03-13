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
    public class BreakAmortisasiRequestController : CoreControllerBase
    {

        private ApplicationDbContext _applicationDbContext;
        private ICurrentUser _currentUser;
        private SqlHelper _query = new SqlHelper("SqlFundingConnection");
        private string _category = "BreakAmortisasi";
        //private string _attachmentBreakAmortisasiRequest = "~/Files/BreakAmortisasiRequest/";
        private string _attachmentBreakAmortisasiRequestTemp = "~/Files/BreakAmortisasiRequest/Temp/";


        public BreakAmortisasiRequestController(ApplicationDbContext context, ICurrentUser currentUser)
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


        //[MyAuthorize(Roles = "Reward_SpvCabang,SupervisorReward")]
        public async Task<JsonResult> Reject(BreakAmortisasiRequestViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                if (!ModelState.IsValid)
                {
                    return JsonValidationError();
                }

                using (var ctx = new SqlFundingDbContext())
                {
                    var target = ctx.BreakAmortisasiRequestSet.FirstOrDefault(c => c.Id == form.Id);
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
                    int totalItems = await Task.FromResult<int>(ctx.GetPageBreakAmortisasiRequest(_currentUser.Branch.BranchCodeT24, "GETDATA", searchText).Count());

                    var models = await Task.FromResult<IEnumerable<BreakAmortisasiRequestViewModel>>(ctx.GetPageBreakAmortisasiRequest(_currentUser.Branch.BranchCodeT24, "GETDATA", searchText).AsQueryable()
                        .OrderBy(sortBy + " " + sortDirection)
                        .Skip((pageNumber - 1) * pageSize)
                        .Take(pageSize));

                    IList<BreakAmortisasiRequestViewModel> list = models.ToList();
                    //int totalItems = await ctx.BreakAmortisasiRequestSet.Include(x => x.AmorisasiRequestMod).Include(x => x.AmorisasiRequestMod.PurchaseOrder).Include(x => x.AmorisasiRequestMod.PurchaseOrder.EnquiryTabunganInput)
                    //    .CountAsync(x => x.IsDelete == false && x.AmorisasiRequestMod.PurchaseOrder.EnquiryTabunganInput.Cabang == _currentUser.Branch.BranchCodeT24 &&
                    //        (
                    //            string.IsNullOrEmpty(searchText) ||
                    //            (
                    //                x.RequestId.Contains(searchText) ||
                    //                x.AmorisasiRequestMod.DeliveryOrderMod.PurchaseOrder.POId.Contains(searchText) ||
                    //                x.AmorisasiRequestMod.DeliveryOrderMod.PurchaseOrder.CategoryId.Contains(searchText) ||
                    //                x.AmorisasiRequestMod.DeliveryOrderMod.PurchaseOrder.DetailBarang.Merek.Contains(searchText) ||
                    //                x.AmorisasiRequestMod.DeliveryOrderMod.PurchaseOrder.DetailBarang.TypeBarang.Contains(searchText) ||
                    //                x.AmorisasiRequestMod.DeliveryOrderMod.PurchaseOrder.DetailBarang.Warna.Contains(searchText) ||
                    //                x.AmorisasiRequestMod.DeliveryOrderMod.PurchaseOrder.DetailBarang.Quantity.ToString().Contains(searchText) ||
                    //                x.AmorisasiRequestMod.DeliveryOrderMod.PurchaseOrder.NominalBarang.ToString().Contains(searchText) ||
                    //                x.AmorisasiRequestMod.DeliveryOrderMod.PurchaseOrder.StatusData.ToString().Contains(searchText)
                    //            )
                    //        )
                    //);

                    //var models = await ctx.BreakAmortisasiRequestSet.Include(x => x.AmorisasiRequestMod.PurchaseOrder).Include(x => x.AmorisasiRequestMod.PurchaseOrder.DetailBarang).Include(x => x.AmorisasiRequestMod.PurchaseOrder.EnquiryTabunganInput)
                    //    .Where(x => x.IsDelete == false && x.AmorisasiRequestMod.PurchaseOrder.EnquiryTabunganInput.Cabang == _currentUser.Branch.BranchCodeT24 &&
                    //        (
                    //            string.IsNullOrEmpty(searchText) ||
                    //            (
                    //                x.RequestId.Contains(searchText) ||
                    //                x.AmorisasiRequestMod.DeliveryOrderMod.PurchaseOrder.POId.Contains(searchText) ||
                    //                x.AmorisasiRequestMod.DeliveryOrderMod.PurchaseOrder.CategoryId.Contains(searchText) ||
                    //                x.AmorisasiRequestMod.DeliveryOrderMod.PurchaseOrder.DetailBarang.Merek.Contains(searchText) ||
                    //                x.AmorisasiRequestMod.DeliveryOrderMod.PurchaseOrder.DetailBarang.TypeBarang.Contains(searchText) ||
                    //                x.AmorisasiRequestMod.DeliveryOrderMod.PurchaseOrder.DetailBarang.Warna.Contains(searchText) ||
                    //                x.AmorisasiRequestMod.DeliveryOrderMod.PurchaseOrder.DetailBarang.Quantity.ToString().Contains(searchText) ||
                    //                x.AmorisasiRequestMod.DeliveryOrderMod.PurchaseOrder.NominalBarang.ToString().Contains(searchText) ||
                    //                x.AmorisasiRequestMod.DeliveryOrderMod.PurchaseOrder.StatusData.ToString().Contains(searchText)
                    //            )
                    //        )
                    //)
                    //.OrderBy(sortBy + " " + sortDirection)
                    //.Skip((pageNumber - 1) * pageSize)
                    //.Take(pageSize)
                    //.ToListAsync();

                    //IList<BreakAmortisasiRequestViewModel> list = Mapper.Map<IList<BreakAmortisasiRequestViewModel>>(models);
                    foreach (var item in list)
                    {
                        item.jurnalDetail = Mapper.Map<List<BreakAmortisasiRequestDetail>, List<BreakAmortisasiRequestDetailViewModel>>(await ctx.BreakAmortisasiRequestDetailSet.Where(x => x.BreakAmortisasiRequestId == item.Id).ToListAsync());
                        item.ListKartuAmortisasi = Mapper.Map<List<KartuAmortisasi>, List<KartuAmortisasiViewModel>>(await ctx.KartuAmortisasiSet.Where(x => x.AmortisasiRequestId == item.TTid).ToListAsync());
                    }
                    return JsonSuccess(new { totalItems = totalItems, data = list.ToArray() });
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
                    int totalItems = await Task.FromResult<int>(ctx.GetPageBreakAmortisasiRequest(_currentUser.Branch.BranchCodeT24, "APPROVE", searchText).Count());

                    var models = await Task.FromResult<IEnumerable<BreakAmortisasiRequestViewModel>>(ctx.GetPageBreakAmortisasiRequest(_currentUser.Branch.BranchCodeT24, "APPROVE", searchText).AsQueryable()
                        .OrderBy(sortBy + " " + sortDirection)
                        .Skip((pageNumber - 1) * pageSize)
                        .Take(pageSize));

                    IList<BreakAmortisasiRequestViewModel> list = models.ToList();
                    //int totalItems = await ctx.BreakAmortisasiRequestSet.Include(x => x.AmorisasiRequestMod).Include(x => x.AmorisasiRequestMod.PurchaseOrder).Include(x => x.AmorisasiRequestMod.PurchaseOrder.EnquiryTabunganInput)
                    //    .CountAsync(x => x.IsDelete == false && x.StatusData != StatusData.Approved && x.AmorisasiRequestMod.PurchaseOrder.EnquiryTabunganInput.Cabang == _currentUser.Branch.BranchCodeT24 &&
                    //        (
                    //            string.IsNullOrEmpty(searchText) ||
                    //            (
                    //                x.RequestId.Contains(searchText) ||
                    //                x.AmorisasiRequestMod.DeliveryOrderMod.PurchaseOrder.POId.Contains(searchText) ||
                    //                x.AmorisasiRequestMod.DeliveryOrderMod.PurchaseOrder.CategoryId.Contains(searchText) ||
                    //                x.AmorisasiRequestMod.DeliveryOrderMod.PurchaseOrder.DetailBarang.Merek.Contains(searchText) ||
                    //                x.AmorisasiRequestMod.DeliveryOrderMod.PurchaseOrder.DetailBarang.TypeBarang.Contains(searchText) ||
                    //                x.AmorisasiRequestMod.DeliveryOrderMod.PurchaseOrder.DetailBarang.Warna.Contains(searchText) ||
                    //                x.AmorisasiRequestMod.DeliveryOrderMod.PurchaseOrder.DetailBarang.Quantity.ToString().Contains(searchText) ||
                    //                x.AmorisasiRequestMod.DeliveryOrderMod.PurchaseOrder.NominalBarang.ToString().Contains(searchText) ||
                    //                x.AmorisasiRequestMod.DeliveryOrderMod.PurchaseOrder.StatusData.ToString().Contains(searchText)
                    //            )
                    //        )
                    //);

                    //var models = await ctx.BreakAmortisasiRequestSet.Include(x => x.AmorisasiRequestMod.PurchaseOrder).Include(x => x.AmorisasiRequestMod.PurchaseOrder.DetailBarang).Include(x => x.AmorisasiRequestMod.PurchaseOrder.EnquiryTabunganInput)
                    //    .Where(x => x.IsDelete == false && x.StatusData != StatusData.Approved && x.AmorisasiRequestMod.PurchaseOrder.EnquiryTabunganInput.Cabang == _currentUser.Branch.BranchCodeT24 &&
                    //        (
                    //            string.IsNullOrEmpty(searchText) ||
                    //            (
                    //                x.RequestId.Contains(searchText) ||
                    //                x.AmorisasiRequestMod.DeliveryOrderMod.PurchaseOrder.POId.Contains(searchText) ||
                    //                x.AmorisasiRequestMod.DeliveryOrderMod.PurchaseOrder.CategoryId.Contains(searchText) ||
                    //                x.AmorisasiRequestMod.DeliveryOrderMod.PurchaseOrder.DetailBarang.Merek.Contains(searchText) ||
                    //                x.AmorisasiRequestMod.DeliveryOrderMod.PurchaseOrder.DetailBarang.TypeBarang.Contains(searchText) ||
                    //                x.AmorisasiRequestMod.DeliveryOrderMod.PurchaseOrder.DetailBarang.Warna.Contains(searchText) ||
                    //                x.AmorisasiRequestMod.DeliveryOrderMod.PurchaseOrder.DetailBarang.Quantity.ToString().Contains(searchText) ||
                    //                x.AmorisasiRequestMod.DeliveryOrderMod.PurchaseOrder.NominalBarang.ToString().Contains(searchText) ||
                    //                x.AmorisasiRequestMod.DeliveryOrderMod.PurchaseOrder.StatusData.ToString().Contains(searchText)
                    //            )
                    //        )
                    //)
                    //.OrderBy(sortBy + " " + sortDirection)
                    //.Skip((pageNumber - 1) * pageSize)
                    //.Take(pageSize)
                    //.ToListAsync();

                    //IList<BreakAmortisasiRequestViewModel> list = Mapper.Map<IList<BreakAmortisasiRequestViewModel>>(models);
                    foreach (var item in list)
                    {
                        item.jurnalDetail = Mapper.Map<List<BreakAmortisasiRequestDetail>, List<BreakAmortisasiRequestDetailViewModel>>(await ctx.BreakAmortisasiRequestDetailSet.Where(x => x.BreakAmortisasiRequestId == item.Id).ToListAsync());
                        item.ListKartuAmortisasi = Mapper.Map<List<KartuAmortisasi>, List<KartuAmortisasiViewModel>>(await ctx.KartuAmortisasiSet.Where(x => x.AmortisasiRequestId == item.TTid).ToListAsync());
                    }
                    return JsonSuccess(new { totalItems = totalItems, data = list.ToArray() });
                }
            });
        }


        [AllowAnonymous]
        public async Task<JsonResult> getAmortisasiRequest(string searchText = "", int pageNumber = 1, int pageSize = 10, string sortBy = "CreateDate", string sortDirection = "desc")
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    int totalItems = await Task.FromResult<int>(ctx.GetPageBreakAmortisasiRequest(_currentUser.Branch.BranchCodeT24, "GetAmorReqInBreakAmorMenu", searchText).Count());

                    var models = await Task.FromResult<IEnumerable<BreakAmortisasiRequestViewModel>>(ctx.GetPageBreakAmortisasiRequest(_currentUser.Branch.BranchCodeT24, "GetAmorReqInBreakAmorMenu", searchText).AsQueryable()
                        .OrderBy(sortBy + " " + sortDirection)
                        .Skip((pageNumber - 1) * pageSize)
                        .Take(pageSize));

                    IList<BreakAmortisasiRequestViewModel> list = models.ToList();
                    //int totalItems = await ctx.AmortisasiRequestSet.Include(x => x.PurchaseOrder).Include(x => x.PurchaseOrder.DetailBarang).Include(x => x.PurchaseOrder.EnquiryTabunganInput)
                    //    .CountAsync(x => x.IsDelete == false && x.StatusData == StatusData.Approved && !x.IsBreak && x.PurchaseOrder.EnquiryTabunganInput.Cabang == _currentUser.Branch.BranchCodeT24 &&
                    //        (
                    //            string.IsNullOrEmpty(searchText) ||
                    //            (
                    //                x.RequestId.Contains(searchText) ||
                    //                //x.DeliveryOrderMod.DeliveryOrderId.Contains(searchText) ||
                    //                //x.DeliveryOrderMod.Receiver.Contains(searchText) ||
                    //                //x.DeliveryOrderDate.Value.ToString("dd/MM/yyyy").Contains(searchText) ||
                    //                //x.DeliveryOrderMod.PurchaseOrder.POId.Contains(searchText) ||
                    //                //x.PurchaseOrder.PODate.Value.ToString("dd/MM/yyyy").Contains(searchText) ||
                    //                x.PurchaseOrder.NominalBarang.ToString().Contains(searchText) ||
                    //                x.PurchaseOrder.NominalPurchase.ToString().Contains(searchText) ||
                    //                x.PurchaseOrder.TotalPurchase.ToString().Contains(searchText) ||
                    //                x.PurchaseOrder.NilaiBuku.ToString().Contains(searchText) ||
                    //                x.PurchaseOrder.DetailBarang.Merek.Contains(searchText) ||
                    //                x.PurchaseOrder.DetailBarang.Penalty.ToString().Contains(searchText) ||
                    //                x.PurchaseOrder.DetailBarang.PromotionCode.Contains(searchText) ||
                    //                x.PurchaseOrder.DetailBarang.Quantity.ToString().Contains(searchText) ||
                    //                x.PurchaseOrder.DetailBarang.TypeBarang.Contains(searchText) ||
                    //                x.PurchaseOrder.DetailBarang.Warna.Contains(searchText) ||
                    //                x.PurchaseOrder.EnquiryTabunganInput.NoRekening.Contains(searchText)
                    //            )
                    //        )
                    //);

                    //var models = await ctx.AmortisasiRequestSet.Include(x => x.PurchaseOrder).Include(x => x.PurchaseOrder.DetailBarang).Include(x => x.PurchaseOrder.EnquiryTabunganInput)
                    //    .Where(x => x.IsDelete == false && x.StatusData == StatusData.Approved && !x.IsBreak && x.PurchaseOrder.EnquiryTabunganInput.Cabang == _currentUser.Branch.BranchCodeT24 &&
                    //        (
                    //            string.IsNullOrEmpty(searchText) ||
                    //            (
                    //                x.RequestId.Contains(searchText) ||
                    //                //x.DeliveryOrderMod.DeliveryOrderId.Contains(searchText) ||
                    //                //x.DeliveryOrderMod.Receiver.Contains(searchText) ||
                    //        //x.DeliveryOrderDate.Value.ToString("dd/MM/yyyy").Contains(searchText) ||
                    //                x.PurchaseOrder.POId.Contains(searchText) ||
                    //        //x.PurchaseOrder.PODate.Value.ToString("dd/MM/yyyy").Contains(searchText) ||
                    //                x.PurchaseOrder.NominalBarang.ToString().Contains(searchText) ||
                    //                x.PurchaseOrder.NominalPurchase.ToString().Contains(searchText) ||
                    //                x.PurchaseOrder.TotalPurchase.ToString().Contains(searchText) ||
                    //                x.PurchaseOrder.NilaiBuku.ToString().Contains(searchText) ||
                    //                x.PurchaseOrder.DetailBarang.Merek.Contains(searchText) ||
                    //                x.PurchaseOrder.DetailBarang.Penalty.ToString().Contains(searchText) ||
                    //                x.PurchaseOrder.DetailBarang.PromotionCode.Contains(searchText) ||
                    //                x.PurchaseOrder.DetailBarang.Quantity.ToString().Contains(searchText) ||
                    //                x.PurchaseOrder.DetailBarang.TypeBarang.Contains(searchText) ||
                    //                x.PurchaseOrder.DetailBarang.Warna.Contains(searchText) ||
                    //                x.PurchaseOrder.EnquiryTabunganInput.NoRekening.Contains(searchText)
                    //            )
                    //        )
                    //)
                    //.OrderBy(sortBy + " " + sortDirection)
                    //.Skip((pageNumber - 1) * pageSize)
                    //.Take(pageSize)
                    //.ToListAsync();

                    //IList<AmortisasiRequestViewModel> list = Mapper.Map<IList<AmortisasiRequestViewModel>>(models);

                    foreach (var item in list)
                    {
                        //item.jurnalDetail = Mapper.Map<List<AmortisasiRequestDetail>, List<AmortisasiRequestDetailViewModel>>(await ctx.AmortisasiRequestDetailSet.Where(x => x.AmortisasiRequestId == item.Id).ToListAsync());
                        item.ListKartuAmortisasi = Mapper.Map<List<KartuAmortisasi>, List<KartuAmortisasiViewModel>>(await ctx.KartuAmortisasiSet.Where(x => x.AmortisasiRequestId == item.Id).ToListAsync());
                    }

                    return JsonSuccess(new { totalItems = totalItems, data = list.ToArray() });
                }
            });
        }

        //[AllowAnonymous]
        //public async Task<JsonResult> AuthorizeGetPage(DateTime TanggalDraft, JenisTabungan Jenistabungan, string Cabang, string Id, string NoDraft, int pageNumber = 1, int pageSize = 10, string sortBy = "Id", string sortDirection = "desc")
        //{
        //    return await ExecuteFaultHandledOperationAsync(async () =>
        //    {
        //        using (var ctx = new SqlFundingDbContext())
        //        {
        //            int totalItems = await Task.FromResult<int>(ctx.BreakAmortisasiRequestSet.Count());

        //            var models = await ctx.BreakAmortisasiRequestSet
        //            .Skip((pageNumber - 1) * pageSize)
        //            .Take(pageSize).ToListAsync();

        //            IList<BreakAmortisasiRequestViewModel> list = Mapper.Map<IList<BreakAmortisasiRequestViewModel>>(models.ToList());

        //            return JsonSuccess(new { totalItems = totalItems, data = list.ToArray() });
        //        }
        //    });
        //}

        [AllowAnonymous]
        public async Task<JsonResult> All()
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    var models = await ctx.BreakAmortisasiRequestSet
                               .Where(x => x.IsDelete == false)
                               .OrderByDescending(x => x.CreateDate)
                               .ToListAsync();

                    IList<BreakAmortisasiRequestViewModel> list = Mapper.Map<IList<BreakAmortisasiRequest>, IList<BreakAmortisasiRequestViewModel>>(models);

                    return JsonSuccess(new { data = list.ToArray() });
                }
            });

        }
        

        public async Task<JsonResult> Add(BreakAmortisasiRequestViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                if (!ModelState.IsValid)
                {
                    return JsonValidationError();
                }

                BreakAmortisasiRequest model = Mapper.Map<BreakAmortisasiRequest>(form);
                List<BreakAmortisasiRequestDetail> details = Mapper.Map<List<BreakAmortisasiRequestDetail>>(form.jurnalDetail);
                
                using (var ctx = new SqlFundingDbContext())
                {
                    var amortize = ctx.AmortisasiRequestSet.Find(form.TTid);
                    if (amortize != null) amortize.IsBreak = true;
                    model.StatusData = StatusData.New;

                    string noPurchase = (string)await _query.ExecScalarProcAsync("SP_GENERATE_NOMOR", "@Category", _category);

                    model.RequestId = noPurchase;

                    ctx.BreakAmortisasiRequestSet.Add(model);
                    await ctx.SaveChangesAsync();
                    var refCodeList = details.Select(grp => grp.ref_code).Distinct().ToArray();
                    int i = 0;
                    if (details.Count() > 0)
                    {
                        foreach (var item in details)
                        {
                            if (item.DebitKredit == Models.DebetKredit.D)
                            {
                                i++;
                            }
                            item.ref_code = model.RequestId + i.ToString();//(Array.IndexOf(refCodeList, item.ref_code) + 1).ToString();
                            item.BreakAmortisasiRequestId = model.Id;
                            item.Narative = form.Transaksi + " " + model.RequestId;
                        }
                        ctx.BreakAmortisasiRequestDetailSet.AddRange(details);
                        await ctx.SaveChangesAsync();
                    }
                    return JsonSuccess("Succes");
                }
            });
        }


        public async Task<JsonResult> Update(BreakAmortisasiRequestViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                List<BreakAmortisasiRequestDetail> listDet = Mapper.Map<List<BreakAmortisasiRequestDetail>>(form.jurnalDetail);

                var refCodeList = listDet.Select(grp => grp.ref_code).Distinct().ToArray();
                foreach (var item in listDet)
                {
                    item.ref_code = form.RequestId + (Array.IndexOf(refCodeList, item.ref_code) + 1).ToString();
                    item.BreakAmortisasiRequestId = form.Id;
                    item.StatusData = StatusData.New;
                    item.CreateBy = _currentUser.User.Id;
                }
                using (var ctx = new SqlFundingDbContext())
                {
                    var existingModel = ctx.BreakAmortisasiRequestSet.Find(form.Id);
                    if (existingModel == null)
                    {
                        return JsonError("Data Tidak Ditemukan di database!");
                    }
                    Mapper.Map(form, existingModel);
                    await ctx.SaveChangesAsync();
                    //var OldDetail = ctx.BreakAmortisasiRequestDetailSet.Where(x => x.BreakAmortisasiRequestId == form.Id);
                    //ctx.BreakAmortisasiRequestDetailSet.RemoveRange(OldDetail);
                    //if (listDet.Count() > 0) ctx.BreakAmortisasiRequestDetailSet.AddRange(listDet);
                    //await ctx.SaveChangesAsync();
                    return JsonSuccess("Update Success");
                }
            });
        }


        //[MyAuthorize(Roles = "Reward_SpvCabang,SupervisorReward")]
        public async Task<JsonResult> Approve(BreakAmortisasiRequestViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    var target = ctx.BreakAmortisasiRequestSet.Find(form.Id);
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
                    //await _query.ExecNonQueryAsync("SP_INSERTBREAKPAYMENTAMORTISASI @id", Params); //Old Insert Into Payment

                    Guid id = Guid.NewGuid();

                    var Params1 = new object[] { 
                        new SqlParameter("@id", form.Id),
                        new SqlParameter("@flag", 1),
                        new SqlParameter("@guid", id),
                        new SqlParameter("@user", _currentUser.User.UserName)
                    };
                    await _query.ExecNonQueryAsync("[SP_INSERTBREAKAUTHORIZEAMORTISASI] @id, @flag, @guid, @user", Params1);

                    var Params2 = new object[] { 
                        new SqlParameter("@id", form.Id),
                        new SqlParameter("@flag", 2),
                        new SqlParameter("@guid", id),
                        new SqlParameter("@user", _currentUser.User.UserName)
                    };
                    await _query.ExecNonQueryAsync("[SP_INSERTBREAKAUTHORIZEAMORTISASI] @id, @flag, @guid, @user", Params2);
                    return JsonSuccess("Delete Success!");
                }
            });
        }


        public async Task<JsonResult> Delete(BreakAmortisasiRequestViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    var target = ctx.BreakAmortisasiRequestSet.Find(form.Id);
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


        public JsonResult UploadBreakAmortisasiRequest()
        {
            string path = Server.MapPath(_attachmentBreakAmortisasiRequestTemp);
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
                        string nameAndLocation = _attachmentBreakAmortisasiRequestTemp + filename;
                        fileContent.SaveAs(Server.MapPath(nameAndLocation));
                        break;
                    }
                }
            }
            catch (RetryLimitExceededException /* dex */)
            {
                //Log the error (uncomment dex variable name and add a line here to write a log.
                return JsonError("Unable to upload Attachment BreakAmortisasiRequest. Try again, and if the problem persists see your system administrator.");
            }
            return JsonSuccess(filename);
        }


        public JsonResult ResetData(string namaFile)
        {
            try
            {
                string path = Server.MapPath(_attachmentBreakAmortisasiRequestTemp + namaFile);
                if (System.IO.File.Exists(path))
                {
                    System.IO.FileInfo fl = new FileInfo(path);
                    fl.Delete();
                }
                return JsonSuccess("Succes");
            }
            catch (RetryLimitExceededException /* dex */)
            {
                //Log the error (uncomment dex variable name and add a line here to write a log.
                return JsonError("Unable to upload Attachment BreakAmortisasiRequest. Try again, and if the problem persists see your system administrator.");
            }
        }

        public async Task<JsonResult> ProcessJurnalOtomatis(string poNo, string narrative, string transaksi)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {

                    var models = await Task.FromResult<IEnumerable<MasterJurnalOtomatisViewModel>>(ctx.GetJurnalOtomatisSet(transaksi, poNo, narrative).AsQueryable());

                    IList<MasterJurnalOtomatisViewModel> list = models.ToList();

                    return JsonSuccess(new { data = list.ToArray() });
                }
            });
        }


    }
}