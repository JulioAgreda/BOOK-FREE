<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/AdministrardorMaster.master" AutoEventWireup="true" CodeFile="LibrosFormulario.aspx.cs" Inherits="Libros_LibrosFormulario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-lg-12">
            
            <h1>REGISTRO DE LIBROS</h1>

            <asp:HiddenField id="LIBROID" runat="server" value="0"/>

            <div class="col-md-6">
                <asp:panel id="panelError" runat="server" visible="false">
                    <asp:Label id="LblError" runat="server" ForeColor="Red">Error al Registrar el libro</asp:Label>
                </asp:panel>

            <div class="form-group" runat="server" visible ="true">
                <label>Autor:</label>
                
                <asp:DropDownList ID="ComboListaAutor" runat="server" CssClass="form-control"
                    OnDataBound ="ComboListaAutor_DataBound"
                    DataValueField="AutorId"
                    DataTextField="NombreCompleto">
                    <asp:ListItem Value="" Text="Seleccione un Autor"></asp:ListItem>
                </asp:DropDownList>            
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ComboListaAutor"
                    ErrorMessage ="Debe seleccionar un Autor"
                    Display="Dynamic"
                    ForeColor="Red"
                    ValidationGroup="AddAutor">
                </asp:RequiredFieldValidator>
                <asp:HyperLink runat="server" NavigateUrl="~/Rol/RegistroRol.aspx">
                   AUTOR +
                </asp:HyperLink>
            </div>

            <div class="form-group" runat="server" visible ="true">
                <label>Categoria:</label>
                
                <asp:DropDownList ID="ComboListaCategoria" runat="server" CssClass="form-control"                    
                    OnDataBound ="ComboListaCategoria_DataBound"
                    DataValueField="CategoriaId"
                    DataTextField="Nombre">
                    <asp:ListItem Value="" Text="Seleccione una Categoria"></asp:ListItem>
                </asp:DropDownList>            
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ComboListaCategoria"
                    ErrorMessage ="Debe seleccionar un Categoria"
                    Display="Dynamic"
                    ForeColor="Red"
                    ValidationGroup="AddCategoria">
                </asp:RequiredFieldValidator>
                <asp:HyperLink runat="server" NavigateUrl="~/Rol/RegistroRol.aspx">
                   CATEGORIA +
                </asp:HyperLink>
            </div>                              

            <div>
                <label>Titulo:</label>
                <asp:textbox id="txtTitulo" runat="server" 
                      CssClass="form-control" 
                      placeholder="Ingrese su Titulo">
                </asp:textbox>
                <asp:RequiredFieldValidator runat="server"
                      ControlToValidate="txtTitulo"
                      Display="Dynamic"
                      ForeColor="Red"
                      ErrorMessage="Debe ingresar su Titulo">
                 </asp:RequiredFieldValidator>
            </div>    

            <div>
                <label>Sinopsis:</label>
                <asp:textbox id="TxtSinopsis" runat="server" TextMode="MultiLine" 
                    Height="150"  
                    CssClass="form-control" 
                    placeholder="Ingrese su Sinopsis">
                </asp:textbox>
                <asp:RequiredFieldValidator runat="server"
                      ControlToValidate="TxtSinopsis"
                      Display="Dynamic"
                      ForeColor="Red"
                      ErrorMessage="Debe ingresar su Sinopsis">
                 </asp:RequiredFieldValidator>
            </div>       

            <div class="form-group">
            <div class="col-md-offset-2">
                <asp:Image ID="imgLibro" runat="server" Height="200px" ImageAlign="Middle" Width="200px" />
                <br /> 
                <asp:Label ID="lbValFile" runat="server" Text="" ForeColor="Red"></asp:Label> 
                <br />        
                <asp:FileUpload ID="btnFile" runat="server" />
                <br />
                <asp:Button ID="btnUploadImage" CssClass="center-block" BorderColor="#666699" runat="server" Text="Cargar Imagen" OnClick="btnUploadImage_Click"/>
            </div>
        </div>

                <br />
                <asp:linkbutton id="btnAgregar"
                    runat="server"
                    OnClick="BtnSave_Click"
                    CssClass="btn btn-primary center-block"
                    Text="REGISTRAR">
                </asp:linkbutton>

            </div>      
        </div>     
    </div>

</asp:Content>

