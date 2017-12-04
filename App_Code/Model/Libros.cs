using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Libros
/// </summary>
public class Libros
{
    public int librosId { get; set; }
    public int AutorId { get; set; }
    public int CategoriaId { get; set; }
    public string Titulo { get; set; }
    public string Portada { get; set; }
    public string Sinopsis { get; set; }
    public string Estado { get; set; }

    public Libros()
    {
        
    }
}