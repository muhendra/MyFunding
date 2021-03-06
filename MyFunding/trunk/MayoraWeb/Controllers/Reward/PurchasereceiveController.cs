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
using MyWeb.ViewModels.MyReward;
using MyWeb.ViewModels.Reward;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Linq;
using System.Linq.Dynamic;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace MyWeb.Controllers.Reward
{
    public class PurchasereceiveController : CoreControllerBase
    {

        private ApplicationDbContext _applicationDbContext;
        private ICurrentUser _currentUser;
        private SqlHelper _query = new SqlHelper("SqlFundingConnection");
        private string _category = "PurchaseReceive";


        public PurchasereceiveController(ApplicationDbContext context, ICurrentUser currentUser)
        {
            _applicationDbContext = context;
            _currentUser = currentUser;
        }


        public ActionResult Index()
        {
            return View();
        }


        public ActionResult Index2()
        {
            return View();
        }


        //[MyAuthorize(Roles = "SupervisorReward,Reward_SpvGA,SupervisorProduk")]
        public ActionResult Authorize()
        {
            return View();
        }

        public ActionResult History()
        {
            return View();
        }

        public ActionResult AuthorizeReceive()
        {
            return View();
        }


        //[MyAuthorize(Roles = "SupervisorReward,Reward_SpvGA,SupervisorProduk")]
        public async Task<JsonResult> Approve(PurchaseReceiveViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                if (!ModelState.IsValid)
                {
                    return JsonValidationError();
                }

                using (var ctx = new SqlFundingDbContext())
                {
                    var target = ctx.PurchaseReceiveSet.FirstOrDefault(c => c.Id == form.Id);
                    target.StatusData = StatusData.Approved;
                    target.ApproveBy = _currentUser.User.Id;
                    target.ApproveDate = DateTime.Now;
                    await ctx.SaveChangesAsync();

                    var cabang = ctx.PurchaseOrderSet.Where(x => x.Id == target.PurchaseOrderId).Select(x => x.EnquiryTabunganInput.Cabang).FirstOrDefault();
                    
                    //if (!String.IsNullOrWhiteSpace(form.PelunasanId))
                    //{
                    //    var Params2 = new object[] { 
                    //        new SqlParameter("@PRid", form.Id),
                    //    };
                    //    await _query.ExecNonQueryAsync("SP_STOP_AUTO_PECADANGAN @PRid", Params2);
                    //} 
                    var Params = new object[] { 
                        new SqlParameter("@id", form.Id),
                    };
                    await _query.ExecNonQueryAsync("SP_INSERTPAYMENTPELUNASAN @id", Params);
                    //NotificationLib.sendNotifikasi("All GA", target.PurchaseOrder.EnquiryTabunganInput.Cabang, form.PurchaseReceiveId, form.PurchaseReceiveDate, "Puchase Receive", "Pembuatan Delivery Order", "Deliveryorder/Index");

                    //ctx.SendEmail_MyFunding("All GA", form.PurchaseReceiveId, cabang, Convert.ToDateTime(form.PurchaseReceiveDate), "Pelunasan Payment", "Pembuatan Delivery Order",

                    //AKTIFIN SETELAH TESTING
                    //ctx.SendEmail_MyFunding("After Authorize Pelunasan Payment", form.PurchaseReceiveId, cabang, Convert.ToDateTime(form.PurchaseReceiveDate), "Pelunasan Payment", "Pembuatan Delivery Order",
                    //    string.Format("http://{0}{1}/{2}", Request.Url.Host, Request.ApplicationPath, "DeliveryOrder/Index"));

                    return JsonSuccess("Approve Success");
                }
            });
        }

        //[MyAuthorize(Roles = "SupervisorReward,Reward_SpvGA,SupervisorProduk")]
        public async Task<JsonResult> Reject(PurchaseReceiveViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                if (!ModelState.IsValid)
                {
                    return JsonValidationError();
                }

                using (var ctx = new SqlFundingDbContext())
                {
                    var target = ctx.PurchaseReceiveSet.FirstOrDefault(c => c.Id == form.Id);
                    if (target == null)
                    {
                        return JsonError("Data tidak ada di database!");
                    }
                    
                    target.PelunasanId = null;
                    target.JurnalValueDate = null;
                    //ctx.PurchaseReceiveSet.Remove(target);
                    //target.PODate = null;
                    //target.POId = null;
                    await ctx.SaveChangesAsync();

                    var existingJurnalPelunasan = ctx.JurnalPelunasanSet.Where(c => c.PCRId == target.Id);
                    if (existingJurnalPelunasan != null)
                    {
                        List<JurnalPelunasan> JurnalPelunasanList = Mapper.Map<List<JurnalPelunasan>>(existingJurnalPelunasan);
                        ctx.JurnalPelunasanSet.RemoveRange(JurnalPelunasanList);
                        await ctx.SaveChangesAsync();
                    }

                    var cabang = ctx.PurchaseOrderSet.Where(x => x.Id == target.PurchaseOrderId).Select(x => x.EnquiryTabunganInput.Cabang).FirstOrDefault();

                    ctx.SendEmailReject_MyFunding("After Reject Pelunasan Payment", form.PoId, cabang, Convert.ToDateTime(form.PoDate), "Purchase Order", "Pelunasan Payment Rejected",
                            string.Format("http://{0}{1}/{2}", Request.Url.Host, Request.ApplicationPath, "PurchaseReceive/index2"));
                }
                return JsonSuccess("Data Rejected");
            });
        }

        public async Task<JsonResult> ApproveReceive(PurchaseReceiveViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                if (!ModelState.IsValid)
                {
                    return JsonValidationError();
                }

                using (var ctx = new SqlFundingDbContext())
                {
                    var target = ctx.PurchaseReceiveSet.FirstOrDefault(c => c.Id == form.Id);
                    target.StatusData = StatusData.Approved;
                    target.ApproveReceiveBy = _currentUser.User.Id;
                    target.ApproveReceiveDateTime = DateTime.Now;
                    await ctx.SaveChangesAsync();

                    var cabang = ctx.PurchaseOrderSet.Where(x => x.Id == target.PurchaseOrderId).Select(x => x.EnquiryTabunganInput.Cabang).FirstOrDefault();

                    //ctx.SendEmail_MyFunding("All Product", form.PurchaseReceiveId, cabang, Convert.ToDateTime(form.PurchaseReceiveDate), "Purchase Receive", "Pembuatan Jurnal Pelunasan",
                    ctx.SendEmail_MyFunding("After Authorize Purchase Receive", form.PurchaseReceiveId, cabang, Convert.ToDateTime(form.PurchaseReceiveDate), "Purchase Receive", "Pembuatan Jurnal Pelunasan",
                        string.Format("http://{0}{1}/{2}", Request.Url.Host, Request.ApplicationPath, "PurchaseReceive/Index2"));

                    return JsonSuccess("Approve Success");
                }
            });
        }


        //[MyAuthorize(Roles = "SupervisorReward,Reward_SpvGA,SupervisorProduk")]
        public async Task<JsonResult> RejectReceive(PurchaseReceiveViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                if (!ModelState.IsValid)
                {
                    return JsonValidationError();
                }

                using (var ctx = new SqlFundingDbContext())
                {
                    var target = ctx.PurchaseReceiveSet.FirstOrDefault(c => c.Id == form.Id);
                    if (target == null)
                    {
                        return JsonError("Data tidak ada di database!");
                    }

                    var cabang = ctx.PurchaseOrderSet.Where(x => x.Id == target.PurchaseOrderId).Select(x => x.EnquiryTabunganInput.Cabang).FirstOrDefault();

                    //target.IsDelete = true;
                    //target.PurchaseReceiveId = null;
                    //target.PurchaseReceiveDate = null;

                    ctx.PurchaseReceiveSet.Remove(target);

                    await ctx.SaveChangesAsync();                    
                    ctx.SendEmailReject_MyFunding("After Reject Purchase Receive", form.PoId, cabang, Convert.ToDateTime(form.PoDate), "Purchase Order", "Purchase Receive Rejected",
                            string.Format("http://{0}{1}/{2}", Request.Url.Host, Request.ApplicationPath, "PurchaseReceive/index"));
       
                }
                return JsonSuccess("Data Rejected");

            });
        }


        private async Task<string> GenerateNoPurchase()
        {
            string noPurchase = (string)await _query.ExecScalarProcAsync("SP_GENERATE_NOMOR", "@Category", _category);
            return noPurchase;
        }

        private async Task<string> GenerateNoPelunasan()
        {
            string noPelunasan = (string)await _query.ExecScalarProcAsync("SP_GENERATE_NOMOR", "@Category", "Pelunasan");
            return noPelunasan;
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
        public async Task<JsonResult> GetNoPelunasan()
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                string noPelunasan = await GenerateNoPelunasan();
                return JsonSuccess(noPelunasan);
            });
        }


        [AllowAnonymous]
        public async Task<JsonResult> GetPage(string No, string NoRekening, JenisTabungan Jenistabungan, string Cabang, DateTime? Tanggal, string Nopr, int pageNumber = 1, int pageSize = 10, string sortBy = "PoId", string sortDirection = "desc")
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    int totalItems = await Task.FromResult<int>(ctx.PurchaseReceiveViewSet(No, NoRekening, (int)Jenistabungan, Cabang, Tanggal, Nopr).Count());

                    var models = await Task.FromResult<IEnumerable<PurchaseReceiveViewModel>>(ctx.PurchaseReceiveViewSet(No, NoRekening, (int)Jenistabungan, Cabang, Tanggal, Nopr).AsQueryable()
                    .OrderBy(sortBy + " " + sortDirection)
                    .Skip((pageNumber - 1) * pageSize)
                    .Take(pageSize));
                    IList<PurchaseReceiveViewModel> list = models.ToList();
                    return JsonSuccess(new { totalItems = totalItems, data = list.ToArray() });
                }
            });
        }


        [AllowAnonymous]
        public async Task<JsonResult> PelunasanGetPage(string No, string Nopr, JenisTabungan Jenistabungan, string Cabang, DateTime? Tanggal, DateTime? Tanggalpr, int pageNumber = 1, int pageSize = 10, string sortBy = "PoId", string sortDirection = "desc")
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    int totalItems = await Task.FromResult<int>(ctx.PelunasanSet(No, Nopr, (int)Jenistabungan, Cabang, Tanggal, Tanggalpr).Count());

                    var models = await Task.FromResult<IEnumerable<PurchaseReceiveViewModel>>(ctx.PelunasanSet(No, Nopr, (int)Jenistabungan, Cabang, Tanggal, Tanggalpr).AsQueryable()
                    .OrderBy(sortBy + " " + sortDirection)
                    .Skip((pageNumber - 1) * pageSize)
                    .Take(pageSize));

                    IList<PurchaseReceiveViewModel> list = models.ToList();

                    return JsonSuccess(new { totalItems = totalItems, data = list.ToArray() });
                }
            });
        }


        [AllowAnonymous]
        public async Task<JsonResult> AuthorizeGetPage(string Cabang, DateTime? Tanggal, string No, string NoPo, DateTime? Tanggalpo, int pageNumber = 1, int pageSize = 10, string sortBy = "PurchaseReceiveId", string sortDirection = "desc")
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    int totalItems = await Task.FromResult<int>(ctx.AuthorizepurchasereceiveSet(Cabang, Tanggal, No, NoPo, Tanggalpo).Count());

                    var models = await Task.FromResult<IEnumerable<PurchaseReceiveViewModel>>(ctx.AuthorizepurchasereceiveSet(Cabang, Tanggal, No, NoPo, Tanggalpo).AsQueryable()
                    .OrderBy(sortBy + " " + sortDirection)
                    .Skip((pageNumber - 1) * pageSize)
                    .Take(pageSize));

                    IList<PurchaseReceiveViewModel> list = models.ToList();

                    if (list != null)
                    {
                        foreach (var item in list)
                        {
                            item.JurnalPelunasanList = Mapper.Map<List<JurnalPelunasan>>(await ctx.JurnalPelunasanSet.Where(x => x.PCRId == item.Id).ToListAsync());
                        }
                    }

                    return JsonSuccess(new { totalItems = totalItems, data = list.ToArray() });
                }
            });
        }

        //20200811,EKA,BEGIN
        [AllowAnonymous]
        public async Task<JsonResult> HistoryGetPage(string Cabang, DateTime? Tanggal, string No, string NoPo, DateTime? Tanggalpo, int pageNumber = 1, int pageSize = 10, string sortBy = "PurchaseReceiveId", string sortDirection = "desc")
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    int totalItems = await Task.FromResult<int>(ctx.HistorypurchasereceiveSet(Cabang, Tanggal, No, NoPo, Tanggalpo).Count());

                    var models = await Task.FromResult<IEnumerable<PurchaseReceiveViewModel>>(ctx.HistorypurchasereceiveSet(Cabang, Tanggal, No, NoPo, Tanggalpo).AsQueryable()
                    .OrderBy(sortBy + " " + sortDirection)
                    .Skip((pageNumber - 1) * pageSize)
                    .Take(pageSize));

                    IList<PurchaseReceiveViewModel> list = models.ToList();

                    if (list != null)
                    {
                        foreach (var item in list)
                        {
                            item.JurnalPelunasanList = Mapper.Map<List<JurnalPelunasan>>(await ctx.JurnalPelunasanSet.Where(x => x.PCRId == item.Id).ToListAsync());
                        }
                    }

                    return JsonSuccess(new { totalItems = totalItems, data = list.ToArray() });
                }
            });
        }

        [AllowAnonymous]
        public async Task<JsonResult> HistoryGetAll(string Cabang, DateTime? Tanggal, string No, string NoPo, DateTime? Tanggalpo, int pageNumber = 1, int pageSize = 10, string sortBy = "PurchaseReceiveId", string sortDirection = "desc")
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    int totalItems = await Task.FromResult<int>(ctx.HistorypurchasereceiveSet(Cabang, Tanggal, No, NoPo, Tanggalpo).Count());

                    var models = await Task.FromResult<IEnumerable<PurchaseReceiveViewModel>>(ctx.HistorypurchasereceiveSet(Cabang, Tanggal, No, NoPo, Tanggalpo).AsQueryable()
                    .OrderBy(sortBy + " " + sortDirection)
                    //.Skip((pageNumber - 1) * pageSize)
                    //.Take(pageSize)
                    );

                    IList<PurchaseReceiveViewModel> list = models.ToList();

                    if (list != null)
                    {
                        foreach (var item in list)
                        {
                            item.JurnalPelunasanList = Mapper.Map<List<JurnalPelunasan>>(await ctx.JurnalPelunasanSet.Where(x => x.PCRId == item.Id).ToListAsync());
                        }
                    }

                    return JsonSuccess(new { totalItems = totalItems, data = list.ToArray() });
                }
            });
        }
        //20200811,EKA,END

        [AllowAnonymous]
        public async Task<JsonResult> AuthorizeReceiveGetPage(string Cabang, DateTime? Tanggal, string No, string NoPo, DateTime? Tanggalpo, JenisTabungan Jenistabungan, int pageNumber = 1, int pageSize = 10, string sortBy = "PurchaseReceiveId", string sortDirection = "desc")
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    int totalItems = await Task.FromResult<int>(ctx.AuthorizeReceiveSet(Cabang, Tanggal, No, NoPo, Tanggalpo, (int)Jenistabungan).Count());

                    var models = await Task.FromResult<IEnumerable<PurchaseReceiveViewModel>>(ctx.AuthorizeReceiveSet(Cabang, Tanggal, No, NoPo, Tanggalpo, (int)Jenistabungan).AsQueryable()
                    .OrderBy(sortBy + " " + sortDirection)
                    .Skip((pageNumber - 1) * pageSize)
                    .Take(pageSize));
                    IList<PurchaseReceiveViewModel> list = models.ToList();
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
                    var models = await ctx.EnquiryTabunganInputSet
                               .Where(x => x.IsDelete == false)
                               .OrderByDescending(x => x.CreateDate)
                               .ToListAsync();

                    IList<EnquirytabunganinputViewModel> list = Mapper.Map<IList<EnquiryTabunganInput>, IList<EnquirytabunganinputViewModel>>(models);
                    return JsonSuccess(new { data = list.ToArray() });
                }
            });
        }
        

        public async Task<JsonResult> Add(PurchaseReceiveViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                if (!ModelState.IsValid)
                {
                    return JsonValidationError();
                }
                PurchaseReceive model = Mapper.Map<PurchaseReceive>(form);
                //List<JurnalPelunasan> details = Mapper.Map<List<JurnalPelunasan>>(form.JurnalPelunasanList);
                using (var ctx = new SqlFundingDbContext())
                {
                    model.PurchaseReceiveId = await GenerateNoPurchase();
                    ctx.PurchaseReceiveSet.Add(model);
                    var cabang = ctx.PurchaseOrderSet.Where(x => x.Id == form.PurchaseOrderId).Select(x => x.EnquiryTabunganInput.Cabang).FirstOrDefault();
                    await ctx.SaveChangesAsync();
                    
                    //NotificationLib.sendNotifikasi("All GA", cabang, form.PurchaseReceiveId, form.PurchaseReceiveDate, "Puchase Receive", "Pembuatan Jurnal Pelunasan", "Purchasereceive/Index2");

                    //ctx.SendEmail_MyFunding("Head GA", form.PurchaseReceiveId, cabang, Convert.ToDateTime(form.PurchaseReceiveDate), "Purchase Receive", "Authorize Purchase Receive",

                    //AKTIFIN SETELAH TESTING
                    //ctx.SendEmail_MyFunding("After Add Purchase Receive", form.PurchaseReceiveId, cabang, Convert.ToDateTime(form.PurchaseReceiveDate), "Purchase Receive", "Authorize Purchase Receive",
                    //    string.Format("http://{0}{1}/{2}", Request.Url.Host, Request.ApplicationPath, "PurchaseReceive/AuthorizeReceive"));

                    return JsonSuccess(model);
                }
            });
        }


        public async Task<JsonResult> Update(PurchaseReceiveViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    var existingModel = ctx.PurchaseReceiveSet.Find(form.Id);
                    if (existingModel == null)
                    {
                        return JsonError("Data Tidak Ditemukan di database!");
                    }

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
                    Mapper.Map(form, existingModel);
                    if (existingModel.StatusData != StatusData.Approved)
                    {
                        existingModel.StatusData = StatusData.Edited;
                        existingModel.SetUpdateByCurrentUser();
                    }
                    await ctx.SaveChangesAsync();

                    return JsonSuccess("Update Success");
                }
            });
        }

        public async Task<JsonResult> Edit(PurchaseReceiveViewModel form) //buat save pelunasan
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    var existingModel = ctx.PurchaseReceiveSet.Find(form.Id);
                    if (existingModel == null)
                    {
                        return JsonError("Data Tidak Ditemukan di database!");
                    }
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

                    if (form.JurnalPelunasanList != null)
                    {
                        var existingPurchaseReceive = ctx.PurchaseReceiveSet.FirstOrDefault(c => c.Id == form.Id);
                        if (existingPurchaseReceive != null)
                        {
                            foreach (var item in form.JurnalPelunasanList)
                            {
                                JurnalPelunasan jurnalPelunasan = Mapper.Map<JurnalPelunasan>(item);
                                jurnalPelunasan.PCRId = existingPurchaseReceive.Id;
                                jurnalPelunasan.POId = existingPurchaseReceive.PurchaseOrderId;
                                ctx.JurnalPelunasanSet.Add(jurnalPelunasan);
                                await ctx.SaveChangesAsync();
                            }
                        }
                    }
                    
                    Mapper.Map(form, existingModel);
                    existingModel.PelunasanId = await GenerateNoPelunasan();
                    await ctx.SaveChangesAsync();

                    var Cabang = ctx.PurchaseOrderSet.Where(x => x.Id == form.PurchaseOrderId).Select(x => x.EnquiryTabunganInput.Cabang).FirstOrDefault();
                    //NotificationLib.sendNotifikasi("Head GA", Cabang, form.PurchaseReceiveId, form.PurchaseReceiveDate, "Purchase Recieve", "Authorize Purchase Recieve", "Purchasereceive/Authorize");
                    //ctx.SendEmail_MyFunding("Head Product", form.PelunasanId, Cabang, Convert.ToDateTime(form.PurchaseReceiveDate), "Pelunasan Payment", "Authorize Pelunasan Payment",
                    //AKTIFIN SETELAH TESTING
                    //ctx.SendEmail_MyFunding("After Add Pelunasan Payment", form.PelunasanId, Cabang, Convert.ToDateTime(form.PurchaseReceiveDate), "Pelunasan Payment", "Authorize Pelunasan Payment",
                    //    string.Format("http://{0}{1}/{2}", Request.Url.Host, Request.ApplicationPath, "PurchaseReceive/Authorize"));
                    
                    return JsonSuccess(existingModel.PelunasanId);
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
                    {
                        return JsonError("Data Tidak Ditemukan di database!");
                    }
                    target.IsDelete = true;
                    target.StatusData = StatusData.Deleted;
                    await ctx.SaveChangesAsync();

                    EnquirytabunganViewModel updatedModel = ctx.EnquiryTabunganInputSet.Project().To<EnquirytabunganViewModel>().Single(x => x.NoRekening == form.NoRekening);

                    return JsonSuccess("Delete Success!");
                }
            });
        }

        public async Task<JsonResult> getinternalaccount()
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    var model = await ctx.InternalAccountSet.Where(x => x.IsDelete == false).ToListAsync();

                    return JsonSuccess(new { data = model.ToArray() });
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

        public async Task<JsonResult> ProcessJurnalOtomatis(string poNo, string narrative)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    string transaksi = string.Empty;                    

                    var models = await Task.FromResult<IEnumerable<MasterJurnalOtomatisViewModel>>(ctx.GetJurnalOtomatisSet("Pelunasan", poNo, narrative).AsQueryable());

                    IList<MasterJurnalOtomatisViewModel> list = models.ToList();

                    return JsonSuccess(new { data = list.ToArray() });
                }
            });
        }

        //public async Task<JsonResult> checkingDataPencadangan(int poid, string nopo)
        //{
        //    return await ExecuteFaultHandledOperationAsync(async () =>
        //    {
        //        using (var ctx = new SqlFundingDbContext())
        //        {
        //            int totalItems = await Task.FromResult<int>(ctx.PaymentRequestSet.Where(x => x.IsDelete == false && x.PurchaseOrderId == poid && x.ApproveBy == null).Count());
        //            if (totalItems > 0)
        //                return JsonSuccess(new { result = string.Format("Tidak Bisa Add Pelunasan Payment karena jurnal Pencadangan untuk Nomor PO : {0} belum di Approved", nopo) });
        //            else
        //                return JsonSuccess(new { result = "" });
        //        }
        //    });
        //}
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