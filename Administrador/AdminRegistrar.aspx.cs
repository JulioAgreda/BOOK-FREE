using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administrador_AdminRegistrar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["USUARIO"] == null)
        {
            Response.Redirect("~/Administrador/AdminLogin.aspx");
        }

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
            string tipoUsuario = "admin";
            string estado = "activo";

            Usuario obj = new Usuario()
            {
                Nombre = nombre,
                Apellido = apellido,
                Email = email,
                Contraseña = contraseña,
                TipoUsuario = tipoUsuario,
                Estado = estado,
                UsuarioId = id
            };

            string strId = Request.Params["Id"];

            //Insertar Nuevo Usuario
            if (string.IsNullOrEmpty(strId))
            {
                int userId = UsuarioBRL.insertarUsuario(obj);

                PermisoUsuario usuarioPermiso;
                Permiso tempPerm;
                //Le inserto los permisos

                for (int i = 0; i < checkPermisos.Items.Count; i++)
                {
                    if (checkPermisos.Items[i].Selected)
                    {
                        tempPerm = PermisoBRL.getPermisoByDescription(checkPermisos.Items[i].Text);
                        usuarioPermiso = new PermisoUsuario()
                        {
                            UsuarioId = userId,
                            PermisoId = tempPerm.PermisoID
                        };
                        UsuarioPermisoBRL.insertUsuarioPermiso(usuarioPermiso);
                    }
                }
            }
            //Actualizar Usuario
            else
            {
                string Id = Request.Params["Id"];
                int codigoUsuario = Int32.Parse(Id);
                UsuarioBRL.actualizarUsuario(nombre, apellido, codigoUsuario);

            //Actualizar Permisos
                //Permiso perm;
                //for (int i = 0; i < checkPermisos.Items.Count; i++)
                //{
                //    if (checkPermisos.Items[i].Selected)
                //    {
                //        perm = PermisoBRL.getPermisoByDescription(checkPermisos.Items[i].Text);
                //        if (!UsuarioPermisoBRL.tienePermiso(obj.UsuarioId, perm.PermisoID))
                //        {
                //            //Actualizar
                //            PermisoUsuario admPerm = new PermisoUsuario()
                //            {
                //                UsuarioId = obj.UsuarioId,
                //                PermisoId = perm.PermisoID
                //            };

                //            UsuarioPermisoBRL.insertUsuarioPermiso(admPerm);
                //        }

                //    }
                //    else
                //    {
                //        perm = PermisoBRL.getPermisoByDescription(checkPermisos.Items[i].Text);
                //        if (UsuarioPermisoBRL.tienePermiso(obj.UsuarioId, perm.PermisoID))
                //        {
                //            //Eliminar
                //            UsuarioPermisoBRL.eliminarUsuarioPermisoByUsuarioIdPermisoId(obj.UsuarioId, perm.PermisoID);
                //        }
                //    }

                //}
            }
        }
        catch(Exception ex)
        {
            panelError.Visible = true;
            return;
        }
        Response.Redirect("~/Administrador/AdminLista.aspx");

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

            Permiso perm;
            for (int i = 0; i < checkPermisos.Items.Count; i++)
            {
                perm = PermisoBRL.getPermisoByDescription(checkPermisos.Items[i].Text);
                if(UsuarioPermisoBRL.tienePermiso(obj.UsuarioId, perm.PermisoID))
                {
                    checkPermisos.Items[i].Selected = true;
                }
            }
        }
        catch (Exception ex)
        {
            LblError.Text = "No se puede cargar el Usuario a Editar";
            panelError.Visible = true;
            return;
        }
    }
}