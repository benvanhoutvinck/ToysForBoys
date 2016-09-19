using DataAccessLayer.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Services
{
    public class CountryService : ICountryService
    {
        public void Insert(Country country)
        {
            using (var entities = new toysforboysEntities())
            {
                entities.countries.Add(country);
                entities.SaveChanges();
            }
        }

        public void Delete(Country country)
        {
            using (var entities = new toysforboysEntities())
            {
                entities.countries.Remove(country);
                entities.SaveChanges();
            }
        }

        public void Edit(Country country)
        {

            using (var entities = new toysforboysEntities())
            {
                var originalCountry = entities.countries.Find(country.id);
                originalCountry.name = country.name;
                entities.SaveChanges();
            }
        }

        public List<Country> GetAll()
        {
            List<Country> AllCountries = new List<Country>();
            using (var entities = new toysforboysEntities())
            {
                foreach (var country in entities.countries)
                {
                    AllCountries.Add(country);
                }
            }

            return AllCountries;
        }

        public Country GetById(int countryID)
        {
            using (var entities = new toysforboysEntities())
            {
                var query = (from country in entities.countries
                             where country.id == countryID
                             orderby country.id
                             select country).First();

                return query;
            }
        }
    }
}
