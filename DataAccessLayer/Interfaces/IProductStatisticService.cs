using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer.Queries;

namespace DataAccessLayer.Interfaces
{
    public interface IProductStatisticService
    {
        List<Product> GetProductStatistics(ProductQuery productQuery);

        //geef waarde -1 mee aan year als je niet wilt filteren op jaar
        //en geeft aantal verkochte producten op van eventueel een bepaald jaar van een bepaalde productline
        int GetCountSold(int productlineID, int year = -1, int month = -1);
    }
}
