using AutoMapper;
using AutoMapper.QueryableExtensions;
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
    public class PurchaserequestController : CoreControllerBase
    {

        private ApplicationDbContext _applicationDbContext;
        private ICurrentUser _currentUser;
        private SqlHelper _query = new SqlHelper("SqlFundingConnection");
        private string _category = "Purchase";
        private string _attachmentMemoDireksi = "~/Files/purchaserequest/";
        private string _attachmentMemoDireksiTemp = "~/Files/purchaserequest/Temp/";


        public PurchaserequestController(ApplicationDbContext context, ICurrentUser currentUser)
        {
            _applicationDbContext = context;
            _currentUser = currentUser;
        }


        public ActionResult Index()
        {
            return View();
        }


        //[MyAuthorize(Roles = "Reward_SpvOtor,SupervisorReward,Reward_SpvGA,SupervisorProduk")]
        public ActionResult Authorize()
        {
            return View();
        }

        public ActionResult Rejected()
        {
            return View();
        }


        //[MyAuthorize(Roles = "Reward_SpvOtor,SupervisorReward,Reward_SpvGA,SupervisorProduk")]
        public async Task<JsonResult> Approve(EnquirytabunganViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                if (!ModelState.IsValid)
                    return JsonValidationError();

                using (var ctx = new SqlFundingDbContext())
                {
                    //var userMaster = ctx.MasterUserSet.FirstOrDefault(c => c.ApplicationUserId == _currentUser.User.Id && c.IsDelete == false);

                    var target = ctx.EnquiryTabunganInputSet.FirstOrDefault(c => c.Id == form.Id);
                    target.StatusData2 = StatusData.Approved;
                    //20190114, jeni, BEGIN
                    //target.StatusData = StatusData.None;
                    //20190114, jeni, END
                    target.ApproveBy2 = _currentUser.User.Id;
                    target.ApproveDate2 = DateTime.Now;
                    await ctx.SaveChangesAsync();

                    //NotificationLib.sendNotifikasi("All GA", form.Cabang, form.PRId, form.PRDate, "Purchase Request (PR)", "Pembuatan Purchase Order", "Purchaseorder/index");

                    //ctx.SendEmail_MyFunding("GA PO Staff", form.PRId, form.Cabang, Convert.ToDateTime(form.PRDate), "Purchase Request", "Pembuatan Purchase Order",
                    
                    //UNCOMMENT ABIS TESTING
                    //ctx.SendEmail_MyFunding("After Authorize Purchase Request", form.PRId, form.Cabang, Convert.ToDateTime(form.PRDate), "Purchase Request", "Pembuatan Purchase Order",
                    //    string.Format("http://{0}{1}/{2}", Request.Url.Host, Request.ApplicationPath, "PurchaseOrder/index"));
                    
                    return JsonSuccess("Approve Success");
                }
            });
        }


        //[MyAuthorize(Roles = "Reward_SpvOtor,SupervisorReward,Reward_SpvGA,SupervisorProduk")]
        public async Task<JsonResult> Reject(EnquirytabunganViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                //if (!ModelState.IsValid)
                //    return JsonValidationError();

                using (var ctx = new SqlFundingDbContext())
                {
                    var target = ctx.EnquiryTabunganInputSet.FirstOrDefault(c => c.Id == form.Id);
                    if (target == null)
                        return JsonError("Data tidak ada di database!");

                    //ctx.EnquiryTabunganInputSet.Remove(target);
                    //20190114, jeni, BEGIN
                    //target.PRDate = null;
                    //target.PRId = null;
                    //target.StatusData = StatusData.Rejected;
                    target.StatusData2 = StatusData.Rejected;
                    target.RejectBy2 = _currentUser.User.Id;
                    target.RejectDate2 = DateTime.Now;
                    target.RejectReason2 = form.RejectReason2;
                    //target.RejectDate = DateTime.Now;
                    //20190114, jeni, END
                    await ctx.SaveChangesAsync();

                    //UNCOMMENT ABIS TESTING
                    //ctx.SendEmailReject_MyFunding("After Reject Purchase Request", form.DraftPRId, form.Cabang, Convert.ToDateTime(form.DraftPRDate), "Draft Purchase Request (DPR)", "Purchase Request Rejected",
                    //    string.Format("http://{0}{1}/{2}", Request.Url.Host, Request.ApplicationPath, "PurchaseRequest/index"));

                    return JsonSuccess("Data Rejected");
                }
            });
        }

        //20190115, jeni, BEGIN
        public async Task<JsonResult> RejecttoDpr(EnquirytabunganViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                //if (!ModelState.IsValid)
                //    return JsonValidationError();

                using (var ctx = new SqlFundingDbContext())
                {
                    var target = ctx.EnquiryTabunganInputSet.FirstOrDefault(c => c.Id == form.Id);
                    if (target == null)
                        return JsonError("Data tidak ada di database!");

                    target.ApproveBy = null;
                    target.ApproveDate = null;
                    target.StatusData = StatusData.Rejected;
                    target.RejectBy = _currentUser.User.Id;
                    target.RejectDate = DateTime.Now;
                    target.RejectReason = form.RejectReason;
                    target.StatusData2 = StatusData.None;
                    target.RejectBy2 = null;
                    target.RejectDate2 = null;
                    target.RejectReason2 = null;
                    await ctx.SaveChangesAsync();

                    //UNCOMMENT ABIS TESTING
                    ctx.SendEmailReject_MyFunding("After Reject Purchase Request", form.DraftPRId, form.Cabang, Convert.ToDateTime(form.DraftPRDate), "Draft Purchase Request (DPR)", "Purchase Request Rejected",
                        string.Format("http://{0}{1}/{2}", Request.Url.Host, Request.ApplicationPath, "PurchaseRequest/index"));

                    return JsonSuccess("Data Rejected");
                }
            });
        }
        //20190115, jeni, END

        //[MyAuthorize(Roles = "Reward_SpvOtor,SupervisorReward,Reward_SpvGA,SupervisorProduk")]
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

                    target.StatusData2 = StatusData.Deleted;
                    await ctx.SaveChangesAsync();

                    return JsonSuccess("Data Deleted");
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

        //20200831,Eka,Begin
        [AllowAnonymous]
        public async Task<JsonResult> GetPage(string NoDraft, string NoRekening, JenisTabungan Jenistabungan, string Cabang, int pageNumber = 1, int pageSize = 10, string sortBy = "DraftPRId", string sortDirection = "desc")
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    int totalItems = await Task.FromResult<int>(ctx.PurchaserequestSet(NoDraft, NoRekening, (int)Jenistabungan, Cabang).Count());

                    var models = await Task.FromResult<IEnumerable<EnquirytabunganViewModel>>(ctx.PurchaserequestSet(NoDraft, NoRekening, (int)Jenistabungan, Cabang)
                        .AsQueryable()
                        .OrderBy(sortBy + " " + sortDirection)
                        .Skip((pageNumber - 1) * pageSize)
                        .Take(pageSize));

                    IList<EnquirytabunganViewModel> list = models.ToList();

                    return JsonSuccess(new { totalItems = totalItems, data = list.ToArray() });
                }
            });
        }

        [AllowAnonymous]
        public async Task<JsonResult> GetAll(string NoDraft, string NoRekening, JenisTabungan Jenistabungan, string Cabang, int pageNumber = 1, int pageSize = 10, string sortBy = "DraftPRId", string sortDirection = "desc")
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    int totalItems = await Task.FromResult<int>(ctx.PurchaserequestSet(NoDraft, NoRekening, (int)Jenistabungan, Cabang).Count());

                    var models = await Task.FromResult<IEnumerable<EnquirytabunganViewModel>>(ctx.PurchaserequestSet(NoDraft, NoRekening, (int)Jenistabungan, Cabang)
                        .AsQueryable()
                        .OrderBy(sortBy + " " + sortDirection)
                        //.Skip((pageNumber - 1) * pageSize)
                        //.Take(pageSize)
                        );

                    IList<EnquirytabunganViewModel> list = models.ToList();

                    return JsonSuccess(new { totalItems = totalItems, data = list.ToArray() });
                }
            });
        }

        [AllowAnonymous]
        public async Task<JsonResult> AuthorizeGetPage(DateTime? Tanggal, JenisTabungan Jenistabungan, string Cabang, string NoRekening, string No, int pageNumber = 1, int pageSize = 10, string sortBy = "PRId", string sortDirection = "desc")
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    int totalItems = await Task.FromResult<int>(ctx.AuthorizepurchaserequestSet(Tanggal, (int)Jenistabungan, Cabang, NoRekening, No)
                        .Count());

                    var models = await Task.FromResult<IEnumerable<EnquirytabunganViewModel>>(ctx.AuthorizepurchaserequestSet(Tanggal, (int)Jenistabungan, Cabang, NoRekening, No)
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
                        }
                    }

                    return JsonSuccess(new { totalItems = totalItems, data = list.ToArray() });
                }
            });
        }

        [AllowAnonymous]
        public async Task<JsonResult> AuthorizeGetAll(DateTime? Tanggal, JenisTabungan Jenistabungan, string Cabang, string NoRekening, string No, int pageNumber = 1, int pageSize = 10, string sortBy = "PRId", string sortDirection = "desc")
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    int totalItems = await Task.FromResult<int>(ctx.AuthorizepurchaserequestSet(Tanggal, (int)Jenistabungan, Cabang, NoRekening, No)
                        .Count());

                    var models = await Task.FromResult<IEnumerable<EnquirytabunganViewModel>>(ctx.AuthorizepurchaserequestSet(Tanggal, (int)Jenistabungan, Cabang, NoRekening, No)
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
                        }
                    }

                    return JsonSuccess(new { totalItems = totalItems, data = list.ToArray() });
                }
            });
        }

        [AllowAnonymous]
        public async Task<JsonResult> RejectGetPage(DateTime? Tanggal, JenisTabungan Jenistabungan, string Cabang, string NoRekening, string No, int pageNumber = 1, int pageSize = 10, string sortBy = "PRId", string sortDirection = "desc")
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    int totalItems = await Task.FromResult<int>(ctx.RejectpurchaserequestSet(Tanggal, (int)Jenistabungan, Cabang, NoRekening, No)
                        .Count());

                    var models = await Task.FromResult<IEnumerable<EnquirytabunganViewModel>>(ctx.RejectpurchaserequestSet(Tanggal, (int)Jenistabungan, Cabang, NoRekening, No)
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
                        }
                    }

                    return JsonSuccess(new { totalItems = totalItems, data = list.ToArray() });
                }
            });
        }

        [AllowAnonymous]
        public async Task<JsonResult> RejectGetAll(DateTime? Tanggal, JenisTabungan Jenistabungan, string Cabang, string NoRekening, string No, int pageNumber = 1, int pageSize = 10, string sortBy = "PRId", string sortDirection = "desc")
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    int totalItems = await Task.FromResult<int>(ctx.RejectpurchaserequestSet(Tanggal, (int)Jenistabungan, Cabang, NoRekening, No)
                        .Count());

                    var models = await Task.FromResult<IEnumerable<EnquirytabunganViewModel>>(ctx.RejectpurchaserequestSet(Tanggal, (int)Jenistabungan, Cabang, NoRekening, No)
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
                        }
                    }

                    return JsonSuccess(new { totalItems = totalItems, data = list.ToArray() });
                }
            });
        }
        //20200831,Eka END
        [AllowAnonymous]
        public async Task<JsonResult> GetPurchaseRequest(string PurchaseRequestNo)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    var models = ctx.EnquiryTabunganInputSet.Where(x => x.PRId == PurchaseRequestNo).ToList();

                    IList<EnquirytabunganViewModel> list = Mapper.Map<IList<EnquiryTabunganInput>, IList<EnquirytabunganViewModel>>(models);

                    if (list != null)
                    {
                        foreach (var item in list)
                        {
                            item.DetailBarangList = Mapper.Map<List<DetailBarang>>(await ctx.DetailBarangSet.Where(x => x.EnquiryId == item.Id).ToListAsync());
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
                    var existingModel = ctx.EnquiryTabunganInputSet.Find(form.Id);
                    Mapper.Map(form, existingModel);
                    if (existingModel.StatusData == StatusData.Approved)
                        existingModel.SetUpdateByCurrentUser();

                    model.PRId = await GenerateNoPurchase();
                    await ctx.SaveChangesAsync();
                    //string url = Request.Url.ToString();
                    //NotificationLib.sendNotifikasi("Head GA",form.Cabang, form.DraftPRId, form.DraftPRDate, "Purchase Request", "Authorize Puchase Request", "Purchaserequest/Authorize");
                    //ctx.SendEmail_MyFunding("Head GA", form.PRId, form.Cabang, Convert.ToDateTime(form.PRDate), "Purchase Request", "Authorize Purchase Request",  
                    //ctx.SendEmail_MyFunding("FProduct Head", form.PRId, form.Cabang, Convert.ToDateTime(form.PRDate), "Purchase Request", "Authorize Purchase Request", 
                    ctx.SendEmail_MyFunding("After Add Purchase Request", form.PRId, form.Cabang, Convert.ToDateTime(form.PRDate), "Purchase Request", "Authorize Purchase Request",      
                        string.Format("http://{0}{1}/{2}", Request.Url.Host, Request.ApplicationPath, "PurchaseRequest/Authorize") );
                        //"http://10.10.2.30/MyFunding/Purchaserequest/Authorize");


                    if (!string.IsNullOrEmpty(form.AttachmentMemoDireksi))
                        foreach (var file in Directory.GetFiles(Server.MapPath(_attachmentMemoDireksiTemp)))
                        {
                            System.IO.File.Copy(file, Path.Combine(Server.MapPath(_attachmentMemoDireksi), Path.GetFileName(file)), true);
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
                    //if (existingModel.FinalMemo != form.FinalMemo)
                    //{
                    //    if (!string.IsNullOrEmpty(form.FinalMemo))
                    //    {
                    //        foreach (var file in Directory.GetFiles(Server.MapPath(_finalMemoDirTemp)))
                    //        {
                    //            System.IO.File.Copy(file, Path.Combine(Server.MapPath(_finalMemoDir), Path.GetFileName(file)), true);
                    //            System.IO.File.Delete(file); //delete file temp
                    //            if (!string.IsNullOrEmpty(existingModel.FinalMemo))
                    //            {
                    //                System.IO.File.Delete(Path.Combine(Server.MapPath(_finalMemoDir), existingModel.FinalMemo)); //delete file sebelumnya
                    //            }
                    //        }
                    //    }
                    //}
                    if (existingModel.AttachmentMemoDireksi != form.AttachmentMemoDireksi)
                        if (!string.IsNullOrEmpty(form.AttachmentMemoDireksi))
                            foreach (var file in Directory.GetFiles(Server.MapPath(_attachmentMemoDireksi)))
                            {
                                System.IO.File.Copy(file, Path.Combine(Server.MapPath(_attachmentMemoDireksi), Path.GetFileName(file)), true);
                                System.IO.File.Delete(file); //delete file temp
                                if (!string.IsNullOrEmpty(existingModel.AttachmentMemoDireksi))
                                {
                                    System.IO.File.Delete(Path.Combine(Server.MapPath(_attachmentMemoDireksi), existingModel.AttachmentMemoDireksi)); //delete file sebelumnya
                                }
                            }

                    Mapper.Map(form, existingModel);
                    if (existingModel.StatusData != StatusData.Approved)
                    {
                        //21090116, jeni, BEGIN
                        //existingModel.StatusData = StatusData.Edited;
                        existingModel.StatusData2 = StatusData.Edited;
                        existingModel.SetUpdateByCurrentUser();
                        existingModel.UpdateDate = DateTime.Now;
                        existingModel.RejectBy2 = null;
                        existingModel.RejectDate2 = null;
                        existingModel.RejectBy = null;
                        existingModel.RejectDate = null;
                        existingModel.ApproveBy = null;
                        existingModel.ApproveDate = null;
                        existingModel.ApproveBy2 = null;
                        existingModel.ApproveDate2 = null;
                        //20190116, jeni, END
                    }
                    await ctx.SaveChangesAsync();

                    return JsonSuccess("Update Success");
                }
            });
        }

        //public async Task<JsonResult> UpdateDetailBarang(int id)
        //{
        //    return await ExecuteFaultHandledOperationAsync(async () =>
        //    {
        //        using (var ctx = new SqlFundingDbContext())
        //        {
        //            var models = await ctx.DetailBarangSet
        //                .Where(x => x.IsDelete == false && x.EnquiryId == id)
        //                .OrderByDescending(x => x.CreateDate)
        //                .ToListAsync();

        //            IList<DetailbarangViewModel> list = Mapper.Map<IList<DetailBarang>, IList<DetailbarangViewModel>>(models);

        //            return JsonSuccess(new { data = list.ToArray() });
        //        }
        //    });
        //}

        public async Task<JsonResult> updated(DetailbarangViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    var existingModel = ctx.DetailBarangSet.Find(form.Id);
                    if (existingModel == null)
                        return JsonError("Data Tidak Ditemukan di database!");

                    //Mapper.Map(form, existingModel);
                    //if (existingModel.StatusData != StatusData.Approved)
                    //{
                    //    //21090116, jeni, BEGIN
                    //    //existingModel.StatusData = StatusData.Edited;
                    //    existingModel.StatusData2 = StatusData.Edited;
                    //    existingModel.SetUpdateByCurrentUser();
                    //    existingModel.UpdateDate = DateTime.Now;
                    //    existingModel.RejectBy2 = null;
                    //    existingModel.RejectDate2 = null;
                    //    existingModel.RejectBy = null;
                    //    existingModel.RejectDate = null;
                    //    existingModel.ApproveBy = null;
                    //    existingModel.ApproveDate = null;
                    //    existingModel.ApproveBy2 = null;
                    //    existingModel.ApproveDate2 = null;
                    //    //20190116, jeni, END
                    //}
                    Mapper.Map(form, existingModel);

                    existingModel.Quantity = form.Quantity;


                    await ctx.SaveChangesAsync();


                    return JsonSuccess("Update Success");
                }
            });
        }

        public async Task<JsonResult> Delete(EnquirytabunganViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    var target = ctx.EnquiryTabunganInputSet.Find(form.NoRekening);
                    if (target == null)
                        return JsonError("Data Tidak Ditemukan di database!");

                    target.IsDelete = true;
                    target.StatusData = StatusData.Deleted;
                    await ctx.SaveChangesAsync();

                    EnquirytabunganViewModel updatedModel = ctx.EnquiryTabunganInputSet.Project().To<EnquirytabunganViewModel>().Single(x => x.NoRekening == form.NoRekening);

                    return JsonSuccess("Delete Success!");
                }
            });
        }


        public async Task<JsonResult> GetDetailBarang(int id)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    var models = await ctx.DetailBarangSet
                        .Where(x => x.IsDelete == false && x.EnquiryId == id)
                        .OrderByDescending(x => x.CreateDate)
                        .ToListAsync();

                    IList<DetailbarangViewModel> list = Mapper.Map<IList<DetailBarang>, IList<DetailbarangViewModel>>(models);

                    return JsonSuccess(new { data = list.ToArray() });
                }
            });
        }

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

        public JsonResult UploadMemoDireksi(string namafile)
        {
            System.IO.DirectoryInfo di = new DirectoryInfo(Server.MapPath(_attachmentMemoDireksiTemp));
            if (!String.IsNullOrWhiteSpace(namafile))
            {
                System.IO.FileInfo file2 = new FileInfo(Server.MapPath(_attachmentMemoDireksiTemp + namafile));
                file2.Delete();
            }
            //System.IO.DirectoryInfo di = new DirectoryInfo(Server.MapPath(_attachmentMemoDireksiTemp));
            //foreach (FileInfo file in di.GetFiles())
            //{
            //    file.Delete();
            //}

            string filename = string.Empty;
            try
            {
                foreach (string file in Request.Files)
                {
                    var fileContent = Request.Files[file];
                    if (fileContent != null && fileContent.ContentLength > 0)
                    {
                        filename = Guid.NewGuid() + "-" + fileContent.FileName;
                        string nameAndLocation = _attachmentMemoDireksiTemp + filename;
                        fileContent.SaveAs(Server.MapPath(nameAndLocation));
                        break;
                    }
                }
            }
            catch (RetryLimitExceededException /* dex */)
            {
                //Log the error (uncomment dex variable name and add a line here to write a log.
                return JsonError("Unable to upload Attachment Memo Direksi. Try again, and if the problem persists see your system administrator.");
            }
            return JsonSuccess(filename);
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