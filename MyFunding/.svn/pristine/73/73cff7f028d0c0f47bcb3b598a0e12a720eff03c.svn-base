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
    public class PencadanganController : CoreControllerBase
    {

        private ApplicationDbContext _applicationDbContext;
        private ICurrentUser _currentUser;
        private SqlHelper _query = new SqlHelper("SqlFundingConnection");
        private string _category = "Amortisasi";
        //private string _attachmentPencadangan = "~/Files/Pencadangan/";
        private string _attachmentPencadanganTemp = "~/Files/Pencadangan/Temp/";


        public PencadanganController(ApplicationDbContext context, ICurrentUser currentUser)
        {
            _applicationDbContext = context;
            _currentUser = currentUser;
        }


        public ActionResult Index()
        {
            return View();
        }


        //[MyAuthorize(Roles = "SupervisorReward")]
        public ActionResult Authorize()
        {
            return View();
        }


        //[MyAuthorize(Roles = "SupervisorReward")]
        public async Task<JsonResult> Reject(PencadanganViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                if (!ModelState.IsValid)
                {
                    return JsonValidationError();
                }

                using (var ctx = new SqlFundingDbContext())
                {
                    var target = ctx.PencadanganSet.FirstOrDefault(c => c.Id == form.Id);
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
                    int totalItems = await ctx.PencadanganSet
                        .CountAsync(x => x.IsDelete == false &&
                            (
                                string.IsNullOrEmpty(searchText) ||
                                (
                                    x.RequestId.Contains(searchText) ||
                                    x.PurchaseOrder.POId.Contains(searchText) ||
                                    x.PurchaseOrder.CategoryId.Contains(searchText) ||
                                    x.PurchaseOrder.DetailBarang.Merek.Contains(searchText) ||
                                    x.PurchaseOrder.DetailBarang.TypeBarang.Contains(searchText) ||
                                    x.PurchaseOrder.DetailBarang.Warna.Contains(searchText) ||
                                    x.PurchaseOrder.DetailBarang.Quantity.ToString().Contains(searchText) ||
                                    x.PurchaseOrder.NominalBarang.ToString().Contains(searchText) ||
                                    x.PurchaseOrder.StatusData.ToString().Contains(searchText)
                                )
                            )
                    );

                    var models = await ctx.PencadanganSet
                        .Where(x => x.IsDelete == false && 
                            (
                                string.IsNullOrEmpty(searchText) ||
                                (
                                    x.RequestId.Contains(searchText) ||
                                    x.PurchaseOrder.POId.Contains(searchText) ||
                                    x.PurchaseOrder.CategoryId.Contains(searchText) ||
                                    x.PurchaseOrder.DetailBarang.Merek.Contains(searchText) ||
                                    x.PurchaseOrder.DetailBarang.TypeBarang.Contains(searchText) ||
                                    x.PurchaseOrder.DetailBarang.Warna.Contains(searchText) ||
                                    x.PurchaseOrder.DetailBarang.Quantity.ToString().Contains(searchText) ||
                                    x.PurchaseOrder.NominalBarang.ToString().Contains(searchText) ||
                                    x.PurchaseOrder.StatusData.ToString().Contains(searchText)
                                )
                            )
                    )
                    .OrderBy(sortBy + " " + sortDirection)
                    .Skip((pageNumber - 1) * pageSize)
                    .Take(pageSize)
                    .ToListAsync();

                    IList<PencadanganViewModel> list = Mapper.Map<IList<PencadanganViewModel>>(models);
                    foreach (var item in list)
                    {
                        item.PecadanganTransaksi = Mapper.Map<List<PencadanganTransaksi>, List<PencadanganTransaksiViewModel>>(await ctx.PencadanganTransaksiSet.Where(x => x.PencadanganId == item.Id).ToListAsync());
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
                    int totalItems = await ctx.PencadanganSet
                        .CountAsync(x => x.IsDelete == false && x.StatusData != StatusData.Approved &&
                            (
                                string.IsNullOrEmpty(searchText) ||
                                (
                                    x.RequestId.Contains(searchText) ||
                                    x.PurchaseOrder.POId.Contains(searchText) ||
                                    x.PurchaseOrder.CategoryId.Contains(searchText) ||
                                    x.PurchaseOrder.DetailBarang.Merek.Contains(searchText) ||
                                    x.PurchaseOrder.DetailBarang.TypeBarang.Contains(searchText) ||
                                    x.PurchaseOrder.DetailBarang.Warna.Contains(searchText) ||
                                    x.PurchaseOrder.DetailBarang.Quantity.ToString().Contains(searchText) ||
                                    x.PurchaseOrder.NominalBarang.ToString().Contains(searchText) ||
                                    x.PurchaseOrder.StatusData.ToString().Contains(searchText)
                                )
                            )
                    );

                    var models = await ctx.PencadanganSet
                        .Where(x => x.IsDelete == false && x.StatusData != StatusData.Approved &&
                            (
                                string.IsNullOrEmpty(searchText) ||
                                (
                                    x.RequestId.Contains(searchText) ||
                                    x.PurchaseOrder.POId.Contains(searchText) ||
                                    x.PurchaseOrder.CategoryId.Contains(searchText) ||
                                    x.PurchaseOrder.DetailBarang.Merek.Contains(searchText) ||
                                    x.PurchaseOrder.DetailBarang.TypeBarang.Contains(searchText) ||
                                    x.PurchaseOrder.DetailBarang.Warna.Contains(searchText) ||
                                    x.PurchaseOrder.DetailBarang.Quantity.ToString().Contains(searchText) ||
                                    x.PurchaseOrder.NominalBarang.ToString().Contains(searchText) ||
                                    x.PurchaseOrder.StatusData.ToString().Contains(searchText)
                                )
                            )
                    )
                    .OrderBy(sortBy + " " + sortDirection)
                    .Skip((pageNumber - 1) * pageSize)
                    .Take(pageSize)
                    .ToListAsync();

                    IList<PencadanganViewModel> list = Mapper.Map<IList<PencadanganViewModel>>(models);
                    foreach (var item in list)
                    {
                        item.PecadanganTransaksi = Mapper.Map<List<PencadanganTransaksi>, List<PencadanganTransaksiViewModel>>(await ctx.PencadanganTransaksiSet.Where(x => x.PencadanganId == item.Id).ToListAsync());
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
                    int totalItems = await ctx.DeliveryOrderSet
                        .CountAsync(x => x.IsDelete == false &&
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
                                    x.PurchaseOrder.DetailBarang.PromotionCode.Contains(searchText) ||
                                    x.PurchaseOrder.DetailBarang.Quantity.ToString().Contains(searchText) ||
                                    x.PurchaseOrder.DetailBarang.TypeBarang.Contains(searchText) ||
                                    x.PurchaseOrder.DetailBarang.Warna.Contains(searchText)
                                )
                            )
                    );

                    var models = await ctx.DeliveryOrderSet
                        .Where(x => x.IsDelete == false &&
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

        //[AllowAnonymous]
        //public async Task<JsonResult> AuthorizeGetPage(DateTime TanggalDraft, JenisTabungan Jenistabungan, string Cabang, string Id, string NoDraft, int pageNumber = 1, int pageSize = 10, string sortBy = "Id", string sortDirection = "desc")
        //{
        //    return await ExecuteFaultHandledOperationAsync(async () =>
        //    {
        //        using (var ctx = new SqlFundingDbContext())
        //        {
        //            int totalItems = await Task.FromResult<int>(ctx.PencadanganSet.Count());

        //            var models = await ctx.PencadanganSet
        //            .Skip((pageNumber - 1) * pageSize)
        //            .Take(pageSize).ToListAsync();

        //            IList<PencadanganViewModel> list = Mapper.Map<IList<PencadanganViewModel>>(models.ToList());

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
                    var models = await ctx.PencadanganSet
                               .Where(x => x.IsDelete == false)
                               .OrderByDescending(x => x.CreateDate)
                               .ToListAsync();

                    IList<PencadanganViewModel> list = Mapper.Map<IList<Pencadangan>, IList<PencadanganViewModel>>(models);

                    return JsonSuccess(new { data = list.ToArray() });
                }
            });

        }
        

        public async Task<JsonResult> Add(PencadanganViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                if (!ModelState.IsValid)
                {
                    return JsonValidationError();
                }

                Pencadangan model = Mapper.Map<Pencadangan>(form);
                List<PencadanganTransaksi> details = Mapper.Map<List<PencadanganTransaksi>>(form.PecadanganTransaksi);
                using (var ctx = new SqlFundingDbContext())
                {
                    model.StatusData = StatusData.New;
                    model.RequestId = (string)await GetNo();
                    ctx.PencadanganSet.Add(model);
                    await ctx.SaveChangesAsync();
                    var refCodeList = details.Select(grp => grp.ref_code).Distinct().ToArray();
                    if (details.Count() > 0)
                    {
                        foreach (var item in details)
                        {
                            item.ref_code = model.RequestId + (Array.IndexOf(refCodeList, item.ref_code)+1).ToString();
                            item.PencadanganId = model.Id;
                        }
                        ctx.PencadanganTransaksiSet.AddRange(details);
                        await ctx.SaveChangesAsync();
                    }
                    return JsonSuccess("Succes");
                }
            });
        }


        public async Task<JsonResult> Update(PencadanganViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                List<PencadanganTransaksi> listDet = Mapper.Map<List<PencadanganTransaksi>>(form.PecadanganTransaksi);

                var refCodeList = listDet.Select(grp => grp.ref_code).Distinct().ToArray();
                foreach (var item in listDet)
                {
                    item.ref_code = form.RequestId + (Array.IndexOf(refCodeList, item.ref_code) + 1).ToString();
                    item.PencadanganId = form.Id;
                    item.StatusData = StatusData.New;
                    item.CreateBy = _currentUser.User.Id;
                }
                using (var ctx = new SqlFundingDbContext())
                {
                    var existingModel = ctx.PencadanganSet.Find(form.Id);
                    if (existingModel == null)
                    {
                        return JsonError("Data Tidak Ditemukan di database!");
                    }
                    Mapper.Map(form, existingModel);
                    await ctx.SaveChangesAsync();
                    var OldDetail = ctx.PencadanganTransaksiSet.Where(x => x.PencadanganId == form.Id);
                    ctx.PencadanganTransaksiSet.RemoveRange(OldDetail);
                    if (listDet.Count() > 0) ctx.PencadanganTransaksiSet.AddRange(listDet);
                    await ctx.SaveChangesAsync();
                    return JsonSuccess("Update Success");
                }
            });
        }


        //[MyAuthorize(Roles = "SupervisorReward")]
        public async Task<JsonResult> Approve(PencadanganViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    var target = ctx.PencadanganSet.Find(form.Id);
                    if (target == null)
                    {
                        return JsonError("Data Tidak Ditemukan di database!");
                    }
                    target.ApproveBy = _currentUser.User.Id;

                    target.ApproveDate = DateTime.Now;
                    //target.IsDelete = true;
                    target.StatusData = StatusData.Approved;
                    await ctx.SaveChangesAsync();
                    var Params = new object[] { 
                        new SqlParameter("@id", form.Id)
                    };
                    await _query.ExecNonQueryAsync("SP_INSERTPAYMENTAMORTISASI @id", Params);
                    return JsonSuccess("Delete Success!");
                }
            });
        }


        public async Task<JsonResult> Delete(PencadanganViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    var target = ctx.PencadanganSet.Find(form.Id);
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


        public JsonResult UploadPencadangan()
        {
            string path = Server.MapPath(_attachmentPencadanganTemp);
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
                        string nameAndLocation = _attachmentPencadanganTemp + filename;
                        fileContent.SaveAs(Server.MapPath(nameAndLocation));
                        break;
                    }
                }
            }
            catch (RetryLimitExceededException /* dex */)
            {
                //Log the error (uncomment dex variable name and add a line here to write a log.
                return JsonError("Unable to upload Attachment Pencadangan. Try again, and if the problem persists see your system administrator.");
            }
            return JsonSuccess(filename);
        }


        public JsonResult ResetData(string namaFile)
        {
            try
            {
                string path = Server.MapPath(_attachmentPencadanganTemp + namaFile);
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
                return JsonError("Unable to upload Attachment Pencadangan. Try again, and if the problem persists see your system administrator.");
            }
        }


    }
}