using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Bank.Website.Handler;

namespace Bank.Website.Controllers
{
    public class HomeController : Controller
    {
        private UsuarioHandler userHandler;

        public HomeController()
        {
            userHandler = new UsuarioHandler();
        }

        public ActionResult _Index()
        {
            return PartialView(userHandler.GetUsuarios().ToList());
        }

        public ActionResult Index()
        {
            return View();
        }              
    }
}