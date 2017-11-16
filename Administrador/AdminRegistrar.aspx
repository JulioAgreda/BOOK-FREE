<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/AdministrardorMaster.master" AutoEventWireup="true" CodeFile="AdminRegistrar.aspx.cs" Inherits="Administrador_AdminRegistrar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="row">
        <div class="col-lg-12">
            
            <h1>REGISTRO DE ADMINISTRADOR</h1>
            <br />
            <br />
            <asp:HiddenField id="UsuarioID" runat="server" value="0"/>

            <div class="col-md-6">
                <asp:panel id="panelError" runat="server" visible="false">
                    <asp:Label id="LblError" runat="server" ForeColor="Red">Error al Registrar el Usuario</asp:Label>
                </asp:panel>

                <div>
                    <label>Nombre:</label>
                    <asp:textbox id="txtNombre" runat="server" 
                        CssClass="form-control" 
                        placeholder="Ingrese su Nombre">
                    </asp:textbox>
                    <asp:RequiredFieldValidator runat="server"
                        ControlToValidate="txtNombre"
                        Display="Dynamic"
                        ForeColor="Red"
                        ErrorMessage="Debe ingresar su Nombre">
                    </asp:RequiredFieldValidator>
                </div>

                <div>
                    <label>Apellido:</label>
                    <asp:textbox id="txtApellido" runat="server"
                        CssClass="form-control" 
                        placeholder="Ingrese su Apellido">
                    </asp:textbox>
                    <asp:RequiredFieldValidator runat="server"
                        ControlToValidate="txtApellido"
                        Display="Dynamic"
                        ForeColor="Red"
                        ErrorMessage="Debe ingresar su Apellido">
                    </asp:RequiredFieldValidator>
                </div>  
                
                <div runat="server" id="campoCorreo" visible="true">                    
                    <label>Correo Electronico:</label>
                    <asp:textbox id="txtEmail" runat="server"
                        CssClass="form-control" 
                        placeholder="Ingrese su Correo">
                    </asp:textbox>
                    <asp:RequiredFieldValidator runat="server"
                        ControlToValidate="txtEmail"
                        Display="Dynamic"
                        ForeColor="Red"
                        ErrorMessage="Debe ingresar su Correo">
                    </asp:RequiredFieldValidator>
                </div>   
                
                <div runat="server" id="CampoContraseña" visible="true">                       
                    <label>Constraseña:</label>
                    <asp:textbox id="txtContraseña" runat="server"
                        TextMode="Password"
                        CssClass="form-control" 
                        placeholder="Ingrese su Constraseña">
                    </asp:textbox>                                        
                </div>  
                <br />
                <h3 class="checkbox">Asignar Permisos</h3>
                    
                <asp:CheckBoxList CssClass="checkbox-inline" ID="checkPermisos" runat="server">
                    <asp:ListItem>Gestionar Usuarios</asp:ListItem>
                    <asp:ListItem>Gestionar Autores</asp:ListItem>
                    <asp:ListItem>Gestionar Editoriales</asp:ListItem>
                    <asp:ListItem>Gestionar Libros</asp:ListItem>
                    <asp:ListItem>Gestionar Categorias</asp:ListItem>
                    <asp:ListItem>Gestionar Permisos</asp:ListItem>
                    <asp:ListItem>Reportes Descargas</asp:ListItem>
                    <asp:ListItem>Reportes Lecturas</asp:ListItem>
                    <asp:ListItem>Reportes Valoracion</asp:ListItem>
                    <asp:ListItem>Ver Lista Libros</asp:ListItem>
                    <asp:ListItem>Descargar Libros</asp:ListItem>
                    <asp:ListItem>Leer Libros</asp:ListItem>
                    <asp:ListItem>Valorar Libro</asp:ListItem>
                </asp:CheckBoxList>

                <br />
                <br />
                <asp:linkbutton id="btnAgregar"
                    runat="server"
                    OnClick="BtnSave_Click"
                    CssClass="btn btn-primary"
                    Text="REGISTRAR">
                </asp:linkbutton>

            </div>      
        </div>     
    </div>


</asp:Content>

