using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DataAccessLayer.Interfaces;
using DataAccessLayer.Services;

namespace WebFrontEnd.Controllers
{
    public class ProductController : Controller
    {
        private IProductService productService;
        
        public ActionResult List()
        {

            var products = new ProductService().GetAll();
            return View();
        }                
    }
}