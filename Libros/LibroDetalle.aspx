<%@ Page Title="" Language="C#" MasterPageFile="~/Interfaz.master" AutoEventWireup="true" CodeFile="LibroDetalle.aspx.cs" Inherits="Libros_LibroDetalle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            <div style="padding-left:100px">
                <br />
                <asp:Label ID="fechaActual" runat="server" Text="Fecha Actual:"></asp:Label>
                <br />
                <asp:Image ID="ImgPortada" runat="server" ImageUrl='<%# Eval("Portada")%>' Width="190" Height="300"/><br />
                <br />
                    <asp:Label runat="server" Text="Titulo:" Font-Bold="true"></asp:Label>
                <br />
                    <asp:Label style="padding-left:20px" ID="lblTitulo" runat="server" Text="" ></asp:Label>
                <br />

                <asp:Label  runat="server" Text="Autor:" Font-Bold="true"></asp:Label>
                <br />
                    <asp:Label style="padding-left:20px" ID="lblAutor" runat="server" Text=""></asp:Label>
                <br />

                <asp:Label  runat="server" Text="Categoria:" Font-Bold="true"></asp:Label>
                <br />
                    <asp:Label style="padding-left:20px" ID="lblCategoria" runat="server" Text=""></asp:Label>
                <br />

                <asp:Label runat="server" Text="Valoracion:" Font-Bold="true"></asp:Label>
                <br />
                    <label style="padding-left:20px" runat="server">(</label> 
                    <asp:Label ID="lblValoracion" runat="server" Text=""></asp:Label>  
                    <label runat="server">/10)</label>
                    
                <br />
                <%--<asp:Label id="lblValoreLibro" runat="server" style="padding-left:20px" Text="Valore:"></asp:Label>
                <div runat="server" style="padding-left: 20px; display:flex" id="valoreLibro">
                    <asp:DropDownList ID="comboValoracion" runat="server"
                        Style="padding-left: 10px; width: 110px; height: 35px"
                        CssClass="form-control"
                        OnDataBound="ComboListaValoracion_DataBound">
                        <asp:ListItem Value="0"></asp:ListItem>
                        <asp:ListItem Value="1"></asp:ListItem>
                        <asp:ListItem Value="2"></asp:ListItem>
                        <asp:ListItem Value="3"></asp:ListItem>
                        <asp:ListItem Value="4"></asp:ListItem>
                        <asp:ListItem Value="5"></asp:ListItem>
                        <asp:ListItem Value="6"></asp:ListItem>
                        <asp:ListItem Value="7"></asp:ListItem>
                        <asp:ListItem Value="8"></asp:ListItem>
                        <asp:ListItem Value="9"></asp:ListItem>
                        <asp:ListItem Value="10"></asp:ListItem>
                    </asp:DropDownList>--%>
                    <%--<asp:Button Class="btn btn-dark btn-block" style="width: 60px; margin-left:5px;" ID="btnValorar" runat="server" Text="Ok" />--%>

                </div>
                <br />

                <asp:Label runat="server" Text="Sinopsis:" Font-Bold="true"></asp:Label>
                    <p runat="server" style="background-color:white; padding:5px; color:black; width:300px ;height:120px" ID="PSinopsis">
                        
                    </p>
                <br />

                <div class="row">
                    <div runat="server" style="padding-right:10px; padding-left:20px">
                        <asp:Button class="btn btn-dark btn-block" ID="btnLeer" runat="server" Text="LEER" OnClick="Leer_Click"/>
                    </div>

                    <div runat="server" >
                        <asp:Button class="btn btn-dark btn-block" ID="btnDescargar" runat="server" Text="DESCARGAR" OnClick="Descargar_Click"/>
                    </div>
                </div>
                <br />
            </div>      
                 

</asp:Content>

