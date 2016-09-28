using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GalaSoft.MvvmLight;
using DataAccessLayer;
using DataAccessLayer.Interfaces;
using GalaSoft.MvvmLight.Command;
using System.ComponentModel;
using System.Windows;
using DataAccessLayer.Services;
using System.Windows.Controls;
using System.Text.RegularExpressions;

namespace WPFToysForBoys.ViewModel
{
    public class OrderDetailUpdateVM : ViewModelBase
    {

        //private IOrderdetailsService odService;
        private IProductService pService;
        private IOrderdetailsService odService;

        private List<Orderdetail> orderdetailList;
        private List<Orderdetail> odList;
        private List<Product> productList;

        public List<Orderdetail> OrderdetailList
        {
            get { return orderdetailList; }
            set
            {
                orderdetailList = value;
                RaisePropertyChanged("OrderdetailList");
            }
        }

        public OrderDetailUpdateVM(List<Orderdetail> nOrderdetailList)
        {
            //odService = new OrderdetailService();
            OrderdetailList = nOrderdetailList;
            pService = new ProductService();
            odService = new OrderdetailService();
            odList = odService.GetAll().ToList().FindAll(odetail => odetail.orderId.Equals(nOrderdetailList[0].orderId));
            PProductList = new List<Product>() { new Product() { id = -1, name = "All" } };
            PProductList = pService.GetAll("productline").ToList();
            productList = pService.GetAll("productline").ToList();
            //SelectedProduct = ProductList.First();
            SelectedPProductI = -1;
        }


        private Orderdetail selectedOrderdetail;
        public Orderdetail SelectedOrderdetail
        {
            get { return selectedOrderdetail; }
            set
            {
                if (value == null)
                {
                    ShowOrderdetail = new Orderdetail() { productId = -1, orderId = -1 };
                }
                else
                {
                    selectedOrderdetail = value;
                    ShowOrderdetail = value;
                    for (int i = 0; i < productList.Count; i++)
                    {
                        if (productList[i].id == ShowOrderdetail.productId)
                            ShowProduct = ShowOrderdetail.product;
                    }
                    RaisePropertyChanged("SelectedOrderdetail");
                }

            }
        }

        public void UpdateProduct()
        {
            for (int i = 0; i < productList.Count; i++)
            {
                if (productList[i].id == ShowOrderdetail.productId)
                    ShowProduct = ShowOrderdetail.product;
            }
        }



        private Orderdetail showOrderdetail;
        public Orderdetail ShowOrderdetail
        {
            get { return showOrderdetail; }
            set
            {
                showOrderdetail = value;
                if (value.product == null)
                {
                    SelectedPProductI = 0;
                }
                else
                {
                    SelectedPProductI = value.product.id;
                }
                RaisePropertyChanged("ShowOrderdetail");
            }
        }

        private int selectedPProductI;
        public int SelectedPProductI
        {
            get { return selectedPProductI; }
            set
            {
                selectedPProductI = value;
                RaisePropertyChanged("SelectedPProductI");
            }
        }


        private List<Product> pProductList;
        public List<Product> PProductList
        {
            get { return pProductList; }
            set
            {
                pProductList = value;
                RaisePropertyChanged("PProductList");
            }
        }

        private Product showProduct;
        public Product ShowProduct
        {
            get { return showProduct; }
            set
            {
                showProduct = value;
                RaisePropertyChanged("showProduct");
            }
        }




