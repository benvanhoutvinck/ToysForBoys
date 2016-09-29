using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class OrderdetailsWithSubTotal : Orderdetail
    {
        public decimal Subtotal { get; set; }
    }
}
