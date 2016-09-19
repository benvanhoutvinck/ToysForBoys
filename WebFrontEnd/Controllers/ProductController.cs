using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DataAccessLayer.Interfaces;

namespace WebFrontEnd.Controllers
{
    public class ProductController : Controller
    {
        private IProductlineService plService;
        // GET: Product
        public ActionResult Index()
        {

            return View();
        }

        public ActionResult SelectGenre(int genreId)
        {
            return View();

        }
    }
}