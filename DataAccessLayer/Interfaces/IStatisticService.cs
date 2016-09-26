using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Interfaces
{
    interface IStatisticService
    {
     
        //eerst GetStatistics opvragen daarna GetFilteredStatistics om te filteren met datums   
        List<Order> GetStatistics(OrderQuery orderQuery);

        //Veiligste is om 0, 1 of 2 als waarde mee te geven bij SortDateEnum
        List<Order> GetFilteredStatistics(List<Order> orders, SortDateEnum SortDateCompareLeft, char DateCompareMode, SortDateEnum SortDateCompareRight);
    }
}
