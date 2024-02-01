<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="TPFinalNivel3_LealGei.Pages.Registro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .validacion{
            color:red;
            font-size:15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-4">
            <h2>Registrate</h2>
            <div class="mb-3">
                <asp:Label Text="Email" CssClass="form-label" runat="server" />
                <asp:TextBox runat="server" CssClass="form-control" ID="txtEmail" />
                <asp:RegularExpressionValidator ErrorMessage="Ingresa Correctamente el Email" ControlToValidate="txtEmail" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" runat="server" />
                <div class="mb-3">
                    <asp:Label Text="Contraseña:" CssClass="form-label" runat="server" />
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtPassword" TextMode="Password" />
                </div>
                <asp:Button Text="Registrarse" CssClass="btn btn-primary"  ID="btnRegistrarse" OnClick="btnRegistrarse_Click" runat="server" />
                <a href="#">Cancelar</a>
            </div>
        </div>
    </div>
</asp:Content>
