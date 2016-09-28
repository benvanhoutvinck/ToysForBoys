using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Interfaces
{
    public interface ICountryStatisticService
    {
        //Geeft het aantal customers van een bepaald land terug
        int CountCustomersOfCountry(int countryId);
    }
}
