using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for LecturaBRL
/// </summary>
public class LecturaBRL
{
    public LecturaBRL()
    {
       
    }

    public static List<Lectura> getDescargas()
    {
        LecturaDSTableAdapters.LecturasTableAdapter adapter = new LecturaDSTableAdapters.LecturasTableAdapter();
        LecturaDS.LecturasDataTable table = adapter.GetLectura();

        List<Lectura> resultado = new List<Lectura>();

        foreach (var row in table)
        {
            Lectura obj = new Lectura();

            obj.LecturaID = row.lecturaId;
            obj.usuarioId = row.usuarioId;
            obj.libroId = row.libroId;
            obj.fecha = row.fecha;

            resultado.Add(obj);
        }
        return resultado;
    }

    public static Lectura getAutorNombreById(int lecturaId)
    {
        LecturaDSTableAdapters.LecturasTableAdapter adapter = new LecturaDSTableAdapters.LecturasTableAdapter();
        LecturaDS.LecturasDataTable table = adapter.GetLecturaById(lecturaId);

        var row = table[0];

        Lectura obj = new Lectura();

        obj.LecturaID = row.lecturaId;
        obj.usuarioId = row.usuarioId;
        obj.libroId = row.libroId;
        obj.fecha = row.fecha;

        return obj;
    }

    public static int insertarLectura(Lectura obj)
    {
        if (obj == null)
        {
            throw new ArgumentException("El objeto a insertar no puede tener un valor nulo");
        }

        if (obj.LecturaID < 0)
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

        int? lecturaId = 0;

        LecturaDSTableAdapters.LecturasTableAdapter adapter = new LecturaDSTableAdapters.LecturasTableAdapter();
        adapter.Insert(obj.usuarioId, obj.libroId, obj.fecha, ref lecturaId);

        if (lecturaId == null || lecturaId.Value <= 0)
        {
            throw new Exception("La llave primaria no se genero correctamente");
        }

        return lecturaId.Value;
    }
}