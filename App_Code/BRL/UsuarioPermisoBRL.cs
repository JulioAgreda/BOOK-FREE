using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


/// <summary>
/// Summary description for UsuarioPermisoBRL
/// </summary>
public class UsuarioPermisoBRL
{
    public UsuarioPermisoBRL()
    {

    }
    public static void insertUsuarioPermiso(PermisoUsuario obj)
    {
        if (obj == null)
        {
            throw new ArgumentException("El objeto UsuarioPermiso no debe ser nulo");
        }

        int? usuarioPermisoId = 0;
        UsuarioPermisosDSTableAdapters.UsuarioPermisoTableAdapter adapter = new UsuarioPermisosDSTableAdapters.UsuarioPermisoTableAdapter();
        adapter.Insert(obj.UsuarioId, obj.PermisoId, ref usuarioPermisoId);
    }

    public static Boolean tienePermiso(int userId, int permisoId)
    {
        UsuarioPermisosDSTableAdapters.UsuarioPermisoTableAdapter adapter = new UsuarioPermisosDSTableAdapters.UsuarioPermisoTableAdapter();
        UsuarioPermisosDS.UsuarioPermisoDataTable table = adapter.GetIdByUserPerm(userId, permisoId);
        if (table.Rows.Count == 0)
        {
            return false;
        }
        return true;
    }

    public static void actualizarUsuarioPermiso(PermisoUsuario obj)
    {
        if (obj == null)
        {
            throw new ArgumentException("El objeto a insertar no puede tener un valor nulo");
        }

        if (obj.UsuarioPermisoId <= 0)
        {
            throw new ArgumentException("El objeto a insertar no puede ser menor o igual a 0");
        }

        if (obj.UsuarioId == 0)
        {
            throw new ArgumentException("el Codigo de Usuario es 0");
        }

        if (obj.PermisoId == 0)
        {
            throw new ArgumentException("el Codigo de Permiso es 0");
        }



        UsuarioPermisosDSTableAdapters.UsuarioPermisoTableAdapter adapter = new UsuarioPermisosDSTableAdapters.UsuarioPermisoTableAdapter();
        adapter.Update(obj.UsuarioId, obj.PermisoId, obj.UsuarioPermisoId);
    }

    public static void eliminarUsuarioPermiso(int usuarioId)
    {
        int usuarioPermisoId = 0;

        UsuarioPermisosDSTableAdapters.UsuarioPermisoTableAdapter adapter = new UsuarioPermisosDSTableAdapters.UsuarioPermisoTableAdapter();
        UsuarioPermisosDS.UsuarioPermisoDataTable table = adapter.GetUsuarioPermisoIdByUsuarioId(usuarioId);

        foreach (var row in table)
        {
            PermisoUsuario obj = new PermisoUsuario();
            usuarioPermisoId = row.usuarioPermisoId;
            adapter.Delete(usuarioPermisoId);
        }        
    }

    public static void eliminarUsuarioPermisoById(int usuarioPermisoId)
    {
        UsuarioPermisosDSTableAdapters.UsuarioPermisoTableAdapter adapter = new UsuarioPermisosDSTableAdapters.UsuarioPermisoTableAdapter();
        adapter.Delete(usuarioPermisoId);       
    }

    public static void eliminarUsuarioPermisoByUsuarioIdPermisoId(int usuarioId, int permisoId)
    {
        UsuarioPermisosDSTableAdapters.UsuarioPermisoTableAdapter adapter = new UsuarioPermisosDSTableAdapters.UsuarioPermisoTableAdapter();
        UsuarioPermisosDS.UsuarioPermisoDataTable table = adapter.GetIdByUserPerm(usuarioId, permisoId);

        var row = table[0];

        PermisoUsuario obj = new PermisoUsuario();

        obj.UsuarioPermisoId = row.usuarioPermisoId;

        eliminarUsuarioPermisoById(obj.UsuarioPermisoId);
             
    }
}