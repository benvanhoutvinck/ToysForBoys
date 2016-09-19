using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    interface IOrderService
    {
        void Insert(Order order);
        void Delete(Order order);

        void Edit(Order order);

        IEnumerable<Order> GetAll();

        Order GetById(int orderID); 
    }
}
