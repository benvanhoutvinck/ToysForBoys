﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public interface ICustomerService
    {
        void Insert(Customer customer);
        void Delete(Customer customer);

        void Edit(Customer customer);

        IEnumerable<Customer> GetAll();

        Customer GetById(int customerID); 
    }
}
