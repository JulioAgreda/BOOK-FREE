<%@ Page Title="" Language="C#" MasterPageFile="~/Interfaz.master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">      
    <br />
    <h1 runat="server" id="title">LIBROS</h1><br />  

    <asp:Repeater ID="ListLibros" runat="server" OnItemCommand="ListLibros_ItemCommand">
        <ItemTemplate>
            <asp:LinkButton ID="itemMostrarLibro" runat="server"
                CommandName="verLibro"                
                CommandArgument='<%# Eval("librosId") %>'>
                <div runat="server" align="center" class="divItem"
                    style="display: inline-flex; margin: 5px; border-radius: 4px;">
                    <table>
                        <tr>
                            <td>
                                <asp:Image ID="ImgPortada" runat="server" ImageUrl='<%# Eval("Portada")%>' Width="190" Height="300"/><br />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblTituloLibro" runat="server" Text='<%# Eval("Titulo")%>'  Font-Size="16px" ForeColor="#cccccc" ></asp:Label><br />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblAutor" runat="server" Text='<%# Eval("AutorId")%>' Font-Size="14px" ForeColor="#999999"></asp:Label><br />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label runat="server" Text='(' Font-Size="12px" ForeColor="#666666"></asp:Label>
                                <asp:Label ID="lblValoracion" runat="server" Text='<%# Eval("Valoracion")%>' Font-Size="12px" ForeColor="#666666"></asp:Label>
                                <asp:Label runat="server" Text='/10)' Font-Size="12px" ForeColor="#666666"></asp:Label><br />
                            </td>
                        </tr>

                    </table>
                </div>
            </asp:LinkButton>

        </ItemTemplate>
    </asp:Repeater>
</asp:Content>

