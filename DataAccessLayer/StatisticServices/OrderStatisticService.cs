using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer.Interfaces;
using System.Windows;
using System.Data.Entity;
using System.Data.Objects;
using System.Data.SqlClient;

namespace DataAccessLayer.Services
{
    public class OrderStatisticService : IOrderStatisticService
    {
        public IEnumerable<int> GetDistinctYear(SortDateEnum sortDate)
        {
            List<int> list = new List<int>();
            switch ((int)sortDate)
            {
                case 0:
                    using (var entities = new toysforboysEntities())
                    {
                        var query = (from order in entities.orders
                                     select order.orderDate.Value.Year);

                        list.AddRange(query);
                    }
                    break;
                case 1:
                    using (var entities = new toysforboysEntities())
                    {
                        var query = (from order in entities.orders
                                     select order.requiredDate.Value.Year);

                        list.AddRange(query);
                    }
                    break;
                case 2:
                    using (var entities = new toysforboysEntities())
                    {
                        var query = (from order in entities.orders
                                     select order.shippedDate.Value.Year);

                        list.AddRange(query);
                    }
                    break;
                default:
                    break;
            }
            return list.Distinct();
        }

        public List<Order> GetByDistinctYear(SortDateEnum sortDate, int year)
        {
            var service = new OrderService();
            var orders = (List<Order>)service.GetAll();
            var ordersOfYear = new List<Order>();

            foreach (var ord in orders)
            {
                switch ((int)sortDate)
                {
                    case 0:
                        if (ord.orderDate.Value.Year == year)
                        {
                            ordersOfYear.Add(ord);
                        }
                        break;

                    case 1:
                        if (ord.requiredDate.Value.Year == year)
                        {
                            ordersOfYear.Add(ord);
                        }
                        break;

                    case 2:
                        if (ord.shippedDate.Value.Year == year)
                        {
                            ordersOfYear.Add(ord);
                        }
                        break;
                }

            }

            return orders;

        }

        public List<Order> GetFilteredOrderStatistics(List<Order> ordersFromGetOrderStatistics, SortDateEnum SortDateCompareLeft, char DateCompareMode, SortDateEnum SortDateCompareRight)
        {
            var filteredOrders = new List<Order>();
            var datesLeft = GetDateTimes(SortDateCompareLeft, ordersFromGetOrderStatistics);
            var datesRight = GetDateTimes(SortDateCompareRight, ordersFromGetOrderStatistics);

            //Checken welke operator er wordt gebruikt (=, > of <)
            for (int i = 0; i < ordersFromGetOrderStatistics.Count; i++)
            {
                
                switch (DateCompareMode)
                {
                    case '=':
                        if (datesLeft[i] == datesRight[i])
                        {
                            filteredOrders.Add(ordersFromGetOrderStatistics[i]);
                        }
                        break;
                    case '<':
                        if (datesLeft[i] < datesRight[i])
                        {
                            filteredOrders.Add(ordersFromGetOrderStatistics[i]);
                        }
                        break;
                    case '>':
                        if (datesLeft[i] > datesRight[i])
                        {
                            filteredOrders.Add(ordersFromGetOrderStatistics[i]);
                        }
                        break;
                    default:
                        break;
                }
            }

            return filteredOrders;
        }

        public List<Order> GetLateShippingDates()
        {
            var service = new OrderService();
            var orders = (List<Order>)service.GetAll();

            foreach (var ord in orders)
            {
                if (ord.shippedDate < ord.requiredDate)
                {
                    orders.Add(ord);
                }
            }

            return orders;
        }

        public List<Order> GetOrderStatistics(OrderQuery orderQuery)
        {
            using (var entities = new toysforboysEntities())
            {
                var query = entities.orders.Where(o => true);
                if (orderQuery.SortDateRange != null)
                    switch ((int)orderQuery.SortDateRange)
                    {
                        case 0:
                            if (orderQuery.DateRangeStart != null)
                            {
                                query = query.Where(o => o.orderDate > orderQuery.DateRangeStart);
                            }

                            if (orderQuery.DateRangeEnd != null)
                            {
                                query = query.Where(o => o.orderDate < orderQuery.DateRangeEnd);
                            }
                            break;
                        case 1:
                            if (orderQuery.DateRangeStart != null)
                            {
                                query = query.Where(o => o.requiredDate > orderQuery.DateRangeStart);
                            }

                            if (orderQuery.DateRangeEnd != null)
                            {
                                query = query.Where(o => o.requiredDate < orderQuery.DateRangeEnd);
                            }
                            break;
                        case 2:
                            if (orderQuery.DateRangeStart != null)
                            {
                                query = query.Where(o => o.shippedDate > orderQuery.DateRangeStart);
                            }

                            if (orderQuery.DateRangeEnd != null)
                            {
                                query = query.Where(o => o.shippedDate < orderQuery.DateRangeEnd);
                            }
                            break;
                    }

                if (orderQuery.CustomerId != null)
                {
                    query = query.Where(o => o.customerId == orderQuery.CustomerId);
                }

                if (!string.IsNullOrEmpty(orderQuery.Status))
                {
                    query = query.Where(o => o.status == orderQuery.Status);
                }

                List<Order> list = new List<Order>();
                list.AddRange(query);

                if (orderQuery.SortDateCompareLeft != null && orderQuery.SortDateCompareRight != null && orderQuery.DateCompareMode != null)
                    list = GetFilteredOrderStatistics(query.ToList(), (SortDateEnum) orderQuery.SortDateCompareLeft, (char) orderQuery.DateCompareMode, (SortDateEnum)orderQuery.SortDateCompareRight);

                return list;

            }

        }

        public List<Order> GetUrgentShippingDates(int days)
        {
            var service = new OrderService();
            var orders = (List<Order>)service.GetAll();

            foreach (var ord in orders)
            {
                if (ord.shippedDate.Value - DateTime.Now <= TimeSpan.FromDays(days))
                {
                    orders.Add(ord);
                }
            }

            return orders;
        }

       //Switch method
        private List<DateTime> GetDateTimes(SortDateEnum sortDateEnum, List<Order> orders)
        {
            List<DateTime> datetime = new List<DateTime>();

            foreach (var order in orders)
            {
                switch (sortDateEnum)
                {
                    case SortDateEnum.orderDate:
                        datetime.Add(Convert.ToDateTime(order.orderDate));
                        break;
                    case SortDateEnum.requiredDate:
                        datetime.Add(Convert.ToDateTime(order.requiredDate));
                        break;
                    case SortDateEnum.shippedDate:
                        datetime.Add(Convert.ToDateTime(order.shippedDate));
                        break;
                    default:
                        break;
                }
            }
            return datetime;
        }

       
    }
}
