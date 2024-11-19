using Data;
using Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BussinesLogic.LogicClass
{
    public class MunicipioBussinesRepository : IMunicipioBussinesLogic
    {
        private readonly IMunicipioRepository _municipioRepository;

        public MunicipioBussinesRepository(IMunicipioRepository municipioRepository)
        {
            _municipioRepository = municipioRepository ?? throw new ArgumentNullException(nameof(municipioRepository));
        }

        public async Task<municipio> GetMunicipioByIdAsync(int id)
        {
            return await _municipioRepository.GetMunicipioByIdAsync(id);
        }
    }
}
