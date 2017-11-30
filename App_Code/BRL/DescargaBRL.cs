using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DescargaBRL
/// </summary>
public class DescargaBRL
{
    public DescargaBRL()
    {
        
    }

    public static List<Descarga> getDescargas()
    {
        DescargaDSTableAdapters.DescargarTableAdapter adapter = new DescargaDSTableAdapters.DescargarTableAdapter();
        DescargaDS.DescargarDataTable table = adapter.GetDescarga();

        List<Descarga> resultado = new List<Descarga>();

        foreach (var row in table)
        {
            Descarga obj = new Descarga();

            obj.DescargaId = row.descargaId;
            obj.usuarioId = row.usuarioId;
            obj.libroId = row.libroId;
            obj.fecha = row.fecha;

            resultado.Add(obj);
        }

        return resultado;

    }
    
    public static Descarga getAutorNombreById(int libroId)
    {
        DescargaDSTableAdapters.DescargarTableAdapter adapter = new DescargaDSTableAdapters.DescargarTableAdapter();
        DescargaDS.DescargarDataTable table = adapter.GetDescargasById(libroId);

        var row = table[0];

        Descarga obj = new Descarga();

        obj.DescargaId = row.descargaId;
        obj.usuarioId = row.usuarioId;
        obj.libroId = row.libroId;
        obj.fecha = row.fecha;

        return obj;
    }

    public static int insertarDescarga(Descarga obj)
    {
        if (obj == null)
        {
            throw new ArgumentException("El objeto a insertar no puede tener un valor nulo");
        }

        if (obj.DescargaId < 0)
        {
            throw new ArgumentException("El codigo Descarga debe de ser Mayor a 0");
        }

        if (obj.usuarioId < 0)
        {
            throw new ArgumentException("El codigo Descarga debe de ser Mayor a 0");
        }

        if (obj.libroId < 0)
        {
            throw new ArgumentException("El codigo Descarga debe de ser Mayor a 0");
        }

        int? descargaId = 0;

        DescargaDSTableAdapters.DescargarTableAdapter adapter = new DescargaDSTableAdapters.DescargarTableAdapter();
        adapter.Insert(obj.usuarioId, obj.libroId, obj.fecha, ref descargaId);

        if (descargaId == null || descargaId.Value <= 0)
        {
            throw new Exception("La llave primaria no se genero correctamente");
        }

        return descargaId.Value;
    }
}