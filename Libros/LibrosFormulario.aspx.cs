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

        string strId = Request.Params["Id"];
        if (string.IsNullOrEmpty(strId))
        {
            cargarCombos();
        }
        cargarDatos();
        
    }

    protected void BtnSave_Click(object sender, EventArgs e)
    {
        try
        {
            int id = Convert.ToInt32(LIBROID.Value);
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

    public void cargarCombos()
    {
        List<Autores> autores = AutorBRL.getAutor();
        ComboListaAutor.DataSource = autores;
        ComboListaAutor.DataBind();

        List<Categorias> categoria = CategoriaBRL.getCategoria();
        ComboListaCategoria.DataSource = categoria;
        ComboListaCategoria.DataBind();

    }

    public void cargarDatos()
    {
        try
        {
            string strId = Request.Params["Id"];
            int codLibro = Int32.Parse(strId);

            List<Autores> autor = AutorBRL.getAutorById(codLibro);
            ComboListaAutor.DataSource = autor;
            ComboListaAutor.DataBind();


            List<Categorias> categoria = CategoriaBRL.getCategoriaById(codLibro);
            ComboListaCategoria.DataSource = categoria;
            ComboListaCategoria.DataBind();

            Libros lib = libroBRL.getLibroById(codLibro);
            txtTitulo.Text = lib.Titulo;
            TxtSinopsis.Text = lib.Sinopsis;

            lib = libroBRL.getLibroById(codLibro);
            imgLibro.ImageUrl = lib.Portada;

        }
        catch (Exception ex)
        {

        }         

    }

    //protected void ComboListaAutor_DataBound(object sender, EventArgs e)
    //{
    //    ComboListaAutor.Items.Insert(0, new ListItem("Seleccione un Autor...", ""));
    //}

    //protected void ComboListaCategoria_DataBound(object sender, EventArgs e)
    //{
    //    ComboListaCategoria.Items.Insert(0, new ListItem("Seleccione un Categoria...", ""));
    //}
}