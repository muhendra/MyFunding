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
    public class KatalogController : CoreControllerBase
    {

        private ApplicationDbContext _applicationDbContext;
        private ICurrentUser _currentUser;
        private SqlHelper _query = new SqlHelper("SqlFundingConnection");
        private string _category = "Enquiry";
        private string _attachmentKatalog = "~/Files/Katalog/";
        private string _attachmentKatalogTemp = "~/Files/Katalog/Temp/";
        private SqlFundingDbContext ctx = new SqlFundingDbContext();


        public KatalogController(ApplicationDbContext context, ICurrentUser currentUser)
        {
            _applicationDbContext = context;
            _currentUser = currentUser;
        }


        public ActionResult Index()
        {
            return View();
        }


        public async Task<JsonResult> KatalogGetPage(string searchText, int pageNumber = 1, int pageSize = 10, string sortBy = "Id", string sortDirection = "asc")
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                try
                {
                    int totalItems = 0;
                    searchText = searchText.ToUpper();

                    List<GetKatalog> listCount = ctx.KatalogPromo().ToList();
                    if (listCount != null)
                        totalItems = listCount.Count();


                    var models = await Task.FromResult<IEnumerable<GetKatalog>>(ctx.KatalogPromo()
                    
                    .Skip((pageNumber - 1) * pageSize)
                    .Take(pageSize));

                    IList<GetKatalog> list = models.ToList();

                    return JsonSuccess(new { totalItems = totalItems, data = list.ToArray() });
                }
                catch (System.Exception)
                {

                    throw;
                }
            });
        }


        public async Task<JsonResult> KataloggetPage2(string searchText, int pageNumber = 1, int pageSize = 10, string sortBy = "Id", string sortDirection = "asc")
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                try
                {
                    int totalItems = 0;
                    searchText = searchText.ToUpper();

                    List<GetKatalog2> listCount = ctx.KatalogPromo2().ToList();
                    if (listCount != null)
                        totalItems = listCount.Count();


                    var models = await Task.FromResult<IEnumerable<GetKatalog2>>(ctx.KatalogPromo2()

                    .Skip((pageNumber - 1) * pageSize)
                    .Take(pageSize));

                    IList<GetKatalog2> list = models.ToList();

                    return JsonSuccess(new { totalItems = totalItems, data = list.ToArray() });
                }
                catch (System.Exception)
                {

                    throw;
                }
            });
        }


        //[MyAuthorize(Roles = "SupervisorReward,Reward_SpvGA,SupervisorProduk")]
        public ActionResult Authorize()
        {
            return View();
        }


        //[MyAuthorize(Roles = "SupervisorReward,Reward_SpvGA,SupervisorProduk")]
        public async Task<JsonResult> Approve(KatalogViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                if (!ModelState.IsValid)
                {
                    return JsonValidationError();
                }

                using (var ctx = new SqlFundingDbContext())
                {
                    //var userMaster = ctx.MasterUserSet.FirstOrDefault(c => c.ApplicationUserId == _currentUser.User.Id && c.IsDelete == false);

                    var target = ctx.KatalogSet.FirstOrDefault(c => c.Id == form.Id);
                    //if (target == null)
                    //{
                    //    return JsonError("Data tidak ada di database!");
                    //}

                    //if (userMaster != null && userMaster.SuperiorId == null) //jika tidak mempunyai atasan maka approve
                    //{
                    //    target.StatusData = StatusData.Approved;
                    //}
                    target.StatusData = StatusData.Approved;
                    target.ApproveBy = _currentUser.User.Id;
                    target.ApproveDate = DateTime.Now;
                    await ctx.SaveChangesAsync();

                    return JsonSuccess("Approve Success");
                }
            });
        }


        //[MyAuthorize(Roles = "SupervisorReward,Reward_SpvGA,SupervisorProduk")]
        public async Task<JsonResult> Reject(KatalogViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                if (!ModelState.IsValid)
                {
                    return JsonValidationError();
                }

                using (var ctx = new SqlFundingDbContext())
                {
                    var target = ctx.KatalogSet.FirstOrDefault(c => c.Id == form.Id);
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
        public async Task<JsonResult> GetPage(string searchText = "", int pageNumber = 1, int pageSize = 10, string sortBy = "Kode_Promo", string sortDirection = "asc")
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    int totalItems = await ctx.KatalogSet
                        .CountAsync(x => x.IsDelete == false &&
                            (
                                string.IsNullOrEmpty(searchText) ||
                                (
                                    x.Kode_Promo.Contains(searchText) ||
                                    x.Merk.Contains(searchText) ||
                                    x.Type.Contains(searchText) ||
                                    x.JangkaWaktu.ToString().Contains(searchText) ||
                                    x.NominalHold.ToString().Contains(searchText) ||
                                    x.Penalty.ToString().Contains(searchText) ||
                                    x.Keterangan.Contains(searchText)
                                )
                            )
                    );

                    var models = await ctx.KatalogSet
                        .Where(x => x.IsDelete == false && 
                            (
                                string.IsNullOrEmpty(searchText) ||
                                (
                                    x.Kode_Promo.Contains(searchText) ||
                                    x.Merk.Contains(searchText) ||
                                    x.Type.Contains(searchText) ||
                                    x.JangkaWaktu.ToString().Contains(searchText) ||
                                    x.NominalHold.ToString().Contains(searchText) ||
                                    x.Penalty.ToString().Contains(searchText) ||
                                    x.Keterangan.Contains(searchText)
                                )
                            )
                    )
                    .OrderBy(sortBy + " " + sortDirection)
                    .Skip((pageNumber - 1) * pageSize)
                    .Take(pageSize)
                    .ToListAsync();

                    IList<KatalogViewModel> list = Mapper.Map<IList<KatalogViewModel>>(models);

                    return JsonSuccess(new { totalItems = totalItems, data = list.ToArray() });
                }
            });
        }


        [AllowAnonymous]
        public async Task<JsonResult> AuthorizeGetPage(DateTime TanggalDraft, JenisTabungan Jenistabungan, string Cabang, string Id, string NoDraft, int pageNumber = 1, int pageSize = 10, string sortBy = "Id", string sortDirection = "desc")
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    int totalItems = await Task.FromResult<int>(ctx.KatalogSet.Count());

                    var models = await ctx.KatalogSet
                    .Skip((pageNumber - 1) * pageSize)
                    .Take(pageSize).ToListAsync();

                    IList<KatalogViewModel> list = Mapper.Map<IList<KatalogViewModel>>(models.ToList());

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
                    var models = await ctx.KatalogSet
                               .Where(x => x.IsDelete == false)
                               .OrderByDescending(x => x.CreateDate)
                               .ToListAsync();

                    IList<KatalogViewModel> list = Mapper.Map<IList<Katalog>, IList<KatalogViewModel>>(models);

                    return JsonSuccess(new { data = list.ToArray() });
                }
            });

        }
        

        public async Task<JsonResult> Add(KatalogViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                if (!ModelState.IsValid)
                {
                    return JsonValidationError();
                }

                Katalog model = Mapper.Map<Katalog>(form);

                using (var ctx = new SqlFundingDbContext())
                {
                    model.StatusData = StatusData.New;
                    ctx.KatalogSet.Add(model);
                    await ctx.SaveChangesAsync();
                    if (!string.IsNullOrEmpty(form.AttachmentKatalog))
                    {
                        var file = Server.MapPath(_attachmentKatalogTemp + form.AttachmentKatalog);
                        System.IO.File.Copy(file, Path.Combine(Server.MapPath(_attachmentKatalog), Path.GetFileName(file)), true);
                        System.IO.File.Delete(file);
                    }
                    return JsonSuccess("Succes");
                }
            });
        }


        public async Task<JsonResult> Update(KatalogViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    var existingModel = ctx.KatalogSet.Find(form.Id);
                    if (existingModel == null)
                    {
                        return JsonError("Data Tidak Ditemukan di database!");
                    }

                    //jika file final memo diganti
                    if (existingModel.AttachmentKatalog != form.AttachmentKatalog)
                    {
                        if (string.IsNullOrEmpty(form.AttachmentKatalog))
                        {
                            if (!string.IsNullOrEmpty(existingModel.AttachmentKatalog))
                            {
                                var file = Server.MapPath(_attachmentKatalog + existingModel.AttachmentKatalog);
                                System.IO.File.Delete(file);    
                            }
                        }
                        else
                        {
                            if (!String.IsNullOrWhiteSpace(existingModel.AttachmentKatalog))
                            {
                                var oldfile = Server.MapPath(_attachmentKatalog + existingModel.AttachmentKatalog);
                                System.IO.File.Delete(oldfile);
                            }
                            var file = Server.MapPath(_attachmentKatalogTemp + form.AttachmentKatalog);
                            System.IO.File.Copy(file, Path.Combine(Server.MapPath(_attachmentKatalog), Path.GetFileName(file)), true);
                            System.IO.File.Delete(file);
                        }
                    }
                    Mapper.Map(form, existingModel);
                    await ctx.SaveChangesAsync();

                    return JsonSuccess("Update Success");
                }
            });
        }


        public async Task<JsonResult> Delete(KatalogViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    var target = ctx.KatalogSet.Find(form.Id);
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


        public JsonResult UploadKatalog()
        {
            string path = Server.MapPath(_attachmentKatalogTemp);
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
                        string nameAndLocation = _attachmentKatalogTemp + filename;
                        fileContent.SaveAs(Server.MapPath(nameAndLocation));
                        break;
                    }
                }
            }
            catch (RetryLimitExceededException /* dex */)
            {
                //Log the error (uncomment dex variable name and add a line here to write a log.
                return JsonError("Unable to upload Attachment Katalog. Try again, and if the problem persists see your system administrator.");
            }
            return JsonSuccess(filename);
        }


        public JsonResult ResetData(string namaFile)
        {
            try
            {
                string path = Server.MapPath(_attachmentKatalogTemp + namaFile);
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
                return JsonError("Unable to upload Attachment Katalog. Try again, and if the problem persists see your system administrator.");
            }
        }


        public JsonResult HapusData(string namaFile)
        {
            try
            {
                string path = Server.MapPath(_attachmentKatalog + namaFile);
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
                return JsonError("Unable to upload Attachment Katalog. Try again, and if the problem persists see your system administrator.");
            }
        }


    }
}