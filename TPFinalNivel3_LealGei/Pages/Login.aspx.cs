using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPFinalNivel3_LealGei.Pages
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Trainee trainee = new Trainee();
            LoginNegocio negocio = new LoginNegocio();
            try
            {

                if (Validacion.validaTextoVacio(txtEmail) || Validacion.validaTextoVacio(txtPassword))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Popup", "openPopup('Debes completar ambos campos');", true);
                    return;
                }

                trainee.Email = txtEmail.Text;
                trainee.Pass = txtPassword.Text;

                if (negocio.Login(trainee))
                {
                    Session.Add("trainee", trainee);
                    Response.Redirect("MiPerfil.aspx", false);
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Popup", "openPopup('Usuario o contraseña incorrectos');", true);
                }
            }
            catch (System.Threading.ThreadAbortException ex) { }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
                throw;
            }
        }
        private void Page_Error(object sender, EventArgs e)
        {
            Exception exc = Server.GetLastError();

            Session.Add("error", exc.ToString());
            Server.Transfer("Error.aspx");
        }
    }
}