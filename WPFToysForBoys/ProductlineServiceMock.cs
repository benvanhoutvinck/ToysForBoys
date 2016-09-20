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
            productlines.Add( new Productline() {
                id = 1,
                name = "test",
                description = "This is a test" });
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

        public Productline GetById(int productlineID)
        {
            throw new NotImplementedException();
        }

        public void Insert(Productline productline)
        {
            throw new NotImplementedException();
        }
    }
}
