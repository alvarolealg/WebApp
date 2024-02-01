using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPFinalNivel3_LealGei
{
    public partial class DetalleArticulo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    int articuloId;
                    if (int.TryParse(Request.QueryString["id"], out articuloId))
                    {
                        CargarDetalleArticulo(articuloId);
                    }
                    else
                        Response.Write("Id de artiuclo no valido");
                }
                else
                {
                    Response.Write("Parametro id no encontrado en la URL");
                }
            }


        }
        private void CargarDetalleArticulo(int articuloId)
        {
            AccesoDatos datos = new AccesoDatos();
            Articulo articulo = new Articulo();
            try
            {


                datos.setConsulta("select id, nombre, imagenUrl, descripcion from articulos where id=@id");
                datos.setParametros("@id", articuloId);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    lblNombre.Text = datos.Lector["Nombre"].ToString();
                    imgFoto.ImageUrl = datos.Lector["ImagenUrl"].ToString();
                    lblDescripcion.Text = datos.Lector["Descripcion"].ToString();
                }
                else
                    Response.Write("No se encontro el articulo");
                datos.cerrarConexion();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
    }
}