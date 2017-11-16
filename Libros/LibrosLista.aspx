<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/AdministrardorMaster.master" AutoEventWireup="true" CodeFile="LibrosLista.aspx.cs" Inherits="Libros_LibrosLista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-lg-12">            
            
            <h1>LISTA DE LIBROS</h1>
            <asp:HyperLink  runat="server" NavigateUrl="~/Libros/LibrosFormulario.aspx">Agregar Nuevo Libros</asp:HyperLink>
            
            <asp:GridView ID="GridLibros" runat="server" 
                OnRowCommand="GridLibros_RowCommand" 
                AutoGenerateColumns =" false"
                CssClass="table"                
                GridLines="None">

                <Columns>                 



                  <asp:TemplateField HeaderText="Eliminar">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnEliminar" runat="server"
                                CommandName="Eliminar"
                                OnClientClick="return confirm('Esta seguro que desea eliminar el Libro?')"
                                CommandArgument='<%# Eval("LibrosId") %>'>
                                <i class="glyphicon glyphicon-trash"></i>
                            </asp:LinkButton>                           
                        </ItemTemplate>
                    </asp:TemplateField>

                   <asp:BoundField DataField="librosId" HeaderText="Libro Id" />
                   <asp:BoundField DataField="autorId" HeaderText="Autor" />
                   <asp:BoundField DataField="categoriaId" HeaderText="Categoria" />         
                   <asp:BoundField DataField="titulo" HeaderText="Titulo" />  
                   <asp:ImageField DataImageUrlField="Portada" HeaderText="portada" ControlStyle-Width="60px"></asp:ImageField>               
                   <asp:BoundField DataField="sinopsis" HeaderText="Sinapsis" />   
                   <asp:BoundField DataField="valoracion" HeaderText="Valoracion" />    
                </Columns> 
             </asp:GridView>
                    
                      <%-- <ItemTemplate>
                                <asp:LinkButton ID="EditButton" runat="server"
                                    CommandName="Editar"
                                    CommandArgument='<%# Eval("PeliculaId") %>'>
                                <i class="glyphicon glyphicon-pencil"></i>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>--%>        
        </div>
    </div>
</asp:Content>

