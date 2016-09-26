using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebFrontEnd.Views.Checkout
{
    public class CheckoutController : Controller
    {
        // GET: Checkout
        public ActionResult ViewCart()
        {
            return View();
        }
    }
}