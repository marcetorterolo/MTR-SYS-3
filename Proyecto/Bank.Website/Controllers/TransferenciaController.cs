using Bank.Website.Handler;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Bank.Website.Controllers
{
    public class TransferenciaController : Controller
    {
        private UsuarioHandler usuarioHandler;
        private TransferenciaHandler transferenciaHandler;
        private CuentaHandler cuentaHandler;

        public TransferenciaController()
        {
            usuarioHandler = new UsuarioHandler();
            transferenciaHandler = new TransferenciaHandler();
            cuentaHandler = new CuentaHandler();
        }

        public ActionResult Transferir(String pIdUser)
        {
            ViewBag.accounts = usuarioHandler.GetUsuarioCuentas(pIdUser);
            Transferencia model = new Transferencia()
            {
                IdUsuario = Convert.ToInt32(pIdUser),
                NombreUsuario = usuarioHandler.GetUsuario(pIdUser).Nombre
            };
            return View(model);
        }

        [HttpPost]
        public ActionResult Transferir(Transferencia pModel)
        {
            ViewBag.accounts = usuarioHandler.GetUsuarioCuentas(pModel.IdUsuario.ToString());

            if (ModelState.IsValid)
            {
                if (String.Equals(pModel.CuentaIdOrigen, pModel.CuentaIdDestino))
                {
                    pModel.ErrorCode = -1;
                    pModel.ErrorMessage = "Las cuentas deben ser distintas";
                }
                else
                {
                    Cuenta cuentaOrigen = cuentaHandler.GetCuenta(pModel.CuentaIdOrigen);
                    Cuenta cuentaDestino = cuentaHandler.GetCuenta(pModel.CuentaIdDestino);

                    if (cuentaOrigen.TipoId == cuentaDestino.TipoId)
                    {
                        if (cuentaOrigen.Saldo > pModel.Monto)
                        {
                            cuentaHandler.ActualizarMontoCuenta(pModel.CuentaIdOrigen, pModel.Monto * (-1));
                            cuentaHandler.ActualizarMontoCuenta(pModel.CuentaIdDestino, pModel.Monto);
                            transferenciaHandler.AgregarTransferencia(pModel);

                            pModel.ErrorCode = 1;
                            pModel.ErrorMessage = "Transferencia realizada con éxito";
                        }
                        else
                        {
                            pModel.ErrorCode = -1;
                            pModel.ErrorMessage = "Saldo insuficiente";
                        }
                    }
                    else
                    {
                        pModel.ErrorCode = -1;
                        pModel.ErrorMessage = "No se permite transferencias entre cuentas de distinto tipo";
                    }
                }
            }
            return View(pModel);
        }

        public ActionResult Historico(String pIdUser)
        {
            return View(usuarioHandler.GetUsuarioTransferencias(pIdUser));
        }
    }
}