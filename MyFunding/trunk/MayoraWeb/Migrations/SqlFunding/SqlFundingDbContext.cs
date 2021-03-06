using MyWeb.DataLayer.Reward;
using MyWeb.Models.Reward;
using MyWeb.ViewModels.MyReward;
using MyWeb.ViewModels.Reward;
using System;
using System.Data.Entity;
//using MyWeb.DataLayer.Reward;
using System.Data.Entity.Core.Objects;
using System.Data.Entity.Infrastructure;
using System.Data.SqlClient;

namespace MyWeb.DataLayer.SqlFunding
{
    public class SqlFundingDbContext : DbContext
    {
        public SqlFundingDbContext()
            : base("SqlFundingConnection")
        {
            // Database.SetInitializer<SqlFundingDbContext>(null);

            this.Database.CommandTimeout = 3600;
            this.Configuration.LazyLoadingEnabled = false;

        }


        public DbSet<EnquiryTabunganInput> EnquiryTabunganInputSet { get; set; }
        public DbSet<DetailBarang> DetailBarangSet { get; set; }
        public DbSet<PurchaseOrder> PurchaseOrderSet { get; set; }
        public DbSet<PaymentRequest> PaymentRequestSet { get; set; }
        public DbSet<JurnalPembayaran> JurnalPembayaranSet { get; set; }
        public DbSet<JurnalPelunasan> JurnalPelunasanSet { get; set; }
        public DbSet<PurchaseReceive> PurchaseReceiveSet { get; set; }
        public DbSet<AmortisasiRequest> AmortisasiRequestSet { get; set; }
        public DbSet<DeliveryOrder> DeliveryOrderSet { get; set; }
        public DbSet<AmortisasiRequestDetail> AmortisasiRequestDetailSet { get; set; }
        public DbSet<Pencadangan> PencadanganSet { get; set; }
        public DbSet<PencadanganTransaksi> PencadanganTransaksiSet { get; set; }
        public DbSet<BreakAmortisasiRequestDetail> BreakAmortisasiRequestDetailSet { get; set; }
        public DbSet<BreakAmortisasiRequest> BreakAmortisasiRequestSet { get; set; }
        public DbSet<Katalog> KatalogSet { get; set; }
        public DbSet<InternalAccount> InternalAccountSet { get; set; }
        public DbSet<ParameterEmail> ParameterEmailSet { get; set; }
        public DbSet<MasterJurnalOtomatis> MasterJurnalOtomatisSet { get; set; }

        public DbSet<KartuAmortisasi> KartuAmortisasiSet { get; set; }
        public DbSet<UploadNasabah> UploadNasabahSet { get; set; }
        
        public DbSet<UploadPenyimpangan> UploadPenyimpanganSet { get; set; }

