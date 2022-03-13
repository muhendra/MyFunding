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
using System.Data.SqlClient;
using System.Linq;
using System.Linq.Dynamic;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace MyWeb.Controllers.Reward
{
    public class PaymentrequestController : CoreControllerBase
    {

        private ApplicationDbContext _applicationDbContext;
        private ICurrentUser _currentUser;
        private SqlHelper _query = new SqlHelper("SqlFundingConnection");
        private string _category = "PaymentRequest";


        public PaymentrequestController(ApplicationDbContext context, ICurrentUser currentUser)
        {
            _applicationDbContext = context;
            _currentUser = currentUser;
        }


        public async Task<JsonResult> GetBranceDesc(string id)
        {
            string Var = (string)await _query.ExecScalarProcAsync("SP_GET_BRANCEDESC", "@id", id);
            return JsonSuccess(Var);
        }


        public async Task<JsonResult> GetIntAccOrCategoryDesc(string id)
        {
            string Var = (string)await _query.ExecScalarProcAsync("SP_GET_INTACCORCATTDESC", "@id", id);
            return JsonSuccess(Var);
        }


        public ActionResult Index()
        {
            return View();
        }


        //[MyAuthorize(Roles = "SupervisorReward,Reward_SpvGA,SupervisorProduk")]
        public ActionResult Authorize()
        {
            return View();
        }


        //[MyAuthorize(Roles = "SupervisorReward,Reward_SpvGA,SupervisorProduk")]
        public async Task<JsonResult> Approve(PaymentRequestViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                if (!ModelState.IsValid)
                {
                    return JsonValidationError();
                }

                using (var ctx = new SqlFundingDbContext())
                {
                    var target = ctx.PaymentRequestSet.FirstOrDefault(c => c.Id == form.Id);
                    target.StatusData = StatusData.Approved;
                    target.ApproveBy = _currentUser.User.Id;
                    target.ApproveDate = DateTime.Now;
                    await ctx.SaveChangesAsync();
                    var cabang = ctx.PurchaseOrderSet.Where(x => x.Id == target.PurchaseOrderId).Select(x => x.EnquiryTabunganInput.Cabang).FirstOrDefault();
                    //NotificationLib.sendNotifikasi("All GA", cabang, form.PaymentRequestId, form.PaymentRequestDate, "Payment Request", "Pembuatan Purchase Recieve", "Purchasereceive/index");

                    
                    
                    var Params = new object[] { 
                        new SqlParameter("@id", form.Id),
                    };
                    await _query.ExecNonQueryAsync("SP_INSERTPAYMENTPEMBAYARAN @id", Params);

                    //ctx.SendEmail_MyFunding("All GA", form.PaymentRequestId, cabang, Convert.ToDateTime(form.PaymentRequestDate), "Payment Request", "Pembuatan Purchase Recieve",
                    //ctx.SendEmail_MyFunding("GA PO Staff", form.PaymentRequestId, cabang, Convert.ToDateTime(form.PaymentRequestDate), "Payment Request", "Pembuatan Purchase Recieve",

                    //AKTIFIN LAGI SETELAH TESTING
                    //ctx.SendEmail_MyFunding("After Authorize Payment Request", form.PaymentRequestId, cabang, Convert.ToDateTime(form.PaymentRequestDate), "Payment Request", "Pembuatan Purchase Recieve",
                    //    string.Format("http://{0}{1}/{2}", Request.Url.Host, Request.ApplicationPath, "PurchaseReceive/index"));

                    return JsonSuccess("Approve Success");
                }
            });
        }        
        

        [AllowAnonymous]
        public async Task<JsonResult> getinternalaccount(string searchText, int pageNumber = 1, int pageSize = 10, string sortBy = "Deskripsi", string sortDirection = "asc", string address = "", string email = "", DateTime? terminationDate = null, string branchId = "")
        {
            //return await ExecuteFaultHandledOperationAsync(async () =>
            //{
            //    using (var ctx = new SqlFundingDbContext())
            //    {
            //        int totalItems = await ctx.InternalAccountSet.CountAsync(x => x.IsDelete == false
            //                &&
            //                (
            //                    string.IsNullOrEmpty(searchText) || (
            //                        x.NomorIA.Contains(searchText) ||
            //                        x.NamaCabang.Contains(searchText)
            //                    )
            //                ));

            //        var models = await ctx.InternalAccountSet.Where(x => x.IsDelete == false
            //                &&
            //                (
            //                    string.IsNullOrEmpty(searchText) || (
            //                        x.NomorIA.Contains(searchText) ||
            //                        x.NamaCabang.Contains(searchText)
            //                    )
            //                )
            //            )
            //        .OrderBy(sortBy + " " + sortDirection)
            //        .Skip((pageNumber - 1) * pageSize)
            //        .Take(pageSize)
            //        .ToListAsync();

            //        IList<InternalAccountViewModel> list = Mapper.Map<IList<InternalAccountViewModel>>(models);

            //        return JsonSuccess(new { totalItems = totalItems, data = list.ToArray() });
            //    }
            //});
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    searchText = searchText.ToLower();

                    int totalItems = await Task.FromResult<int>(ctx.sp_getInternalAccount_PaymentRequest_DebitSet(branchId)
                                                    .Where(x=> x.NomorIA.Contains(searchText) ||
                                                                x.NamaCabang.Contains(searchText) ||
                                                                x.MataUang.Contains(searchText) ||
                                                                x.Deskripsi.Contains(searchText) ).Count() );


                    var models = await Task.FromResult<IEnumerable<get_internal_account>>(ctx.sp_getInternalAccount_PaymentRequest_DebitSet(branchId).AsQueryable()
                        .Where(x => x.NomorIA.Contains(searchText) ||
                                    x.NamaCabang.Contains(searchText) ||
                                    x.MataUang.Contains(searchText) ||
                                    x.Deskripsi.Contains(searchText))
                        .OrderBy(sortBy + " " + sortDirection)
                        .Skip((pageNumber - 1) * pageSize)
                        .Take(pageSize));

                    IList<get_internal_account> list = models.ToList();

                    return JsonSuccess(new { totalItems = totalItems, data = list.ToArray() });
                }
            });
        }

        [AllowAnonymous]
        public async Task<JsonResult> GetInternalAccountKredit(string searchText, int pageNumber = 1, int pageSize = 10, string sortBy = "Deskripsi", string sortDirection = "asc", string address = "", string email = "", DateTime? terminationDate = null, string branchId = "")
        {
            
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    searchText = searchText.ToLower();

                    int totalItems = await Task.FromResult<int>(ctx.sp_getInternalAccount_PaymentRequest_KreditSet(branchId)
                                                    .Where(x => x.NomorIA.ToLower().Contains(searchText) ||
                                                                x.NamaCabang.ToLower().Contains(searchText) ||
                                                                x.MataUang.ToLower().Contains(searchText) ||
                                                                x.Deskripsi.ToLower().Contains(searchText)).Count());


                    var models = await Task.FromResult<IEnumerable<get_internal_account>>(ctx.sp_getInternalAccount_PaymentRequest_KreditSet(branchId).AsQueryable()
                        .Where(x => x.NomorIA.ToLower().Contains(searchText) ||
                                    x.NamaCabang.ToLower().Contains(searchText) ||
                                    x.MataUang.ToLower().Contains(searchText) ||
                                    x.Deskripsi.ToLower().Contains(searchText))
                        .OrderBy(sortBy + " " + sortDirection)
                        .Skip((pageNumber - 1) * pageSize)
                        .Take(pageSize));

                    IList<get_internal_account> list = models.ToList();

                    return JsonSuccess(new { totalItems = totalItems, data = list.ToArray() });
                }
            });
        }

        [AllowAnonymous]
        public async Task<JsonResult> GetInternalAccountJurnalPelunasanDebit(string searchText, int pageNumber = 1, int pageSize = 10, string sortBy = "Deskripsi", string sortDirection = "asc", string address = "", string email = "", DateTime? terminationDate = null, string branchId = "")
        {

            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    searchText = searchText.ToLower();

                    int totalItems = await Task.FromResult<int>(ctx.sp_GetInternalAccount_JurnalPelunasan_Debit(branchId)
                                                    .Where(x => x.NomorIA.ToLower().Contains(searchText) ||
                                                                x.NamaCabang.ToLower().Contains(searchText) ||
                                                                x.MataUang.ToLower().Contains(searchText) ||
                                                                x.Deskripsi.ToLower().Contains(searchText)).Count());


                    var models = await Task.FromResult<IEnumerable<get_internal_account>>(ctx.sp_GetInternalAccount_JurnalPelunasan_Debit(branchId).AsQueryable()
                        .Where(x => x.NomorIA.ToLower().Contains(searchText) ||
                                    x.NamaCabang.ToLower().Contains(searchText) ||
                                    x.MataUang.ToLower().Contains(searchText) ||
                                    x.Deskripsi.ToLower().Contains(searchText))
                        .OrderBy(sortBy + " " + sortDirection)
                        .Skip((pageNumber - 1) * pageSize)
                        .Take(pageSize));

                    IList<get_internal_account> list = models.ToList();

                    return JsonSuccess(new { totalItems = totalItems, data = list.ToArray() });
                }
            });
        }

        [AllowAnonymous]
        public async Task<JsonResult> GetInternalAccountJurnalPencadanganDebit(string searchText, int pageNumber = 1, int pageSize = 10, string sortBy = "Deskripsi", string sortDirection = "asc", string address = "", string email = "", DateTime? terminationDate = null, string branchId = "")
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    searchText = searchText.ToLower();

                    int totalItems = await Task.FromResult<int>(ctx.sp_GetInternalAccount_JurnalPencadangan_Debit(branchId)
                                                    .Where(x => x.NomorIA.ToLower().Contains(searchText) ||
                                                                x.NamaCabang.ToLower().Contains(searchText) ||
                                                                x.MataUang.ToLower().Contains(searchText) ||
                                                                x.Deskripsi.ToLower().Contains(searchText)).Count());


                    var models = await Task.FromResult<IEnumerable<get_internal_account>>(ctx.sp_GetInternalAccount_JurnalPencadangan_Debit(branchId).AsQueryable()
                        .Where(x => x.NomorIA.ToLower().Contains(searchText) ||
                                    x.NamaCabang.ToLower().Contains(searchText) ||
                                    x.MataUang.ToLower().Contains(searchText) ||
                                    x.Deskripsi.ToLower().Contains(searchText))
                        .OrderBy(sortBy + " " + sortDirection)
                        .Skip((pageNumber - 1) * pageSize)
                        .Take(pageSize));

                    IList<get_internal_account> list = models.ToList();

                    return JsonSuccess(new { totalItems = totalItems, data = list.ToArray() });
                }
            });
        }

        [AllowAnonymous]
        public async Task<JsonResult> GetInternalAccountJurnalPencadanganKredit(string searchText, int pageNumber = 1, int pageSize = 10, string sortBy = "Deskripsi", string sortDirection = "asc", string address = "", string email = "", DateTime? terminationDate = null, string branchId = "")
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    searchText = searchText.ToLower();

                    int totalItems = await Task.FromResult<int>(ctx.sp_GetInternalAccount_JurnalPencadangan_Kredit(branchId)
                                                    .Where(x => x.NomorIA.ToLower().Contains(searchText) ||
                                                                x.NamaCabang.ToLower().Contains(searchText) ||
                                                                x.MataUang.ToLower().Contains(searchText) ||
                                                                x.Deskripsi.ToLower().Contains(searchText)).Count());

                    var models = await Task.FromResult<IEnumerable<get_internal_account>>(ctx.sp_GetInternalAccount_JurnalPencadangan_Kredit(branchId).AsQueryable()
                        .Where(x => x.NomorIA.ToLower().Contains(searchText) ||
                                    x.NamaCabang.ToLower().Contains(searchText) ||
                                    x.MataUang.ToLower().Contains(searchText) ||
                                    x.Deskripsi.ToLower().Contains(searchText))
                        .OrderBy(sortBy + " " + sortDirection)
                        .Skip((pageNumber - 1) * pageSize)
                        .Take(pageSize));

                    IList<get_internal_account> list = models.ToList();

                    return JsonSuccess(new { totalItems = totalItems, data = list.ToArray() });
                }
            });
        }
        
        //[MyAuthorize(Roles = "SupervisorReward,Reward_SpvGA,SupervisorProduk")]
        public async Task<JsonResult> Reject(PaymentRequestViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                if (!ModelState.IsValid)
                {
                    return JsonValidationError();
                }

                using (var ctx = new SqlFundingDbContext())
                {
                    var target = ctx.PaymentRequestSet.FirstOrDefault(c => c.Id == form.Id);
                    var target2 = ctx.JurnalPembayaranSet.Where(c => c.PaymentRequestId == form.Id);
                    if (target == null)
                    {
                        return JsonError("Data tidak ada di database!");
                    }
                    ctx.JurnalPembayaranSet.RemoveRange(target2); //multi record
                    ctx.PaymentRequestSet.Remove(target);

                    await ctx.SaveChangesAsync();

                    var cabang = ctx.PurchaseOrderSet.Where(x => x.Id == target.PurchaseOrderId).Select(x => x.EnquiryTabunganInput.Cabang).FirstOrDefault();

                    ctx.SendEmail_MyFunding("After Reject Payment Request", form.poid, cabang, Convert.ToDateTime(form.PODate), "Purchase Order", "Payment Request Rejected",
                        string.Format("http://{0}{1}/{2}", Request.Url.Host, Request.ApplicationPath, "PaymentRequest/index"));

                    return JsonSuccess("Data Rejected");
                }
            });
        }


        //[MyAuthorize(Roles = "SupervisorReward,Reward_SpvGA,SupervisorProduk")]
        public async Task<JsonResult> Deleted(PaymentRequestViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                if (!ModelState.IsValid)
                {
                    return JsonValidationError();
                }

                using (var ctx = new SqlFundingDbContext())
                {
                    var target = ctx.PaymentRequestSet.FirstOrDefault(c => c.Id == form.Id);
                    if (target == null)

                    {
                        return JsonError("Data tidak ada di database!");
                    }

                    target.StatusData = StatusData.Deleted;
                    target.UpdateBy = _currentUser.User.Id;
                    target.UpdateDate = DateTime.Now;
                    await ctx.SaveChangesAsync();

                    return JsonSuccess("Data Deleted");
                }
            });
        }


        private async Task<string> GenerateNoPayment()
        {
            string noPurchase = (string)await _query.ExecScalarProcAsync("SP_GENERATE_NOMOR", "@Category", _category);
            return noPurchase;
        }


        [AllowAnonymous]
        public async Task<JsonResult> GetNoPayment()
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                //string noMemo = (string) await _query.ExecScalarProcAsync("SP_GENERATE_NOMOR", "@Category", _category);
                string noPayment = await GenerateNoPayment();
                return JsonSuccess(noPayment);
            });
        }

        [AllowAnonymous]
        public async Task<JsonResult> GetPage(string Nomor, DateTime? Tanggal, JenisTabungan JenisTabungan, string Cabang, int pageNumber = 1, int pageSize = 10, string sortBy = "POId", string sortDirection = "desc")
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    int totalItems = await Task.FromResult<int>(ctx.PaymentrequestSet(Nomor, Tanggal, (int)JenisTabungan, Cabang).Count());

                    if (/*_currentUser.Department.Id == "006" &&*/ _currentUser.Division.Id == "026" /*Product Funding*/)
                    {

                        var models = await Task.FromResult<IEnumerable<PaymentRequestViewModel>>(ctx.PaymentrequestSet(Nomor, Tanggal, (int)JenisTabungan, Cabang).AsQueryable()
                        .Where(x=> x.PaymentMethod == PaymentMethod.FPAfterReceive)
                            .OrderBy(sortBy + " " + sortDirection)
                        .Skip((pageNumber - 1) * pageSize)
                        .Take(pageSize));

                        IList<PaymentRequestViewModel> list = models.ToList();

                        return JsonSuccess(new { totalItems = totalItems, data = list.ToArray() });
                    }
                    else if (/*_currentUser.Department.Id == "026" &&*/ _currentUser.Division.Id == "035" /*GA*/)
                    {
                        var models = await Task.FromResult<IEnumerable<PaymentRequestViewModel>>(ctx.PaymentrequestSet(Nomor, Tanggal, (int)JenisTabungan, Cabang).AsQueryable()
                        .Where(x => x.PaymentMethod != PaymentMethod.FPAfterReceive)
                            .OrderBy(sortBy + " " + sortDirection)
                        .Skip((pageNumber - 1) * pageSize)
                        .Take(pageSize));

                        IList<PaymentRequestViewModel> list = models.ToList();

                        return JsonSuccess(new { totalItems = totalItems, data = list.ToArray() });
                    }
                    else
                    {
                        var models = await Task.FromResult<IEnumerable<PaymentRequestViewModel>>(ctx.PaymentrequestSet(Nomor, Tanggal, (int)JenisTabungan, Cabang).AsQueryable()                      
                            .OrderBy(sortBy + " " + sortDirection)
                        .Skip((pageNumber - 1) * pageSize)
                        .Take(pageSize));

                        IList<PaymentRequestViewModel> list = models.ToList();

                        return JsonSuccess(new { totalItems = totalItems, data = list.ToArray() });
                    }
                }
            });
        }


        [AllowAnonymous]
        public async Task<JsonResult> AuthorizeGetPage(DateTime? Tanggal, JenisTabungan Jenistabungan, string Cabang, string No, string Norekening, string Nopo, DateTime? Tanggalpo, int pageNumber = 1, int pageSize = 10, string sortBy = "PaymentRequestId", string sortDirection = "desc")
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    int totalItems = await Task.FromResult<int>(ctx.AuthorizepaymentrequestSet(Tanggal, (int)Jenistabungan, Cabang, Norekening, No, Nopo, Tanggalpo).Count());

                    if (/*_currentUser.Department.Id == "006" && */_currentUser.Division.Id == "026" /*Product Funding*/)
                    {
                        var models = await Task.FromResult<IEnumerable<PaymentRequestViewModel>>(ctx.AuthorizepaymentrequestSet(Tanggal, (int)Jenistabungan, Cabang, Norekening, No, Nopo, Tanggalpo).AsQueryable()
                        .Where(x => x.PaymentMethod == PaymentMethod.FPAfterReceive)
                            .OrderBy(sortBy + " " + sortDirection)
                        .Skip((pageNumber - 1) * pageSize)
                        .Take(pageSize));

                        IList<PaymentRequestViewModel> list = models.ToList();

                        if (list != null)
                        {
                            foreach (var item in list)
                            {
                                var obj = await ctx.JurnalPembayaranSet.Where(x => x.PaymentRequestId == item.Id).ToListAsync();
                                item.JurnalPembayaranList = Mapper.Map<List<JurnalPembayaran>>(obj);
                            }
                        }
                        return JsonSuccess(new { totalItems = totalItems, data = list.ToArray() });
                    }
                    else if (/*_currentUser.Department.Id == "026" && */_currentUser.Division.Id == "035" /*GA*/)
                    {
                        var models = await Task.FromResult<IEnumerable<PaymentRequestViewModel>>(ctx.AuthorizepaymentrequestSet(Tanggal, (int)Jenistabungan, Cabang, Norekening, No, Nopo, Tanggalpo).AsQueryable()
                        .Where(x => x.PaymentMethod != PaymentMethod.FPAfterReceive)
                        .OrderBy(sortBy + " " + sortDirection)
                        .Skip((pageNumber - 1) * pageSize)
                        .Take(pageSize));

                        IList<PaymentRequestViewModel> list = models.ToList();

                        if (list != null)
                        {
                            foreach (var item in list)
                            {
                                var obj = await ctx.JurnalPembayaranSet.Where(x => x.PaymentRequestId == item.Id).ToListAsync();
                                item.JurnalPembayaranList = Mapper.Map<List<JurnalPembayaran>>(obj);
                            }
                        }

                        return JsonSuccess(new { totalItems = totalItems, data = list.ToArray() });
                    }
                    else
                    {
                        var models = await Task.FromResult<IEnumerable<PaymentRequestViewModel>>(ctx.AuthorizepaymentrequestSet(Tanggal, (int)Jenistabungan, Cabang, Norekening, No, Nopo, Tanggalpo).AsQueryable()
                        .OrderBy(sortBy + " " + sortDirection)
                        .Skip((pageNumber - 1) * pageSize)
                        .Take(pageSize));

                        IList<PaymentRequestViewModel> list = models.ToList();

                        if (list != null)
                        {
                            foreach (var item in list)
                            {
                                var obj = await ctx.JurnalPembayaranSet.Where(x => x.PaymentRequestId == item.Id).ToListAsync();
                                item.JurnalPembayaranList = Mapper.Map<List<JurnalPembayaran>>(obj);
                            }
                        }

                        return JsonSuccess(new { totalItems = totalItems, data = list.ToArray() });
                    }
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
                    var models = await ctx.PaymentRequestSet
                               .Where(x => x.IsDelete == false)
                               .OrderByDescending(x => x.CreateDate)
                               .ToListAsync();

                    IList<PaymentRequestViewModel> list = Mapper.Map<IList<PaymentRequest>, IList<PaymentRequestViewModel>>(models);

                    return JsonSuccess(new { data = list.ToArray() });
                }
            });

        }

        public async Task<JsonResult> Add(PaymentRequestViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                if (!ModelState.IsValid)
                {
                    return JsonValidationError();
                }

                PaymentRequest model = Mapper.Map<PaymentRequest>(form);
                using (var ctx = new SqlFundingDbContext())
                {
                    List<JurnalPembayaran> listJurnal = form.JurnalPembayaranList;
                    
                    model.CreateBy = _currentUser.User.Id;
                    model.CreateDate = DateTime.Now;
                    model.ApproveBy = null;
                    model.ApproveDate = null;
                    model.Id = 0;
                    model.PaymentRequestId = await GenerateNoPayment();
                    model.StatusData = StatusData.New;
                    ctx.PaymentRequestSet.Add(model);
                    //await _query.ExecNonQueryProcAsync("[SP_Insert_GenerateNoPurchaseOrder]", "@Nomor", model.PaymentRequestId);
                    await ctx.SaveChangesAsync();

                    if (form.JurnalPembayaranList != null)
                    {
                        //var existingjurnal = ctx.PaymentRequestSet.FirstOrDefault(c => c.Id == model.Id && c.IsDelete == false);
                        //if (existingjurnal != null)
                        //{

                        string type = string.Empty;

                        if (form.PaymentRequestType == PaymentRequestType.PaymentRequest)
                        {
                            type = "PaymentRequest";
                        }
                        else if (form.PaymentRequestType == PaymentRequestType.Pencadangan)
                        {
                            type = "Pencadangan";
                        }

                        foreach (JurnalPembayaran item in listJurnal)
                        {
                            //JurnalPembayaran jurnalPembayaran = Mapper.Map<JurnalPembayaran>(item);
                            item.PaymentRequestId = model.Id;                            
                            item.Narrative = type + " " + model.PaymentRequestId;
                            ctx.JurnalPembayaranSet.Add(item);

                        }
                        //}
                        await ctx.SaveChangesAsync();
                    }
                    var Cabang = ctx.PurchaseOrderSet.Where(x => x.Id == form.PurchaseOrderId).Select(x => x.EnquiryTabunganInput.Cabang).FirstOrDefault();

                    //NotificationLib.sendNotifikasi("Head GA", Cabang, form.PaymentRequestId, form.PaymentRequestDate, "Payment Request", "Authorize Payment Request", "Paymentrequest/Authorize");
                    //ctx.SendEmail_MyFunding("Head GA", form.PaymentRequestId, Cabang, Convert.ToDateTime(form.PaymentRequestDate), "Payment Request", "Authorize Payment Request",
                    //ctx.SendEmail_MyFunding("Finance", form.PaymentRequestId, Cabang, Convert.ToDateTime(form.PaymentRequestDate), "Payment Request", "Authorize Payment Request",
                    ctx.SendEmail_MyFunding("After Add Payment Request", form.PaymentRequestId, Cabang, Convert.ToDateTime(form.PaymentRequestDate), "Payment Request", "Authorize Payment Request",
                        string.Format("http://{0}{1}/{2}", Request.Url.Host, Request.ApplicationPath, "PaymentRequest/Authorize"));

                    return JsonSuccess(model);
                }
                    //await _query.ExecNonQueryProcAsync("SP_INSERT_GENERATE_NOMOR", "@Nomor", model.NoMemo);

                    //Pindahin file FinalMemo dari temp
                    //if (!string.IsNullOrEmpty(form.FinalMemo))
                    //{
                    //    foreach (var file in Directory.GetFiles(Server.MapPath(_finalMemoDirTemp)))
                    //    {
                    //        System.IO.File.Copy(file, Path.Combine(Server.MapPath(_finalMemoDir), Path.GetFileName(file)), true);
                    //        System.IO.File.Delete(file);
                    //    }
                    //}
            });
        }

        public async Task<JsonResult> Update(EnquirytabunganViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    var existingModel = ctx.EnquiryTabunganInputSet.Find(form.NoRekening);
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

        public async Task<JsonResult> GetDetailBarang(int EnquiryId)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    var models = await ctx.DetailBarangSet
                               .Where(x => x.IsDelete == false && x.EnquiryId == EnquiryId)
                               .OrderByDescending(x => x.CreateDate)
                               .ToListAsync();

                    IList<DetailbarangViewModel> list = Mapper.Map<IList<DetailBarang>, IList<DetailbarangViewModel>>(models);

                    return JsonSuccess(new { data = list.ToArray() });
                }
            });
        }

        public async Task<JsonResult> ProcessJurnalOtomatis(string poNo, string narrative, PaymentRequestType paymentRequestType)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    string transaksi = string.Empty;

                    if (paymentRequestType == PaymentRequestType.PaymentRequest)
                        transaksi = "PaymentRequest";
                    else if (paymentRequestType == PaymentRequestType.Pencadangan)
                        transaksi = "Pencadangan";

                    var models = await Task.FromResult<IEnumerable<MasterJurnalOtomatisViewModel>>(ctx.GetJurnalOtomatisSet(transaksi, poNo, narrative).AsQueryable());

                    IList<MasterJurnalOtomatisViewModel> list = models.ToList();

                    return JsonSuccess(new { data = list.ToArray() });
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
        
        //public JsonResult UploadFinalMemo()
        //{
        //    System.IO.DirectoryInfo di = new DirectoryInfo(Server.MapPath(_finalMemoDirTemp));
        //    foreach (FileInfo file in di.GetFiles())
        //    {
        //        file.Delete();
        //    }

        //    string filename = string.Empty;
        //    try
        //    {
        //        foreach (string file in Request.Files)
        //        {
        //            var fileContent = Request.Files[file];
        //            if (fileContent != null && fileContent.ContentLength > 0)
        //            {
        //                filename = Guid.NewGuid() + "-" + fileContent.FileName;
        //                string nameAndLocation = _finalMemoDirTemp + filename;
        //                fileContent.SaveAs(Server.MapPath(nameAndLocation));
        //                break;
        //            }
        //        }
        //    }
        //    catch (RetryLimitExceededException /* dex */)
        //    {
        //        //Log the error (uncomment dex variable name and add a line here to write a log.
        //        return JsonError("Unable to upload Final Memo. Try again, and if the problem persists see your system administrator.");
        //    }
        //    return JsonSuccess(filename);
        //}
    }
}