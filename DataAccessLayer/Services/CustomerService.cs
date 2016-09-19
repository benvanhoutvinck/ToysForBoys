using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class CustomerService : ICustomerService
    {

        public void Insert(Customer customer)
        {
            using (var entities = new toysforboysEntities())
            {
                entities.customers.Add(customer);
                entities.SaveChanges();
            }
        }

        public void Delete(Customer customer)
        {
            using (var entities = new toysforboysEntities())
            {
                entities.customers.Remove(customer);
                entities.SaveChanges();
            }
        }

        public void Edit(Customer customer)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Customer> GetAll()
        {
            throw new NotImplementedException();
        }

        public Customer GetById(int customerID)
        {
            throw new NotImplementedException();
        }
    }
}
