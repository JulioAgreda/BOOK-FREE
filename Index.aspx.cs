using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            cargarLibros();
            Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache);
            Response.Cache.SetAllowResponseInBrowserHistory(false);
            Response.Cache.SetNoStore();
        }
    }
    public void cargarLibros()
    {
        List<Libros> listPeliculas = libroBRL.getLibros();
        ListLibros.DataSource = listPeliculas;
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


}