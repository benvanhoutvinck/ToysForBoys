using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Interfaces
{
    public interface IProductService
    {
        public void Insert(Product product);

        public void Delete(Product product);

        public void Edit(Product product);

        public IEnumerable<Product> GetAll();

        public Product GetById(int productID); 
    }
}
