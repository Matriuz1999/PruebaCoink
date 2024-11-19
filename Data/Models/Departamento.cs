using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Data.Models
{
    public class departamento
    {
        [Key]
        [Column("id_departamento")]
        public int Id { get; set; }

        [ForeignKey("pais")]
        [Column("id_pais")]
        public int id_pais { get; set; }

        public string Nombre { get; set; }

        [Column("fecha_creacion")]
        public DateTime FechaCreacion { get; set; } = DateTime.Now;

        // Relación: Un departamento pertenece a un país
        public pais pais { get; set; }

    }
}
