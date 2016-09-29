using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer.Interfaces;

namespace DataAccessLayer.Services
{
    public class ShippingService : IShippingService
    {
        public ShippingDetails GetShippingDetails(int orderId)
        {
           using( var entities = new toysforboysEntities())
            {
                ShippingDetails shippingDetails = new ShippingDetails();
                //Ophalen van de OrderProperties

                var orderProperties = (from order in entities.orders
                                      where order.id == orderId
                                      select order).First();

                shippingDetails.OrderId = orderProperties.id;
                shippingDetails.OrderDate =(DateTime)orderProperties.orderDate;
                if (!string.IsNullOrEmpty(orderProperties.shippedDate.ToString()))
                    shippingDetails.ShippedDate = (DateTime)orderProperties.shippedDate;

                shippingDetails.RequiredDate = (DateTime)orderProperties.requiredDate;
                shippingDetails.OrderComments = orderProperties.comments;
                shippingDetails.OrderStatus = orderProperties.status;

                //ophalen van customerProperties

                var customerProperties = (from customer in entities.customers
                                          where customer.id == orderProperties.customerId
                                          select customer).First();

                shippingDetails.CustomerName = customerProperties.name;
                shippingDetails.Street = customerProperties.streetAndNumber;
                shippingDetails.PostalCode = customerProperties.postalCode;
                shippingDetails.City = customerProperties.city;
                if(!string.IsNullOrEmpty(customerProperties.state))
                    shippingDetails.State = customerProperties.state;

                //ophalen van Country

                var service = new CountryService();
                var country= service.GetById(customerProperties.countryId);
                shippingDetails.Country = country.name;
                //ophalen van orderdetailsProperties

                var orderdetailsProperties = from orderdetail in entities.orderdetails
                                             where orderdetail.orderId == shippingDetails.OrderId
                                             select orderdetail;

                
                var service2 = new OrderdetailService();
                var withSubtotals = new List<OrderdetailsWithSubTotal>();
                foreach (var od in orderdetailsProperties)
                {
                    
                    
                    withSubtotals.Add(new OrderdetailsWithSubTotal {
                        orderId = od.orderId,
                        priceEach = od.priceEach,
                        productId = od.productId,
                        quantityOrdered = od.quantityOrdered,
                        Subtotal = service2.GetSubTotal(od) });

                }
                shippingDetails.OrderDetails = withSubtotals;

                
                return shippingDetails;

                
            }
        }
    }
}
