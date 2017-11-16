using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for libroBRL
/// </summary>
public class libroBRL
{
    public libroBRL()
    {
        
    }

    public static List<Libros> getLibros()
    {
        LibrosDSTableAdapters.LibrosTableAdapter adapter = new LibrosDSTableAdapters.LibrosTableAdapter();
        LibrosDS.LibrosDataTable table = adapter.GetLibros();

        List<Libros> resultado = new List<Libros>();

        foreach (var row in table)
        {
            Libros obj = new Libros();

            obj.librosId = row.LibroId;
            obj.AutorId = row.autorId;
            obj.CategoriaId = row.categoriaId;
            obj.Titulo = row.titulo;
            obj.Portada = row.portada;
            obj.Sinopsis = row.sinopsis;
            obj.Valoracion = row.valoracion;
            obj.Estado = row.estado;
            
            resultado.Add(obj);
        }

        return resultado;

    }
    

    public static void eliminarLibro(int LibroId)
    {
        if (LibroId <= 0)
        {
            throw new ArgumentException("El id del usuario no puede ser menor a 1");
        }
        string estado = "inactivo";

        LibrosDSTableAdapters.LibrosTableAdapter adapter = new LibrosDSTableAdapters.LibrosTableAdapter();
        adapter.Delete(LibroId, estado);
    }


}