        public DbSet<JurnalCashback> JurnalCashbackListSet { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Configurations.Add(new EnquiryTabunganInputConfiguration());
            modelBuilder.Configurations.Add(new DetailBarangConfiguration());
            modelBuilder.Configurations.Add(new PurchaseOrderConfiguration());
            modelBuilder.Configurations.Add(new PaymentRequestConfiguration());
            modelBuilder.Configurations.Add(new JurnalPembayaranConfiguration());
            modelBuilder.Configurations.Add(new PurchaseReceiveConfiguration());
            modelBuilder.Configurations.Add(new AmortisasiRequestConfiguration());
            modelBuilder.Configurations.Add(new AmortisasiRequestDetailConfiguration());
            modelBuilder.Configurations.Add(new BreakAmortisasiRequestConfiguration());
            modelBuilder.Configurations.Add(new BreakAmortisasiRequestDetailConfiguration());
            modelBuilder.Configurations.Add(new KatalogConfiguration());
            modelBuilder.Configurations.Add(new DeliveryOrderConfiguration());
            modelBuilder.Configurations.Add(new PencadanganConfiguration());
            modelBuilder.Configurations.Add(new PencadanganTransaksiConfiguration());
            modelBuilder.Configurations.Add(new InternalAccountConfiguration());
            modelBuilder.Configurations.Add(new ParameterEmailConfiguration());
            modelBuilder.Configurations.Add(new MasterJurnalOtomatisConfiguration());
            modelBuilder.Configurations.Add(new KartuAmortisasiConfiguration());
            modelBuilder.Configurations.Add(new UploadNasabahConfiguration());
            modelBuilder.Configurations.Add(new JurnalCashbackConfiguration());
            base.OnModelCreating(modelBuilder);
        }
        public virtual ObjectResult<string> SP_GenerateFTCashBack(string POGroupId)
        {
            var Params = new object[] { 
                new SqlParameter("@POGroupId", POGroupId)
            };
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<string>("SP_GenerateFTCashBack @POGroupId", Params);
        }
        public virtual void SendEmail_MyFunding(string Group, string DocumentNo, string Cabang, DateTime DocumentDate, string DocumentType, string JenisPembuatan, string Link)
        {
            var Params = new object[] { 
                new SqlParameter("@Group", Group),
                new SqlParameter("@DocumentNo", DocumentNo),
                new SqlParameter("@Cabang", Cabang),
                new SqlParameter("@DocumentDate", DocumentDate),
                new SqlParameter("@DocumentType", DocumentType),
                new SqlParameter("@JenisPembuatan", JenisPembuatan),
                new SqlParameter("@Link", Link)
            };
            ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<Int32>("SP_SendEmail_MyFunding @Group, @DocumentNo, @Cabang, @DocumentDate, @DocumentType, @JenisPembuatan, @Link", Params);
        }

        public virtual void SendEmailReject_MyFunding(string Group, string DocumentNo, string Cabang, DateTime DocumentDate, string DocumentType, string JenisPembuatan, string Link)
        {
            var Params = new object[] { 
                new SqlParameter("@Group", Group),
                new SqlParameter("@DocumentNo", DocumentNo),
                new SqlParameter("@Cabang", Cabang),
                new SqlParameter("@DocumentDate", DocumentDate),
                new SqlParameter("@DocumentType", DocumentType),
                new SqlParameter("@JenisPembuatan", JenisPembuatan),
                new SqlParameter("@Link", Link)
            };
            ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<Int32>("SP_SendEmailReject_MyFunding @Group, @DocumentNo, @Cabang, @DocumentDate, @DocumentType, @JenisPembuatan, @Link", Params);
        }

        public virtual ObjectResult<PurchaseOrderViewModel> GetPageAmortisasiRequestPurchaseOrder(string cabang, string status, string searchText)
        {
            var Params = new object[] { 
                new SqlParameter("@cabanglogin", cabang),
                new SqlParameter("@status", status),
                new SqlParameter("@searchtext", searchText)
            };
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<PurchaseOrderViewModel>("[GetPageAmortisasiRequestPurchaseOrder] @cabanglogin, @status, @searchtext", Params);
        }

        public virtual ObjectResult<DetailbarangViewModel> SP_Update_DetailBarang_PR(int id, int quantity)
        {
            var Params = new object[] { 
                new SqlParameter("@id", id),
                new SqlParameter("@quantity", quantity)
            };
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<DetailbarangViewModel>("[SP_Update_DetailBarang_PR] @id, @quantity", Params);
        }

