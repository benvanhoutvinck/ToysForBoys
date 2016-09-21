using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Interfaces
{
    public interface IOrderService
    {
        void Insert(Order order);
        void Delete(Order order);

        void Edit(Order order);

        IEnumerable<Order> GetAll();

        Order GetById(int orderID);

        IEnumerable<Orderdetail> GetOrderDetails(Order order);

        decimal GetTotalPrice(Order order);

        
        
    }
}
