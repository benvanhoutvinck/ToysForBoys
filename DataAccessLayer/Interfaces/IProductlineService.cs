using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Interfaces
{
    public interface IProductlineService
    {
        void Insert(Productline productline);
        void Delete(Productline productline);

        void Edit(Productline productline);

        IEnumerable<Productline> GetAll();

        Productline GetById(int productlineID); 
    }
}
