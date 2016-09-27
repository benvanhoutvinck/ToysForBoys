﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Interfaces
{
    interface IOrderStatisticService
    {
     
        //eerst GetStatistics opvragen daarna GetFilteredStatistics om te filteren met datums   
        List<Order> GetOrderStatistics(OrderQuery orderQuery);

        //Veiligste is om 0, 1 of 2 als waarde mee te geven bij SortDateEnum
        List<Order> GetFilteredOrderStatistics(List<Order> orders, SortDateEnum SortDateCompareLeft, char DateCompareMode, SortDateEnum SortDateCompareRight);

        List<Order> GetDistinctYear(SortDateEnum sortDate, int year);

        List<Order> GetLateShippingDates();

        List<Order> GetUrgentShippingDates(int days);
    }
}