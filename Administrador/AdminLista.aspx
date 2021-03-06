﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/AdministrardorMaster.master" AutoEventWireup="true" CodeFile="AdminLista.aspx.cs" Inherits="Administrador_AdminLista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="row">
        <div class="col-lg-12">            
            
            <h1>LISTA DE ADMINISTRADORES</h1>
            <asp:HyperLink  runat="server" NavigateUrl="~/Administrador/AdminRegistrar.aspx">Agregar Nuevo Administrador</asp:HyperLink>
            
            <asp:GridView ID="GridUsuarios" runat="server" 
                OnRowCommand="GridUsuarios_RowCommand" 
                AutoGenerateColumns =" false"
                CssClass="table"                
                GridLines="None">

                <Columns>

                    <asp:BoundField DataField="usuarioId" HeaderText="Codigo"/>
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre"/>
                    <asp:BoundField DataField="Apellido" HeaderText="Apellido"/>
                    <asp:BoundField DataField="email" HeaderText="Correo Electronico"/>

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
                    
                </Columns>

            </asp:GridView>

        </div>

    </div>

</asp:Content>

