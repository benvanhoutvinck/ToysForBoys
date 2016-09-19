using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    interface IProductService
    {
        void Insert(Product product);

        void Delete(Product product);

        void Edit(Product product);

        IEnumerable<Product> GetAll();

        Product GetById(int productID); 
    }
}
