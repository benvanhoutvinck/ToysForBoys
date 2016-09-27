using DataAccessLayer.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;

namespace WPFToysForBoys.Mock
{
    public class OrderStatMock : IOrderStatisticService
    {
        List<Order> IOrderStatisticService.GetByDistinctYear(SortDateEnum sortDate, int year)
        {
            throw new NotImplementedException();
        }

        IEnumerable<int> IOrderStatisticService.GetDistinctYear(SortDateEnum sortDate)
        {
            return new List<int>() { 2003, 2004, 2005 };
        }

        List<Order> IOrderStatisticService.GetFilteredOrderStatistics(List<Order> orders, SortDateEnum SortDateCompareLeft, char DateCompareMode, SortDateEnum SortDateCompareRight)
        {
            throw new NotImplementedException();
        }

        List<Order> IOrderStatisticService.GetLateShippingDates()
        {
            throw new NotImplementedException();
        }

        List<Order> IOrderStatisticService.GetOrderStatistics(OrderQuery orderQuery)
        {
            throw new NotImplementedException();
        }

        List<Order> IOrderStatisticService.GetUrgentShippingDates(int days)
        {
            throw new NotImplementedException();
        }
    }
}
