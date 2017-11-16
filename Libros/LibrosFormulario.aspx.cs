using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Libros_LibrosFormulario : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["USUARIO"] == null)
        {
            Response.Redirect("~/Administrador/AdminLogin.aspx");
        }

        if (IsPostBack)
        {
            return;
        }
        cargar();
    }

    protected void BtnSave_Click(object sender, EventArgs e)
    {
        try
        {
            string valorAutor = ComboListaAutor.SelectedValue;
            int autorId = Convert.ToInt32(valorAutor);

            string valorCategoria = ComboListaCategoria.SelectedValue;
            int categoriaId = Convert.ToInt32(valorCategoria);

            string imgPortada = imgLibro.ImageUrl;
            string tiutlo = txtTitulo.Text;
            string sinopsis = TxtSinopsis.Text;

            Libros objLibro = new Libros();

            objLibro.AutorId = autorId;
            objLibro.CategoriaId = categoriaId;
            objLibro.Titulo = tiutlo;
            objLibro.Portada = imgPortada;            
            objLibro.Sinopsis = sinopsis;
            objLibro.Valoracion = 0;
            objLibro.Estado = "activo";

            libroBRL.insertarlibros(objLibro);

            Response.Redirect("~/Libros/LibrosLista.aspx");

        }
        catch(Exception ex)
        {

        }
    }

    protected void btnUploadImage_Click(object sender, EventArgs e)
    {
        lbValFile.Text = "";
        if (btnFile.HasFile)
        {
            string extention = System.IO.Path.GetExtension(btnFile.FileName);
            if (extention == ".jpg" || extention == ".png")
            {
                imgLibro.ImageUrl = "~/Libros/Imagenes/" + btnFile.FileName;
                string path = Server.MapPath("~/Libros/Imagenes/");
                btnFile.SaveAs(path + btnFile.FileName);
            }
            else
            {
                lbValFile.Text = "Solo puede seleccionar archivos JPG y PNG";
            }

        }
        else
        {
            if (String.IsNullOrEmpty(imgLibro.ImageUrl))
            {
                lbValFile.Text = "Debe Seleccionar un Archivo";
            }

        }
    }

    public void cargar()
    {
        List<Autores> autores = AutorBRL.getAutor();
        ComboListaAutor.DataSource = autores;
        ComboListaAutor.DataBind();

        List<Categorias> categoria = CategoriaBRL.getCategoria();
        ComboListaCategoria.DataSource = categoria;
        ComboListaCategoria.DataBind();
    }

    protected void ComboListaAutor_DataBound(object sender, EventArgs e)
    {
        ComboListaAutor.Items.Insert(0, new ListItem("Seleccione un Autor...", ""));
    }

    protected void ComboListaCategoria_DataBound(object sender, EventArgs e)
    {
        ComboListaCategoria.Items.Insert(0, new ListItem("Seleccione un Categoria...", ""));
    }
}