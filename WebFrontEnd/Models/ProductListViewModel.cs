using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebFrontEnd.Models
{
	public class ProductListViewModel
	{
        public int? FilterProductLineID { get; set; }
        public string FilterProductName { get; set; }

        public IEnumerable<ProductListItem> Products { get; set; }
    }
}