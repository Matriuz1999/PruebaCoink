using Data.Models;

namespace BussinesLogic.Helpers
{
    public static class ResultUsuarioHelper
    {
        public static resultUsuario Success(string descripcion)
        {
            return new resultUsuario
            {
                state = true,
                descripcion = descripcion
            };
        }

        public static resultUsuario Failure(string descripcion)
        {
            return new resultUsuario
            {
                state = false,
                descripcion = descripcion
            };
        }
    }
}