        public RelayCommand ODAddCommand
        {
            get { return new RelayCommand(ODAdd); }
        }
        private void ODAdd()
        {
            try
            {
                ShowOrderdetail.productId = SelectedPProductI;
                ShowOrderdetail.orderId = OrderdetailList[0].orderId;
                if (SelectedPProductI >= 1)
                    if ((ShowOrderdetail.priceEach == null || ShowOrderdetail.priceEach > 0) && (ShowOrderdetail.quantityOrdered == null || ShowOrderdetail.quantityOrdered >= 0))
                    {
                        if (!IdChecker.IdCheck(odList, ShowOrderdetail))
                        {
                            odService.Insert(new Orderdetail()
                            {
                                orderId = OrderdetailList[0].orderId, //ShowOrderdetail.orderId,
                                productId = SelectedPProductI, // ShowOrderdetail.productId,
                                quantityOrdered = ShowOrderdetail.quantityOrdered,
                                priceEach = ShowOrderdetail.priceEach
                            });
                        }
                        else
                        {
                            odService.Edit(new Orderdetail()
                            {
                                orderId = ShowOrderdetail.orderId,
                                productId = SelectedPProductI, // ShowOrderdetail.productId,
                                quantityOrdered = ShowOrderdetail.quantityOrdered,
                                priceEach = ShowOrderdetail.priceEach
                            });
                        }
                        odList = odService.GetAll().ToList().FindAll(odetail => odetail.orderId.Equals(ShowOrderdetail.orderId));
                        SelectedPProductI = SelectedPProductI;
                        OrderdetailList = odService.GetAll().ToList().FindAll(odetail => odetail.orderId.Equals(ShowOrderdetail.orderId));
                        for (int i = 0; i < OrderdetailList.Count; i++)
                        {
                            OrderdetailList[i].product = pService.GetById(OrderdetailList[i].productId);
                        }
                        RefreshTab();
                    }
                    else
                        MessageBox.Show("Invalid Quantities/price!", "Warning", MessageBoxButton.OK, MessageBoxImage.Exclamation);
                else
                    MessageBox.Show("No product selected for your order!", "Warning", MessageBoxButton.OK, MessageBoxImage.Exclamation);
            }
            catch (ArgumentException)
            {
                MessageBox.Show("Identical object already exists in the database!", "Warning", MessageBoxButton.OK, MessageBoxImage.Exclamation);
            }
        }

        public RelayCommand ODDeleteCommand
        {
            get { return new RelayCommand(ODDelete); }
        }
        private void ODDelete()
        {
            try
            {
                if (IdChecker.IdCheck(orderdetailList, ShowOrderdetail))
                {
                    if (MessageBox.Show("You are about to delete a modified orderline. \nAre you sure you want to continue?", "Warning", MessageBoxButton.YesNo, MessageBoxImage.Exclamation, MessageBoxResult.No) == MessageBoxResult.Yes)
                    {
                        odService.Delete(odService.GetById(ShowOrderdetail.orderId, ShowOrderdetail.productId));
                        OrderdetailList = odService.GetAll().ToList().FindAll(odetail => odetail.orderId.Equals(ShowOrderdetail.orderId));
                        for (int i = 0; i < OrderdetailList.Count; i++)
                        {
                            OrderdetailList[i].product = pService.GetById(OrderdetailList[i].productId);
                        }
                        RefreshTab();
                        ODNew();
                    }
                }
                else
                {
                    ODNew();
                    RefreshTab();
                }
            }
            catch (ArgumentException)
            {
                if (MessageBox.Show("You are about to delete a orderline from the database. \nAre you sure you want to continue?", "Warning", MessageBoxButton.YesNo, MessageBoxImage.Exclamation, MessageBoxResult.No) == MessageBoxResult.Yes)
                {
                    odService.Delete(odService.GetById(ShowOrderdetail.orderId, ShowOrderdetail.productId));
                    OrderdetailList = odService.GetAll().ToList().FindAll(odetail => odetail.orderId.Equals(ShowOrderdetail.orderId));
                    for (int i = 0; i < OrderdetailList.Count; i++)
                    {
                        OrderdetailList[i].product = pService.GetById(OrderdetailList[i].productId);
                    }
                    RefreshTab();
                    ODNew();
                }
            }
            //SelectedProductlineI = SelectedProductlineI;
        }

        public RelayCommand ODNewCommand
        {
            get { return new RelayCommand(ODNew); }
        }
        private void ODNew()
        {
            SelectedOrderdetail = null;
            ShowProduct = null;
        }

        private void RefreshTab()
        {
            SelectedPProductI = SelectedPProductI;
        }

    }
}
