using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer.Interfaces;

namespace DataAccessLayer
{
    public class CountryStatisticService : ICountryStatisticService
    {
        public int CountCustomersOfCountry(int countryId)
        {
            using (var entities = new toysforboysEntities())
            {
                var query = from customer in entities.customers
                            where customer.countryId == countryId
                            select customer;
                var count = query.Count();
                return query.Count();
            }
        }
    }
}
