using DataAccessLayer.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Services
{
    public class OrderdetailService : IOrderdetailsService
    {
        public void Insert(Orderdetail orderdetail)
        {
            using (var entities = new toysforboysEntities())
            {
                entities.orderdetails.Add(orderdetail);
                entities.SaveChanges();
            }
        }

        public void Delete(Orderdetail orderdetail)
        {
            using (var entities = new toysforboysEntities())
            {
                entities.orderdetails.Remove(orderdetail);
                entities.SaveChanges();
            }
        }

        public void Edit(Orderdetail orderdetail)
        {

            using (var entities = new toysforboysEntities())
            {
                var originalOrderdetail = entities.orderdetails.Find(orderdetail.orderId);
                originalOrderdetail.productId = orderdetail.productId;
                originalOrderdetail.quantityOrdered = orderdetail.quantityOrdered;
                originalOrderdetail.priceEach = orderdetail.priceEach;
                entities.SaveChanges();
            }
        }

        public IEnumerable<Orderdetail> GetAll()
        {
            List<Orderdetail> AllOrderdetails = new List<Orderdetail>();
            using (var entities = new toysforboysEntities())
            {
                foreach (var orderdetail in entities.orderdetails)
                {
                    AllOrderdetails.Add(orderdetail);
                }
            }

            return AllOrderdetails;
        }

        public Orderdetail GetById(int orderdetailID, int productID)
        {
            using (var entities = new toysforboysEntities())
            {
                var query = (from orderdetail in entities.orderdetails
                             where orderdetail.orderId == orderdetailID && orderdetail.productId == productID
                             orderby orderdetail.orderId
                             select orderdetail).First();

                return query;
            }
        }
    }
}
