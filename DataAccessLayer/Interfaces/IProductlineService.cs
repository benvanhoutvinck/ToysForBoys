using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Interfaces
{
    public interface IProductlineService
    {
        public void Insert(Productline productline);
        public void Delete(Productline productline);

        public void Edit(Productline productline);

        public IEnumerable<Productline> GetAll();

        public Productline GetById(int productlineID); 
    }
}
