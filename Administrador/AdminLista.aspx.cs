using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administrador_AdminLista : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int permisoId = 3;
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
                Response.Write("<script>window.alert('Usuario no Admitido!!!');</script>");
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
            List<Usuario> usuarios = UsuarioBRL.getAdmin();
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

            Response.Redirect("~/Administrador/AdminRegistrar.aspx?Id=" + usuarioId.ToString());
            return;
        }

        if (e.CommandName == "Eliminar")
        {
            try
            {
                UsuarioBRL.eliminarUsuario(usuarioId);
                cargarLista();

                UsuarioPermisoBRL.eliminarUsuarioPermiso(usuarioId);

            }
            catch (Exception ex)
            {

            }
        }

    }
}