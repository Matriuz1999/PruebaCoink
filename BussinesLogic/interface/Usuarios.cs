using Data.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace BussinesLogic
{
    public interface IUsuariosBusinessLogic
    {
        Task<IEnumerable<usuario>> GetUsuarios();
        Task<usuario> GetUsuario(int id);
        Task<resultUsuario> CrearUsuario(usuario newUsuario);
    }
}