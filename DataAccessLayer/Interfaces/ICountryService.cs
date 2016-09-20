using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Interfaces
{
    public interface ICountryService
    {
        public void Insert(Country country);
        public void Delete(Country country);

        public void Edit(Country country);

        public IEnumerable<Country> GetAll();

        public Country GetById(int countryID); 
    }
}
