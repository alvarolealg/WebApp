<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="DetalleArticulo.aspx.cs" Inherits="TPFinalNivel3_LealGei.DetalleArticulo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            margin-top: 40px;
        }

        .header {
            margin-bottom: 20px;
        }

        img#ContentPlaceHolder1_imgFoto {
            max-width: 100%;
            max-height:400px;
            margin-bottom:20px;
            object-fit:contain;
        }

        #lblDescripcion {
            max-width: 50%;
            margin-left: auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="header">
            <h1>
                <asp:Label Text="" ID="lblNombre" runat="server" />
            </h1>
            <asp:Image ID="imgFoto" runat="server" />
        </div>
        <div>
            <p>
                <asp:Label Text="" ID="lblDescripcion" runat="server" />
            </p>
        </div>
    </div>
</asp:Content>
