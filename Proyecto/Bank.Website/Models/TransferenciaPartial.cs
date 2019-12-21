using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Bank.Website
{
    [MetadataType(typeof(TransferenciaMetadata))]
    public partial class Transferencia : MessageHandlingModel
    {
        public int IdUsuario { get; set; }

        [Display(Name = "Usuario")]
        public String NombreUsuario { get; set; }
    }

    public class TransferenciaMetadata
    {
        [Display(Name = "Cuenta Origen")]
        public string CuentaIdOrigen { get; set; }

        [Display(Name = "Cuenta Destino")]
        public string CuentaIdDestino { get; set; }

        [Range(1, 2000)]
        public int Monto { get; set; }

        [Display(Name = "Descripción")]
        public string Descripcion { get; set; }
    }
}