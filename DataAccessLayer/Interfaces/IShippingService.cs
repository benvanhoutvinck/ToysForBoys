using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace DataAccessLayer.Interfaces
{
    public interface IShippingService
    {
        //Geeft ordergegevens, customergegevens en orderdetails terug van een bepaalde order in een klasse van ShippingDetails
        //zie klasse ShippingDetails voor meer duidelijkheid
        ShippingDetails GetShippingDetails(int orderId);
    }
}
