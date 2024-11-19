using Microsoft.EntityFrameworkCore;
using Data.Data;
using BussinesLogic;
using Data;
using BussinesLogic.LogicClass;

namespace PruebaCoink
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // Add services to the container.
            builder.Services.AddControllers(); // Habilitar controladores
            builder.Services.AddAuthorization();

            // Configurar Swagger
            builder.Services.AddEndpointsApiExplorer();
            builder.Services.AddSwaggerGen();

            // Configurar conexi�n con la base de datos
            var connectionString = builder.Configuration.GetConnectionString("PostgreSQLConnection");
            builder.Services.AddDbContext<CoinkDB>(options => options.UseNpgsql(connectionString));

            // Registrar las interfaces y sus implementaciones
            builder.Services.AddScoped<IUsuarioRepository, UsuarioRepository>(); // Registro del repositorio de usuario
            builder.Services.AddScoped<IUsuariosBusinessLogic, UsuariosBusinessLogic>(); // Registro de la l�gica de negocio
            builder.Services.AddScoped<IMunicipioBussinesLogic, MunicipioBussinesRepository>(); // Registro de la l�gica de negocio
            builder.Services.AddScoped<IMunicipioRepository, MunicipioRepository>(); // Registro de la l�gica de negocio



            var app = builder.Build();

            // Configurar la tuber�a de solicitudes HTTP
            if (app.Environment.IsDevelopment())
            {
                app.UseSwagger();
                app.UseSwaggerUI();
            }

            app.UseHttpsRedirection();
            app.UseAuthorization();

            // Mapear controladores
            app.MapControllers(); // Esto asegura que todas las rutas definidas en los controladores sean reconocidas

            app.Run();
        }
    }
}
