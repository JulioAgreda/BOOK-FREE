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
        List<Libros> listLibros = libroBRL.getLibros();
        GridLibros.DataSource = listLibros;
        GridLibros.DataBind();

        cargar();
    }
    protected void GridLibros_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }

    public void cargar()
    {
        
    }
}