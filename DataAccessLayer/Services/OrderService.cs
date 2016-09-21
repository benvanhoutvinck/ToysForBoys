using DataAccessLayer.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Services
{
    public class OrderService : IOrderService
    {
        public void Insert(Order order)
        {
            using (var entities = new toysforboysEntities())
            {
                entities.orders.Add(order);
                entities.SaveChanges();
            }
        }

        public void Delete(Order order)
        {
            using (var entities = new toysforboysEntities())
            {
                entities.orders.Remove(order);
                entities.SaveChanges();
            }
        }

        public void Edit(Order order)
        {

            using (var entities = new toysforboysEntities())
            {
                var originalOrder = entities.orders.Find(order.id);
                originalOrder.orderDate = order.orderDate;
                originalOrder.requiredDate = order.requiredDate;
                originalOrder.shippedDate = order.shippedDate;
                originalOrder.comments = order.comments;
                originalOrder.customerId = order.customerId;
                originalOrder.status = order.status;
                entities.SaveChanges();
            }
        }

        public IEnumerable<Order> GetAll()
        {
            List<Order> AllOrders = new List<Order>();
            using (var entities = new toysforboysEntities())
            {
                foreach (var order in entities.orders)
                {
                    AllOrders.Add(order);
                }
            }

            return AllOrders;
        }

        public Order GetById(int orderID)
        {
            using (var entities = new toysforboysEntities())
            {
                var query = (from order in entities.orders
                             where order.id == orderID
                             orderby order.id
                             select order).First();

                return query;
            }
        }

        public IEnumerable<Orderdetail> GetOrderDetails(Order order)
        {
            var orderdetails = new List<Orderdetail>();

            using (var entities = new toysforboysEntities())
            {
                foreach (var od in entities.orderdetails)
                {
                    if (order.id==od.orderId)
                    {
                        orderdetails.Add(od);
                    }
                }
            }

            return orderdetails;
        }

        public decimal GetTotalPrice(Order order)
        {
           var orderdetails = GetOrderDetails(order);
            decimal totalPrice = 0;

            foreach (var od in orderdetails)
            {
                totalPrice +=(decimal)(od.quantityOrdered * od.priceEach);
            }

            return totalPrice;
        }

        

      


    }
}
