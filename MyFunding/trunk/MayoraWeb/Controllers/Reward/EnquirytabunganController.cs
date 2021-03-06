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
    public class EnquirytabunganController : CoreControllerBase
    {

        private ApplicationDbContext _applicationDbContext;
        private ICurrentUser _currentUser;
        private SqlHelper _query = new SqlHelper("SqlFundingConnection");
        private string _category = "Enquiry";
        private string _attachmentSPNasabah = "~/Files/enquirytabungan/";
        private string _attachmentSPNasabahTemp = "~/Files/enquirytabungan/Temp/";
        private string _attachmentPenyimpangan = "~/Files/enquirytabungan/";
        private string _attachmentPenyimpanganTemp = "~/Files/enquirytabungan/Temp/";

        public EnquirytabunganController(ApplicationDbContext context, ICurrentUser currentUser)
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

        public ActionResult Rejected()
        {
            return View();
        }

        //[MyAuthorize(Roles = "Reward_SpvCabang,SupervisorReward,Reward_SpvGA,SupervisorProduk")]
        public async Task<JsonResult> Approve(EnquirytabunganViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                if (!ModelState.IsValid)
                    return JsonValidationError();

                using (var ctx = new SqlFundingDbContext())
                {
                    var target = ctx.EnquiryTabunganInputSet.FirstOrDefault(c => c.Id == form.Id);
                    target.StatusData = StatusData.Approved;
                    target.ApproveBy = _currentUser.User.Id;
                    target.ApproveDate = DateTime.Now;
                    await ctx.SaveChangesAsync();

                    //NotificationLib.sendNotifikasi("All Cabang", form.Cabang, form.DraftPRId, form.DraftPRDate, "Draft Purchase Request (DPR)", "Pembuatan Puchase Request", "PurchaseRequest/index");
                    //ctx.SendEmail_MyFunding("All Cabang", form.DraftPRId, form.Cabang, Convert.ToDateTime(form.DraftPRDate), "Draft Purchase Request (DPR)", "Pembuatan Puchase Request",
                    //ctx.SendEmail_MyFunding("FProduct Staff", form.DraftPRId, form.Cabang, Convert.ToDateTime(form.DraftPRDate), "Draft Purchase Request (DPR)", "Pembuatan Puchase Request",  
                    //AKTIFIN LAGI NNT ABIS SELESAI TESTING
                    //ctx.SendEmail_MyFunding("After Authorize Draft Purchase Request", form.DraftPRId, form.Cabang, Convert.ToDateTime(form.DraftPRDate), "Draft Purchase Request (DPR)", "Pembuatan Puchase Request",
                    //    string.Format("http://{0}{1}/{2}", Request.Url.Host, Request.ApplicationPath, "PurchaseRequest/index"));
                    return JsonSuccess("Approve Success");
                }
            });
        }


        //[MyAuthorize(Roles = "Reward_SpvCabang,SupervisorReward,Reward_SpvGA,SupervisorProduk")]
        public async Task<JsonResult> Reject(EnquirytabunganViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                //20190114, jeni, BEGIN
                //if (!ModelState.IsValid)
                //    return JsonValidationError();
                //20190114, jeni, END
                using (var ctx = new SqlFundingDbContext())
                {
                    var target = ctx.EnquiryTabunganInputSet.FirstOrDefault(c => c.Id == form.Id);
                    if (target == null)
                        return JsonError("Data tidak ada di database!");
                    //20190114, jeni, BEGIN
                    target.StatusData = StatusData.Rejected;
                    //20190114, jeni, END
                    target.RejectBy = _currentUser.Username;
                    target.RejectDate = DateTime.Now;

                    //ctx.EnquiryTabunganInputSet.Remove(target);
                    await ctx.SaveChangesAsync();

                    //AKTIFIN LAGI NNT ABIS SELESAI TESTING
                    //ctx.SendEmail_MyFunding("After Reject Draft Purchase Request", form.NoRekening, form.Cabang, Convert.ToDateTime(form.DraftPRDate), "No Rekening", "Draft Purchase Request Rejected",
                    //    string.Format("http://{0}{1}/{2}", Request.Url.Host, Request.ApplicationPath, "EnquiryTabungan/index"));

                    return JsonSuccess("Data Rejected");
                }
            });
        }

        //[MyAuthorize(Roles = "Reward_SpvCabang,SupervisorReward,Reward_SpvGA,SupervisorProduk")]
        public async Task<JsonResult> Deleted(EnquirytabunganViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                if (!ModelState.IsValid)
                    return JsonValidationError();

                using (var ctx = new SqlFundingDbContext())
                {
                    var target = ctx.EnquiryTabunganInputSet.FirstOrDefault(c => c.Id == form.Id);
                    if (target == null)
                        return JsonError("Data tidak ada di database!");

                    target.StatusData = StatusData.Deleted;
                    await ctx.SaveChangesAsync();

                    return JsonSuccess("Data Rejected");
                }
            });
        }

        private async Task<string> GenerateNoPurchase()
        {
            string noPurchase = (string)await _query.ExecScalarProcAsync("SP_GENERATE_NOMOR", "@Category", _category);
            return noPurchase;
        }

        [AllowAnonymous]
        public async Task<JsonResult> GetNoPurchase()
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                //string noMemo = (string) await _query.ExecScalarProcAsync("SP_GENERATE_NOMOR", "@Category", _category);
                string noPurchase = await GenerateNoPurchase();
                return JsonSuccess(noPurchase);
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

        [AllowAnonymous]
        public async Task<JsonResult> GetPage(DateTime? Tanggal, JenisTabungan Jenistabungan, string Cabang, int pageNumber = 1, int pageSize = 10, string sortBy = "NoRekening", string sortDirection = "desc")
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    //string cabangUser = _currentUser.Branch.BranchCode;

                    int totalItems = await Task.FromResult<int>(ctx.EnquirytabunganSet(Tanggal, (int)Jenistabungan, Cabang).Count());

                    var models = await Task.FromResult<IEnumerable<EnquirytabunganViewModel>>(ctx.EnquirytabunganSet(Tanggal, (int)Jenistabungan, Cabang).AsQueryable()
                        .OrderBy(sortBy + " " + sortDirection)
                        .Skip((pageNumber - 1) * pageSize)
                        .Take(pageSize));

                    IList<EnquirytabunganViewModel> list = models.ToList();

                    if (list != null)
                    {
                        foreach (var item in list)
                        {
                            if (item.RejectBy != null)
                                item.DetailBarangList = Mapper.Map<List<DetailBarang>>(await ctx.DetailBarangSet.Where(x => x.EnquiryId == item.EnquiryId).ToListAsync());
                        }
                    }

                    return JsonSuccess(new { totalItems = totalItems, data = list.ToArray() });
                }
            });
        }

        //20200710, eka, BEGIN
        [AllowAnonymous]
        public async Task<JsonResult> GetAll(DateTime? Tanggal, JenisTabungan Jenistabungan, string Cabang, int pageNumber = 1, int pageSize = 10, string sortBy = "NoRekening", string sortDirection = "desc")
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    //string cabangUser = _currentUser.Branch.BranchCode;

                    int totalItems = await Task.FromResult<int>(ctx.EnquirytabunganSet(Tanggal, (int)Jenistabungan, Cabang).Count());

                    var models = await Task.FromResult<IEnumerable<EnquirytabunganViewModel>>(ctx.EnquirytabunganSet(Tanggal, (int)Jenistabungan, Cabang).AsQueryable()
                        .AsQueryable()
                        .OrderBy(sortBy + " " + sortDirection)
                        //.Skip((pageNumber - 1) * pageSize)
                        //.Take(pageSize)
                        );

                    IList<EnquirytabunganViewModel> list = models.ToList();

                    if (list != null)
                    {
                        foreach (var item in list)
                        {
                            if (item.RejectBy != null)
                                item.DetailBarangList = Mapper.Map<List<DetailBarang>>(await ctx.DetailBarangSet.Where(x => x.EnquiryId == item.EnquiryId).ToListAsync());
                        }
                    }
                    return JsonSuccess(new { totalItems = totalItems, data = list.ToArray() });
                }
            });
        }
        //20200710, eka, END

        [AllowAnonymous]
        public async Task<JsonResult> AuthorizeGetPage(DateTime? TanggalDraft, JenisTabungan Jenistabungan, string Cabang, string NoRekening, string NoDraft, int pageNumber = 1, int pageSize = 10, string sortBy = "DraftPRId", string sortDirection = "desc")
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    int totalItems = await Task.FromResult<int>(ctx.AuthorizeenquirytabunganSet(TanggalDraft, (int)Jenistabungan, Cabang, NoRekening, NoDraft).Count());

                    var models = await Task.FromResult<IEnumerable<EnquirytabunganViewModel>>(ctx.AuthorizeenquirytabunganSet(TanggalDraft, (int)Jenistabungan, Cabang, NoRekening, NoDraft)
                        .AsQueryable()
                        .OrderBy(sortBy + " " + sortDirection)
                        .Skip((pageNumber - 1) * pageSize)
                        .Take(pageSize));

                    IList<EnquirytabunganViewModel> list = models.ToList();

                    if (list != null)
                    {
                        foreach (var item in list)
                        {
                            item.DetailBarangList = Mapper.Map<List<DetailBarang>>(await ctx.DetailBarangSet.Where(x => x.EnquiryId == item.Id).ToListAsync());
                            item.DetailUploadList = Mapper.Map<List<UploadNasabah>>(await ctx.UploadNasabahSet.Where(x => x.NoRekening == item.NoRekening).ToListAsync());
                        }
                    }
                    return JsonSuccess(new { totalItems = totalItems, data = list.ToArray() });
                }
            });
        }

        [AllowAnonymous]
        public async Task<JsonResult> AuthorizeGetAll(DateTime? TanggalDraft, JenisTabungan Jenistabungan, string Cabang, string NoRekening, string NoDraft, int pageNumber = 1, int pageSize = 10, string sortBy = "DraftPRId", string sortDirection = "desc")
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    int totalItems = await Task.FromResult<int>(ctx.AuthorizeenquirytabunganSet(TanggalDraft, (int)Jenistabungan, Cabang, NoRekening, NoDraft).Count());

                    var models = await Task.FromResult<IEnumerable<EnquirytabunganViewModel>>(ctx.AuthorizeenquirytabunganSet(TanggalDraft, (int)Jenistabungan, Cabang, NoRekening, NoDraft)
                        .AsQueryable()
                        .OrderBy(sortBy + " " + sortDirection)
                        //.Skip((pageNumber - 1) * pageSize)
                        //.Take(pageSize)
                        );

                    IList<EnquirytabunganViewModel> list = models.ToList();

                    if (list != null)
                    {
                        foreach (var item in list)
                        {
                            item.DetailBarangList = Mapper.Map<List<DetailBarang>>(await ctx.DetailBarangSet.Where(x => x.EnquiryId == item.Id).ToListAsync());
                            item.DetailUploadList = Mapper.Map<List<UploadNasabah>>(await ctx.UploadNasabahSet.Where(x => x.NoRekening == item.NoRekening).ToListAsync());
                        }
                    }
                    return JsonSuccess(new { totalItems = totalItems, data = list.ToArray() });
                }
            });
        }

        public async Task<JsonResult> RejectGetPage(DateTime? TanggalDraft, JenisTabungan Jenistabungan, string Cabang, string NoRekening, string NoDraft, int pageNumber = 1, int pageSize = 10, string sortBy = "DraftPRId", string sortDirection = "desc")
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    int totalItems = await Task.FromResult<int>(ctx.RejectenquirytabunganSet(TanggalDraft, (int)Jenistabungan, Cabang, NoRekening, NoDraft).Count());

                    var models = await Task.FromResult<IEnumerable<EnquirytabunganViewModel>>(ctx.RejectenquirytabunganSet(TanggalDraft, (int)Jenistabungan, Cabang, NoRekening, NoDraft)
                        .AsQueryable()
                        .OrderBy(sortBy + " " + sortDirection)
                        .Skip((pageNumber - 1) * pageSize)
                        .Take(pageSize));

                    IList<EnquirytabunganViewModel> list = models.ToList();

                    if (list != null)
                    {
                        foreach (var item in list)
                        {
                            item.DetailBarangList = Mapper.Map<List<DetailBarang>>(await ctx.DetailBarangSet.Where(x => x.EnquiryId == item.Id).ToListAsync());
                            item.DetailUploadList = Mapper.Map<List<UploadNasabah>>(await ctx.UploadNasabahSet.Where(x => x.NoRekening == item.NoRekening).ToListAsync());
                        }
                    }

                    return JsonSuccess(new { totalItems = totalItems, data = list.ToArray() });
                }
            });
        }

        public async Task<JsonResult> RejectGetAll(DateTime? TanggalDraft, JenisTabungan Jenistabungan, string Cabang, string NoRekening, string NoDraft, int pageNumber = 1, int pageSize = 10, string sortBy = "DraftPRId", string sortDirection = "desc")
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    int totalItems = await Task.FromResult<int>(ctx.RejectenquirytabunganSet(TanggalDraft, (int)Jenistabungan, Cabang, NoRekening, NoDraft).Count());

                    var models = await Task.FromResult<IEnumerable<EnquirytabunganViewModel>>(ctx.RejectenquirytabunganSet(TanggalDraft, (int)Jenistabungan, Cabang, NoRekening, NoDraft)
                        .AsQueryable()
                        .OrderBy(sortBy + " " + sortDirection)
                        //.Skip((pageNumber - 1) * pageSize)
                        //.Take(pageSize)
                        );

                    IList<EnquirytabunganViewModel> list = models.ToList();

                    if (list != null)
                    {
                        foreach (var item in list)
                        {
                            item.DetailBarangList = Mapper.Map<List<DetailBarang>>(await ctx.DetailBarangSet.Where(x => x.EnquiryId == item.Id).ToListAsync());
                            item.DetailUploadList = Mapper.Map<List<UploadNasabah>>(await ctx.UploadNasabahSet.Where(x => x.NoRekening == item.NoRekening).ToListAsync());
                        }
                    }

                    return JsonSuccess(new { totalItems = totalItems, data = list.ToArray() });
                }
            });
        }

        public async Task<JsonResult> GetPageUpload(EnquirytabunganViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    //string cabangUser = _currentUser.Branch.BranchCode;
                    var a = _query.ExecDataTableProc("[SP_GetUploadNasabah]", "@norek", form.NoRekening);
                    var b = a.ToList<UploadNasabahViewModel>();
                    int totalitems = b.Count();
                    var c = b.AsQueryable()
                    .ToArray();

                    return JsonSuccess(new { totalItems = totalitems, data = c.ToArray() });
                   
                }
            });
        }
        [AllowAnonymous]
        public async Task<JsonResult> GetDraftPurchaseRequest(string NoDraft)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    var models = ctx.EnquiryTabunganInputSet.Where(x => x.DraftPRId == NoDraft).ToList();                

                    IList<EnquirytabunganViewModel> list = Mapper.Map<IList<EnquiryTabunganInput>, IList<EnquirytabunganViewModel>>(models);

                    if (list != null)
                    {
                        foreach (var item in list)
                        {
                            item.DetailBarangList = Mapper.Map<List<DetailBarang>>(await ctx.DetailBarangSet.Where(x => x.EnquiryId == item.Id).ToListAsync());
                            item.DetailUploadList = Mapper.Map<List<UploadNasabah>>(await ctx.UploadNasabahSet.Where(x => x.NoRekening == item.NoRekening).ToListAsync());
                        }
                    }

                    return JsonSuccess(new { data = list.ToArray() });
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
                    var models = await ctx.EnquiryTabunganInputSet
                        .Where(x => x.IsDelete == false)
                        .OrderByDescending(x => x.CreateDate)
                        .ToListAsync();

                    IList<EnquirytabunganinputViewModel> list = Mapper.Map<IList<EnquiryTabunganInput>, IList<EnquirytabunganinputViewModel>>(models);

                    return JsonSuccess(new { data = list.ToArray() });
                }
            });

        }

        public async Task<JsonResult> Add(EnquirytabunganinputViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                if (!ModelState.IsValid)
                    return JsonValidationError();

                EnquiryTabunganInput model = Mapper.Map<EnquiryTabunganInput>(form);

                using (var ctx = new SqlFundingDbContext())
                {
                    model.StatusData = StatusData.New;
                    model.DraftPRId = await GenerateNoPurchase();
                    ctx.EnquiryTabunganInputSet.Add(model);
                    await ctx.SaveChangesAsync();

                    if (form.DetailBarangList != null)
                    {
                        var existingDetailBarang = ctx.EnquiryTabunganInputSet.FirstOrDefault(c => c.DraftPRId == form.DraftPRId && c.IsDelete == false);
                        if (existingDetailBarang != null)
                        {
                            foreach (var item in form.DetailBarangList)
                            {
                                DetailBarang detailBarang = Mapper.Map<DetailBarang>(item);
                                detailBarang.EnquiryId = existingDetailBarang.Id;
                                ctx.DetailBarangSet.Add(detailBarang);
                                //NotificationLib.sendNotifikasi("Head Product", form.Cabang, form.DraftPRId, form.DraftPRDate, "Draft Purchase Request", "Authorize Draft Puchase Request", "EnquiryTabungan/Authorize");
                            }
                            await ctx.SaveChangesAsync();
                        }
                    }
                    //await _query.ExecNonQueryProcAsync("SP_INSERT_GENERATE_NOMOR", "@Nomor", model.NoMemo);
                    //ctx.SendEmail_MyFunding("Head Product", form.DraftPRId, form.Cabang, Convert.ToDateTime(form.DraftPRDate), "Draft Purchase Request (DPR)", "Authorize Draft Puchase Request",
                    //ctx.SendEmail_MyFunding("Head Cabang " + form.Cabang, form.DraftPRId, form.Cabang, Convert.ToDateTime(form.DraftPRDate), "Draft Purchase Request (DPR)", "Authorize Draft Puchase Request",
                    //Pindahin file FinalMemo dari temp
                    if (form.DetailUploadList != null)
                    {
                        foreach (var item in form.DetailUploadList)
                        {
                            UploadNasabah detailUpload = Mapper.Map<UploadNasabah>(item);
                            ctx.UploadNasabahSet.Add(detailUpload);
                        }
                        await ctx.SaveChangesAsync();
                            
                        foreach (var file in Directory.GetFiles(Server.MapPath(_attachmentSPNasabahTemp)))
                        {
                            System.IO.File.Copy(file, Path.Combine(Server.MapPath(_attachmentSPNasabah), Path.GetFileName(file)), true);
                            System.IO.File.Delete(file);
                        }
                    }

                    //20200710, eka, BEGIN
                    if (!string.IsNullOrEmpty(form.AttachmentPenyimpangan))
                        foreach (var file in Directory.GetFiles(Server.MapPath(_attachmentPenyimpanganTemp)))
                        {
                            System.IO.File.Copy(file, Path.Combine(Server.MapPath(_attachmentPenyimpangan), Path.GetFileName(file)), true);
                            System.IO.File.Delete(file);
                        }
                    return JsonSuccess(model);
                }
            });
        }

        public async Task<JsonResult> Update(EnquirytabunganViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    var existingModel = ctx.EnquiryTabunganInputSet.Find(form.Id);
                    if (existingModel == null)
                        return JsonError("Data Tidak Ditemukan di database!");

                    //jika file final memo diganti
                    if (existingModel.AttachmentSPNasabah != form.AttachmentSPNasabah)
                        if (!string.IsNullOrEmpty(form.AttachmentSPNasabah))
                            foreach (var file in Directory.GetFiles(Server.MapPath(_attachmentSPNasabahTemp)))
                            {
                                System.IO.File.Copy(file, Path.Combine(Server.MapPath(_attachmentSPNasabah), Path.GetFileName(file)), true);
                                System.IO.File.Delete(file); //delete file temp
                                if (!string.IsNullOrEmpty(existingModel.AttachmentSPNasabah))
                                    System.IO.File.Delete(Path.Combine(Server.MapPath(_attachmentSPNasabah), existingModel.AttachmentSPNasabah)); //delete file sebelumnya
                            }

                    //20200710, eka, BEGIN
                    if (existingModel.AttachmentPenyimpangan != form.AttachmentPenyimpangan)
                        if (!string.IsNullOrEmpty(form.AttachmentPenyimpangan))
                            foreach (var file in Directory.GetFiles(Server.MapPath(_attachmentPenyimpanganTemp)))
                            {
                                System.IO.File.Copy(file, Path.Combine(Server.MapPath(_attachmentPenyimpangan), Path.GetFileName(file)), true);
                                System.IO.File.Delete(file); //delete file temp
                                if (!string.IsNullOrEmpty(existingModel.AttachmentPenyimpangan))
                                {
                                    System.IO.File.Delete(Path.Combine(Server.MapPath(_attachmentPenyimpangan), existingModel.AttachmentPenyimpangan));
                                }
                            }
                    //20200710, eka, END
                    //form.Id = form.EnquiryId ?? 0;
                    Mapper.Map(form, existingModel);
                    if (existingModel.StatusData != StatusData.Approved)
                    {
                        existingModel.StatusData = StatusData.Edited;
                        existingModel.SetUpdateByCurrentUser();
                        existingModel.UpdateDate = DateTime.Now;
                        existingModel.RejectBy = null;
                        existingModel.RejectDate = null;
                    }
                    await ctx.SaveChangesAsync();

                    //20190117, jeni, BEGIN
                    if (form.DetailBarangList != null)
                    {
                        var existingDetailBarang = ctx.EnquiryTabunganInputSet.FirstOrDefault(c => c.DraftPRId == form.DraftPRId && c.IsDelete == false);
                        if (existingDetailBarang != null)
                        {
                            var models = ctx.EnquiryTabunganInputSet.Where(x => x.Id == form.Id).ToList();

                            IList<EnquirytabunganViewModel> list = Mapper.Map<IList<EnquiryTabunganInput>, IList<EnquirytabunganViewModel>>(models);

                            if (list != null)
                            {
                                foreach (var item in list)
                                {
                                    item.DetailBarangList = Mapper.Map<List<DetailBarang>>(await ctx.DetailBarangSet.Where(x => x.EnquiryId == item.Id).ToListAsync());
                                    foreach (var item1 in item.DetailBarangList)
                                    {
                                        DetailBarang detailBarang = Mapper.Map<DetailBarang>(item1);
                                        detailBarang.EnquiryId = existingDetailBarang.Id;
                                        ctx.DetailBarangSet.Remove(detailBarang);
                                    }
                                    await ctx.SaveChangesAsync();

                                    item.DetailUploadList = Mapper.Map<List<UploadNasabah>>(await ctx.UploadNasabahSet.Where(x => x.NoRekening == item.NoRekening).ToListAsync());
                                    foreach (var item1 in item.DetailUploadList)
                                    {
                                        UploadNasabah detailUploadNasabah = Mapper.Map<UploadNasabah>(item1);
                                        detailUploadNasabah.NoRekening = existingDetailBarang.NoRekening;
                                        ctx.UploadNasabahSet.Remove(detailUploadNasabah);
                                    }
                                    await ctx.SaveChangesAsync();
                                }
                            }

                            foreach (var item in form.DetailBarangList)
                            {
                                DetailBarang detailBarang = Mapper.Map<DetailBarang>(item);
                                detailBarang.EnquiryId = existingDetailBarang.Id;
                                ctx.DetailBarangSet.Add(detailBarang);
                            }
                            await ctx.SaveChangesAsync();
                        }
                    }
                    
                    //Pindahin file FinalMemo dari temp
                    if (form.DetailUploadList != null)
                    {
                        foreach (var item in form.DetailUploadList)
                        {
                            UploadNasabah detailUpload = Mapper.Map<UploadNasabah>(item);
                            ctx.UploadNasabahSet.Add(detailUpload);
                        }
                        await ctx.SaveChangesAsync();

                        foreach (var file in Directory.GetFiles(Server.MapPath(_attachmentSPNasabahTemp)))
                        {
                            System.IO.File.Copy(file, Path.Combine(Server.MapPath(_attachmentSPNasabah), Path.GetFileName(file)), true);
                            System.IO.File.Delete(file);
                        }
                    }
                    //20190117, jeni, END
                    return JsonSuccess("Update Success");
                }
            });
        }

        //public async Task<JsonResult> Approve(EnquirytabunganViewModel form)
        //{
        //    return await ExecuteFaultHandledOperationAsync(async () =>
        //    {
        //        using (var ctx = new SqlFundingDbContext())
        //        {
        //            var existingModel = ctx.EnquiryTabunganInputSet.Find(form.NoRekening);
        //            if (existingModel == null)
        //            {
        //                return JsonError("Data Tidak Ditemukan di database!");
        //            }

        //            //jika file final memo diganti
        //            //if (existingModel.FinalMemo != form.FinalMemo)
        //            //{
        //            //    if (!string.IsNullOrEmpty(form.FinalMemo))
        //            //    {
        //            //        foreach (var file in Directory.GetFiles(Server.MapPath(_finalMemoDirTemp)))
        //            //        {
        //            //            System.IO.File.Copy(file, Path.Combine(Server.MapPath(_finalMemoDir), Path.GetFileName(file)), true);
        //            //            System.IO.File.Delete(file); //delete file temp
        //            //            if (!string.IsNullOrEmpty(existingModel.FinalMemo))
        //            //            {
        //            //                System.IO.File.Delete(Path.Combine(Server.MapPath(_finalMemoDir), existingModel.FinalMemo)); //delete file sebelumnya
        //            //            }
        //            //        }
        //            //    }
        //            //}
        //            Mapper.Map(form, existingModel);
        //            if (existingModel.StatusData != StatusData.Approved)
        //            {
        //                existingModel.SetApproveByCurrentUser();
        //                existingModel.StatusData = StatusData.Approved;
        //                existingModel.SetUpdateByCurrentUser();
        //            }
        //            await ctx.SaveChangesAsync();

        //            return JsonSuccess("Update Success"); 
        //        }
        //    });
        //}

        public JsonResult GetDataKodePromosi(string promotionCode)
        {
            //DetailBarang model = Mapper.Map<DetailBarang>(promotionCode);
            using (var ctx = new SqlFundingDbContext())
            {
                Katalog model = ctx.KatalogSet.Where(x => x.Kode_Promo == promotionCode).FirstOrDefault();
                if (model == null)
                    return JsonError("Data Tidak Ditemukan di database!");

                return JsonSuccess(model);
            }
            //return JsonSuccess(model);
        }

        public JsonResult UploadSPNasabah(string namafile)
        {
            System.IO.DirectoryInfo di = new DirectoryInfo(Server.MapPath(_attachmentSPNasabahTemp));
            if (!String.IsNullOrWhiteSpace(namafile))
            {
                System.IO.FileInfo file2 = new FileInfo(Server.MapPath(_attachmentSPNasabahTemp+namafile));
                file2.Delete();   
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
                        string nameAndLocation = _attachmentSPNasabahTemp + filename;
                        fileContent.SaveAs(Server.MapPath(nameAndLocation));
                        break;
                    }
                }
            }
            catch (RetryLimitExceededException /* dex */)
            {
                return JsonError("Unable to upload Attachment SP Nasabah. Try again, and if the problem persists see your system administrator.");
            }
            return JsonSuccess(filename);
        }

        //20200710, eka, BEGIN
        public JsonResult UploadPenyimpangan(string namafile)
        {
            System.IO.DirectoryInfo di = new DirectoryInfo(Server.MapPath(_attachmentPenyimpanganTemp));
            if (!String.IsNullOrWhiteSpace(namafile))
            {
                System.IO.FileInfo file2 = new FileInfo(Server.MapPath(_attachmentPenyimpanganTemp + namafile));
                file2.Delete();
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
                        string nameAndLocation = _attachmentPenyimpanganTemp + filename;
                        fileContent.SaveAs(Server.MapPath(nameAndLocation));
                        break;
                    }
                }
            }
            catch (RetryLimitExceededException /* dex */)
            {
                //Log the error (uncomment dex variable name and add a line here to write a log.
                return JsonError("Unable to upload Attachment Memo Penyimpangan. Try again, and if the problem persists see your system administrator.");
            }
            return JsonSuccess(filename);
        }

        public async Task<JsonResult> GetDetailBarang(string KodePromosi)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    var id = await ctx.EnquiryTabunganInputSet.Select(x => x.DetailBarangId).ToArrayAsync();
                    var models = await ctx.KatalogSet
                        .Where(x => x.IsDelete == false && x.Kode_Promo == KodePromosi && !(id.Contains(x.Id)))
                        .OrderByDescending(x => x.CreateDate)
                        .ToListAsync();

                    IList<KatalogViewModel> list = Mapper.Map<IList<Katalog>, IList<KatalogViewModel>>(models);

                    return JsonSuccess(new { data = list.ToArray() });
                }
            });
        }
        //20200710, eka, END
    }
}