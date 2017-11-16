<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/AdministrardorMaster.master" AutoEventWireup="true" CodeFile="UsuarioLista.aspx.cs" Inherits="Administrador_UsuarioLista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="row">
        <div class="col-lg-12">            
            
            <h1>LISTA DE USUARIOS</h1>
            
            <asp:GridView ID="GridUsuarios" runat="server" 
                OnRowCommand="GridUsuarios_RowCommand" 
                AutoGenerateColumns =" false"
                CssClass="table"                
                GridLines="None">
                <Columns>
                    <asp:TemplateField HeaderText="Editar">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnEditar" runat="server"
                                CommandName="Editar"
                                CommandArgument='<%# Eval("usuarioId") %>'>
                                <i class="glyphicon glyphicon-pencil"></i>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Eliminar">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnEliminar" runat="server"
                                CommandName="Eliminar"
                                OnClientClick="return confirm('Esta seguro que desea eliminar el Usuario?')"
                                CommandArgument='<%# Eval("usuarioId") %>'>
                                <i class="glyphicon glyphicon-trash"></i>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="Nombre" HeaderText="Nombre"/>
                    <asp:BoundField DataField="Apellido" HeaderText="Apellido"/>
                    <asp:BoundField DataField="Email" HeaderText="Correo Electronico"/>
                </Columns>

            </asp:GridView>

        </div>

    </div>
</asp:Content>

