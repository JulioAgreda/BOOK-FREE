﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Usuario_Perfil : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["USUARIO"] == null)
            {
                Response.Redirect("~/Usuario/LoginUsuario.aspx");
            }
        }
        catch (Exception ex)
        {
        }
    }
}