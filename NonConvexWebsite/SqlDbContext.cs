using Microsoft.EntityFrameworkCore;
using NonConvexWebsite.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace NonConvexWebsite
{
    public class SqlDbContext : DbContext
    {
        public SqlDbContext(DbContextOptions<SqlDbContext> options) : base(options)
        {
        }
        public DbSet<Employee> Employees { get; set; }
        public DataSet GetDs(string cmd)
        {
            DataSet ds = new DataSet();
            return ds;
        }

    }
}
