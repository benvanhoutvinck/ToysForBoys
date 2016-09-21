using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class OrderedProduct : Product
    {
        public int quantityOrdered { get; set; }
        public decimal priceEach { get; set; }
    }
}
