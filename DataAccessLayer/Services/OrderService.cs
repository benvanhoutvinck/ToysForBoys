using DataAccessLayer.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;

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

        public IEnumerable<Order> GetAll(string includes)
        {
            return GetAll(p => true, includes);
        }

        public IEnumerable<Order> GetAll(Func<Order, bool> predicate, string includes)
        {
            List<Order> Allorders = new List<Order>();
            using (var entities = new toysforboysEntities())
            {
                foreach (var order in (String.IsNullOrEmpty(includes) ? entities.orders : entities.orders.Include(includes)).Where(predicate))
                {
                    Allorders.Add((Order)order);
                }
            }

            return Allorders;
        }

        public Order GetById(int orderID)
        {
            return GetById(orderID, string.Empty);
        }

        public Order GetById(int orderID, string includes)
        {
            using (var entities = new toysforboysEntities())
            {
                var query = (from order in entities.orders
                             where order.id == orderID
                             orderby order.id
                             select order).Include(includes).First();

                return query;
            }
        }
    }
}
