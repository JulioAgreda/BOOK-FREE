using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Libros_LibrosLista : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int permisoId = 4;
        try
        {
            if (Session["USUARIO"] == null)
            {
                Response.Redirect("~/Administrador/AdminLogin.aspx");
            }
            Usuario user = UsuarioBRL.getUsuariosActivos();
            if (UsuarioPermisoBRL.tienePermiso(user.UsuarioId, permisoId))
            {
                cargar();
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
    protected void GridLibros_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int LibrosId = 0;

        try
        {
            LibrosId = Convert.ToInt32(e.CommandArgument);
        }
        catch (Exception ex)
        {

        }

        if (LibrosId <= 0)
        {
            return;
        }


        if (e.CommandName == "Editar")
        {

            Response.Redirect("~/Libros/LibrosFormulario.aspx?Id=" + LibrosId.ToString());
            return;
        }

        if (e.CommandName == "Eliminar")
        {
            try
            {
                libroBRL.eliminarLibro(LibrosId);
                cargar();                

            }
            catch (Exception ex)
            {

            }
        }

    }

    public void cargar()
    {
        List<Libros> listLibros = libroBRL.getLibros();
        GridLibros.DataSource = listLibros;
        GridLibros.DataBind();
    }
}