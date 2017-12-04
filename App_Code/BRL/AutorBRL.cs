using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de AutorBRL
/// </summary>
public class AutorBRL
{
    public AutorBRL()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }

    public static List<Autores> getAutor()
    {

        AutorDSTableAdapters.AutorTableAdapter adapter = new AutorDSTableAdapters.AutorTableAdapter();
        AutorDS.AutorDataTable table = adapter.GetAutor();

        List<Autores> resultado = new List<Autores>();

        foreach (var row in table)
        {
            Autores obj = new Autores();

            obj.AutorId = row.autorId;
            obj.nombreCompleto = row.nombreCompleto;
            obj.estado = row.estado;
            
            resultado.Add(obj);
        }

        return resultado;

    }

    public static List<Autores> getAutorById(int libroId)
    {
        Libros libro =  libroBRL.getLibroById(libroId);


        AutorDSTableAdapters.AutorTableAdapter adapter = new AutorDSTableAdapters.AutorTableAdapter();
        AutorDS.AutorDataTable table = adapter.GetAutorById(libro.AutorId);

        List<Autores> resultado = new List<Autores>();

        foreach (var row in table)
        {
            Autores obj = new Autores();

            obj.AutorId = row.autorId;
            obj.nombreCompleto = row.nombreCompleto;
            obj.estado = row.estado;

            resultado.Add(obj);
        }

        return resultado;
    }

    public static Autores getAutorNombreById(int libroId)
    {
        Libros libro = libroBRL.getLibroById(libroId);


        AutorDSTableAdapters.AutorTableAdapter adapter = new AutorDSTableAdapters.AutorTableAdapter();
        AutorDS.AutorDataTable table = adapter.GetAutorById(libro.AutorId);

        var row = table[0];

        Autores obj = new Autores();

        obj.AutorId = row.autorId;
        obj.nombreCompleto = row.nombreCompleto;
        obj.estado = row.estado;
        
        return obj;
    }        
}