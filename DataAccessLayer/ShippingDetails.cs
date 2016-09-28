using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class ShippingDetails
    {
        //Properties van order van de shipping
        public int OrderId { get; set; }
        public DateTime OrderDate { get; set; }
        public DateTime? ShippedDate { get; set; }
        public DateTime RequiredDate { get; set; }
        public String OrderComments { get; set; }
        public String OrderStatus { get; set; }

        //properties van customer van de shipping
        public String CustomerName { get; set; }
        public String Street { get; set; }
        public String PostalCode { get; set; }
        public String City { get; set; }
        public String State { get; set; }
        public String Country { get; set; }

        //properties van orderdetails van de shipping
        public List<OrderdetailsWithSubTotal> OrderDetails { get; set; }
    }
}
