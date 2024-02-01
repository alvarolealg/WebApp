<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TPFinalNivel3_LealGei.Pages.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .popup {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.4);
        }

        .popup-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-width: 400px; /* Ancho máximo del popup */
            border-radius: 8px;
        }

        .popup-header {
            padding-bottom: 10px;
            border-bottom: 1px solid #ccc;
        }

            .popup-header h2 {
                margin: 0;
                font-size: 1.2em;
            }

        .popup-body {
            padding: 10px 0;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }

            .close:hover,
            .close:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }
    </style>
    <script>
        function openPopup(message) {
            document.getElementById("errorMessage").innerText = message;
            document.getElementById("popupError").style.display = "block";
        }

        function closePopup() {
            document.getElementById("popupError").style.display = "none";
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <div class="col-4">
            <h2>Login</h2>
            <div class="mb-3">
                <asp:Label Text="Email" CssClass="form-label" runat="server" />
                <asp:TextBox runat="server" CssClass="form-control" ID="txtEmail" />
            </div>
            <div class="mb-3">
                <asp:Label Text="Password" CssClass="form-label" runat="server" />
                <asp:TextBox runat="server" CssClass="form-control" ID="txtPassword" TextMode="Password" />
            </div>
            <asp:Button Text="Ingresar" CssClass="btn btn-primary" ID="btnLogin" OnClick="btnLogin_Click" runat="server" />
            <a href="Registro.aspx">No tenes cuenta? Registrate!</a>
        </div>
        <div id="popupError" class="popup">
            <div class="popup-content">
                <div class="popup-header">
                    <span class="close" onclick="closePopup()">&times;</span>
                    <h2>Error</h2>
                </div>
                <div class="popup-body">
                    <p id="errorMessage" class="error-message"></p>
                </div>
            </div>
        </div>

    </div>

</asp:Content>
