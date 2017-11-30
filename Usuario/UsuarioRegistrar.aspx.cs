using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Usuario_UsuarioRegistrar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strId = Request.Params["Id"];
        if (string.IsNullOrEmpty(strId))
        {
            return;
        }
        cargarDatos();
    }

    protected void BtnSave_Click(object sender, EventArgs e)
    {
        panelError.Visible = false;

        try
        {
            int id = Convert.ToInt32(UsuarioID.Value);
            string nombre = txtNombre.Text;
            string apellido = txtApellido.Text;
            string email = txtEmail.Text;
            string contraseña = txtContraseña.Text;
            string tipoUsuario = "usuario";
            string estado = "activo";
            string estadoActual = "off";

            Usuario obj = new Usuario()
            {
                Nombre = nombre,
                Apellido = apellido,
                Email = email,
                Contraseña = contraseña,
                TipoUsuario = tipoUsuario,
                Estado = estado,
                EstadoActual = estadoActual,
                UsuarioId = id
            };

            string strId = Request.Params["Id"];

            //Insertar Nuevo Usuario
            if (string.IsNullOrEmpty(strId))
            {
                int userId = UsuarioBRL.insertarUsuario(obj);
            }
            //Actualizar Usuario
            else
            {
                string Id = Request.Params["Id"];
                int codigoUsuario = Int32.Parse(Id);
                UsuarioBRL.actualizarUsuario(nombre, apellido, codigoUsuario);
            }
        }
        catch (Exception ex)
        {
            panelError.Visible = true;
            return;
        }
        Response.Redirect("~/Index.aspx");

    }

    public void cargarDatos()
    {

        campoCorreo.Visible = false;
        CampoContraseña.Visible = false;

        string strId = Request.Params["Id"];
        if (string.IsNullOrEmpty(strId))
        {
            return;
        }

        int id = 0;
        try
        {
            id = Convert.ToInt32(strId);
        }
        catch (Exception ex)
        {
            LblError.Text = "No se puede cargar el Usuario a Editar";
            panelError.Visible = true;
            return;
        }

        if (id <= 0)
        {
            LblError.Text = "No se puede cargar el Usuario a Editar";
            panelError.Visible = true;
            return;
        }
        try
        {
            Usuario obj = UsuarioBRL.getUsuariosById(id);

            txtNombre.Text = obj.Nombre;
            txtApellido.Text = obj.Apellido;
        }
        catch (Exception ex)
        {
            LblError.Text = "No se puede cargar el Usuario a Editar";
            panelError.Visible = true;
            return;
        }
    }
}
