using AutoMapper;
using Core.Web.Controllers;
using Core.Web.Helpers;
using Core.Web.Infrastructure;
using Core.Web.Utilities;
using Microsoft.Reporting.WebForms;
using MyWeb.DataLayer;
using MyWeb.DataLayer.SqlFunding;
using MyWeb.Infrastructure.Applications;
using MyWeb.Models;
using MyWeb.Models.Reward;
using MyWeb.SQL_FUNDINGDataSetTableAdapters;
using MyWeb.ViewModels.MyReward;
using MyWeb.ViewModels.Reward;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Linq;
using System.Linq.Dynamic;
using System.Threading.Tasks;
using System.Web.Mvc;
using System.Web.UI.WebControls;

namespace MyWeb.Controllers.Reward
{
    public class PurchaseorderController : CoreControllerBase
    {

        private ApplicationDbContext _applicationDbContext;
        private ICurrentUser _currentUser;
        private SqlHelper _query = new SqlHelper("SqlFundingConnection");
        private string _category = "PurchaseOrder";
        //private string _category2 = "PurchaseOrderGroup";

        public PurchaseorderController(ApplicationDbContext context, ICurrentUser currentUser)
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

        public ActionResult History()
        {
            return View();
        }

        public ActionResult ViewReport(int id, string poNo)
        {
            List<ReportDataSource> reportDataSourceList = new List<ReportDataSource>();

            SP_ReportPurchaseOrderTableAdapter adapter = new SP_ReportPurchaseOrderTableAdapter();
            MyWeb.SQL_FUNDINGDataSet.SP_ReportPurchaseOrderDataTable table = new MyWeb.SQL_FUNDINGDataSet.SP_ReportPurchaseOrderDataTable();
            adapter.Fill(table, poNo);

            reportDataSourceList.Add(new ReportDataSource("DataSet1", (DataTable)table));

            ReportViewer reportViewer = ReportViewer(@"\Reports\Funding\PurchaseOrderReport.rdlc", reportDataSourceList);
            reportViewer.ProcessingMode = ProcessingMode.Local;
            reportViewer.SizeToReportContent = true;
            reportViewer.Width = Unit.Percentage(100);
            reportViewer.Height = Unit.Percentage(100);

            ReportParameter[] parameters = new ReportParameter[1];
            parameters[0] = new ReportParameter("PONo", poNo);
            reportViewer.LocalReport.SetParameters(parameters);

            ViewBag.ReportViewer = reportViewer;

            return View("ViewReport");
        }

