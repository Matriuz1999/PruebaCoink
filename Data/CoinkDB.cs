using Microsoft.EntityFrameworkCore;
using Data.Models;

namespace Data.Data
{
    public class CoinkDB : DbContext
    {
        public CoinkDB(DbContextOptions<CoinkDB> options) : base(options)
        { }

        // DbSets para las tablas
        public DbSet<usuario> usuario { get; set; }
        public DbSet<pais> pais { get; set; }
        public DbSet<departamento> departamentos { get; set; }
        public DbSet<municipio> municipio { get; set; }
    }
}
