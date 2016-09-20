using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Interfaces
{
    public interface IOrderService
    {
        public void Insert(Order order);
        public void Delete(Order order);

        public void Edit(Order order);

        public IEnumerable<Order> GetAll();

        public Order GetById(int orderID); 
    }
}
