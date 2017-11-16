using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UsuariosDSTableAdapters;


/// <summary>
/// Summary description for UsuarioBRL
/// </summary>
public class UsuarioBRL
{
    public UsuarioBRL()
    {

    }

    public static List<Usuario> getUsuarios()
    {
        UsuariosDSTableAdapters.UsuarioTableAdapter adapter = new UsuariosDSTableAdapters.UsuarioTableAdapter();
        UsuariosDS.UsuarioDataTable table = adapter.GetUsuario();
        List<Usuario> resultado = new List<Usuario>();

        foreach (var row in table)
        {
            Usuario obj = new Usuario();

            obj.UsuarioId = row.usuarioId;
            obj.Nombre = row.nombre;
            obj.Apellido = row.apellido;
            obj.Email = row.email;
            obj.Contraseña = row.contraseña;
            obj.Estado = row.estado;
            obj.TipoUsuario = row.tipoUsuario;

            resultado.Add(obj);
        }

        return resultado;

    }
    public static List<Usuario> getAdmin()
    {
        UsuariosDSTableAdapters.UsuarioTableAdapter adapter = new UsuariosDSTableAdapters.UsuarioTableAdapter();
        UsuariosDS.UsuarioDataTable table = adapter.GetAdmin();

        List<Usuario> resultado = new List<Usuario>();

        foreach (var row in table)
        {
            Usuario obj = new Usuario();

            obj.UsuarioId = row.usuarioId;
            obj.Nombre = row.nombre;
            obj.Apellido = row.apellido;
            obj.Email = row.email;
            obj.Contraseña = row.contraseña;
            obj.Estado = row.estado;
            obj.TipoUsuario = row.tipoUsuario;

            resultado.Add(obj);
        }

        return resultado;

    }

    public static int insertarUsuario(Usuario obj)
    {
        if (obj == null)
        {
            throw new ArgumentException("El objeto a insertar no puede tener un valor nulo");
        }

        if (string.IsNullOrEmpty(obj.Nombre))
        {
            throw new ArgumentException("el Nombre no puede ser nulo ni vacio");
        }

        if (string.IsNullOrEmpty(obj.Apellido))
        {
            throw new ArgumentException("el Apellido no puede ser nulo ni vacio");
        }

        if (string.IsNullOrEmpty(obj.Email))
        {
            throw new ArgumentException("el Email no puede ser nulo ni vacio");
        }

        if (string.IsNullOrEmpty(obj.Contraseña))
        {
            throw new ArgumentException("el Contraseña no puede ser nulo ni vacio");
        }

        if (string.IsNullOrEmpty(obj.TipoUsuario))
        {
            throw new ArgumentException("el Tipo de usuario no puede ser nulo ni vacio");
        }

        if (string.IsNullOrEmpty(obj.Estado))
        {
            throw new ArgumentException("el Estado no puede ser nulo ni vacio");
        }

        int? usuarioId = 0;

        UsuariosDSTableAdapters.UsuarioTableAdapter adapter = new UsuariosDSTableAdapters.UsuarioTableAdapter();
        adapter.Insert(obj.Nombre, obj.Apellido, obj.Email, obj.Contraseña, obj.TipoUsuario, obj.Estado, ref usuarioId);

        if (usuarioId == null || usuarioId.Value <= 0)
        {
            throw new Exception("La llave primaria no se genero correctamente");
        }

        return usuarioId.Value;
    }

    public static Usuario getUsuariosById(int usuarioId)
    {
        if (usuarioId <= 0)
        {
            throw new ArgumentException("El id del usuario no puede ser menor a 1");
        }

        UsuariosDSTableAdapters.UsuarioTableAdapter adapter = new UsuariosDSTableAdapters.UsuarioTableAdapter();
        UsuariosDS.UsuarioDataTable table = adapter.GetUsuarioById(usuarioId);

        List<Usuario> resultado = new List<Usuario>();

        var row = table[0];

        Usuario obj = new Usuario();

        obj.UsuarioId = row.usuarioId;
        obj.Nombre = row.nombre;
        obj.Apellido = row.apellido;

        resultado.Add(obj);

        return obj;

    }

    public static void actualizarUsuario(string nombre, string apellido, int usuarioId)
    {
        if (string.IsNullOrEmpty(nombre))
        {
            throw new ArgumentException("El Nombre no puede estar Vacio");
        }

        if (string.IsNullOrEmpty(apellido))
        {
            throw new ArgumentException("El Apellido no puede estar Vacio");
        }

        if (usuarioId == 0)
        {
            throw new ArgumentException("el codigo de Usuario no puede ser 0");
        }
        
        UsuariosDSTableAdapters.UsuarioTableAdapter adapter = new UsuariosDSTableAdapters.UsuarioTableAdapter();
        adapter.Update(nombre, apellido, usuarioId);
    }

    public static void eliminarUsuario(int usuarioId)
    {
        if (usuarioId <= 0)
        {
            throw new ArgumentException("El id del usuario no puede ser menor a 1");
        }
        string estado = "inactivo";
        UsuariosDSTableAdapters.UsuarioTableAdapter adapter = new UsuariosDSTableAdapters.UsuarioTableAdapter();
        adapter.Delete(usuarioId, estado);
    }

    public static Usuario GetUsuarioByEmail(string userEmail)
    {
        if (string.IsNullOrEmpty(userEmail))
            throw new ArgumentException("El Email no puede ser nulo ni vacio");

        UsuariosDSTableAdapters.UsuarioTableAdapter adapter = new UsuariosDSTableAdapters.UsuarioTableAdapter();
        UsuariosDS.UsuarioDataTable table = adapter.GetUsuarioByEmail(userEmail);

        if (table.Rows.Count == 0)
        {
            return null;
        }

        if (table.Rows.Count == 0)
            return null;

        Usuario obj = GetUsuarioFromRow(table[0]);

        return obj;
    }

    private static Usuario GetUsuarioFromRow(UsuariosDS.UsuarioRow row)
    {
        return new Usuario()
        {
            UsuarioId = row.usuarioId,
            Nombre = row.nombre,
            Apellido = row.apellido,
            Email = row.email,
            Contraseña = row.contraseña,
            Estado = row.estado,
            TipoUsuario = row.tipoUsuario
    };
    }

}