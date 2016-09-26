using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class OrderQuery
    {
        public SortDateEnum? SortDateRange { get; set; }
        public DateTime? DateRangeStart { get; set; }
        public DateTime? DateRangeEnd { get; set; }
        public int? CustomerId { get; set; }
        public string Status { get; set; }
        public SortDateEnum? SortDateCompareLeft { get; set; }
        public char? DateCompareMode { get; set; }
        public SortDateEnum? SortDateCompareRight { get; set; }
    }
}
