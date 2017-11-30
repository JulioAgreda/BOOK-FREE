using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Usuario_UsuarioLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            Usuario user = UsuarioBRL.getUsuariosActivos();
            UsuarioBRL.actualizarEstadoUsuario("off", user.UsuarioId);

            Session["USUARIO"] = null;
        }
        catch (Exception ex)
        {

        }        
    }

    protected void BtnLogin_Click(object sender, EventArgs e)
    {
        string userEmail = UserEmailTxt.Text;
        string contraseña = PasswordTxt.Text;

        MsgError.Visible = false;
        try
        {
            Usuario obj = UsuarioBRL.GetUsuarioByEmail(userEmail);
            if (obj == null)
            {
                MsgError.Text = "Correo No Valido";
                MsgError.Visible = true;
                return;
            }
            if (obj.Contraseña.Trim() != contraseña)
            {
                MsgError.Text = "Constraseña No Valido";
                MsgError.Visible = true;
                return;
            }    
            UsuarioBRL.actualizarEstadoUsuario("on", obj.UsuarioId);
            Session["USUARIO"] = obj;            
        }
        catch (Exception ex)
        {
            MsgError.Text = "Error al Iniciar Seccion";
            MsgError.Visible = true;
            return;
        }
        Response.Redirect("~/Usuario/Perfil.aspx");
    }
}