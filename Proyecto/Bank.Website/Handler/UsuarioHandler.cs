using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Bank.Website.Handler
{
    public class UsuarioHandler
    {
        protected DBBank_Entities mContexto;

        public UsuarioHandler()
        {
            mContexto = new DBBank_Entities();
        }

        // Retorna usuario con cuyo id es 'pIdUser', en caso de no
        // existir el usuario retorna null
        public Usuario GetUsuario(String pIdUser)
        {
            return mContexto.Usuario.Where(u => u.Id == pIdUser).FirstOrDefault();
        }

        // Retorna todos los usuarios en el sistmea
        public List<Usuario> GetUsuarios()
        {
            return mContexto.Usuario.OrderBy(u => u.Nombre).ToList();
        }

        // Retorna todas las cuentas del usuario 'pIdUser'
        public List<SelectListItem> GetUsuarioCuentas(String pIdUser)
        {
            List<SelectListItem> listItems = new List<SelectListItem>();

            List<Cuenta> listCuentas = this.GetUsuario(pIdUser).Cuentas.ToList();
            listItems = listCuentas.ConvertAll(a =>
            {
                return new SelectListItem()
                {
                    Text = a.TipoCuenta.Nombre + " (" + a.Id + ")",
                    Value = a.Id,
                    Selected = false
                };
            });

            return listItems;
        }


        // Retorna todas las transferencias del usuario 'pIdUser'
        public List<Transferencia> GetUsuarioTransferencias(String pIdUser)
        {
            List<Transferencia> listItem = new List<Transferencia>();

            List<Cuenta> cuentas = mContexto.Usuario.Where(u => u.Id == pIdUser).FirstOrDefault().Cuentas.ToList();
            foreach(Cuenta c in cuentas)
            {
                listItem.AddRange(c.TrxDestino);
            }

            return listItem.OrderByDescending(t => t.Fecha).ToList();
        }
    }
}