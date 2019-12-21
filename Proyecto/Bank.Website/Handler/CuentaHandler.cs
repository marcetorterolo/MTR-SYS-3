using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace Bank.Website.Handler
{
    public class CuentaHandler
    {
        protected DBBank_Entities mContexto;

        public CuentaHandler()
        {
            mContexto = new DBBank_Entities();
        }

        // Retorna cuenta con cuyo id es 'pIdAccount', en caso de no
        // existir la cuenta retorna null
        public Cuenta GetCuenta(String pIdAccount)
        {
            return mContexto.Cuenta.Where(c => c.Id == pIdAccount).FirstOrDefault();
        }

        // Actualiza el monto de la cuenta
        public void ActualizarMontoCuenta(String pIdAccount, Int32 Monto)
        {
            Cuenta cuenta = mContexto.Cuenta.SingleOrDefault(c => c.Id == pIdAccount);
            if (cuenta != null)
            {
                cuenta.Saldo += Monto;
                mContexto.SaveChanges();
            }
        }

        // Retorna todas las cuentas del usuario 'pIdUser'
        public List<Cuenta> GetCuentasUsuario(String pIdUser)
        {
            return mContexto.Cuenta.Where(c => c.UsuarioId == pIdUser).ToList();
        }
    }
}