using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Data.Models
{
    public class municipio
    {
        [Key]
        [Column("id_municipio")]
        public int id_municipio { get; set; }

        [ForeignKey("departamento")]
        [Column("id_departamento")]
        public int id_departamento { get; set; }

        public string nombre { get; set; }

        public bool estado { get; set; } = true;

        [Column("fecha_creacion")]
        public DateTime FechaCreacion { get; set; } = DateTime.Now;
    }
}
