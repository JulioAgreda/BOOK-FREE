using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de CategoriaBRL
/// </summary>
public class CategoriaBRL
{
    public CategoriaBRL()
    {
        
    }

    public static List<Categorias> getCategoria()
    {
        CategoriaDSTableAdapters.CategoriaTableAdapter adapter = new CategoriaDSTableAdapters.CategoriaTableAdapter();
        CategoriaDS.CategoriaDataTable table = adapter.GetCategoria();      

        List<Categorias> resultado = new List<Categorias>();

        foreach (var row in table)
        {
            Categorias obj = new Categorias();

            obj.CategoriaId = row.categoriaID;
            obj.Nombre = row.nombre;
            obj.Descripcion = row.descripcion;
            obj.Estado = row.descripcion;

            resultado.Add(obj);
        }
        return resultado;
    }

    public static List<Categorias> getCategoriaById(int libroId)
    {
        Libros libro = libroBRL.getLibroById(libroId);

        CategoriaDSTableAdapters.CategoriaTableAdapter adapter = new CategoriaDSTableAdapters.CategoriaTableAdapter();
        CategoriaDS.CategoriaDataTable table = adapter.GetCategoriaById(libro.CategoriaId);

        List<Categorias> resultado = new List<Categorias>();

        foreach (var row in table)
        {
            Categorias obj = new Categorias();

            obj.CategoriaId = row.categoriaID;
            obj.Nombre = row.nombre;
            obj.Descripcion = row.descripcion;
            obj.Estado = row.estado;

            resultado.Add(obj);
        }

        return resultado;

    }
}