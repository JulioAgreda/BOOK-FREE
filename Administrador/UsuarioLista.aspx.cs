using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administrador_UsuarioLista : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int permisoId = 1;
        try
        {
            if (Session["USUARIO"] == null)
            {
                Response.Redirect("~/Administrador/AdminLogin.aspx");
            }
            Usuario user = UsuarioBRL.getUsuariosActivos();
            if (UsuarioPermisoBRL.tienePermiso(user.UsuarioId, permisoId))
            {
                cargarLista();
            }
            else
            {                
                Response.Redirect("~/Administrador/AdminLogin.aspx");
            }

        }
        catch (Exception ex)
        {

        }

    }
    
    private void cargarLista()
    {
        try
        {
            List<Usuario> usuarios = UsuarioBRL.getUsuarios();
            GridUsuarios.DataSource = usuarios;
            GridUsuarios.DataBind();
        }
        catch (Exception ex)
        {
        }
    }
    protected void GridUsuarios_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int usuarioId = 0;

        try
        {
            usuarioId = Convert.ToInt32(e.CommandArgument);
        }
        catch (Exception ex)
        {

        }

        if (usuarioId <= 0)
        {
            return;
        }


        if (e.CommandName == "Editar")
        {
            Response.Redirect("UsuarioEditar.aspx?Id=" + usuarioId.ToString());
            return;
        }

        if (e.CommandName == "Eliminar")
        {
            try
            {
                UsuarioBRL.eliminarUsuario(usuarioId);
                cargarLista();

            }
            catch (Exception ex)
            {

            }
        }
    }
}