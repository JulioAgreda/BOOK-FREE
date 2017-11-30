<%@ Page Title="" Language="C#" MasterPageFile="~/Interfaz.master" AutoEventWireup="true" CodeFile="LibroDetalle.aspx.cs" Inherits="Libros_LibroDetalle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            <div>
                <br />
                <asp:Image ID="ImgPortada" runat="server" ImageUrl='<%# Eval("Portada")%>' Width="190" Height="300"/><br />
                <br />
                <asp:Label runat="server" Text="Titulo:" Font-Bold="true"></asp:Label>
                <br />
                    <asp:Label ID="lblTitulo" runat="server" Text="" ></asp:Label>
                <br />
                
                <asp:Label  runat="server" Text="Autor:" Font-Bold="true"></asp:Label>
                <br />
                    <asp:Label ID="lblAutor" runat="server" Text=""></asp:Label>
                <br />
                
                <asp:Label  runat="server" Text="Autor:" Font-Bold="true"></asp:Label>
                <br />
                    <asp:Label ID="lbl" runat="server" Text=""></asp:Label>
                <br />

                <asp:Label runat="server" Text="Valoracion:" Font-Bold="true"></asp:Label>
                <br />
                    <asp:Label ID="lblValoracio" runat="server" Text=""></asp:Label>
                <br />

                <asp:Label runat="server" Text="Sinopsis:" Font-Bold="true"></asp:Label>
                <br />
                    <p runat="server" ID="Sinopsis"></p>
                <br />

                <div class="row">
                    <div runat="server" style="padding-right:10px; padding-left:20px">
                        <asp:Button class="btn btn-dark btn-block" ID="btnLeer" runat="server" Text="LEER" />
                    </div>

                    <div runat="server" >
                        <asp:Button class="btn btn-dark btn-block" ID="btnDescargar" runat="server" Text="DESCARGAR" />
                    </div>
                </div>
                <br />
            </div>      
                 

</asp:Content>

