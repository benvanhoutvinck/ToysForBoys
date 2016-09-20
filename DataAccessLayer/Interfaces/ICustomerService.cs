using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Interfaces
{
    public interface ICustomerService
    {
        public void Insert(Customer customer);
        public void Delete(Customer customer);

        public void Edit(Customer customer);

        public IEnumerable<Customer> GetAll();

        public Customer GetById(int customerID); 
    }
}
