<%@ Page Title="" Language="C#" MasterPageFile="~/Interfaz.master" AutoEventWireup="true" CodeFile="UsuarioRegistrar.aspx.cs" Inherits="Usuario_UsuarioRegistrar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="col-lg-12">

            <h1>REGISTRO DE USUARIO</h1>
            <br />
            <asp:HiddenField ID="UsuarioID" runat="server" Value="0" />

            <div class="col-md-6">
                <asp:Panel ID="panelError" runat="server" Visible="false">
                    <asp:Label ID="LblError" runat="server" ForeColor="Red">Error al Registrar el Usuario</asp:Label>
                </asp:Panel>

                <div>
                    <label>Nombre:</label>
                    <asp:TextBox ID="txtNombre" Width="200px" runat="server"
                        CssClass="form-control"
                        placeholder="Ingrese su Nombre">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator runat="server"
                        ControlToValidate="txtNombre"
                        Display="Dynamic"
                        ForeColor="Red"
                        ErrorMessage="Debe ingresar su Nombre">
                    </asp:RequiredFieldValidator>
                </div>

                <div>
                    <label style="padding-top:5px">Apellido:</label>
                    <asp:TextBox ID="txtApellido" Width="200px" runat="server"
                        CssClass="form-control"
                        placeholder="Ingrese su Apellido">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator runat="server"
                        ControlToValidate="txtApellido"
                        Display="Dynamic"
                        ForeColor="Red"
                        ErrorMessage="Debe ingresar su Apellido">
                    </asp:RequiredFieldValidator>
                </div>

                <div runat="server" id="campoCorreo" visible="true">
                    <label style="padding-top:5px">Correo Electronico:</label>
                    <asp:TextBox ID="txtEmail" Width="350px" runat="server"
                        CssClass="form-control"
                        placeholder="Ingrese su Correo">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator runat="server"
                        ControlToValidate="txtEmail"
                        Display="Dynamic"
                        ForeColor="Red"
                        ErrorMessage="Debe ingresar su Correo">
                    </asp:RequiredFieldValidator>
                </div>

                <div runat="server" id="CampoContraseña" visible="true">
                    <label style="padding-top:5px">Constraseña:</label>
                    <asp:TextBox ID="txtContraseña" Width="180px" runat="server"
                        TextMode="Password"
                        CssClass="form-control"
                        placeholder="Constraseña">
                    </asp:TextBox>
                </div>
                <br />
                <asp:LinkButton ID="btnAgregar"
                    runat="server"
                    OnClick="BtnSave_Click"
                    CssClass="btn btn-primary"
                    Text="REGISTRAR">
                </asp:LinkButton>
                <br />
                <br />
            </div>
        </div>
    </div>
</asp:Content>

