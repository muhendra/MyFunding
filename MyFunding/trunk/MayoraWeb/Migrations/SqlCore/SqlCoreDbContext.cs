using System.Data.Entity;
using System.Security.Claims;
using System.Threading.Tasks;
using MyWeb.DataLayer;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using MyWeb.Models;
using MyWeb.Models;
using MyWeb.Models.Customers;
using MyWeb.DataLayer.Customers;

namespace MyWeb.DataLayer.SqlCore
{
    public class SqlCoreDbContext : DbContext
    {
        public SqlCoreDbContext()
            : base("SqlCoreConnection")
        {
            Database.SetInitializer<SqlCoreDbContext>(null);
        }      
        public DbSet<Customer> Customers { get; set; }     
      
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Configurations.Add(new CustomerConfiguration());          
          
            base.OnModelCreating(modelBuilder);
         
        }

    }
}
