using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WPFToysForBoys
{
    public class IdChecker
    {
        public static bool IdCheck(List<Product> l, Product p)
        {
            bool b = false;
            foreach (Product product in l)
            {
                if (p.id == product.id)
                {
                    b = true;
                    if (p.name == product.name && p.buyPrice == product.buyPrice && p.description == product.description && p.productlineId == product.productlineId && p.quantityInOrder == product.quantityInOrder && p.quantityInStock == product.quantityInStock && p.scale == product.scale)
                        throw new ArgumentException();
                    break;
                }
            }
            return b;
        }

        public static bool IdCheck(List<Productline> l, Productline p)
        {
            bool b = false;
            foreach (Productline productline in l)
            {
                if (p.id == productline.id)
                {
                    b = true;
                    if (p == productline)
                        throw new ArgumentException();
                    break;
                }
            }
            return b;
        }

        public static bool IdCheck(List<Customer> l, Customer c)
        {
            bool b = false;
            foreach (Customer customer in l)
            {
                if (c.id == customer.id)
                {
                    b = true;
                    if (c == customer)
                        throw new ArgumentException();
                    break;
                }
            }
            return b;
        }




    }
}
