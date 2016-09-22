using DataAccessLayer;
using DataAccessLayer.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebFrontEnd.Mock
{
    public class CountryServiceMock : ICountryService
    {

        private List<Country> Countries;


        public CountryServiceMock()
        {
            Countries = new List<Country>()
            {
                new Country()
                {
                     id = 1,
                     name = "België"
                },
                new Country()
                {
                    id = 2,
                    name = "Nederland"
                },
                new Country()
                {
                    id=3,
                    name="Frankrijk"
                }

            }; 
        }

        public void Insert(DataAccessLayer.Country country)
        {
            throw new NotImplementedException();
        }

        public void Delete(DataAccessLayer.Country country)
        {
            throw new NotImplementedException();
        }

        public void Edit(DataAccessLayer.Country country)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<DataAccessLayer.Country> GetAll()
        {

            return Countries;
        }

        public DataAccessLayer.Country GetById(int countryID)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Country> GetAll(string includes)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Country> GetAll(Func<Country, bool> predicate, string includes)
        {
            throw new NotImplementedException();
        }

        public Country GetById(int countryID, string includes)
        {
            throw new NotImplementedException();
        }
    }
}