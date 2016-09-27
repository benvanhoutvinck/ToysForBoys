using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer.Interfaces;
using DataAccessLayer.Services;
using DataAccessLayer.Queries;
using System.Data.SqlClient;

namespace DataAccessLayer
{
    public class CustomerStatisticService : ICustomerStatisticService
    {
        public List<Customer> GetCustomerPerCity(string city)
        {
            var service = new CustomerService();
            var customers = service.GetAll();
            var customersByCity = new List<Customer>();

            foreach (var customer in customers)
            {
                if (customer.city == city)
                {
                    customersByCity.Add(customer);
                }
            }
            return customersByCity;
        }

        public List<Customer> GetCustomerPerPostalCode(string postalCode)
        {
            var service = new CustomerService();
            var customers = service.GetAll();
            var customersByPostal = new List<Customer>();

            foreach (var customer in customers)
            {
                if (customer.postalCode == postalCode)
                {
                    customersByPostal.Add(customer);
                }
            }
            return customersByPostal;
        }

        public List<Customer> GetCustomerPerState(string state)
        {
            var service = new CustomerService();
            var customers = service.GetAll();
            var customersByState = new List<Customer>();

            foreach (var customer in customers)
            {
                if (customer.state == state)
                {
                    customersByState.Add(customer);
                }
            }
            return customersByState;
        }

        public List<Customer> GetCustomersPerCountry(int countryId)
        {
            var service = new CustomerService();
            var customers = service.GetAll();
            var customersByCountry = new List<Customer>();

            foreach (var customer in customers)
            {
                if (customer.countryId == countryId)
                {
                    customersByCountry.Add(customer);
                }
            }
            return customersByCountry;
        }

        public List<Customer> GetCustomerStatistics(CustomerQuery customerQuery)
        {
            using (var entities = new toysforboysEntities())
            {
                var query = entities.customers.Where(c=>true);
                if (customerQuery.State != string.Empty)
                {
                    query = query.Where(c=>c.state==customerQuery.State);
                }

                if (customerQuery.City != string.Empty)
                {
                    query = query.Where(c=>c.city==customerQuery.City);
                }

                if (customerQuery.PostalCode != string.Empty)
                {
                    query = query.Where(c => c.postalCode == customerQuery.PostalCode);
                }

                if (customerQuery.CountryId != null)
                {
                    query = query.Where(c => c.countryId == customerQuery.CountryId);
                }

                return query.ToList();
            }          
        }
    }
}
