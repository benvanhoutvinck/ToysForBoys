using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebFrontEnd.Models
{
	public class ProductListViewModel
	{
        public IEnumerable<Productline> AllProductLines { get; set; }

        public List<int> FilterProductLines { get; set; }

        public string FilterProductName { get; set; }

        public int FilterBuyPriceMinimum { get; set; }
        public int FilterBuyPriceMaximum { get; set; }
        
        public IEnumerable<ProductListItem> Products { get; set; }
    }
}