        public virtual ObjectResult<PurchaseReceiveViewModel> PurchaseReceiveViewSet(string no, string noRekening, int JenisTabungan, string cabang, DateTime? Tanggal, string nopr)
        {
            var Params = new object[] { 
                new SqlParameter("@no", no),
                new SqlParameter("@noRekening", noRekening),
                new SqlParameter("@tanggal", Tanggal == null ? (object)DBNull.Value : Tanggal),
                new SqlParameter("@jenis", JenisTabungan),
                new SqlParameter("@cabang", cabang),
                new SqlParameter("@nopr", nopr) 
            };
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<PurchaseReceiveViewModel>("SP_PURCHASERECEIVE @no, @norekening, @jenis, @cabang, @tanggal, @nopr", Params);
        }
        public virtual ObjectResult<PurchaseReceiveViewModel> PelunasanSet(string no, string nopr, int JenisTabungan, string cabang, DateTime? Tanggal, DateTime? Tanggalpr)
        {
            var Params = new object[] { 
                new SqlParameter("@no", no),
                new SqlParameter("@nopr", nopr),
                new SqlParameter("@tanggal", Tanggal == null ? (object)DBNull.Value : Tanggal),
                new SqlParameter("@tanggalpr", Tanggalpr == null ? (object)DBNull.Value : Tanggalpr),
                new SqlParameter("@jenis", JenisTabungan),
                new SqlParameter("@cabang", cabang) 
            };
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<PurchaseReceiveViewModel>("SP_PELUNASAN @no, @nopr, @jenis, @cabang, @tanggal, @tanggalpr", Params);
        }
        public virtual ObjectResult<EnquirytabunganViewModel> EnquirytabunganSet(DateTime? Tanggal, int JenisTabungan, string cabang)
        {
            var Params = new object[] { 
                new SqlParameter("@tanggal", Tanggal == null ? (object)DBNull.Value : Tanggal),
                new SqlParameter("@jenis", JenisTabungan),
                new SqlParameter("@cabang", cabang) 
            };
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<EnquirytabunganViewModel>("SP_ENQUIRYTABUNGAN @tanggal, @jenis, @cabang", Params);
        }
        public virtual ObjectResult<EnquirytabunganViewModel> PurchaserequestSet(string NoDraft, string NoRekening, int JenisTabungan, string cabang)
        {
            var Params = new object[] { 
                new SqlParameter("@nodraft", NoDraft),
                new SqlParameter("@norekening", NoRekening),
                new SqlParameter("@jenis", JenisTabungan),
                new SqlParameter("@cabang", cabang) 
            };
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<EnquirytabunganViewModel>("SP_PURCHASEREQUEST @nodraft, @norekening, @jenis, @cabang", @Params);
        }
        public virtual ObjectResult<PurchaseReceiveViewModel> AuthorizepurchasereceiveSet(string Cabang, DateTime? Tanggal, string No, string NoPo, DateTime? Tanggalpo)
        {
            var Params = new object[] { 
                new SqlParameter("@cabang", Cabang) ,
                new SqlParameter("@tanggal", Tanggal == null ? (object)DBNull.Value : Tanggal),
                new SqlParameter("@no", No),
                new SqlParameter("@nopo", NoPo),
                new SqlParameter("@tanggalpo", Tanggalpo == null ? (object)DBNull.Value : Tanggalpo),
            };
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<PurchaseReceiveViewModel>("SP_AUTHORIZEPURCHASERECEIVE @cabang, @tanggal, @no, @nopo, @tanggalpo", @Params);
        }

        public virtual ObjectResult<PurchaseReceiveViewModel> HistorypurchasereceiveSet(string Cabang, DateTime? Tanggal, string No, string NoPo, DateTime? Tanggalpo)
        {
            var Params = new object[] { 
                new SqlParameter("@cabang", Cabang) ,
                new SqlParameter("@tanggal", Tanggal == null ? (object)DBNull.Value : Tanggal),
                new SqlParameter("@no", No),
                new SqlParameter("@nopo", NoPo),
                new SqlParameter("@tanggalpo", Tanggalpo == null ? (object)DBNull.Value : Tanggalpo),
            };
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<PurchaseReceiveViewModel>("SP_HISTORYPURCHASERECEIVE @cabang, @tanggal, @no, @nopo, @tanggalpo", @Params);
        }
        public virtual ObjectResult<EnquirytabunganViewModel> PurchaseorderviewSet(string Nomor, string NoRekening, int JenisTabungan, string cabang)
        {
            var Params = new object[] { 
                new SqlParameter("@no", Nomor),
                new SqlParameter("@norekening", NoRekening),
                new SqlParameter("@jenis", JenisTabungan),
                new SqlParameter("@cabang", cabang) 
            };
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<EnquirytabunganViewModel>("SP_PURCHASEORDER @no, @norekening, @jenis, @cabang", @Params);
        }

