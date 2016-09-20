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
    }
}
