using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Data;

namespace WPFToysForBoys.Model
{
    public class OrderStat: Order
    {
        public decimal revenue { get; set; }
        public string brush { get; set; }

        public OrderStat() { }

        public OrderStat(Order o)
        {
            if (o != null)
            {
                this.id = o.id;
                this.customerId = o.customerId;
                this.orderDate = o.orderDate;
                this.requiredDate = o.requiredDate;
                this.shippedDate = o.shippedDate;
                this.status = o.status;
                this.customer = o.customer;
                this.orderdetails = o.orderdetails;
                CalcRevenue();
            }
        }

        public void SetNavProp(Customer c, List<Orderdetail> od)
        {
            this.customer = c;
            this.orderdetails = od;
        }

        public void CalcRevenue()
        {
            revenue = 0;
            if (orderdetails != null)
                if (orderdetails.Count > 0)
                    foreach (Orderdetail od in orderdetails)
                        revenue += od.quantityOrdered.Value * od.priceEach.Value;

            if (this.status != "CANCELLED")
                this.brush = "Black";
            else
                this.brush = "Red";
        }
    }

    public class DateSort
    {
        public string display { get; set; }
        public SortDateEnum? value { get; set; }
    }

    public class OrderStatCustomer
    {
        public int? id { get; set; }
        public string name { get; set; }

        public OrderStatCustomer(int? id, string name)
        {
            this.id = id;
            this.name = name;
        }
        public OrderStatCustomer(Customer c)
        {
            this.id = c.id;
            this.name = c.name;
        }
    }
}
