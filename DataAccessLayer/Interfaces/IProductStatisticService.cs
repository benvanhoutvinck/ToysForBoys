using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer.Queries;

namespace DataAccessLayer.Interfaces
{
    public interface IProductStatisticService
    {
        List<Product> GetProductStatistics(ProductQuery productQuery);

        /// <summary>
        /// Geeft de totale som van Quantity ordered van producten van de productline terug
        /// </summary>
        /// <param name="ProductlineID">De ID van de geselecteerde productline</param>
        /// <param name="Year">Het geselecteerde jaar, -1 is alle jaren</param>
        /// <returns>SQL command: SELECT sold FROM (SELECT productlineid, sum(quantityOrdered) [sold] FROM products p, orderdetails od, orders o WHERE p.id == od.productId AND od.orderId == o.id AND o.orderDate.Year == Year GROUP BY p.productlineId) WHERE productlineid == ProductlineID</returns>
        int GetCountSold(int ProductlineID, int Year = -1);
    }
}
