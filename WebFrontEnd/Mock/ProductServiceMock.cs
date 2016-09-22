using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DataAccessLayer;
using DataAccessLayer.Interfaces;

namespace WebFrontEnd.Mock
{
    public class ProductServiceMock : IProductService
    {

        private List<Product> products;

        public ProductServiceMock()
        {
            products = new List<Product>()
            {
                new Product()
                {
                    id = 1,
                    name = "Matchbox Speelgoedauto",
                    buyPrice = 50,
                    description = "Model van een Porshe Carrera",
                    
                }
            };
        }

        public void Delete(Product product)
        {
            throw new NotImplementedException();
        }

        public void Edit(Product product)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Product> GetAll()
        {
            throw new NotImplementedException();
        }

        public Product GetById(int productID)
        {
            throw new NotImplementedException();
        }

        public void Insert(Product product)
        {
            throw new NotImplementedException();
        }


        public IEnumerable<Product> GetAll(string includes)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Product> GetAll(Func<Product, bool> predicate, string includes)
        {
            throw new NotImplementedException();
        }

        public Product GetById(int productID, string includes)
        {
            throw new NotImplementedException();
        }

        public OrderedProduct CreateOrderedProduct(Product product, int quantityOrdered, decimal priceEach)
        {
            throw new NotImplementedException();
        }

        public OrderedProduct CreateOrderedProduct(string productName, int quantityOrdered, decimal priceEach)
        {
            throw new NotImplementedException();
        }
    }
}