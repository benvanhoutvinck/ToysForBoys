using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Interfaces
{
    interface IStatisticService
    {
        List<Order> GetStatistics(OrderQuery orderQuery);

        List<Order> GetFilteredStatistics(List<Order> orders, SortDateEnum SortDateCompareLeft, char DateCompareMode, SortDateEnum SortDateCompareRight);
    }
}
