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
                    if (p == product)
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
                    if (p.name == productline.name && p.description == productline.description)
                        throw new ArgumentException();
                    break;
                }
            }
            return b;
        }
    }
}
