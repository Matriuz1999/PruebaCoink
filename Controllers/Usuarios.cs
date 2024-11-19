using BussinesLogic;
using BussinesLogic.Helpers;
using Data.Models;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace PruebaCoink.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsuariosController : ControllerBase
    {
        private readonly IUsuariosBusinessLogic _usuariosBusinessLogic;

        public UsuariosController(IUsuariosBusinessLogic usuariosBusinessLogic)
        {
            _usuariosBusinessLogic = usuariosBusinessLogic;
        }

        [HttpGet]
        public async Task<IActionResult> GetUsuarios()
        {
            var usuarios = await _usuariosBusinessLogic.GetUsuarios();
            return Ok(usuarios);
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetUsuario(int id)
        {
            var usuario = await _usuariosBusinessLogic.GetUsuario(id);
            if (usuario == null)
            {
                return NotFound();
            }
            return Ok(usuario);
        }

        [HttpPost]
        public async Task<resultUsuario> CrearUsuario([FromBody] usuario newUsuario)
        {
            if (!ModelState.IsValid)
            {
                return ResultUsuarioHelper.Failure("El modelo proporcionado no es válido.");
            }

            var createdUsuario = await _usuariosBusinessLogic.CrearUsuario(newUsuario);
            return createdUsuario;
        }
    }
}
