using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebFrontEnd.Models;

namespace WebFrontEnd.Views.Checkout
{
    public class CheckoutController : Controller
    {
        // GET: Checkout
        public ActionResult ViewCart()
        {
            if (this.Session["cart"] != null)
            {
                return View(((ShoppingCart)this.Session["cart"]).orders);
            }
            else
            {
                return View();
            }
        }

        public ActionResult RemoveFromCart(int id)
        {
            RemoveOrderFromCart(id);
            return RedirectToAction("ViewCart");
        }

        private void RemoveOrderFromCart(int productId)
        {
            ShoppingCart cart = (ShoppingCart)this.Session["cart"];

            foreach (OrderViewModel order in cart.orders)
            {
                if (order.Product.id == productId)
                {
                    cart.orders.Remove(order);
                    break;
                }
            }

            this.Session["cart"] = cart;
        }

        public ActionResult RefreshCart(string button, List<OrderViewModel> orders)
        {
            ShoppingCart cart = (ShoppingCart)this.Session["cart"];

            if (cart != null)
            {

                for (int i = 0; i < orders.Count(); i++)
                {
                    cart.orders[i].Aantal = orders[i].Aantal;
                }

                this.Session["cart"] = cart;

                if (button == "refresh")
                    return RedirectToAction("ViewCart");
                else
                    return RedirectToAction("Checkout");
            }
            else
            {
                return RedirectToAction("ViewCart");
            }
        }

        public ActionResult Checkout()
        {
            if (this.Session["customer"] == null)
            {
                return RedirectToAction("Login", "Account", new { returnUrl = "Checkout/Checkout" });
            }

            ShoppingCart cart = (ShoppingCart)this.Session["cart"];

            foreach (OrderViewModel vm in cart.orders)
            {
                Order order = new Order();
                order.customer = (Customer)this.Session["customer"];

            }
            return View();
        }

    }
}