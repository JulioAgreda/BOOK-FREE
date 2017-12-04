<%@ Page Title="" Language="C#" MasterPageFile="~/Interfaz.master" AutoEventWireup="true" CodeFile="busquedaTitulo.aspx.cs" Inherits="Libros_Busquedas_busquedaTitulo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <div style="display:flex" id="subMenu">
        <h1 runat="server"  style="margin-right:250px" id="title">BUSQUEDA POR TITULO</h1><br />  

<%--        <asp:RequiredFieldValidator runat="server"
            ControlToValidate="txtBusqueda"
            Display="Dynamic"
            ForeColor="Red"
            ErrorMessage="Debe ingresar su Titulo">
        </asp:RequiredFieldValidator>--%>
        <asp:TextBox ID="txtBusqueda" runat="server"
             CssClass="form-control" 
             Width="250px"
             style="margin-top:20px" 
             placeholder="Ingrese el Titulo">
        </asp:TextBox>
        

        <asp:LinkButton ID="btnBuscar" 
            CssClass="btn-primary" 
            style="border-radius:10px
            ;margin-top:20px
            ;text-align:center
            ;font-size:20px" 
            runat="server"
            Height="35px"
            Width="70px"
            OnClick="btnBuscar_Click">Buscar            
        </asp:LinkButton>
    </div>
    
    <asp:Repeater ID="ListLibros" runat="server" OnItemCommand="ListLibros_ItemCommand">
        <ItemTemplate>
            <asp:LinkButton ID="itemMostrarLibro" runat="server"
                CommandName="verLibro"                
                CommandArgument='<%# Eval("librosId") %>'>
                <div runat="server" align="center" class="divItem"
                    style="display: inline-flex; margin: 5px; border-radius: 4px;">
                    <table runat="server" ID="tblValores">
                        <tr>
                            <td>
                                <asp:Image ID="ImgPortada" runat="server" ImageUrl='<%# Eval("Portada")%>' Width="190" Height="300"/><br />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblTituloLibro" runat="server" Text='<%# Eval("Titulo")%>' Font-Size="16px" ForeColor="#cccccc"></asp:Label><br />
                            </td>
                        </tr>
                        <tr>
                            <td>                                
                                <asp:Label ID="lblAutor" runat="server" Text='<%# Eval("AutorId")%>' Font-Size="14px" ForeColor="#999999"></asp:Label><br />
                            </td>
                        </tr>    
                        <%--<tr>
                            <td>
                                <asp:Label runat="server" Text='(' Font-Size="12px" ForeColor="#666666"></asp:Label>
                                <asp:Label ID="lblValoracion" runat="server" Text='<%# Eval("Valoracion")%>' Font-Size="12px" ForeColor="#666666"></asp:Label>
                                <asp:Label runat="server" Text='/10)' Font-Size="12px" ForeColor="#666666"></asp:Label><br />
                            </td>
                        </tr>--%>       
                    </table>
                </div>
            </asp:LinkButton>
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>

