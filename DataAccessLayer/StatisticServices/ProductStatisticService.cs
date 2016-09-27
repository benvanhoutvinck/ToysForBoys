using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer.Interfaces;
using DataAccessLayer.Queries;
using System.Data.SqlClient;

namespace DataAccessLayer.Services
{
    public class ProductStatisticService : IProductStatisticService
    {
        public int GetCountSold(int productlineID, int year)
        {
            using(var entities = new toysforboysEntities())
            {
                int count;
                if (year!=-1)
                {
                    var query = from product in entities.products
                                join orderDetail in entities.orderdetails on product.id equals orderDetail.productId
                                join order in entities.orders on orderDetail.orderId equals order.id
                                where product.productlineId == productlineID
                                && order.orderDate.Value.Year == year
                                select orderDetail;

                    count = (int)query.AsEnumerable().Sum(od => od.quantityOrdered);
                }
                else
                {
                    var query = from product in entities.products
                                join orderDetail in entities.orderdetails on product.id equals orderDetail.productId
                                join order in entities.orders on orderDetail.orderId equals order.id
                                where product.productlineId == productlineID                                
                                select orderDetail;

                    count = (int)query.AsEnumerable().Sum(od => od.quantityOrdered);
                }

                return count;                

                
            }
        }

        public List<Product> GetProductStatistics(ProductQuery productQuery)
        {
            using (var entities = new toysforboysEntities())
            {
                var query = entities.products.Where(p => true);
                switch ((int)productQuery.SortQuantity)
                {
                    case 0:
                        if (productQuery.minimumQuantity!=null)
                        {
                            query = query.Where(p => p.quantityInStock >= productQuery.minimumQuantity);
                        }

                        if (productQuery.maximumQuantity!=null)
                        {
                            query = query.Where(p => p.quantityInStock <= productQuery.maximumQuantity);
                        }
                        break;
                    case 1:
                        if (productQuery.minimumQuantity != null)
                        {
                            query = query.Where(p => p.quantityInOrder >= productQuery.minimumQuantity);
                        }

                        if (productQuery.maximumQuantity != null)
                        {
                            query = query.Where(p => p.quantityInOrder <= productQuery.maximumQuantity);
                        }
                        break;                  

                }

                if (productQuery.minPrice!=null)
                {
                    query = query.Where(p => p.buyPrice >= productQuery.minPrice);

                }

                if (productQuery.maxPrice != null)
                {
                    query = query.Where(p => p.buyPrice <= productQuery.maxPrice);

                }

                if (productQuery.active!=null)
                {
                    query = query.Where(p => p.active == productQuery.active);
                }

                return query.ToList();
            }
        }

        
    }
}
