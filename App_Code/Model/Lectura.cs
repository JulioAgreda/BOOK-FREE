using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for LecturaBRL
/// </summary>
public class Lectura
{
    public int LecturaID { get; set; }
    public int usuarioId { get; set; }
    public int libroId { get; set; }
    public DateTime fecha { get; set; }

    public Lectura()
    {
        
    }
}