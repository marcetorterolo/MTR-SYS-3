using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Bank.Website.Handler
{
    public class TransferenciaHandler
    {
        protected DBBank_Entities mContexto;

        public TransferenciaHandler()
        {
            mContexto = new DBBank_Entities();
        }

        public void AgregarTransferencia(Transferencia pModel)
        {
            pModel.Fecha = DateTime.Now;
            mContexto.Transferencia.Add(pModel);
            mContexto.SaveChanges();
        }
    }
}