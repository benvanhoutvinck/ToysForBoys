using DataAccessLayer;
using DataAccessLayer.Interfaces;
using DataAccessLayer.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WPFToysForBoys.Model
{
    public class ProductStatStruct
    {
        public int id { get; set; }
        public string name { get; set; }
        public int countProductsSold { get; set; }
    }

    public class YearStruct
    {
        public int year { get; set; }
        public string display { get; set; }
    }

    public class MonthStruct
    {
        public int month { get; set; }
        public string display { get; set; }
    }

    public class ProductShortageStruct
    {
        public int id { get; set; }
        public string name { get; set; }
        public int itemShortage { get; set; }
        
        public ProductShortageStruct(Product p)
        {
            this.id = p.id;
            this.name = p.name;
            CalcShortage(p.quantityInStock.Value, p.quantityInOrder.Value);
        }
        private void CalcShortage(int stock, int order)
        {
            this.itemShortage = order - stock;
        }
    }
}