        public virtual ObjectResult<EnquirytabunganViewModel> CashbackviewSet(string Nomor, string NoRekening, int JenisTabungan, string cabang)
        {
            var Params = new object[] { 
                new SqlParameter("@no", Nomor),
                new SqlParameter("@norekening", NoRekening),
                new SqlParameter("@jenis", JenisTabungan),
                new SqlParameter("@cabang", cabang) 
            };
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<EnquirytabunganViewModel>("SP_Cashback @no, @norekening, @jenis, @cabang", @Params);
        }

        public virtual ObjectResult<PaymentRequestViewModel> PaymentrequestSet(string Nomor, DateTime? Tanggal, int JenisTabungan, string cabang)
        {
            var Params = new object[] { 
                new SqlParameter("@no", Nomor),
                new SqlParameter("@tanggal", Tanggal == null ? (object)DBNull.Value : Tanggal),
                new SqlParameter("@jenistabungan", JenisTabungan),
                new SqlParameter("@cabang", cabang) 
            };
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<PaymentRequestViewModel>("SP_PAYMENTREQUEST @no, @tanggal, @jenistabungan, @cabang", @Params);
        }

        public virtual ObjectResult<string> GetEmailByRoleID(string IDROLE)
        {
            var Params = new object[] { 
                new SqlParameter("@ROLEID", IDROLE)
            };
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<string>("SP_GETLISTEMAIL_BY_ROLE @ROLEID", Params);
        }
        public virtual ObjectResult<string> GetEmailByRoleName(string ROLEName)
        {
            var Params = new object[] { 
                new SqlParameter("@rolename", ROLEName)
            };
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<string>("SP_GETLISTEMAIL_BY_ROLE @rolename", Params);
        }
        public virtual ObjectResult<PaymentRequestViewModel> AuthorizepaymentrequestSet(DateTime? Tanggal, int JenisTabungan, string cabang, string norekening, string no, string nopo, DateTime? tanggalpo)
        {
            var Params = new object[] { 
                new SqlParameter("@tanggal", Tanggal == null ? (object)DBNull.Value : Tanggal),
                new SqlParameter("@jenis", JenisTabungan),
                new SqlParameter("@cabang", cabang),
                new SqlParameter("@norekening", norekening),
                new SqlParameter("@no", no),
                new SqlParameter("@nopo", nopo),
                new SqlParameter("@tanggalpo", tanggalpo == null ? (object)DBNull.Value : tanggalpo),
            };
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<PaymentRequestViewModel>("SP_AUTHORIZEPAYMENTREQUEST @tanggal, @jenis, @cabang, @norekening, @no, @nopo, @tanggalpo", Params);
        }
        public virtual ObjectResult<EnquirytabunganViewModel> AuthorizeenquirytabunganSet(DateTime? Tanggal, int JenisTabungan, string cabang, string norekening, string nodraft)
        {
            var Params = new object[] { 
                new SqlParameter("@tanggal", Tanggal == null ? (object)DBNull.Value : Tanggal),
                new SqlParameter("@jenis", JenisTabungan),
                new SqlParameter("@cabang", cabang),
                new SqlParameter("@norekening", norekening),
                new SqlParameter("@nodraft", nodraft)
            };
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<EnquirytabunganViewModel>("SP_AUTHORIZEENQUIRYTABUNGAN @tanggal, @jenis, @cabang, @norekening, @nodraft", Params);
        }
        public virtual ObjectResult<EnquirytabunganViewModel> RejectenquirytabunganSet(DateTime? Tanggal, int JenisTabungan, string cabang, string norekening, string nodraft)
        {
            var Params = new object[] { 
                new SqlParameter("@tanggal", Tanggal == null ? (object)DBNull.Value : Tanggal),
                new SqlParameter("@jenis", JenisTabungan),
                new SqlParameter("@cabang", cabang),
                new SqlParameter("@norekening", norekening),
                new SqlParameter("@nodraft", nodraft)
            };
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<EnquirytabunganViewModel>("SP_REJECTENQUIRYTABUNGAN @tanggal, @jenis, @cabang, @norekening, @nodraft", Params);
        }
        public virtual ObjectResult<EnquirytabunganViewModel> AuthorizepurchaserequestSet(DateTime? Tanggal, int JenisTabungan, string cabang, string norekening, string no)
        {
            var Params = new object[] { 
                new SqlParameter("@tanggal", Tanggal == null ? (object)DBNull.Value : Tanggal),
                new SqlParameter("@jenis", JenisTabungan),
                new SqlParameter("@cabang", cabang),
                new SqlParameter("@norekening", norekening),
                new SqlParameter("@no", no)
            };
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<EnquirytabunganViewModel>("SP_AUTHORIZEPURCHASEREQUEST @tanggal, @jenis, @cabang, @norekening, @no", Params);
        }
        public virtual ObjectResult<EnquirytabunganViewModel> RejectpurchaserequestSet(DateTime? Tanggal, int JenisTabungan, string cabang, string norekening, string no)
        {
            var Params = new object[] { 
                new SqlParameter("@tanggal", Tanggal == null ? (object)DBNull.Value : Tanggal),
                new SqlParameter("@jenis", JenisTabungan),
                new SqlParameter("@cabang", cabang),
                new SqlParameter("@norekening", norekening),
                new SqlParameter("@no", no)
            };
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<EnquirytabunganViewModel>("SP_REJECTPURCHASEREQUEST @tanggal, @jenis, @cabang, @norekening, @no", Params);
        }
        public virtual ObjectResult<PurchaseOrderViewModel> AuthorizepurchaseorderSet(DateTime? Tanggal, int JenisTabungan, string cabang, string no)
        {
            var Params = new object[] { 
                new SqlParameter("@tanggal", Tanggal == null ? (object)DBNull.Value : Tanggal),
                new SqlParameter("@jenis", JenisTabungan),
                new SqlParameter("@cabang", cabang),
                new SqlParameter("@no", no)
            };
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<PurchaseOrderViewModel>("SP_AUTHORIZEPURCHASEORDER @tanggal, @jenis, @cabang, @no", Params);
        }