        //[MyAuthorize(Roles = "SupervisorReward,Reward_SpvGA,SupervisorProduk")]
        public async Task<JsonResult> Approve(PurchaseOrderViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                if (!ModelState.IsValid)
                    return JsonValidationError();

                using (var ctx = new SqlFundingDbContext())
                {
                    var target = ctx.PurchaseOrderSet.FirstOrDefault(c => c.Id == form.Id);
                    target.StatusData = StatusData.Approved;
                    target.SetApproveByCurrentUser();
                    await ctx.SaveChangesAsync();

                    //NotificationLib.sendNotifikasi("All GA", form.Cabang, form.POId, form.PODate, "Purchase Order", "Pembuatan Payment Request", "Paymentrequest/index");
                    //ctx.SendEmail_MyFunding("All GA", form.POId, form.Cabang, Convert.ToDateTime(form.PODate), "Purchase Order", "Pembuatan Payment Request",
                    //ctx.SendEmail_MyFunding("GA Payment Staff", form.POId, form.Cabang, Convert.ToDateTime(form.PODate), "Purchase Order", "Pembuatan Payment Request",
                    //AKTIFIN LAGI SETELAH TESTING
                    //if (target.PaymentMethod == PaymentMethod.FPAfterReceive)
                    //{
                    //    ctx.SendEmail_MyFunding("After Authorize Payment Request", form.POId, form.Cabang, Convert.ToDateTime(form.PODate), "Purchase Order", "Pembuatan Purchase Recieve",
                    //    string.Format("http://{0}{1}/{2}", Request.Url.Host, Request.ApplicationPath, "PurchaseReceive/index"));
                    //}
                    //else
                    //{
                    //    ctx.SendEmail_MyFunding("After Authorize Purchase Order", form.POId, form.Cabang, Convert.ToDateTime(form.PODate), "Purchase Order", "Pembuatan Payment Request",
                    //        string.Format("http://{0}{1}/{2}", Request.Url.Host, Request.ApplicationPath, "PaymentRequest/index"));
                    //}
                    var Params = new object[] { 
                        new SqlParameter("@POid", form.Id)
                    };
                    //await _query.ExecNonQueryAsync("SP_START_AUTO_PECADANGAN @POid", Params);
                    return JsonSuccess("Approve Success");
                }
            });
        }

        //[MyAuthorize(Roles = "SupervisorReward,Reward_SpvGA,SupervisorProduk")]
        public async Task<JsonResult> Reject(PurchaseOrderViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                if (!ModelState.IsValid)
                    return JsonValidationError();

                using (var ctx = new SqlFundingDbContext())
                {
                    var target = ctx.PurchaseOrderSet.FirstOrDefault(c => c.Id == form.Id);
                    if (target == null)
                        return JsonError("Data tidak ada di database!");

                    ctx.PurchaseOrderSet.Remove(target);
                    //target.PODate = null;
                    //target.POId = null;
                    await ctx.SaveChangesAsync();

                    //AKTIFIN LAGI SETELAH TESTING
                    //ctx.SendEmailReject_MyFunding("After Reject Purchase Order", form.PRId, form.Cabang, Convert.ToDateTime(form.PRDate), "Purchase Request", "Purchase Order Rejected",
                    //        string.Format("http://{0}{1}/{2}", Request.Url.Host, Request.ApplicationPath, "PurchaseOrder/index"));

                    return JsonSuccess("Data Rejected");
                }
            });
        }


        //[MyAuthorize(Roles = "SupervisorReward,Reward_SpvGA,SupervisorProduk")]
        public async Task<JsonResult> Deleted(PurchaseOrderViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                if (!ModelState.IsValid)
                    return JsonValidationError();

                using (var ctx = new SqlFundingDbContext())
                {
                    var target = ctx.PurchaseOrderSet.FirstOrDefault(c => c.Id == form.Id);
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

        private async Task<string> GenerateNoPurchaseGroup(PurchaseOrderViewModel form)
        {
            string noPurchaseGroup = (string)await _query.ExecScalarProcAsync("SP_GENERATE_NOMOR_POGROUP", "@EnquiryID", form.Id);
            //noPurchaseGroup = form.POId + "-" + noPurchaseGroup;
            return noPurchaseGroup;
        }


        [AllowAnonymous]
        public async Task<JsonResult> GetNoPurchaseGroup(PurchaseOrderViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                //string noMemo = (string) await _query.ExecScalarProcAsync("SP_GENERATE_NOMOR", "@Category", _category);
                string noPurchaseGroup = await GenerateNoPurchaseGroup(form);
                return JsonSuccess(noPurchaseGroup);
            });
        }

        [AllowAnonymous]
        public async Task<JsonResult> GetNikUserLogin()
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                if (_currentUser.Employee != null)
                {
                    if (_currentUser.Department != null)
                    {
                        return JsonSuccess(new { nik = _currentUser.Employee.NIK, employeeName = _currentUser.Employee.Nama, departmentId = _currentUser.Department.Id, departmentName = _currentUser.Department.Name });
                    }
                    else
                    {
                        return JsonSuccess(new { nik = _currentUser.Employee.NIK, employeeName = _currentUser.Employee.Nama, departmentId = "", departmentName = "" });
                    }
                }
                else
                    return JsonSuccess(new { nik = "", employeeName = "", departmentId = "", departmentName = "" });
            });
        }


        [AllowAnonymous]
        public async Task<JsonResult> GetPage(string Nomor, string NoRekening, JenisTabungan Jenistabungan, string Cabang, int pageNumber = 1, int pageSize = 10, string sortBy = "PRId", string sortDirection = "desc")
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    int totalItems = await Task.FromResult<int>(ctx.PurchaseorderviewSet(Nomor, NoRekening, (int)Jenistabungan, Cabang).Count());

                    var models = await Task.FromResult<IEnumerable<EnquirytabunganViewModel>>(ctx.PurchaseorderviewSet(Nomor, NoRekening, (int)Jenistabungan, Cabang)
                        .AsQueryable()
                        .OrderBy(sortBy + " " + sortDirection)
                        .Skip((pageNumber - 1) * pageSize)
                        .Take(pageSize));

                    IList<EnquirytabunganViewModel> list = models.ToList();

                    if (list != null)
                    {
                        foreach (var item in list)
                        {
                            item.DetailBarangList = Mapper.Map<List<DetailBarang>>(await ctx.DetailBarangSet.Where(x => x.Id == item.DetailBarangId).ToListAsync());
                        }
                    }
                    return JsonSuccess(new { totalItems = totalItems, data = list.ToArray() });
                }
            });
        }

        [AllowAnonymous]
        public async Task<JsonResult> AuthorizeGetPage(DateTime? Tanggal, JenisTabungan Jenistabungan, string Cabang, string No, int pageNumber = 1, int pageSize = 10, string sortBy = "POId", string sortDirection = "desc")
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    int totalItems = await Task.FromResult<int>(ctx.AuthorizepurchaseorderSet(Tanggal, (int)Jenistabungan, Cabang, No).Count());

                    var models = await Task.FromResult<IEnumerable<PurchaseOrderViewModel>>(ctx.AuthorizepurchaseorderSet(Tanggal, (int)Jenistabungan, Cabang, No)
                        .AsQueryable()
                        .OrderBy(sortBy + " " + sortDirection)
                        .Skip((pageNumber - 1) * pageSize)
                        .Take(pageSize));

                    IList<PurchaseOrderViewModel> list = models.ToList();

                    if (list != null)
                    {
                        foreach (var item in list)
                        {
                            item.DetailBarangList = Mapper.Map<List<DetailBarang>>(await ctx.DetailBarangSet.Where(x => x.Id == item.DetailBarangId).ToListAsync());
                        }
                    }

                    return JsonSuccess(new { totalItems = totalItems, data = list.ToArray() });
                }
            });
        }

        /*Section History Page*/

        [AllowAnonymous]
        public async Task<JsonResult> HistoryGetPage(DateTime? TanggalMulai, DateTime? TanggalAkhir, JenisTabungan Jenistabungan, string Cabang, string No, string print, int pageNumber = 1, int pageSize = 10, string sortBy = "POId", string sortDirection = "desc")
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    int totalItems = await Task.FromResult<int>(ctx.HistoryPurchaseOrderSet(TanggalMulai, TanggalAkhir, (int)Jenistabungan, Cabang, No, print).Count());

                    var models = await Task.FromResult<IEnumerable<PurchaseOrderViewModel>>(ctx.HistoryPurchaseOrderSet(TanggalMulai, TanggalAkhir, (int)Jenistabungan, Cabang, No, print)
                        .AsQueryable()
                        .OrderBy(sortBy + " " + sortDirection)
                        .Skip((pageNumber - 1) * pageSize)
                        .Take(pageSize));

                    IList<PurchaseOrderViewModel> list = models.ToList();

                    if (list != null)
                    {
                        foreach (var item in list)
                        {
                            item.DetailBarangList = Mapper.Map<List<DetailBarang>>(await ctx.DetailBarangSet.Where(x => x.Id == item.DetailBarangId).ToListAsync());
                        }
                    }

                    return JsonSuccess(new { totalItems = totalItems, data = list.ToArray() });
                }
            });
        }

        [AllowAnonymous]
        public async Task<JsonResult> HistoryPOGetAll(DateTime? TanggalMulai, DateTime? TanggalAkhir, string Cabang, string No, int pageNumber = 1, int pageSize = 10, string sortBy = "POId", string sortDirection = "desc")
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    int totalItems = await Task.FromResult<int>(ctx.HistoryPOGetAll(TanggalMulai, TanggalAkhir, Cabang, No).Count());

                    var models = await Task.FromResult<IEnumerable<PurchaseOrderViewModel>>(ctx.HistoryPOGetAll(TanggalMulai, TanggalAkhir, Cabang, No)
                        .AsQueryable()
                        .OrderBy(sortBy + " " + sortDirection)
                        .Skip((pageNumber - 1) * pageSize)
                        .Take(pageSize));

                    IList<PurchaseOrderViewModel> list = models.ToList();

                    if (list != null)
                    {
                        foreach (var item in list)
                        {
                            item.DetailBarangList = Mapper.Map<List<DetailBarang>>(await ctx.DetailBarangSet.Where(x => x.Id == item.DetailBarangId).ToListAsync());
                        }
                    }

                    return JsonSuccess(new { totalItems = totalItems, data = list.ToArray() });
                }
            });
        }

        /*End Section History Page*/

        [AllowAnonymous]
        public async Task<JsonResult> GetSupplier(string searchText, int pageNumber = 1, int pageSize = 10, string sortBy = "Supp_ID", string sortDirection = "desc")
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    string search = searchText.ToLower();

                    int totalItems = await Task.FromResult<int>(ctx.SupplierSet().Count());

                    var models = await Task.FromResult<IEnumerable<SupplierViewModel>>(ctx.SupplierSet()
                        .AsQueryable()
                        .Where(x => (x.Supp_ID != null && x.Supp_ID.ToLower().Contains(searchText)) ||
                                    (x.Nm_Supp != null && x.Nm_Supp.ToLower().Contains(searchText)) ||
                                    (x.Alamat1 != null && x.Alamat1.ToLower().Contains(searchText)) ||
                                    (x.Alamat2 != null && x.Alamat2.ToLower().Contains(searchText)) ||
                                    (x.Alamat3 != null && x.Alamat3.ToLower().Contains(searchText)) ||
                                    (x.Kota != null && x.Kota.ToLower().Contains(searchText)) ||
                                    (x.Zip_ID != null && x.Zip_ID.ToLower().Contains(searchText)) ||
                                    (x.Kabupaten != null && x.Kabupaten.ToLower().Contains(searchText)) ||
                                    (x.Provinsi != null && x.Provinsi.ToLower().Contains(searchText)) ||
                                    (x.Owner != null && x.Owner.ToLower().Contains(searchText)) ||
                                    (x.Telp_Owner != null && x.Telp_Owner.ToLower().Contains(searchText)) ||
                                    (x.HP_Owner != null && x.HP_Owner.ToLower().Contains(searchText)) ||
                                    (x.PIC != null && x.PIC.ToLower().Contains(searchText)) ||
                                    (x.Telp_PIC != null && x.Telp_PIC.ToLower().Contains(searchText)) ||
                                    (x.HP_PIC != null && x.HP_PIC.ToLower().Contains(searchText)) ||
                                    (x.Fax_No != null && x.Fax_No.ToLower().Contains(searchText)) ||
                                    (x.Email != null && x.Email.ToLower().Contains(searchText)) ||
                                    (x.NoRek != null && x.NoRek.ToLower().Contains(searchText)) ||
                                    (x.Nm_Bank != null && x.Nm_Bank.ToLower().Contains(searchText)) ||
                                    (x.TermOfPayment != null && x.TermOfPayment.ToLower().Contains(searchText))
                                    )
                        .OrderBy(sortBy + " " + sortDirection)
                        .Skip((pageNumber - 1) * pageSize)
                        .Take(pageSize));

                    IList<SupplierViewModel> list = models.ToList();

                    return JsonSuccess(new { totalItems = totalItems, data = list.ToArray() });
                }
            });
        }

        //20190130, jeni, BEGIN
        [AllowAnonymous]
        public async Task<JsonResult> GetPOGroup(string SupplierId = "", int PaymentMethod = 0, string searchText = "", int pageNumber = 1, int pageSize = 10, string sortBy = "POGroupId", string sortDirection = "desc")
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    string search = searchText.ToLower();

                    int totalItems = await Task.FromResult<int>(ctx.POGroupSet(SupplierId, PaymentMethod).Count());

                    pageSize = totalItems;

                    var models = await Task.FromResult<IEnumerable<POGroupIDViewModel>>(ctx.POGroupSet(SupplierId, PaymentMethod)
                        .AsQueryable()
                        .Where(x => (x.POGroupId != null && x.POGroupId.ToLower().Contains(searchText)))
                        .OrderBy(sortBy + " " + sortDirection)
                        .Skip((pageNumber - 1) * pageSize)
                        .Take(pageSize));

                    IList<POGroupIDViewModel> list = models.ToList();

                    return JsonSuccess(new { totalItems = totalItems, data = list.ToArray() });
                }
            });
        }
        //20190130, jeni, END

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


        public async Task<JsonResult> Add(PurchaseOrderViewModel form)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                if (!ModelState.IsValid)
                    return JsonValidationError();

                PurchaseOrder model = Mapper.Map<PurchaseOrder>(form);

                using (var ctx = new SqlFundingDbContext())
                {
                    if (form.NamaBank.Contains("BANK MAYORA"))
                    {
                        int totalItems = await Task.FromResult<int>(ctx.SP_CHECKING_ACCCOUNT(form.NomorRekeningVendor).AsQueryable()
                            .Count(
                            ));
                        if (totalItems <= 0)
                            return JsonError(string.Format("Nomor Rekening Vendor {0} tidak ditemukan di Account!", form.NomorRekeningVendor));
                    }

                    //var existingModel = ctx.PurchaseOrderSet.Find(form.Id);
                    //Mapper.Map(form, existingModel);

                    //if (existingModel.StatusData == StatusData.Approved)
                    //{
                    //    existingModel.SetUpdateByCurrentUser();

                    //}
                    model.CreateBy = _currentUser.User.Id;
                    model.CreateDate = DateTime.Now;
                    model.ApproveBy = null;
                    model.ApproveDate = null;
                    model.Id = 0;
                    model.EnquiryId = form.Id;
                    model.StatusData = StatusData.New;
                    //20190206, jeni, BEGIN
                    //model.POId = await GenerateNoPurchaseOrder();
                    //model.POGroupId = model.POId + "-1";
                    if (model.POId == model.POGroupId)
                    {
                        model.POId = await GenerateNoPurchaseOrder();
                        model.POGroupId = model.POId;
                    }
                    else
                    {
                        model.POId = await GenerateNoPurchaseOrder();
                    }
                    //20190206, jeni, END
                    ctx.PurchaseOrderSet.Add(model);

                    await _query.ExecNonQueryProcAsync("[SP_Insert_GenerateNoPurchaseOrder]", "@Nomor", model.POId);
                    await ctx.SaveChangesAsync();

                    //NotificationLib.sendNotifikasi("Head GA", form.Cabang, form.POId, form.PODate, "Purchase Order", "Authorize Puchase Order", "Purchaseorder/Authorize");

                    //ctx.SendEmail_MyFunding("Head GA", form.POId, form.Cabang, Convert.ToDateTime(form.PODate), "Purchase Order", "Authorize Purchase Order",
                    //ctx.SendEmail_MyFunding("GA Head", form.POId, form.Cabang, Convert.ToDateTime(form.PODate), "Purchase Order", "Authorize Purchase Order", 

                    //AKTIFIN LAGI SETELAH TESTING
                    //ctx.SendEmail_MyFunding("After Add Purchase Order", form.POId, form.Cabang, Convert.ToDateTime(form.PODate), "Purchase Order", "Authorize Purchase Order",
                    //    string.Format("http://{0}{1}/{2}", Request.Url.Host, Request.ApplicationPath, "PurchaseOrder/Authorize"));

                    //if (form.DetailBarangList != null)
                    //{
                    //    var existingDetailBarang = ctx.EnquiryTabunganInputSet.FirstOrDefault(c => c.DraftPRId == form.DraftPRId && c.IsDelete == false);
                    //    if (existingDetailBarang != null)
                    //    {
                    //        foreach (var item in form.DetailBarangList)
                    //        {
                    //            DetailBarang detailBarang = Mapper.Map<DetailBarang>(item);
                    //            detailBarang.EnquiryId = existingDetailBarang.Id;
                    //            ctx.DetailBarangSet.Add(detailBarang);
                    //            await ctx.SaveChangesAsync();
                    //        }
                    //    }
                    //}

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
                    var existingModel = ctx.EnquiryTabunganInputSet.Find(form.NoRekening);
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

        private async Task<string> GenerateNoPurchaseOrder()
        {
            string noPurchaseOrder = (string)await _query.ExecScalarProcAsync("SP_GenerateNoPurchaseOrder");
            return noPurchaseOrder;
        }


        public async Task<JsonResult> GetNoPurchaseOrder()
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                //string noMOA = (string) await _query.ExecScalarProcAsync("SP_GENERATE_NOMOR", "@Category", _category);
                string NomorPurchaseOrder = await GenerateNoPurchaseOrder();
                return JsonSuccess(NomorPurchaseOrder);
            });
        }


        public async Task<JsonResult> GetDetailBarang(int EnquiryId)
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    var id = await ctx.PurchaseOrderSet.Select(x => x.DetailBarangId).ToArrayAsync();
                    var models = await ctx.DetailBarangSet
                        .Where(x => x.IsDelete == false && x.EnquiryId == EnquiryId && !(id.Contains(x.Id)))
                        .OrderByDescending(x => x.CreateDate)
                        .ToListAsync();

                    IList<DetailbarangViewModel> list = Mapper.Map<IList<DetailBarang>, IList<DetailbarangViewModel>>(models);

                    return JsonSuccess(new { data = list.ToArray() });
                }
            });
        }

        [AllowAnonymous]
        public async Task<JsonResult> GetCMSBankPage(string searchText, int pageNumber = 1, int pageSize = 10, string sortBy = "BankName", string sortDirection = "asc")
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {

                    searchText = searchText.ToLower();

                    int totalItems = await Task.FromResult<int>(ctx.CMSBankSet().AsQueryable()
                        .Count(x =>

                            (
                                    string.IsNullOrEmpty(searchText) ||
                                    (
                                    x.BankName.ToLower().Contains(searchText)

                                    )
                                )

                        ));

                    var models = await Task.FromResult<IEnumerable<BankViewModel>>(ctx.CMSBankSet().AsQueryable()
                        .Where(x =>
                            (
                                    string.IsNullOrEmpty(searchText) ||
                                    (
                                    x.BankName.ToLower().Contains(searchText)
                                    )
                                )
                        )
                        .OrderBy(sortBy + " " + sortDirection)
                        .Skip((pageNumber - 1) * pageSize)
                        .Take(pageSize)
                        );

                    IList<BankViewModel> list = models.ToList();

                    return JsonSuccess(new { totalItems = totalItems, data = list.ToArray() });
                }
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

        //20190115, jeni, BEGIN
        public async Task<JsonResult> RejecttoPr(PurchaseOrderViewModel form)
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
                    target.ApproveBy2 = null;
                    target.ApproveDate2 = null;
                    target.StatusData2 = StatusData.Rejected;
                    target.RejectBy2 = _currentUser.User.Id;
                    target.RejectDate2 = DateTime.Now;
                    target.RejectReason2 = form.RejectReason;
                    //target.RejectDate = DateTime.Now;
                    //20190114, jeni, END
                    await ctx.SaveChangesAsync();

                    //UNCOMMENT ABIS TESTING
                    ctx.SendEmailReject_MyFunding("After Reject Purchase Order", form.DraftPRId, form.Cabang, Convert.ToDateTime(form.DraftPRDate), "Purchase Order", "Purchase Order Rejected",
                        string.Format("http://{0}{1}/{2}", Request.Url.Host, Request.ApplicationPath, "PurchaseRequest/index"));

                    return JsonSuccess("Data Rejected");
                }
            });
        }
        //20190115, jeni, END

        //20200730, eka, BEGIN
        public async Task<JsonResult> GetDetail(DateTime startDate, DateTime endDate, decimal amortizeAmount)
        {
            var today = DateTime.Now;
            
            var dt = new System.Data.DataTable();

            dt.Columns.Add("periode", typeof(int));
            dt.Columns.Add("valueDate", typeof(DateTime));
            dt.Columns.Add("amortizeAmount", typeof(decimal));

            int rangeBulan = 0;
            int bedaBulanDariStartDate = 0;

            using (var ctx = new SqlFundingDbContext())
            {
                rangeBulan = await ctx.Database.SqlQuery<int>(string.Format("SELECT DATEDIFF(M, '{0}', '{1}')", startDate, endDate)).SingleOrDefaultAsync();
                bedaBulanDariStartDate = await ctx.Database.SqlQuery<int>(string.Format("SELECT DATEDIFF(M, '{0}', '{1}')", startDate, today)).SingleOrDefaultAsync();
            }

            for (int j = 0; j <= bedaBulanDariStartDate; j++)
            {
                if (dt.Rows.Count == 1)
                {
                    var temp = Convert.ToDecimal(dt.Rows[0]["amortizeAmount"]);
                    dt.Rows[0]["amortizeAmount"] = temp + amortizeAmount;
                }
                else
                {
                    var bulanBerjalan = startDate.AddMonths(bedaBulanDariStartDate);
                    dt.Rows.Add(1, bulanBerjalan, amortizeAmount);
                }
            }

            for (int i = 1; i < rangeBulan - bedaBulanDariStartDate; i++)
            {
                var bulanBerjalan = startDate.AddMonths(i + bedaBulanDariStartDate);
                dt.Rows.Add(i + 1, bulanBerjalan, amortizeAmount);
            }

            return JsonSuccess(dt);
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
        public async Task<JsonResult> historyGetAll(DateTime? TanggalMulai, DateTime? TanggalAkhir, JenisTabungan Jenistabungan, string Cabang, string No, string print, int pageNumber = 1, int pageSize = 10, string sortBy = "POId", string sortDirection = "desc")
        {
            return await ExecuteFaultHandledOperationAsync(async () =>
            {
                using (var ctx = new SqlFundingDbContext())
                {
                    int totalItems = await Task.FromResult<int>(ctx.HistoryPurchaseOrderSet(TanggalMulai, TanggalAkhir, (int)Jenistabungan, Cabang, No, print).Count());

                    var models = await Task.FromResult<IEnumerable<PurchaseOrderViewModel>>(ctx.HistoryPurchaseOrderSet(TanggalMulai, TanggalAkhir, (int)Jenistabungan, Cabang, No, print)
                        .AsQueryable()
                        .OrderBy(sortBy + " " + sortDirection)
                        //.Skip((pageNumber - 1) * pageSize)
                        //.Take(pageSize)
                        );

                    IList<PurchaseOrderViewModel> list = models.ToList();

                    if (list != null)
                    {
                        foreach (var item in list)
                        {
                            item.DetailBarangList = Mapper.Map<List<DetailBarang>>(await ctx.DetailBarangSet.Where(x => x.Id == item.DetailBarangId).ToListAsync());
                        }
                    }
                    return JsonSuccess(new { totalItems = totalItems, data = list.ToArray() });
                }
            });
        }
        //20200730, eka, END
    }
}