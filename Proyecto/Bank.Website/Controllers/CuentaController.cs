using Bank.Website.Handler;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Bank.Website.Controllers
{
    public class CuentaController : Controller
    {
        private CuentaHandler cuentaHandler;

        public CuentaController()
        {
            cuentaHandler = new CuentaHandler();
        }

        public ActionResult Cuentas(String pIdUser)
        {
            return View(cuentaHandler.GetCuentasUsuario(pIdUser));
        }
    }
}