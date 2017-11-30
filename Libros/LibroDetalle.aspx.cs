using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Libros_LibroDetalle : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        cargarDatos();
    }

    public void cargarDatos()
    {
        try
        {
            //Ocultar Valorar
            lblValoreLibro.Visible = false;
            valoreLibro.Visible = false;

            

            string strId = Request.Params["Id"];
            int codLibro = Int32.Parse(strId);

            Libros Libro = libroBRL.getLibroById(codLibro);

            lblTitulo.Text = Libro.Titulo;

            ImgPortada.ImageUrl = Libro.Portada;

            Autores autor = AutorBRL.getAutorNombreById(codLibro);
            lblAutor.Text = autor.nombreCompleto;

            Categorias categoria = CategoriaBRL.getCategoriaNombreById(codLibro);
            lblCategoria.Text = categoria.Nombre;

            lblValoracion.Text = ""+ Libro.Valoracion;

            PSinopsis.InnerText = Libro.Sinopsis;
            
        }
        catch (Exception ex)
        {

        }
    }

    protected void ComboListaValoracion_DataBound(object sender, EventArgs e)
    {
        comboValoracion.Items.Insert(0, new ListItem("0", ""));
    }


    protected void Descargar_Click(object sender, EventArgs e)
    {
        try
        {
            if (Session["USUARIO"] == null)
            {
                Response.Redirect("~/Usuario/UsuarioLogin.aspx");
            }

            string strId = Request.Params["Id"];
            int codLibro = Int32.Parse(strId);
            DateTime fec = Convert.ToDateTime(DateTime.Now.ToString("dd/MM/yyyy"));

            Usuario user = UsuarioBRL.getUsuariosActivos();
            Descarga objDescarga = new Descarga();
            objDescarga.libroId = codLibro;
            objDescarga.usuarioId = user.UsuarioId;
            objDescarga.fecha = fec;

            DescargaBRL.insertarDescarga(objDescarga);

            Libros lib = libroBRL.getLibroById(codLibro);

            string nombreLibro = "" + lib.Titulo;

            Response.Clear();
            string filePath = "~/Libros/Pdf/" + nombreLibro + ".pdf";
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment; filename =" + filePath);
        }
        catch (Exception ex)
        {
            
        }       
    }

    protected void Leer_Click(object sender, EventArgs e)
    {
        try
        {
            if (Session["USUARIO"] == null)
            {
                Response.Redirect("~/Usuario/UsuarioLogin.aspx");
            }

            string strId = Request.Params["Id"];
            int codLibro = Int32.Parse(strId);

            DateTime fec = Convert.ToDateTime(DateTime.Now.ToString("dd/MM/yyyy"));
            Usuario user = UsuarioBRL.getUsuariosActivos();
            Lectura objLectura = new Lectura();
            objLectura.libroId = codLibro;
            objLectura.usuarioId = user.UsuarioId;
            objLectura.fecha = fec;

            LecturaBRL.insertarLectura(objLectura);

            Libros lib = libroBRL.getLibroById(codLibro);

            string nombreLibro = "" + lib.Titulo;

            Response.Clear();
            string filePath = "~/Libros/Pdf/" + nombreLibro + ".pdf";
            Response.ContentType = "application/pdf";
            Response.WriteFile(filePath);
            Response.End();
        }
        catch (Exception ex)
        {
            
        }
    }
}