using DataAccessLayer.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Services
{
    public class ProductlineService : IProductService
    {
        public void Insert(Productline productline)
        {
            using (var entities = new toysforboysEntities())
            {
                entities.productlines.Add(productline);
                entities.SaveChanges();
            }
        }

        public void Delete(Productline productline)
        {
            using (var entities = new toysforboysEntities())
            {
                entities.productlines.Remove(productline);
                entities.SaveChanges();
            }
        }

        public void Edit(Productline productline)
        {

            using (var entities = new toysforboysEntities())
            {
                var originalProductline = entities.productlines.Find(productline.id);
                originalProductline.name = productline.name;
                originalProductline.description = productline.description;

                entities.SaveChanges();
            }
        }

        public List<Productline> GetAll()
        {
            List<Productline> AllProductlines = new List<Productline>();
            using (var entities = new toysforboysEntities())
            {
                foreach (var productline in entities.productlines)
                {
                    AllProductlines.Add(productline);
                }
            }

            return AllProductlines;
        }

        public Productline GetById(int productlineID)
        {
            using (var entities = new toysforboysEntities())
            {
                var query = (from productline in entities.productlines
                             where productline.id == productlineID
                             orderby productline.id
                             select productline).First();

                return query;
            }
        }
    }
}
