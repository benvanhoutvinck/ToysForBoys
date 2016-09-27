using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GalaSoft.MvvmLight;
using DataAccessLayer.Interfaces;
using DataAccessLayer.Services;

namespace WPFToysForBoys.ViewModel
{
    public class OrderStatVM : ViewModelBase
    {
        private IOrderStatisticService oService;
        private ICustomerService cService;
        public OrderStatVM()
        {
            oService = new OrderStatisticService();
            cService = new CustomerService();

            OrderStatList = oService.GetOrderStatistics(new OrderQuery() { CustomerId = null, DateCompareMode = null, DateRangeEnd = null, DateRangeStart = null, SortDateCompareLeft = null, SortDateCompareRight = null, SortDateRange = null, Status = null });
        }

        private List<Order> orderStatList;
        public List<Order> OrderStatList
        {
            get { return orderStatList; }
            set
            {
                orderStatList = value;
                RaisePropertyChanged("OrderStatList");
            }
        }
    }
}
