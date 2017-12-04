<%@ Page Title="" Language="C#" MasterPageFile="~/Interfaz.master" AutoEventWireup="true" CodeFile="LoginUsuario.aspx.cs" Inherits="Usuario_LoginUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="col-md-3 col-md-offset-4">
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
        <asp:TextBox style="margin-bottom:10px; margin-top:10px" ID="PasswordTxt" runat="server"
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
        <asp:Label ID="MsgError" runat="server" ForeColor="Red" Visible="false" Style="margin-bottom: 10px"></asp:Label>

        <asp:Button ID="BtnLogin" runat="server"
            OnClick="BtnLogin_Click"
            CssClass="btn btn-lg btn-primary btn-block"
            ValidationGroup="Login" Text="Ingresar" />
        <br />
        <asp:HyperLink Style="padding-left: 80px" runat="server" Font-Size="15px" ForeColor="#ff0000" Font-Bold="true" NavigateUrl="~/Usuario/UsuarioRegistrar.aspx">Registrarse</asp:HyperLink>
        
    </div>
</asp:Content>

