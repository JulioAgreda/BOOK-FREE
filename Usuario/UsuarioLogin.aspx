<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UsuarioLogin.aspx.cs" Inherits="Usuario_UsuarioLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .validators
        {
            margin-bottom: 10px;
            color: red;
        }
    </style>
</head>
<body>
    <div class="container">
        <form id="form1" runat="server" class="col-md-3 col-md-offset-4">
            <h2 class="form-signin-heading">Iniciar Seccion</h2>
            
            <label for="inputEmail" class="sr-only">Correo Electronico</label>
            <asp:TextBox ID="UserEmailTxt" runat="server" CssClass="form-control" placeholder="Ingrese su Correo"></asp:TextBox>
            
            <div class="validators">
                <asp:RequiredFieldValidator runat="server" ControlToValidate="UserEmailTxt"
                    ErrorMessage="Debe ingresar su Correo Electronico"
                    ValidationGroup="Login"
                    Display="Dynamic">
                </asp:RequiredFieldValidator>
            </div>

            <label for="inputPassword" class="sr-only">Contraseña</label>
            <asp:TextBox ID="PasswordTxt" runat="server" 
                CssClass="form-control"                
                TextMode="Password"
                placeholder="Ingrese su Contraseña">
            </asp:TextBox>
            <div class="validators">
                <asp:RequiredFieldValidator runat="server" 
                    ControlToValidate="PasswordTxt"
                    ErrorMessage="Debe ingresar su contraseña"
                    ValidationGroup="Login"
                    Display="Dynamic">
                </asp:RequiredFieldValidator>
            </div>            
            <asp:Label ID="MsgError" runat="server" ForeColor="Red" Visible="false" style="margin-bottom: 10px"></asp:Label>            
            
            <asp:Button ID="BtnLogin" runat="server"
                OnClick="BtnLogin_Click"
                CssClass="btn btn-lg btn-primary btn-block"
                ValidationGroup="Login" Text="Ingresar" />
            <br />
            <asp:HyperLink style="padding-left:80px" runat="server" Font-Size="15px" ForeColor="#ff0000" Font-Bold="true" NavigateUrl="~/Usuario/UsuarioRegistrar.aspx">Registrarse</asp:HyperLink>

        </form>
    </div>
</body></html>
