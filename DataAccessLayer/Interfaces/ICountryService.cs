using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Interfaces
{
    public interface ICountryService
    {
        void Insert(Country country);
        void Delete(Country country);

        void Edit(Country country);

        IEnumerable<Country> GetAll();

        Country GetById(int countryID); 
    }
}
