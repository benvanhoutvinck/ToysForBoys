﻿using System;
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
        public int GetCountSold(int productlineID, int year = -1, int month = -1)
        {
            using (var entities = new toysforboysEntities())
            {
                int count;
                if (year != -1)
                {
                    if (month != -1)
                    {
                        var query = from od in entities.orderdetails
                                    join p in entities.products on od.productId equals p.id
                                    join o in entities.orders on od.orderId equals o.id
                                    where p.productlineId == productlineID
                                    && o.orderDate.Value.Year == year
                                    && o.orderDate.Value.Month == month
                                    select od;

                        count = (int)query.AsEnumerable().Sum(od => od.quantityOrdered);
                    }
                    else
                    {
                        var query = from od in entities.orderdetails
                                    join p in entities.products on od.productId equals p.id
                                    join o in entities.orders on od.orderId equals o.id
                                    where p.productlineId == productlineID
                                    && o.orderDate.Value.Year == year
                                    select od;

                        count = (int)query.AsEnumerable().Sum(od => od.quantityOrdered);
                    }
                }
                else
                {
                    if (month != -1)
                    {
                        var query = from od in entities.orderdetails
                                    join p in entities.products on od.productId equals p.id
                                    join o in entities.orders on od.orderId equals o.id
                                    where p.productlineId == productlineID
                                    && o.orderDate.Value.Month == month
                                    select od;

                        count = (int)query.AsEnumerable().Sum(od => od.quantityOrdered);
                    }
                    else
                    {
                        var query = from od in entities.orderdetails
                                    join p in entities.products on od.productId equals p.id
                                    where p.productlineId == productlineID
                                    select od;

                        count = (int)query.AsEnumerable().Sum(od => od.quantityOrdered);
                    }
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
                        if (productQuery.minimumQuantity != null)
                        {
                            query = query.Where(p => p.quantityInStock >= productQuery.minimumQuantity);
                        }

                        if (productQuery.maximumQuantity != null)
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
                    default:
                        break;


                }

                if (productQuery.minPrice != null)
                {
                    query = query.Where(p => p.buyPrice >= productQuery.minPrice);

                }

                if (productQuery.maxPrice != null)
                {
                    query = query.Where(p => p.buyPrice <= productQuery.maxPrice);

                }

                if (productQuery.active != null)
                {
                    query = query.Where(p => p.active == productQuery.active);
                }


                return query.ToList();
            }
        }



        public List<BestSoldProduct> GetProductsSortedByMostSold(int productlineId, int month = -1, int year = -1)
        {
            List<BestSoldProduct> products = new List<BestSoldProduct>();

            using (var entities = new toysforboysEntities())
            {
                foreach (var product in entities.products.Where(p => p.productlineId == productlineId))
                {
                    int count;
                    if (year != -1)
                    {
                        if (month != -1)
                        {
                            var query = from od in entities.orderdetails
                                        join o in entities.orders on od.orderId equals o.id
                                        where od.productId == product.id
                                        && o.orderDate.Value.Year == year
                                        && o.orderDate.Value.Month == month
                                        select od;

                            count = (int)query.AsEnumerable().Sum(od => od.quantityOrdered);
                        }
                        else
                        {
                            var query = from od in entities.orderdetails
                                        join o in entities.orders on od.orderId equals o.id
                                        where od.productId == product.id
                                        && o.orderDate.Value.Year == year
                                        select od;

                            count = (int)query.AsEnumerable().Sum(od => od.quantityOrdered);
                        }
                    }
                    else
                    {
                        if (month != -1)
                        {
                            var query = from od in entities.orderdetails
                                        join o in entities.orders on od.orderId equals o.id
                                        where od.productId == product.id
                                        && o.orderDate.Value.Month == month
                                        select od;

                            count = (int)query.AsEnumerable().Sum(od => od.quantityOrdered);
                        }
                        else
                        {
                            var query = from od in entities.orderdetails
                                        where od.productId == product.id
                                        select od;

                            count = (int)query.AsEnumerable().Sum(od => od.quantityOrdered);
                        }
                    }

                    var totalOrdered = count;
                    products.Add(new BestSoldProduct
                    {
                        id = product.id,
                        name = product.name,
                        active = product.active,
                        buyPrice = product.buyPrice,
                        description = product.description,
                        productlineId = product.productlineId,
                        quantityInOrder = product.quantityInOrder,
                        quantityInStock = product.quantityInStock,
                        scale = product.scale,
                        QuantityOrdered = (int)totalOrdered
                    });

                }

                return products.OrderBy(p => p.QuantityOrdered).Reverse().ToList();
            }
        }

        public List<BestSoldProduct> GetProductsSortedByLeastSold(int productlineId, int month = -1, int year = -1)
        {
            var list = GetProductsSortedByMostSold(year:year, month: month, productlineId: productlineId).ToList();
            list.Reverse();
            return list;
        }
    }
}
