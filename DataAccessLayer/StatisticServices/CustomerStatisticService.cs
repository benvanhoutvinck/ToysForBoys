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

        //public List<Customer> GetCustomerStatistics(CustomerQuery customerQuery)
        //{

        //    var queryString = new StringBuilder();
        //    queryString.Append("from customer in entities.customers where ");

        //    //checken of state is ingevuld 
        //    bool stateUsed = false;
        //    if (customerQuery.State != string.Empty)
        //    {
        //        queryString.Append("customer.state == " + customerQuery.State+" ");
        //        stateUsed = true;
        //    }
        //    bool cityUsed = false;

        //    if(customerQuery.City != string.Empty)
        //    {
        //        if (stateUsed)
        //        {
        //            queryString.Append("&& ");
        //        }
        //        queryString.Append("customer.city == " + customerQuery.City + " ");
        //        cityUsed = true;

        //    }

        //    bool postalCodeUsed = false;
        //    if(customerQuery.PostalCode != string.Empty)
        //    {
        //        if(cityUsed || stateUsed)
        //        {
        //            queryString.Append("&& ");
        //        }
        //        queryString.Append("customer.postalCode == " + customerQuery.PostalCode + " ");
        //        postalCodeUsed = true;
        //    }
        //    if (customerQuery.CountryId != null)
        //    {
        //        if(cityUsed || stateUsed || postalCodeUsed)
        //        {
        //            queryString.Append("&& ");
        //        }
        //        queryString.Append("customer.countryId == " + customerQuery.CountryId + " ");
        //    }
        //    queryString.Append("select customer");

        //    using(var entities = new toysforboysEntities())
        //    {
        //        var cmd = new SqlCommand(queryString.ToString());
        //        var customers = new List<Customer>();
        //        using (SqlDataReader reader = cmd.ExecuteReader())
        //        {
        //            Int32 IdPos = reader.GetOrdinal("id");
        //            Int32 namePos = reader.GetOrdinal("name");
        //            Int32 sanPos = reader.GetOrdinal("streetAndNumber");
        //            Int32 cityPos = reader.GetOrdinal("city");
        //            Int32 statePos = reader.GetOrdinal("state");
        //            Int32 pcPos = reader.GetOrdinal("postalCode");
        //            Int32 countryIdPos = reader.GetOrdinal("countryId");
        //            Int32 passPos = reader.GetOrdinal("password");
        //            Int32 emailPos = reader.GetOrdinal("email");

        //            while (reader.Read())
        //            {
        //                var customer = new Customer();
        //                customer.id = reader.GetInt32(IdPos);
        //                customer.name = reader.GetString(namePos);
        //                customer.streetAndNumber = reader.GetString(sanPos);
        //                customer.city = reader.GetString(cityPos);
        //                customer.state = reader.GetString(statePos);
        //                customer.postalCode = reader.GetString(pcPos);
        //                customer.countryId = reader.GetInt32(countryIdPos);
        //                customer.password = reader.GetString(passPos);
        //                customer.email = reader.GetString(emailPos);
        //                customers.Add(customer);
        //            }
        //            return customers;
        //        }
        //    }
        //}
    }
}
