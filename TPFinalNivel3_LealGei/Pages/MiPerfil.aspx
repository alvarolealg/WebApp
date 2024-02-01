<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="MiPerfil.aspx.cs" Inherits="TPFinalNivel3_LealGei.Pages.MiPerfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        function validar() {
            const txtApellido = document.getElementById("txtApellido");
            const txtNombre = document.getElementById("txtNombre");
            const regex = /^[a-zA-ZáéíóúÁÉÍÓÚ\s]+$/; // Expresión regular para letras y espacios

            if (txtApellido.value.trim() === "") {
                txtApellido.classList.remove("is-valid");
                txtApellido.classList.add("is-invalid");
            } else {
                txtApellido.classList.remove("is-invalid");
                txtApellido.classList.add("is-valid");
            }

            if (txtNombre.value.trim() === "") {
                txtNombre.classList.remove("is-valid");
                txtNombre.classList.add("is-invalid");
            } else {
                txtNombre.classList.remove("is-invalid");
                txtNombre.classList.add("is-valid");
            }

            if (!regex.test(txtApellido.value)) {
                txtApellido.classList.remove("is-valid");
                txtApellido.classList.add("is-invalid");
            }

            if (!regex.test(txtNombre.value)) {
                txtNombre.classList.remove("is-valid");
                txtNombre.classList.add("is-invalid");
            }

            return txtApellido.classList.contains("is-valid") && txtNombre.classList.contains("is-valid");
        }
    </script>

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h2>Mi Perfil</h2>
    <div class="row">
        <div class="col-md-4">
            <div class="mb-3">
                <asp:Label Text="Email" CssClass="form-label" runat="server" />
                <asp:TextBox runat="server" CssClass="form-control" ID="txtEmail" />
            </div>
            <div class="mb-3">
                <asp:Label Text="Nombre" CssClass="form-label" runat="server" />
                <asp:TextBox runat="server" CssClass="form-control" ClientIDMode="Static" ID="txtNombre" />
                <asp:RegularExpressionValidator ErrorMessage="El nombre debe contener solo letras y espacios" ID="regexNombre" ControlToValidate="txtNombre" ValidationExpression="^[a-zA-ZáéíóúÁÉÍÓÚ\s]+$" runat="server" />
            </div>
            <div class="mb-3">
                <asp:Label Text="Apellido" CssClass="form-label" runat="server" />
                <asp:TextBox runat="server" ID="txtApellido" ClientIDMode="Static" CssClass="form-control" MaxLength="8" />
                <asp:RegularExpressionValidator ErrorMessage="El nombre debe contener solo letras y espacios" ID="regexApellido" ControlToValidate="txtApellido" ValidationExpression="^[a-zA-ZáéíóúÁÉÍÓÚ\s]+$" runat="server" />
            </div>

        </div>
        <div class="col-md-4">
            <div class="mb-3">
                <asp:Label Text="Imagen Perfil" CssClass="form-label" runat="server" />
                <input type="file" id="txtImagen" runat="server" class="form-control" />
            </div>
            <asp:Image ImageUrl="https://www.palomacornejo.com/wp-content/uploads/2021/08/no-image.jpg" ID="imgNuevoPerfil" runat="server" CssClass="img-fluid mb-3" />
        </div>
    </div>

    <div class="row">
        <div class="col-md-4">
            <asp:Button Text="Guardar" CssClass="btn btn-primary" ID="btnGuardar" OnClick="btnGuardar_Click" OnClientClick="return validar()" runat="server" />
            <a href="#">Regresar</a>
        </div>
    </div>

</asp:Content>