        //20200710, Eka, BEGIN

        public virtual ObjectResult<PurchaseOrderViewModel> AuthorizecashbackSet(DateTime? Tanggal, int JenisTabungan, string cabang, string no)
        {
            var Params = new object[] { 
                new SqlParameter("@tanggal", Tanggal == null ? (object)DBNull.Value : Tanggal),
                new SqlParameter("@jenis", JenisTabungan),
                new SqlParameter("@cabang", cabang),
                new SqlParameter("@no", no)
            };
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<PurchaseOrderViewModel>("SP_AUTHORIZECASHBACK @tanggal, @jenis, @cabang, @no", Params);
        }

        public virtual ObjectResult<PurchaseOrderViewModel> HistoryPurchaseOrderSet(DateTime? TanggalMulai, DateTime? TanggalAkhir, int JenisTabungan, string cabang, string no, string print = null)
        {
            var Params = new object[] { 
                new SqlParameter("@tanggalmulai", TanggalMulai == null ? (object)DBNull.Value : TanggalMulai),
                new SqlParameter("@tanggalakhir", TanggalAkhir == null ? (object)DBNull.Value : TanggalAkhir),
                new SqlParameter("@jenis", JenisTabungan),
                new SqlParameter("@cabang", cabang),
                new SqlParameter("@no", no),
                new SqlParameter("@print", print == null ? "0" : print)
            };
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<PurchaseOrderViewModel>("SP_HistoryPurchaseOrder @tanggalmulai, @tanggalakhir, @jenis, @cabang, @no, @print", Params);
        }

        public virtual ObjectResult<PurchaseOrderViewModel> HistoryPOGetAll(DateTime? TanggalMulai, DateTime? TanggalAkhir, string cabang, string no)
        {
            var Params = new object[] { 
                new SqlParameter("@tanggalmulai", TanggalMulai == null ? (object)DBNull.Value : TanggalMulai),
                new SqlParameter("@tanggalakhir", TanggalAkhir == null ? (object)DBNull.Value : TanggalAkhir),
                new SqlParameter("@cabang", cabang),
                new SqlParameter("@no", no)
            };
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<PurchaseOrderViewModel>("SP_HistoryPOGetAll @tanggalmulai, @tanggalakhir, @cabang, @no", Params);
        }

