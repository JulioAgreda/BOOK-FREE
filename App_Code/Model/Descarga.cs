using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DescargaBRL
/// </summary>
public class Descarga
{
    public int DescargaId { get; set; }
    public int usuarioId { get; set; }
    public int libroId { get; set; }
    public DateTime fecha { get; set; }

    public Descarga()
    {
        
    }
}