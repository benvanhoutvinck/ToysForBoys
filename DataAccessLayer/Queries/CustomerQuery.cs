using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Queries
{
    public class CustomerQuery
    {
        public String State { get; set; }
        public String City { get; set; }
        public String PostalCode { get; set; }
        public int? CountryId { get; set; }
    }
}