        public virtual ObjectResult<PurchaseOrderViewModel> HistoryCashbackSet(DateTime? TanggalMulai, DateTime? TanggalAkhir, int JenisTabungan, string cabang, string no, string print = null)
        {
            var Params = new object[] { 
                new SqlParameter("@tanggalmulai", TanggalMulai == null ? (object)DBNull.Value : TanggalMulai),
                new SqlParameter("@tanggalakhir", TanggalAkhir == null ? (object)DBNull.Value : TanggalAkhir),
                new SqlParameter("@jenis", JenisTabungan),
                new SqlParameter("@cabang", cabang),
                new SqlParameter("@no", no),
                new SqlParameter("@print", print == null ? "0" : print)
            };
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<PurchaseOrderViewModel>("SP_HistoryCashback @tanggalmulai, @tanggalakhir, @jenis, @cabang, @no", Params);
        }
        //20200710, Eka, END

        public virtual ObjectResult<SupplierViewModel> SupplierSet()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<SupplierViewModel>("SP_ListSupplier_SQLInventory");
        }

        //20190130, jeni, BEIGN
        public virtual ObjectResult<POGroupIDViewModel> POGroupSet(string SupplierId, int PaymentMethod)
        {
            var Params = new object[] { 
                new SqlParameter("@SupplierId", SupplierId == null ? (object)DBNull.Value : SupplierId),
                new SqlParameter("@PaymentMethod", PaymentMethod)
            };
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<POGroupIDViewModel>("SP_GetPOGroup @SupplierId, @PaymentMethod", Params);

            //return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<POGroupIDViewModel>("SP_GetPOGroup");
        }
        //20190130, jeni, END

        //20201009, eka, BEGIN
        public virtual ObjectResult<JurnalCashbackViewModel> JurnalCashbackSet(int EnquiryId, int Flag)
        {
            var Params = new object[] { 
                new SqlParameter("@EnquiryId", EnquiryId == null ? (object)DBNull.Value : EnquiryId),
                new SqlParameter("@flag", Flag == null ? (object)DBNull.Value : Flag)
                //,new SqlParameter("@PoId", PoId)
            };
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<JurnalCashbackViewModel>("SP_Get_JurnalCashback @EnquiryId, @flag", Params);
        }

        public virtual ObjectResult<POGroupListViewModel> POGroupList(string POGroupId,string POId, int Flag)
        {
            var Params = new object[] { 
                new SqlParameter("@POGroupId", POGroupId == null ? (object)DBNull.Value : POGroupId),
                new SqlParameter("@POId", POId == null ? (object)DBNull.Value : POId),
                new SqlParameter("@flag", Flag == null ? (object)DBNull.Value : Flag)
            };
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<POGroupListViewModel>("SP_GetCashbackGroup @POGroupId,@POId, @flag", Params);
        }

        //public virtual ObjectResult<POGroupListViewModel> DeleteRowList(string POGroupId, int Flag)
        //{
        //    var Params = new object[] { 
        //        new SqlParameter("@POGroupId", POGroupId == null ? (object)DBNull.Value : POGroupId),
        //        new SqlParameter("@POId", POId == null ? (object)DBNull.Value : POId),
        //        new SqlParameter("@flag", Flag == null ? (object)DBNull.Value : Flag)
        //    };
        //    return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<POGroupListViewModel>("SP_GetCashbackGroup @POGroupId, @flag", Params);
        //}

        public virtual ObjectResult<HistoryJurnalCashbackViewModel> HistoryJurnalCashbackList(string POGroupId)
        {
            var Params = new object[] { 
                new SqlParameter("@POGroupId", POGroupId == null ? (object)DBNull.Value : POGroupId)
            };
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<HistoryJurnalCashbackViewModel>("SP_HistoryJurnalCashback @POGroupId", Params);
        }


        public virtual ObjectResult<DetailJurnalCashbackViewModel> DetailJurnalCashbackList(string POGroupId, string POId, int Flag)
        {
            var Params = new object[] { 
                new SqlParameter("@POGroupId", POGroupId == null ? (object)DBNull.Value : POGroupId),
                new SqlParameter("@POId", POId == null ? (object)DBNull.Value : POId),
                new SqlParameter("@flag", Flag == null ? (object)DBNull.Value : Flag)
            };
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<DetailJurnalCashbackViewModel>("SP_ListJurnalCashback @POGroupId,@POId,@flag", Params);
        }
        //20201009, eka, END

