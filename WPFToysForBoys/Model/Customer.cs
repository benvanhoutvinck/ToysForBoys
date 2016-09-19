using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WPFToysForBoys.Model
{
    public class Customer
    {
        public int CustomerID { get; set; }
        public string Fistname { get; set; }
        public string Lastname { get; set; }
        public string Street { get; set; }
        public string City { get; set; }
        public string Postcode { get; set; }
        public int CountryID { get; set; }

    }
}
