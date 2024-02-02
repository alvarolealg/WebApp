using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace TPFinalNivel3_LealGei.Pages
{
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistrarse_Click(object sender, EventArgs e)
        {
            try
            {
                Trainee user = new Trainee();
                LoginNegocio traineeNegocio = new LoginNegocio();
                EmailService emailService = new EmailService();

                user.Email = txtEmail.Text;
                user.Pass = txtPassword.Text;
                user.Id=traineeNegocio.insertarNuevo(user);
                Session.Add("trainee", user);

                emailService.armarCorreo(user.Email, "Te registraste", "Pedazo de Topu!!!");
                emailService.enviarCorreo();
                Response.Redirect("Default.aspx");
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
            }
        }
    }
}