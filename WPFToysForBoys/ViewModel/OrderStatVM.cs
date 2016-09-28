using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GalaSoft.MvvmLight;
using DataAccessLayer.Interfaces;
using DataAccessLayer.Services;
using WPFToysForBoys.Model;
using GalaSoft.MvvmLight.Command;
using System.Windows;

namespace WPFToysForBoys.ViewModel
{
    public class OrderStatVM : ViewModelBase
    {
        private IOrderStatisticService osService;
        private ICustomerService cService;
        private IOrderService oService;
        public OrderStatVM()
        {
            osService = new OrderStatisticService();
            oService = new OrderService();
            cService = new CustomerService();

            List<DateSort> ds = new List<DateSort>() { new DateSort() { display = "", value = null }, new DateSort() { display = "Date Ordered", value = SortDateEnum.orderDate }, new DateSort() { display = "Date Required", value = SortDateEnum.requiredDate }, new DateSort() { display = "Date Shipped", value = SortDateEnum.shippedDate } };

            DateRangeSortList = ds;
            DateCompareLeftList = ds;
            DateCompareRightList = ds;

            DateRangeStart = new DateTime(2003, 1, 1);
            DateRangeEnd = new DateTime(2003, 1, 1);

            DateCompareModeList = new List<char>() { ' ', '<', '=', '>' };
            DateCompareMode = ' ';

            StatusList = new List<string>() { "ALL", "WAITING", "CANCELLED", "RESOLVED", "SHIPPED", "DISPUTED", "PROCESSING" };
            Status = "ALL";

            List<Customer> cl = cService.GetAll().ToList();

            List<OrderStatCustomer> osc = new List<OrderStatCustomer>();
            osc.Add(new OrderStatCustomer(null, "None Selected"));

            foreach (Customer c in cl)
                osc.Add(new OrderStatCustomer(c));

            CustomerList = osc;
            SCustomer = null;
        }

        private DateTime dateRangeEnd;
        public DateTime DateRangeEnd
        {
            get { return dateRangeEnd; }
            set
            {
                dateRangeEnd = value;
                RaisePropertyChanged("DateRangeEnd");
            }
        }

        private DateTime dateRangeStart;
        public DateTime DateRangeStart
        {
            get { return dateRangeStart; }
            set
            {
                dateRangeStart = value;
                RaisePropertyChanged("DateRangeStart");
            }
        }

        public RelayCommand FilterCommand
        {
            get { return new RelayCommand(Filter); }
        }

        private string queryName;
        public string QueryName
        {
            get { return queryName; }
            set
            {
                queryName = value;
                RaisePropertyChanged("QueryName");
            }
        }

        private SortDateEnum? sortDateRange;
        public SortDateEnum? SortDateRange
        {
            get { return sortDateRange; }
            set
            {
                sortDateRange = value;
                RaisePropertyChanged("SortDateRange");
            }
        }

        private SortDateEnum? dateCompareLeft;
        public SortDateEnum? DateCompareLeft
        {
            get { return dateCompareLeft; }
            set
            {
                dateCompareLeft = value;
                RaisePropertyChanged("DateCompareLeft");
            }
        }

        private SortDateEnum? dateCompareRight;
        public SortDateEnum? DateCompareRight
        {
            get { return dateCompareRight; }
            set
            {
                dateCompareRight = value;
                RaisePropertyChanged("DateCompareRight");
            }
        }

        private List<DateSort> dateRangeSortList;
        public List<DateSort> DateRangeSortList
        {
            get { return dateRangeSortList; }
            set
            {
                dateRangeSortList = value;
                RaisePropertyChanged("DateRangeSortList");
            }
        }

        private List<DateSort> dateCompareLeftList;
        public List<DateSort> DateCompareLeftList
        {
            get { return dateCompareLeftList; }
            set
            {
                dateCompareLeftList = value;
                RaisePropertyChanged("DateCompareLeftList");
            }
        }

        private List<DateSort> dateCompareRightList;
        public List<DateSort> DateCompareRightList
        {
            get { return dateCompareRightList; }
            set
            {
                dateCompareRightList = value;
                RaisePropertyChanged("DateCompareRightList");
            }
        }

        private List<char> dateCompareModeList;
        public List<char> DateCompareModeList
        {
            get { return dateCompareModeList; }
            set
            {
                dateCompareModeList = value;
                RaisePropertyChanged("DateCompareModeList");
            }
        }

        private char dateCompareMode;
        public char DateCompareMode
        {
            get { return dateCompareMode; }
            set
            {
                dateCompareMode = value;
                RaisePropertyChanged("DateCompareMode");
            }
        }

        private List<OrderStatCustomer> customerList;
        public List<OrderStatCustomer> CustomerList
        {
            get { return customerList; }
            set
            {
                customerList = value;
                RaisePropertyChanged("CustomerList");
            }
        }

        private int? sCustomer;
        public int? SCustomer
        {
            get { return sCustomer; }
            set
            {
                sCustomer = value;
                RaisePropertyChanged("SCustomer");
            }
        }

        private List<string> statusList;
        public List<string> StatusList
        {
            get { return statusList; }
            set
            {
                statusList = value;
                RaisePropertyChanged("StatusList");
            }
        }

        private string status;
        public string Status
        {
            get { return status; }
            set
            {
                status = value;
                RaisePropertyChanged("Status");
            }
        }

        private void Filter()
        {
            List<Order> ol;

            if (string.IsNullOrWhiteSpace(Status) || "ALL".Equals(this.Status))
            {
                ol = osService.GetOrderStatistics(new OrderQuery()
                {
                    SortDateRange = this.SortDateRange,
                    DateRangeStart = this.DateRangeStart,
                    DateRangeEnd = this.DateRangeEnd,
                    CustomerId = this.SCustomer,
                    Status = null,
                    SortDateCompareLeft = this.DateCompareLeft,
                    DateCompareMode = this.DateCompareMode,
                    SortDateCompareRight = this.DateCompareRight
                });
            }
            else
            {
                ol = osService.GetOrderStatistics(new OrderQuery()
                {
                    SortDateRange = this.SortDateRange,
                    DateRangeStart = this.DateRangeStart,
                    DateRangeEnd = this.DateRangeEnd,
                    CustomerId = this.SCustomer,
                    Status = this.Status,
                    SortDateCompareLeft = this.DateCompareLeft,
                    DateCompareMode = this.DateCompareMode,
                    SortDateCompareRight = this.DateCompareRight
                });
            }

            

            List<OrderStat> os = new List<OrderStat>();

            foreach (Order o in ol)
                os.Add(new OrderStat(o));

            OrderStatList = os;
        }

        private List<OrderStat> orderStatList;
        public List<OrderStat> OrderStatList
        {
            get { return orderStatList; }
            set
            {
                orderStatList = value;
                RaisePropertyChanged("OrderStatList");
            }
        }

        public RelayCommand SaveCommand
        {
            get { return new RelayCommand(NotImplementedC); }
        }

        public RelayCommand LoadCommand
        {
            get { return new RelayCommand(NotImplementedC); }
        }

        private void NotImplementedC()
        {
            MessageBox.Show("Functionality is not yet implemented!", "Function to come soon", MessageBoxButton.OK, MessageBoxImage.Exclamation);
        }
    }
}
