using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Interfaces
{
    public interface IOrderdetailsService
    {
        public void Insert(Orderdetail orderdetail);
        public void Delete(Orderdetail orderdetail);

        public void Edit(Orderdetail orderdetail);

        public IEnumerable<Orderdetail> GetAll();

        public Orderdetail GetById(int orderdetailID, int productID); 
    }
}
