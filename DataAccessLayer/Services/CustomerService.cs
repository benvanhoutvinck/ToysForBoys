using DataAccessLayer.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Services
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
            
            using (var entities = new toysforboysEntities())
            {
                var originalCustomer = entities.customers.Find(customer.id);
                originalCustomer.name = customer.name;
                originalCustomer.streetAndNumber = customer.streetAndNumber;
                originalCustomer.city = customer.city;
                originalCustomer.state = customer.state;
                originalCustomer.postalCode = customer.postalCode;
                originalCustomer.countryId = customer.countryId;
                entities.SaveChanges();
            }
        }

        public IEnumerable<Customer> GetAll()
        {
            List<Customer> AllCustomers = new List<Customer>();
            using (var entities = new toysforboysEntities())
            {
                foreach (var customer in entities.customers)
                {
                    AllCustomers.Add(customer);
                }
            }

            return AllCustomers;
        }

        public Customer GetById(int customerID)
        {
            using (var entities = new toysforboysEntities())
            {
                var query = (from customer in entities.customers
                            where customer.id == customerID
                            orderby customer.id
                            select customer).First();

                return query;
            }
        }
    }
}
