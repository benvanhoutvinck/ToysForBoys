using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;
using DataAccessLayer.Interfaces;
using DataAccessLayer.Services;

namespace WPFToysForBoys
{
    public class ProductlineServiceMock : IProductlineService
    {
        private List<Productline> productlines;
        public ProductlineServiceMock()
        {
            productlines = new List<Productline>();
            productlines.Add(new Productline()
            {
                id = 1,
                name = "Line1",
                description = "This is a test"
            });
            productlines.Add(new Productline()
            {
                id = 2,
                name = "Line2",
                description = "This is a test"
            }); ;
            int i = 0;
        }
        public void Delete(Productline productline)
        {
            throw new NotImplementedException();
        }

        public void Edit(Productline productline)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Productline> GetAll()
        {
            return productlines;
        }

        public IEnumerable<Productline> GetAll(Func<Productline, bool> predicate)
        {
            throw new NotImplementedException();
        }

        public Productline GetById(int productlineID)
        {
            return new Productline()
            {
                id = 2,
                name = "Line2",
                description = "This is a test"
            };
        }

        public void Insert(Productline productline)
        {
            throw new NotImplementedException();
        }
    }
}
