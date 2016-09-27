using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;

namespace DataAccessLayer
{
    public class BestSoldProduct : Product
    {
        public int QuantityOrdered { get; set; }
    }
}
