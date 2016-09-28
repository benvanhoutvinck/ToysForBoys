using DataAccessLayer;
using DataAccessLayer.Services;
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
        private OrderService oService = new OrderService();
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
            Customer cust = (Customer)this.Session["customer"];

            Order order = new Order();
         
            order.customerId = cust.id;
            order.orderDate = DateTime.Now;
            order.requiredDate = DateTime.Now;
            order.status = "PROCESSING";

            foreach (OrderViewModel vm in cart.orders)
            {
                
                Orderdetail detail = new Orderdetail();

                detail.product = vm.Product;
                detail.productId = vm.Product.id;
                detail.quantityOrdered = vm.Aantal;
                detail.priceEach = vm.Product.buyPrice;

                order.orderdetails.Add(detail);

            }
            oService.Insert(order);
            this.Session["cart"] = null;

            return View();
        }

    }
}