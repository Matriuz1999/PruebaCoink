using Data.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Data
{
    public interface IUsuarioRepository
    {
        Task<List<usuario>> GetAllUsuariosAsync();
        Task<usuario> GetUsuarioByIdAsync(int id);
        Task<resultUsuario> AddUsuarioAsync(usuario newUsuario);
    }
}
