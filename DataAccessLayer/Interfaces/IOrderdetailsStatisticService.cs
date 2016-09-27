using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Interfaces
{
    public interface IOrderdetailsStatisticService
    {
        decimal GetTotalPriceOfOrder(int orderId);
        decimal GetTotalSellingPriceForSingleProduct(int productId);
        int GetTotalUnitsSoldForSingleProduct(int productId);
    }
}
