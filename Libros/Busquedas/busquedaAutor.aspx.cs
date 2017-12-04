using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Libros_Busquedas_busquedaAutor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //cargarLibros();
        }
    }

    public void cargarLibros()
    {
        string nombreAutor = txtBusqueda.Text;
        List<Libros> listLibros = libroBRL.getLibros();
        ListLibros.DataSource = listLibros;
        ListLibros.DataBind();
    }

    protected void ListLibros_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        int libroId = 0;
        try
        {
            libroId = Convert.ToInt32(e.CommandArgument);
        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
        if (libroId <= 0)
            return;

        if (e.CommandName == "verLibro")
        {
            Response.Redirect("~/Libros/LibroDetalle.aspx?Id=" + libroId.ToString());
            return;
        }
    }

    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        string nombreAutor = txtBusqueda.Text;
        List<Libros> listLibros = libroBRL.getLibrosByAutor(nombreAutor);
        ListLibros.DataSource = listLibros;
        ListLibros.DataBind();
    }
}