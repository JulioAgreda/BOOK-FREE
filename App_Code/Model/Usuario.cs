using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Usuario
/// </summary>
public class Usuario
{
    public int UsuarioId { get; set; }
    public string Nombre { get; set; }
    public string Apellido { get; set; }
    public string Email { get; set; }
    public string Contraseña { get; set; }
    public string TipoUsuario { get; set; }    
    public string Estado { get; set; }

    public Usuario()
    {

    }



}