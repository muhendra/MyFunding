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
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Linq.Dynamic;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace MyWeb.Controllers.Reward
{
    public class DeliveryorderController : CoreControllerBase
    {

        private ApplicationDbContext _applicationDbContext;
        private ICurrentUser _currentUser;
        private SqlHelper _query = new SqlHelper("SqlFundingConnection");
        private string _category = "DeliveryOrder";
        private string _attachmentTandaTerima = "~/Files/deliveryorder/";
        private string _attachmentTandaTerimaTemp = "~/Files/deliveryorder/Temp/";


        public DeliveryorderController(ApplicationDbContext context, ICurrentUser currentUser)
        {
            _applicationDbContext = context;
            _currentUser = currentUser;
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
        public async Task<JsonResult> Approve(DeliveryOrderViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                if (!ModelState.IsValid)
                {
                    return JsonValidationError();
                }

                using (var ctx = new SqlFundingDbContext())
                {
                    
                    var target = ctx.DeliveryOrderSet.FirstOrDefault(c => c.Id == form.Id);
                    target.StatusData = StatusData.Approved;
                    target.ApproveBy = _currentUser.User.Id;
                    target.ApproveDate = DateTime.Now;
                    await ctx.SaveChangesAsync();
                    //NotificationLib.sendNotifikasi(target.PurchaseOrder.EnquiryTabunganInput.Cabang, form.DeliveryOrderId, form.DeliveryOrderDate, "Delivery Order", "Pembuatan Hand Over", "#");
                    return JsonSuccess("Approve Success");
                }
            });
        }


        //[MyAuthorize(Roles = "SupervisorReward,Reward_SpvGA,SupervisorProduk")]
        public async Task<JsonResult> Reject(DeliveryOrderViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                if (!ModelState.IsValid)
                {
                    return JsonValidationError();
                }

                using (var ctx = new SqlFundingDbContext())
                {
                    var target = ctx.DeliveryOrderSet.FirstOrDefault(c => c.Id == form.Id);
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


        private async Task<string> GenerateNoDeliveryOrder()
        {
            string noDeliveryOrder = (string)await _query.ExecScalarProcAsync("SP_GENERATE_NOMOR", "@Category", _category);
            return noDeliveryOrder;
        }


        [AllowAnonymous]
        public async Task<JsonResult> GetNoDeliveryOrder()
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                //string noMemo = (string) await _query.ExecScalarProcAsync("SP_GENERATE_NOMOR", "@Category", _category);
                string noDeliveryOrder = await GenerateNoDeliveryOrder();
                return JsonSuccess(noDeliveryOrder);
            });
        }
        

        [AllowAnonymous]
        public async Task<JsonResult> GetPageDetail(int poid, int pageNumber = 1, int pageSize = 10, string sortBy = "DeliveryOrderId", string sortDirection = "desc")
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    int totalItems = await Task.FromResult<int>(ctx.DeliveryOrderViewDetailSet(poid).Count());

                    var models = await Task.FromResult<IEnumerable<DeliveryOrderViewModel>>(ctx.DeliveryOrderViewDetailSet(poid).AsQueryable()
                    .OrderBy(sortBy + " " + sortDirection)
                    .Skip((pageNumber - 1) * pageSize)
                    .Take(pageSize));

                    IList<DeliveryOrderViewModel> list = models.ToList();

                    return JsonSuccess(new { totalItems = totalItems, data = list.ToArray() });
                }
            });
        }

        
        [AllowAnonymous]
        public async Task<JsonResult> GetPage(string No, string Nopr, string NoRekening, JenisTabungan Jenistabungan, string Cabang, DateTime? Tanggal, DateTime? Tanggalpr, int pageNumber = 1, int pageSize = 10, string sortBy = "PurchaseReceiveId", string sortDirection = "desc")
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    int totalItems = await Task.FromResult<int>(ctx.DeliveryOrderViewSet(No, NoRekening, (int)Jenistabungan, Cabang, Tanggal, Nopr, Tanggalpr).Count());

                    var models = await Task.FromResult<IEnumerable<DeliveryOrderViewModel>>(ctx.DeliveryOrderViewSet(No, NoRekening, (int)Jenistabungan, Cabang, Tanggal, Nopr, Tanggalpr).AsQueryable()
                    .OrderBy(sortBy + " " + sortDirection)
                    .Skip((pageNumber - 1) * pageSize)
                    .Take(pageSize));

                    IList<DeliveryOrderViewModel> list = models.ToList();

                    return JsonSuccess(new { totalItems = totalItems, data = list.ToArray() });
                }
            });
        }

        //[AllowAnonymous]
        //public async Task<JsonResult> AuthorizeGetPage(string Cabang, DateTime? Tanggal, string No, string NoPo, int pageNumber = 1, int pageSize = 10, string sortBy = "Id", string sortDirection = "desc")
        //{
        //    return await ExecuteFaultHandledOperationAsync(async () =>
        //    {
        //        using (var ctx = new SqlFundingDbContext())
        //        {
        //            int totalItems = await Task.FromResult<int>(ctx.AuthorizepurchasereceiveSet(Cabang, Tanggal, No, NoPo).Count());

        //            var models = await Task.FromResult<IEnumerable<PurchaseReceiveViewModel>>(ctx.AuthorizepurchasereceiveSet(Cabang, Tanggal, No, NoPo)
        //            .Skip((pageNumber - 1) * pageSize)
        //            .Take(pageSize));

        //            IList<PurchaseReceiveViewModel> list = models.ToList();

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
                    var models = await ctx.EnquiryTabunganInputSet
                               .Where(x => x.IsDelete == false)
                               .OrderByDescending(x => x.CreateDate)
                               .ToListAsync();

                    IList<EnquirytabunganinputViewModel> list = Mapper.Map<IList<EnquiryTabunganInput>, IList<EnquirytabunganinputViewModel>>(models);

                    return JsonSuccess(new { data = list.ToArray() });
                }
            });
        }


        public JsonResult UploadTandaTerima(string namafile)
        {
            System.IO.DirectoryInfo di = new DirectoryInfo(Server.MapPath(_attachmentTandaTerimaTemp));
            if (!String.IsNullOrWhiteSpace(namafile))
            {
                System.IO.FileInfo file2 = new FileInfo(Server.MapPath(_attachmentTandaTerimaTemp + namafile));
                file2.Delete();
            }

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
                        string nameAndLocation = _attachmentTandaTerimaTemp + filename;
                        fileContent.SaveAs(Server.MapPath(nameAndLocation));
                        break;
                    }
                }
            }
            catch (RetryLimitExceededException /* dex */)
            {
                //Log the error (uncomment dex variable name and add a line here to write a log.
                return JsonError("Unable to upload Attachment Tanda Terima. Try again, and if the problem persists see your system administrator.");
            }
            return JsonSuccess(filename);
        }


        public async Task<JsonResult> Add(DeliveryOrderViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                if (!ModelState.IsValid)
                {
                    return JsonValidationError();
                }

                DeliveryOrder model = Mapper.Map<DeliveryOrder>(form);

                using (var ctx = new SqlFundingDbContext())
                {
                    model.DeliveryOrderId = await GenerateNoDeliveryOrder();
                    ctx.DeliveryOrderSet.Add(model);
                    await ctx.SaveChangesAsync();
                    var cabang = ctx.PurchaseOrderSet.Where(x => x.Id == form.PurchaseOrderId).Select(x => x.EnquiryTabunganInput.Cabang).FirstOrDefault();
                    //NotificationLib.sendNotifikasi(cabang, form.DeliveryOrderId, form.DeliveryOrderDate, "Delivery Order", "Authorize Delivery Order", "Deliveryorder/Authorize");
                    if (!string.IsNullOrEmpty(form.attachmentTandaTerima))
                    {
                        foreach (var file in Directory.GetFiles(Server.MapPath(_attachmentTandaTerimaTemp)))
                        {
                            System.IO.File.Copy(file, Path.Combine(Server.MapPath(_attachmentTandaTerima), Path.GetFileName(file)), true);
                            System.IO.File.Delete(file);
                        }
                    }
                    //var Params = new object[] { 
                    //    new SqlParameter("@id", form.PurchaseReceiveId),
                    //};
                    //if (!String.IsNullOrWhiteSpace(form.))
                    //{
                    //if (form.StatusBarang == StatusBarang.Customer)
                    //{
                    //    var Params2 = new object[] { 
                    //        new SqlParameter("@PRid", form.PurchaseReceiveId),
                    //    };
                    //    await _query.ExecNonQueryAsync("SP_STOP_AUTO_PECADANGAN @PRid", Params2);
                    //}
                    //}
                    //await _query.ExecNonQueryAsync("SP_INSERTPAYMENTPELUNASAN @id", Params);
                    return JsonSuccess(model);
                }
            });
        }


        public async Task<JsonResult> Update(DeliveryOrderViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    var existingModel = ctx.DeliveryOrderSet.Find(form.Id);
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


        public async Task<JsonResult> Delete(DeliveryOrderViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    var target = ctx.DeliveryOrderSet.Find(form.Id);
                    if (target == null)
                    {
                        return JsonError("Data Tidak Ditemukan di database!");
                    }

                    target.IsDelete = true;
                    target.StatusData = StatusData.Deleted;
                    await ctx.SaveChangesAsync();

                    DeliveryOrderViewModel updatedModel = ctx.DeliveryOrderSet.Project().To<DeliveryOrderViewModel>().Single(x => x.Id == form.Id);

                    return JsonSuccess("Delete Success!");
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
    }
}