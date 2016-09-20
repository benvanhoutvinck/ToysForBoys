﻿using DataAccessLayer;
using DataAccessLayer.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace WPFToysForBoys
{
    public class ProductServiceMock : IProductService
    {

        public List<Product> Products { get; set; }

        public ProductServiceMock()
        {
            Products = new List<Product>();
            Products.Add
                (
                    new Product()
                    {
                        id = 1,
                        name = "product1",
                        scale = "1:25",
                        description = "dit is een product",
                        productline = new Productline() { name = "Line1" },
                        quantityInStock = 10,
                        quantityInOrder = 5,
                        buyPrice = 500,
                        productlineId = 1
                    }
                );
            Products.Add
                (
                    new Product()
                    {
                        id = 2,
                        name = "product2",
                        scale = "1:35",
                        description = "dit is een tweede product",
                        productline = new Productline() { name = "Line2" },
                        quantityInStock = 25,
                        quantityInOrder = 3,
                        buyPrice = 250,
                        productlineId = 2
                    }
                );
        }
        public void Insert(Product product)
        {
          
           product.id=Products.Count+1;
            product.productlineId = 3;
            product.productline = new Productline() { name = "Line3" };
            Products.Add(product);
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
            return Products;
               
        }

        public Product GetById(int productID)
        {
            throw new NotImplementedException();
        }
    }

}

