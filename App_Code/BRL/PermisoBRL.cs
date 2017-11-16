using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for PermisoBRL
/// </summary>
public class PermisoBRL
{
    public PermisoBRL()
    {
        
    }


    public static Permiso getPermisoByDescription(string descripcion)
    {
        PermisosDSTableAdapters.PermisosTableAdapter adapter = new PermisosDSTableAdapters.PermisosTableAdapter();
        PermisosDS.PermisosDataTable tabla = adapter.GetPermisoByDescripcion(descripcion);

        if (tabla.Rows.Count == 0)
        {
            return null;
        }

        PermisosDS.PermisosRow row = tabla[0];

        Permiso obj = new Permiso()
        {
            PermisoID = row.permisoId
        };

        return obj;
    }



}