﻿using DataAccessLayer.Interfaces;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace DataAccessLayer.Services
{
    public class CustomerService : ICustomerService
    {
        private Regex passwordRegex = new Regex(@"^.{1,20}$");
        public void Insert(Customer customer)
        {
            using (var entities = new toysforboysEntities())
            {
                if (customer.email!=null)
                {
                    var query = from c in entities.customers
                                where c.email == customer.email
                                select c;

                    if (query.Count() == 0)
                    {
                        entities.customers.Add(customer);
                        entities.SaveChanges();
                    }
                    else
                    {
                        throw new Exception("Email already in use");
                    }

                    if (!passwordRegex.IsMatch(customer.password))
                    {
                        throw new Exception("Invalid password: password must be 1 to 20 characters long and is case sensitive");
                    }
                }
                else
                {
                    entities.customers.Add(customer);
                    entities.SaveChanges();
                }   
            }
        }

        public void Delete(Customer customer)
        {
            using (var entities = new toysforboysEntities())
            {
                entities.customers.Attach(customer);
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

                if (customer.email!=string.Empty)                
                    originalCustomer.email = customer.email;

                if (customer.password != string.Empty)
                    originalCustomer.password = customer.password;
                
                
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
            using (var entities = new toysforboysEntities())
            {
                var query = (from customer in entities.customers
                             where customer.id == customerID
                             orderby customer.id
                             select customer).First();

                return query;
            }
            
        }

        public Customer LoginVerification(string email, string password)
        {
            using (var entities = new toysforboysEntities())
            {
                var query = (from customer in entities.customers
                             where customer.email == email &&
                             customer.password == password
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

            if (includes == "")
                includes = null;


            using (var entities = new toysforboysEntities())
            {

                if (predicate == null && includes == null)
                {
                    return entities.customers.ToList();
                }
                else if (predicate != null && includes == null)
                {
                    return entities.customers.Where(predicate).ToList();
                }
                else if (predicate == null && includes != null)
                {
                    return entities.customers.Include(includes).ToList();
                }
                else if (predicate != null && includes != null)
                {
                    return entities.customers.Include(includes).Where(predicate).ToList();
                }

                return null;

            }

            
        }

        public void AddEmailAndPassword(string name, string email, string password)
        {
            using (var entities = new toysforboysEntities())
            {
                var query = (from customer in entities.customers
                             where customer.name == name
                             select customer).First();

                var query2 = from customer in entities.customers
                             where customer.email == email
                             select customer;

                if (query != null && query2.Count() == 0)
                {

                    query.email = email;
                    query.password = password;
                    entities.SaveChanges();
                }
                else
                {
                    if (query==null)
                    {
                        throw new Exception("Customer's name not found");
                    }

                    if (query2.Count() > 0)
                    {
                        throw new Exception("Email is already in use");
                    }

                   
                }
            } 
           
            
        }

        public void ChangePassword(string email, string oldPassword, string newPassword)
        {
            using (var entities = new toysforboysEntities())
            {
                var query = (from customer in entities.customers
                             where customer.email == email
                             select customer).FirstOrDefault();

                if (query != null && query.password == oldPassword)
                {
                    query.password = newPassword;
                    entities.SaveChanges();
                }
            }                       
        }

        public IEnumerable<Order> GetOrders(int customerId)
        {
            using (var entities = new toysforboysEntities())
            {
                var query = from order in entities.orders
                            where order.customerId == customerId
                            select order;
                return query;
            }
        }
    }
}
