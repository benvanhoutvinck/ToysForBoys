using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebFrontEnd.Models
{
    public class ShoppingCart
    {
        public List<OrderViewModel> orders { get; set; }

        public ShoppingCart()
        {
            this.orders = new List<OrderViewModel>();
        }
       
    }
}