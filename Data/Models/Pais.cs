using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Data.Models
{
    public class pais
    {
        [Key]
        [Column("id_pais")]
        public int Id { get; set; }

        public string Nombre { get; set; }

        [Column("fecha_creacion")]
        public DateTime FechaCreacion { get; set; } = DateTime.Now;

        // Relación: Un país puede tener muchos departamentos
        public ICollection<departamento> Departamentos { get; set; }
    }
}
