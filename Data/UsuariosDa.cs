using Data.Models;
using Microsoft.EntityFrameworkCore;
using Npgsql;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Data.Data
{
    public class UsuarioRepository : IUsuarioRepository
    {
        private readonly CoinkDB _context;

        public UsuarioRepository(CoinkDB context)
        {
            _context = context;
        }

        public async Task<List<usuario>> GetAllUsuariosAsync()
        {
            return await _context.usuario.ToListAsync();
        }

        public async Task<usuario> GetUsuarioByIdAsync(int id)
        {
            return await _context.usuario.FindAsync(id);
        }

        public async Task<resultUsuario> AddUsuarioAsync(usuario newUsuario)
        {
            var resultUsuario = new resultUsuario();
            try
            {
                var parameters = new[]
                {
            new NpgsqlParameter("@nombre", newUsuario.nombre),
            new NpgsqlParameter("@telefono", newUsuario.telefono),
            new NpgsqlParameter("@direccion", newUsuario.direccion),
            new NpgsqlParameter("@id_municipio", newUsuario.id_municipio),
            new NpgsqlParameter("@estado", newUsuario.estado)
             };

                await _context.Database
                    .ExecuteSqlRawAsync("SELECT agregar_usuario(@nombre, @telefono, @direccion, @id_municipio, @estado)",
                        parameters);

                resultUsuario.state = true;
                resultUsuario.descripcion = "Usuario agregado exitosamente";
            }
            catch (Exception ex)
            {
                resultUsuario.state = false;
                resultUsuario.descripcion = $"Error al agregar el usuario: {ex.Message}";
            }
            return resultUsuario;
        }
    }
}
