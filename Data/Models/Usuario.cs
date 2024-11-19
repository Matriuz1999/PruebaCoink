using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace Data.Models
{
    public class usuario
    {
        [Key]
        [Column("id_usuario")]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)] 
        [JsonIgnore]
        public int Id { get; set; }

        public string nombre { get; set; }

        public string telefono { get; set; }

        public string direccion { get; set; }

        [ForeignKey("municipio")]
        [Column("id_municipio")]
        public int id_municipio { get; set; } 

        public bool estado { get; set; } = true;
    }

    public class resultUsuario
    {
        public bool state { get; set; }

        public string descripcion { get; set; }
    }

}
