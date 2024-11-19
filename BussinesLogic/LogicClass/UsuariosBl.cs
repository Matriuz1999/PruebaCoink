// En BussinesLogic/UsuariosBusinessLogic.cs
using BussinesLogic.Helpers;
using BussinesLogic.LogicClass;
using Data;
using Data.Data;
using Data.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace BussinesLogic
{
    public class UsuariosBusinessLogic : IUsuariosBusinessLogic
    {
        private readonly IUsuarioRepository _usuarioRepository;
        private readonly IMunicipioBussinesLogic _municipioBussinesLogic;

        public UsuariosBusinessLogic(IUsuarioRepository usuarioRepository, IMunicipioBussinesLogic municipioBussinesLogic)
        {
            _usuarioRepository = usuarioRepository;
            _municipioBussinesLogic = municipioBussinesLogic;
        }

        public async Task<IEnumerable<usuario>> GetUsuarios()
        {
            return await _usuarioRepository.GetAllUsuariosAsync();
        }

        public async Task<usuario> GetUsuario(int id)
        {

            return await _usuarioRepository.GetUsuarioByIdAsync(id);
        }

        public async Task<resultUsuario> CrearUsuario(usuario newUsuario)
        {
            var municipio = await _municipioBussinesLogic.GetMunicipioByIdAsync(newUsuario.id_municipio);

            if (municipio == null)
            {
                return ResultUsuarioHelper.Failure("El municipio no existe.");
            }

            return await _usuarioRepository.AddUsuarioAsync(newUsuario);
        }


    }
}
