using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace negocio
{
    public class LoginNegocio
    {
        public int insertarNuevo(Trainee nuevo)
        {
            AccesoDatos datos=new AccesoDatos();
            try
            {
                datos.setearProcedimiento("insertarNuevo");
                datos.setParametros("@email", nuevo.Email);
                datos.setParametros("@pass", nuevo.Pass);
                return datos.ejecutarAccionScalar();
            }
            catch (Exception ex)
            {

                throw;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
        public void actualizar(Trainee user)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setConsulta("Update USERS set urlImagenPerfil = @imagen, Nombre = @nombre, Apellido = @apellido Where id = @id");
                datos.setParametros("@imagen", (object)user.ImagenPerfil ?? DBNull.Value);
                datos.setParametros("@nombre", user.Nombre);
                datos.setParametros("@apellido", user.Apellido);
                datos.setParametros("@id", user.Id);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
        public bool Login(Trainee login)
        {
            AccesoDatos datos=new AccesoDatos();
            try
            {
                datos.setConsulta("select id, email, pass, admin, urlImagenPerfil, nombre, apellido from users where email=@email and pass = @pass");
                datos.setParametros("@email", login.Email);
                datos.setParametros("@pass", login.Pass);
                datos.ejecutarLectura();
                if (datos.Lector.Read())
                {
                    login.Id = (int)datos.Lector["id"];
                    login.Admin = (bool)datos.Lector["admin"];
                    if (!(datos.Lector["urlImagenPerfil"] is DBNull))
                        login.ImagenPerfil = (string)datos.Lector["urlImagenPerfil"];
                    if (!(datos.Lector["nombre"] is DBNull))
                        login.Nombre = (string)datos.Lector["nombre"];
                    if (!(datos.Lector["apellido"] is DBNull))
                        login.Apellido = (string)datos.Lector["apellido"];
                    return true;
                }
                return false;   
            }
            catch (Exception ex)
            {

                throw;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
       
    }
}
