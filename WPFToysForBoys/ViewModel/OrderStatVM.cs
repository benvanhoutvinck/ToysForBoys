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
using Microsoft.Win32;
using System.IO;

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

        private int orderCount;
        public int OrderCount
        {
            get { return orderCount; }
            set
            {
                orderCount = value;
                RaisePropertyChanged("OrderCount");
            }
        }

        private int customerCount;
        public int CustomerCount
        {
            get { return customerCount; }
            set
            {
                customerCount = value;
                RaisePropertyChanged("CustomerCount");
            }
        }

        private int disputedOrders;
        public int DisputedOrders
        {
            get { return disputedOrders; }
            set
            {
                disputedOrders = value;
                RaisePropertyChanged("DisputedOrders");
            }
        }

        private int shipments;
        public int Shipments
        {
            get { return shipments; }
            set
            {
                shipments = value;
                RaisePropertyChanged("Shipments");
            }
        }

        private int cancelled;
        public int Cancelled
        {
            get { return cancelled; }
            set
            {
                cancelled = value;
                RaisePropertyChanged("Cancelled");
            }
        }

        private decimal disputedOrdersPercentage;
        public decimal DisputedOrdersPercentage
        {
            get { return disputedOrdersPercentage; }
            set
            {
                disputedOrdersPercentage = value;
                RaisePropertyChanged("DisputedOrdersPercentage");
            }
        }

        private decimal totalRevenue;
        public decimal TotalRevenue
        {
            get { return totalRevenue; }
            set
            {
                totalRevenue = value;
                RaisePropertyChanged("TotalRevenue");
            }
        }

        private decimal averageRevenue;
        public decimal AverageRevenue
        {
            get { return averageRevenue; }
            set
            {
                averageRevenue = value;
                RaisePropertyChanged("AverageRevenue");
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

        private bool dateBox;
        public bool DateBox
        {
            get { return dateBox; }
            set
            {
                dateBox = value;
                RaisePropertyChanged("DateBox");
            }
        }

        private SortDateEnum? sortDateRange;
        public SortDateEnum? SortDateRange
        {
            get { return sortDateRange; }
            set
            {
                sortDateRange = value;
                if (value == null)
                    DateBox = false;
                else
                    DateBox = true;
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
            if (SortDateRange != null)
                if (this.DateRangeStart.CompareTo(this.DateRangeEnd) <= 0)
                {
                    Refresh();
                }
                else
                {
                    MessageBox.Show("You have selected an invalid Date Range!", "Warning", MessageBoxButton.OK, MessageBoxImage.Exclamation);
                }
            else
                Refresh();

        }

        private void Refresh()
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


            CalcStats(os);
        }

        private void CalcStats(List<OrderStat> OrderList)
        {
            this.OrderCount = OrderList.Count;

            {
                List<Customer> cl = new List<Customer>();

                foreach (OrderStat os in OrderList)
                    cl.Add(os.customer);

                this.CustomerCount = cl.Distinct(new CustomerCompare()).Count();
            }

            this.DisputedOrders = OrderList.FindAll(o => o.status.Equals("DISPUTED")).Count;
            if (this.OrderCount > 0)
                this.DisputedOrdersPercentage = ((decimal)this.DisputedOrders) / this.OrderCount;
            else
                this.DisputedOrdersPercentage = 0;

            {
                decimal count = 0;

                foreach (OrderStat os in OrderList.FindAll(o => !o.status.Equals("CANCELLED")))
                    count += os.revenue;

                this.TotalRevenue = count;
            }
            {
                int count = OrderList.FindAll(o => !o.status.Equals("CANCELLED")).Count;

                if (count > 0)
                    this.AverageRevenue = this.TotalRevenue / count;
                else
                    this.AverageRevenue = 0;
            }


            this.Shipments = OrderList.FindAll(o => OrderStat.OverdueShipment(o.requiredDate, o.shippedDate)).Count;

            this.Cancelled = OrderList.FindAll(o => o.status.Equals("CANCELLED")).Count;
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
            get { return new RelayCommand(SaveRapport); }
        }

        public RelayCommand LoadCommand
        {
            get { return new RelayCommand(LoadRapport); }
        }

        private void SaveRapport()
        {
            try
            {
                SaveFileDialog dlg = new SaveFileDialog();
                dlg.FileName = QueryName;
                dlg.DefaultExt = ".rapport";
                dlg.Filter = "Rapport Queries |*.rapport";
                if (dlg.ShowDialog() == true)
                {
                    using (StreamWriter file = new StreamWriter(dlg.FileName))
                    {
                        file.WriteLine(QueryName);
                        file.WriteLine(SortDateRange.ToString());
                        file.WriteLine(DateRangeStart.ToString());
                        file.WriteLine(DateRangeEnd.ToString());
                        file.WriteLine(SCustomer.ToString());
                        file.WriteLine(Status);
                        file.WriteLine(DateCompareLeft.ToString());
                        file.WriteLine(DateCompareMode.ToString());
                        file.WriteLine(DateCompareRight.ToString());
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("opslaan mislukt: " + ex.Message);
            }
        }

        private void LoadRapport()
        {
            try
            {
                OpenFileDialog dlg = new OpenFileDialog();
                dlg.DefaultExt = ".rapport";
                dlg.Filter = "Rapport Queries |*.rapport";
                if (dlg.ShowDialog() == true)
                {
                    using (StreamReader bestand = new StreamReader(dlg.FileName))
                    {
                        QueryName = bestand.ReadLine();
                        var lijn = bestand.ReadLine();
                        switch (lijn)
                        {
                            case "orderDate":
                                SortDateRange = SortDateEnum.orderDate;
                                break;
                            case "requiredDate":
                                SortDateRange = SortDateEnum.requiredDate;
                                break;
                            case "shippedDate":
                                SortDateRange = SortDateEnum.shippedDate;
                                break;
                            default:
                                SortDateRange = null;
                                break;
                        }

                        DateRangeStart = DateTime.Parse(bestand.ReadLine());
                        DateRangeEnd = DateTime.Parse(bestand.ReadLine());

                        int c;
                        if (!int.TryParse(bestand.ReadLine(), out c))
                            SCustomer = null;
                        else
                            SCustomer = c;

                        Status = bestand.ReadLine();

                        lijn = bestand.ReadLine();
                        switch (lijn)
                        {
                            case "orderDate":
                                DateCompareLeft = SortDateEnum.orderDate;
                                break;
                            case "requiredDate":
                                DateCompareLeft = SortDateEnum.requiredDate;
                                break;
                            case "shippedDate":
                                DateCompareLeft = SortDateEnum.shippedDate;
                                break;
                            default:
                                DateCompareLeft = null;
                                break;
                        }
                        
                        DateCompareMode = bestand.ReadLine()[0];

                        lijn = bestand.ReadLine();
                        switch (lijn)
                        {
                            case "orderDate":
                                DateCompareRight = SortDateEnum.orderDate;
                                break;
                            case "requiredDate":
                                DateCompareRight = SortDateEnum.requiredDate;
                                break;
                            case "shippedDate":
                                DateCompareRight = SortDateEnum.shippedDate;
                                break;
                            default:
                                DateCompareRight = null;
                                break;
                        }
                    }

                    Filter();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("openen mislukt : " + ex.Message);
            }
        }

        private void NotImplementedC()
        {
            MessageBox.Show("Functionality is not yet implemented!", "Function to come soon", MessageBoxButton.OK, MessageBoxImage.Exclamation);
        }
    }
}
