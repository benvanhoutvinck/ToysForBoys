using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer.Interfaces;
using DataAccessLayer.Queries;

namespace DataAccessLayer.Services
{
    public class ProductStatisticService : IProductStatisticService
    {
        public List<Product> GetProductStatistics(ProductQuery productQuery)
        {
            var queryString = new StringBuilder();
            queryString.Append("from product in entities.products where ");


            if (productQuery.SortQuantity!=null)
            {
                switch ((int)productQuery.SortQuantity)
                {
                    case 0:
                        queryString.Append("product.quantityInStock ");
                        break;
                    case 1:
                        queryString.Append("product.quantityInOrder ");
                        break;
                }
            }

            bool quantityUsed = false;
            if (productQuery.minimumQuantity!=null)
            {
                queryString.Append("> " + productQuery.minimumQuantity + " ");
                quantityUsed = true;
            }

            if (productQuery.maximumQuantity!=null)
            {
                queryString.Append("< " + productQuery.maximumQuantity + " ");
                quantityUsed = true;
            }

            bool minPriceUsed = false;
            if (productQuery.minPrice!=null)
            {
                if (quantityUsed)
                {
                    queryString.Append("and where ");
                }
                queryString.Append("product.buyPrice > " + productQuery.minPrice + " ");
                minPriceUsed = true;
            }

            bool maxPriceUsed = false;
            if (productQuery.maxPrice!=null)
            {
                if (quantityUsed || minPriceUsed)
                {
                    queryString.Append("and where ");
                }

                queryString.Append("product.buyPrice < " + productQuery.maxPrice + " ");
                maxPriceUsed = true;
            }

            if (productQuery.active!=null)
            {
                if (maxPriceUsed || minPriceUsed || quantityUsed)
                {
                    queryString.Append("and where ");
                }

                queryString.Append("product.active =")
            }
            


        }

        
    }
}
