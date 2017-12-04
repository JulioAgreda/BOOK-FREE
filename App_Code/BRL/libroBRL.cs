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
        LibrosDSTableAdapters.LibroTableAdapter adapter = new LibrosDSTableAdapters.LibroTableAdapter();
        LibrosDS.LibroDataTable table = adapter.GetLibros();

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
            obj.Estado = row.estado;
            
            resultado.Add(obj);
        }

        return resultado;

    }

    public static int insertarlibros(Libros obj)
    {
        if (obj == null)
        {
            throw new ArgumentException("El objeto a insertar no puede tener un valor nulo");
        }

        if (string.IsNullOrEmpty(obj.Titulo))
        {
            throw new ArgumentException("el Titulo no puede ser nulo ni vacio");
        }

        if (string.IsNullOrEmpty(obj.Sinopsis))
        {
            throw new ArgumentException("La Sinopsis no puede ser nulo ni vacio");
        }
       
        int? libroId = 0;
        LibrosDSTableAdapters.LibroTableAdapter adapter = new LibrosDSTableAdapters.LibroTableAdapter();
        adapter.Insert(obj.AutorId, obj.CategoriaId, obj.Titulo, obj.Portada, obj.Sinopsis, obj.Estado, ref libroId);
        
        if (libroId == null || libroId.Value <= 0)
        {
            throw new Exception("La llave primaria no se genero correctamente");
        }

        return libroId.Value;
    }

    public static void eliminarLibro(int LibroId)
    {
        if (LibroId <= 0)
        {
            throw new ArgumentException("El id del usuario no puede ser menor a 1");
        }
        string estado = "inactivo";

        LibrosDSTableAdapters.LibroTableAdapter adapter = new LibrosDSTableAdapters.LibroTableAdapter();
        adapter.Delete(LibroId, estado);
    }

    public static Libros getLibroById(int libroId)
    {

        LibrosDSTableAdapters.LibroTableAdapter adapter = new LibrosDSTableAdapters.LibroTableAdapter();
        LibrosDS.LibroDataTable table = adapter.GetLibroById(libroId);

        List<Libros> resultado = new List<Libros>();

        var row = table[0];

            Libros obj = new Libros();

            obj.librosId = row.LibroId;
            obj.AutorId = row.autorId;
            obj.CategoriaId = row.categoriaId;
            obj.Titulo = row.titulo;
            obj.Portada = row.portada;
            obj.Sinopsis = row.sinopsis;
            obj.Estado = row.estado;

        return obj;

    }

    public static List<Libros> getLibrosMasDescargados()
    {
        LibrosDSTableAdapters.LibroTableAdapter adapter = new LibrosDSTableAdapters.LibroTableAdapter();
        LibrosDS.LibroDataTable table = adapter.GetLibroMasDescargado();     

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
            obj.Estado = row.estado;

            resultado.Add(obj);
        }
        return resultado;

    }

    public static List<Libros> getLibrosByAutor(string nombreAutor)
    {
        LibrosDSTableAdapters.LibroTableAdapter adapter = new LibrosDSTableAdapters.LibroTableAdapter();
        LibrosDS.LibroDataTable table = adapter.GetLibroByNombreAutor(nombreAutor);
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
            obj.Estado = row.estado;

            resultado.Add(obj);
        }
        return resultado;
    }
}