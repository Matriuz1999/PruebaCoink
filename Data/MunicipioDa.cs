using Data.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Data
{
    public class MunicipioRepository : IMunicipioRepository
    {

        private readonly CoinkDB _context;

        public MunicipioRepository(CoinkDB context)
        {
            _context = context;
        }
        public async Task<municipio> GetMunicipioByIdAsync(int id)
        {
            return await _context.municipio.FindAsync(id);
        }
    }
}
