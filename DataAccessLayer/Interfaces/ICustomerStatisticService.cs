using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer.Queries;

namespace DataAccessLayer.Interfaces
{
    public interface ICustomerStatisticService
    {
        List<Customer> GetCustomerStatistics(CustomerQuery customerQuery);
        List<Customer> GetCustomersPerCountry(int countryId);
        List<Customer> GetCustomerPerPostalCode(string postalCode);
        List<Customer> GetCustomerPerState(string state);
        List<Customer> GetCustomerPerCity(string city);
    }
}
