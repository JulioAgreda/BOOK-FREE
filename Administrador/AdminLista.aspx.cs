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
        if (Session["USUARIO"] == null)
        {
            Response.Redirect("~/Administrador/AdminLogin.aspx");
        }

        cargarLista();

        //if (!IsPostBack)
        //{
        //    cargarLista();
        //}
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