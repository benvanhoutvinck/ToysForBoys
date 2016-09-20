using DataAccessLayer.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Services
{
    public class ProductService : IProductService
    {
        public void Insert(Product product)
        {
            using (var entities = new toysforboysEntities())
            {
                entities.products.Add(product);
                entities.SaveChanges();
            }
        }

        public void Delete(Product product)
        {
            using (var entities = new toysforboysEntities())
            {
                entities.products.Remove(product);
                entities.SaveChanges();
            }
        }

        public void Edit(Product product)
        {

            using (var entities = new toysforboysEntities())
            {
                var originalProduct = entities.products.Find(product.id);
                originalProduct.name = product.name;
                originalProduct.scale = product.scale;
                originalProduct.description = product.description;
                originalProduct.quantityInStock = product.quantityInStock;
                originalProduct.quantityInOrder = product.quantityInOrder;
                originalProduct.buyPrice = product.buyPrice;
                originalProduct.productlineId = product.productlineId;
                entities.SaveChanges();
            }
        }

        public IEnumerable<Product> GetAll()
        {
            List<Product> AllProducts = new List<Product>();
            using (var entities = new toysforboysEntities())
            {
                foreach (var product in entities.products)
                {
                    AllProducts.Add(product);
                }
            }

            return AllProducts;
        }

        public Product GetById(int productID)
        {
            using (var entities = new toysforboysEntities())
            {
                var query = (from product in entities.products
                             where product.id == productID
                             orderby product.id
                             select product).First();

                return query;
            }
        }
    }
}
