using AutoMapper;
using AutoMapper.QueryableExtensions;
using Core.Web.Controllers;
using Core.Web.Helpers;
using Core.Web.Infrastructure;
using Core.Web.Utilities;
using MyWeb.DataLayer;
using MyWeb.DataLayer.SqlFunding;
using MyWeb.Infrastructure.Applications;
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
    public class EnquirytabunganinputController : CoreControllerBase
    {

        private ApplicationDbContext _applicationDbContext;
        private ICurrentUser _currentUser;
        private SqlHelper _query = new SqlHelper("SqlFundingConnection");
        private string _category = "DOCUMENT";
        private string _attachmentSPNasabah = "~/Files/enquirytabungan/";
        private string _attachmentSPNasabahTemp = "~/Files/enquirytabungan/Temp/";


        public EnquirytabunganinputController(ApplicationDbContext context, ICurrentUser currentUser)
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
        public async Task<JsonResult> Approve(EnquirytabunganinputViewModel form)
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

                    var target = ctx.EnquiryTabunganInputSet.FirstOrDefault(c => c.NoRekening == form.NoRekening);
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
        public async Task<JsonResult> Reject(EnquirytabunganinputViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                if (!ModelState.IsValid)
                {
                    return JsonValidationError();
                }

                using (var ctx = new SqlFundingDbContext())
                {
                    var target = ctx.EnquiryTabunganInputSet.FirstOrDefault(c => c.NoRekening == form.NoRekening);
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
      

        private async Task<string> GenerateNoMemo()
        {
            string noMemo = (string)await _query.ExecScalarProcAsync("SP_GENERATE_NOMOR", "@Category", _category);
            return noMemo;
        }


        [AllowAnonymous]
        public async Task<JsonResult> GetNoMemo()
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                //string noMemo = (string) await _query.ExecScalarProcAsync("SP_GENERATE_NOMOR", "@Category", _category);
                string noMemo = await GenerateNoMemo();
                return JsonSuccess(noMemo);
            });
        }


        [AllowAnonymous]
        public async Task<JsonResult> GetPage(string searchText, int pageNumber = 1, int pageSize = 10, string sortBy = "Id", string sortDirection = "desc")
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    int totalItems = ctx.EnquiryTabunganInputSet.Count(
                        x => x.IsDelete == false &&
                            (
                                string.IsNullOrEmpty(searchText) ||
                                (
                                x.KodePromosi.Contains(searchText)
                                )
                            )
                        );

                    var models = await ctx.EnquiryTabunganInputSet
                    .Where(x => x.IsDelete == false &&
                            (
                                string.IsNullOrEmpty(searchText) ||
                                (
                                x.KodePromosi.Contains(searchText)
                                )
                            )
                    )
                    .OrderBy(sortBy + " " + sortDirection)
                    .Skip((pageNumber - 1) * pageSize)
                    .Take(pageSize)
                    .ToListAsync();

                    IList<EnquirytabunganinputViewModel> list = Mapper.Map<IList<EnquiryTabunganInput>, IList<EnquirytabunganinputViewModel>>(models);

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
        

        public async Task<JsonResult> Add(EnquirytabunganinputViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                if (!ModelState.IsValid)
                {
                    return JsonValidationError();
                }

                EnquiryTabunganInput model = Mapper.Map<EnquiryTabunganInput>(form);


                using (var ctx = new SqlFundingDbContext())
                {
                    //var target = ctx.MemoSet.FirstOrDefault(c => c.NoMemo == form.NoMemo);
                    //if (target != null)
                    //{
                    //    return JsonError("Data sudah ada di database!");
                    //}                   

                    model.StatusData = StatusData.New;
                    //if (IsNoMemoExists(model.PRId))
                    //{
                        model.PRId = await GenerateNoMemo();
                    //}
                    //ctx.MemoSet.Add(model);
                    await ctx.SaveChangesAsync();

                    //await _query.ExecNonQueryProcAsync("SP_INSERT_GENERATE_NOMOR", "@Nomor", model.NoMemo);

                    //Pindahin file attachment dari temp
                    if (!string.IsNullOrEmpty(form.AttachmentSPNasabah))
                    {
                        foreach (var file in Directory.GetFiles(Server.MapPath(_attachmentSPNasabahTemp)))
                        {
                            System.IO.File.Copy(file, Path.Combine(Server.MapPath(_attachmentSPNasabah), Path.GetFileName(file)), true);
                            System.IO.File.Delete(file);
                        }
                    }

                    return JsonSuccess(model);
                }
            });
        }


        public async Task<JsonResult> Update(EnquirytabunganinputViewModel form)
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
                    if (existingModel.AttachmentSPNasabah != form.AttachmentSPNasabah)
                    {
                        if (!string.IsNullOrEmpty(form.AttachmentSPNasabah))
                        {
                            foreach (var file in Directory.GetFiles(Server.MapPath(_attachmentSPNasabahTemp)))
                            {
                                System.IO.File.Copy(file, Path.Combine(Server.MapPath(_attachmentSPNasabah), Path.GetFileName(file)), true);
                                System.IO.File.Delete(file); //delete file temp
                                if (!string.IsNullOrEmpty(existingModel.AttachmentSPNasabah))
                                {
                                    System.IO.File.Delete(Path.Combine(Server.MapPath(_attachmentSPNasabah), existingModel.AttachmentSPNasabah)); //delete file sebelumnya
                                }
                            }
                        }
                    }
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


        public async Task<JsonResult> Delete(EnquirytabunganinputViewModel form)
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

                    EnquirytabunganinputViewModel updatedModel = ctx.EnquiryTabunganInputSet.Project().To<EnquirytabunganinputViewModel>().Single(x => x.NoRekening == form.NoRekening);

                    return JsonSuccess("Delete Success!");
                }
            });
        }


        public JsonResult UploadSPNasabah()
        {
            System.IO.DirectoryInfo di = new DirectoryInfo(Server.MapPath(_attachmentSPNasabahTemp));
            foreach (FileInfo file in di.GetFiles())
            {
                file.Delete();
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
                //Log the error (uncomment dex variable name and add a line here to write a log.
                return JsonError("Unable to upload Attachment SP Nasabah. Try again, and if the problem persists see your system administrator.");
            }
            return JsonSuccess(filename);
        }


    }
}