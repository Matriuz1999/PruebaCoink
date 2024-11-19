﻿using Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data
{
    public interface IMunicipioRepository
    {
        Task<municipio> GetMunicipioByIdAsync(int id);
    }
}
