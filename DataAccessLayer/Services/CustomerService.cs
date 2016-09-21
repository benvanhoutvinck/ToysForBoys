using DataAccessLayer.Interfaces;
using System;
using System.Collections.Generic;
using System.Data.Entity;
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
                if(customer.name!=string.Empty)
                    originalCustomer.name = customer.name;

                if(customer.streetAndNumber!=string.Empty)
                    originalCustomer.streetAndNumber = customer.streetAndNumber;

                if(customer.city!=string.Empty)
                    originalCustomer.city = customer.city;

                if(customer.state!=string.Empty)
                    originalCustomer.state = customer.state;

                if(customer.postalCode!=string.Empty)
                    originalCustomer.postalCode = customer.postalCode;

                if(customer.countryId!=null)
                    originalCustomer.countryId = customer.countryId;

                entities.SaveChanges();
            }
        }

        public IEnumerable<Customer> GetAll()
        {
            return GetAll(string.Empty);
        }

        public Customer GetById(int customerID)
        {
            return GetById(customerID, string.Empty);
        }

        public Customer LoginVerification(string naam, string postcode)
        {
            using (var entities = new toysforboysEntities())
            {
                var query = (from customer in entities.customers
                             where customer.name == naam &&
                             customer.postalCode == postcode
                             select customer).FirstOrDefault();

                return query;
            }

        }


        public IEnumerable<Customer> GetAll(string includes)
        {
            return GetAll(c => true, includes);
        }

        public Customer GetById(int customerID, string includes)
        {
            using (var entities = new toysforboysEntities())
            {
                var query = (from customer in entities.customers
                             where customer.id == customerID
                             orderby customer.id
                             select customer).Include(includes).First();

                return query;
            }
        }


        public IEnumerable<Customer> GetAll(Func<Customer, bool> predicate, string includes)
        {
            List<Customer> AllCustomers = new List<Customer>();
            using (var entities = new toysforboysEntities())
            {
                
                foreach (var customer in ((DbSet) entities.customers.Where(predicate)).Include(includes))
                {
                    AllCustomers.Add((Customer) customer);
                }
            }

            return AllCustomers;
        }
    }
}