        public virtual ObjectResult<DeliveryOrderViewModel> DeliveryOrderViewSet(string no, string noRekening, int JenisTabungan, string cabang, DateTime? Tanggal, string nopr, DateTime? Tanggalpr)
        {
            var Params = new object[] { 
                new SqlParameter("@no", no),
                new SqlParameter("@noRekening", noRekening),
                new SqlParameter("@jenis", JenisTabungan),
                new SqlParameter("@cabang", cabang),
                new SqlParameter("@tanggal", Tanggal == null ? (object)DBNull.Value : Tanggal),
                new SqlParameter("@nopr", nopr),
                new SqlParameter("@tanggalpr", Tanggalpr == null ? (object)DBNull.Value : Tanggalpr)
            };
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<DeliveryOrderViewModel>("SP_DELIVERYORDER @no, @norekening, @jenis, @cabang, @tanggal, @nopr, @tanggalpr", Params);
        }
        public virtual ObjectResult<GetKatalog> KatalogPromo()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<GetKatalog>("SP_GetKodeProduk");
        }
        public virtual ObjectResult<GetKatalog2> KatalogPromo2()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<GetKatalog2>("SP_GetKodeProduk2");
        }

        public virtual ObjectResult<CompanyViewModel> CompanyTemenosSet()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<CompanyViewModel>("SP_GetCompany");
        }

        public virtual ObjectResult<DeliveryOrderViewModel> DeliveryOrderViewDetailSet(int poid)
        {
            var Params = new object[] { 
                new SqlParameter("@id", poid)
            };
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<DeliveryOrderViewModel>("SP_DELIVERYORDERDETAIL @id", Params);
        }


        public virtual ObjectResult<get_internal_account> sp_get_internal_accountSet(string search = "")
        {
            string flag01 = "01";
            var Params = new object[] { 
                new SqlParameter("@flag", flag01),
                new SqlParameter("@code", search == "" ? (object)DBNull.Value : search)
            };

            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<get_internal_account>("[sp_helper] @flag, @code", Params);
        }

        public virtual ObjectResult<get_internal_account> sp_getInternalAccount_PaymentRequest_DebitSet(string branchId)
        {
            var Params = new object[] { 
                new SqlParameter("@BranchId", branchId)
            };

            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<get_internal_account>("[sp_GetInternalAccount_PaymentRequest_Debit] @BranchId", Params);
        }

        public virtual ObjectResult<get_internal_account> sp_getInternalAccount_PaymentRequest_KreditSet(string branchId)
        {
            var Params = new object[] { 
                new SqlParameter("@BranchId", branchId)
            };

            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<get_internal_account>("[sp_GetInternalAccount_PaymentRequest_Kredit] @BranchId", Params);
        }

        public virtual ObjectResult<get_internal_account> sp_GetInternalAccount_JurnalPelunasan_Debit(string branchId)
        {
            var Params = new object[] { 
                new SqlParameter("@BranchId", branchId)
            };

            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<get_internal_account>("[sp_GetInternalAccount_JurnalPelunasan_Debit] @BranchId", Params);
        }

        public virtual ObjectResult<get_internal_account> sp_GetInternalAccount_JurnalPencadangan_Debit(string branchId)
        {
            var Params = new object[] { 
                new SqlParameter("@BranchId", branchId)
            };

            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<get_internal_account>("[sp_GetInternalAccount_JurnalPencadangan_Debit] @BranchId", Params);
        }

        public virtual ObjectResult<get_internal_account> sp_GetInternalAccount_JurnalPencadangan_Kredit(string branchId)
        {
            var Params = new object[] { 
                new SqlParameter("@BranchId", branchId)
            };

            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<get_internal_account>("[sp_GetInternalAccount_JurnalPencadangan_Kredit] @BranchId", Params);
        }

        public virtual ObjectResult<PurchaseReceiveViewModel> AuthorizeReceiveSet(string Cabang, DateTime? Tanggal, string No, string NoPo, DateTime? Tanggalpo, int JenisTabungan)
        {
            var Params = new object[] { 
                new SqlParameter("@cabang", Cabang) ,
                new SqlParameter("@tanggal", Tanggal == null ? (object)DBNull.Value : Tanggal),
                new SqlParameter("@no", No),
                new SqlParameter("@nopo", NoPo),
                new SqlParameter("@tanggalpo", Tanggalpo == null ? (object)DBNull.Value : Tanggalpo),
                new SqlParameter("@jenis", JenisTabungan)
            };
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<PurchaseReceiveViewModel>("SP_AUTHORIZE_RECEIVE @cabang, @tanggal, @no, @nopo, @tanggalpo, @jenis", @Params);
        }

        public virtual ObjectResult<BankViewModel> CMSBankSet()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<BankViewModel>("SP_GetBankName");
        }

        public virtual ObjectResult<MasterJurnalOtomatisViewModel> GetJurnalOtomatisSet(string Transaksi, string PONo, string Narrative)
        {
            var Params = new object[] { 
                new SqlParameter("@Transaksi", Transaksi) ,                
                new SqlParameter("@PONo", PONo),
                new SqlParameter("@Narrative", Narrative)
            };
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<MasterJurnalOtomatisViewModel>("SP_GetJurnalOtomatis @Transaksi, @PONo, @Narrative", @Params);
        }

        public virtual ObjectResult<AccountViewModel> SP_CHECKING_ACCCOUNT(string AccountNumber)
        {
            var Params = new object[] { 
                new SqlParameter("@AccountNumber", AccountNumber)
            };
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<AccountViewModel>("SP_CHECKING_ACCCOUNT @AccountNumber", Params);
        }
        //20190117, jeni, BEGIN
        //public virtual ObjectResult<StatusNasabahViewModel> SP_GetMenuStatusNasabah()
        public virtual ObjectResult<StatusNasabahViewModel> SP_GetMenuStatusNasabah(string NoRekening, string NoCIF, string Cabang)
        //20190117, jeni, END
        {
            //20190117, jeni, BEGIN
            //var Params = new object[] { 
            //    //new SqlParameter("@AccountNumber", AccountNumber)
            //};
            //return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<StatusNasabahViewModel>("SP_GetMenuStatusNasabah", Params);
            var Params = new object[] { 
                new SqlParameter("@pNoRekening", NoRekening==null ? "":NoRekening),
                new SqlParameter("@pNoCif", NoCIF==null?"":NoCIF),
                new SqlParameter("@pCabang", Cabang==null?"":Cabang)
            };
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<StatusNasabahViewModel>("SP_GetMenuStatusNasabah @pNoRekening, @pNoCif, @pCabang", Params);
            //20190117, jeni, END
        }
        public virtual ObjectResult<UploadNasabahViewModel> InsertUploadSpNasabah(string norek, string filenames, string userid)
        {
            var Params = new object[] { 
                new SqlParameter("@norek", norek),
                new SqlParameter("@filenames", filenames),
                new SqlParameter("@userid", userid)
            };
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<UploadNasabahViewModel>("InsertUploadSpNasabah @norek, @filenames, @userid", Params);
        }
        public virtual ObjectResult<AmortisasiRequestViewModel> GetPageAmortisasiRequest(string cabang, string status, string searchText)
        {
            var Params = new object[] { 
                new SqlParameter("@cabanglogin", cabang),
                new SqlParameter("@status", status),
                new SqlParameter("@searchText", searchText)
            };
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<AmortisasiRequestViewModel>("[GetPageAmortisasiRequest] @cabanglogin, @status, @searchText", Params);
        }
        public virtual ObjectResult<BreakAmortisasiRequestViewModel> GetPageBreakAmortisasiRequest(string cabang, string status, string searchText)
        {
            var Params = new object[] { 
                new SqlParameter("@cabanglogin", cabang),
                new SqlParameter("@status", status),
                new SqlParameter("@searchText", searchText)
            };
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<BreakAmortisasiRequestViewModel>("[GetPageBreakAmortisasiRequest] @cabanglogin, @status, @searchText", Params);
        }
    }
}
