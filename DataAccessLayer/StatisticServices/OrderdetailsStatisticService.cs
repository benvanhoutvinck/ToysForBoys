using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer.Interfaces;
using DataAccessLayer.Services;

namespace DataAccessLayer.StatisticServices
{
    public class OrderdetailsStatisticService : IOrderdetailsStatisticService
    {
        public decimal GetTotalPriceOfOrder(int orderId)
        {
            var service = new OrderdetailService();
            var orderdetails = (List<Orderdetail>)service.GetAll();
            decimal totalPrice = 0;

            foreach (var od in orderdetails)
            {
                if (od.orderId == orderId)
                {
                    totalPrice += (Decimal)(od.quantityOrdered * od.priceEach);
                }
            }
            return totalPrice;
        }

        public decimal GetTotalSellingPriceForSingleProduct(int productId)
        {
            var service = new OrderdetailService();
            var orderdetails = service.GetAll().ToList().FindAll(od => od.productId == productId);
            decimal totalPrice = 0;

            foreach (var od in orderdetails)
            {
                totalPrice += (decimal)(od.quantityOrdered * od.priceEach);
            }
            return totalPrice;
        }

        public int GetTotalUnitsSoldForSingleProduct(int productId)
        {
            var service = new OrderdetailService();
            var orderdetails = (List<Orderdetail>)service.GetAll();
            int totalUnits = 0;

            foreach (var od in orderdetails)
            {
                if (od.productId == productId)
                {
                    totalUnits += (int)od.quantityOrdered;
                }
            }
            return totalUnits;

        }
    }
}
