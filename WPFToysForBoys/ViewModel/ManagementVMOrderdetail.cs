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

namespace WPFToysForBoys.ViewModel
{
    public partial class ManagementVM : ViewModelBase
    {
        private List<Orderdetail> orderdetailList;
        public List<Orderdetail> OrderdetailList
        {
            get { return orderdetailList; }
            set
            {
                orderdetailList = value;
                RaisePropertyChanged("OrderdetailList");
            }
        }


        private Orderdetail selectedOrderdetail;
        public Orderdetail SelectedOrderdetail
        {
            get { return selectedOrderdetail; }
            set
            {
                if (value == null)
                {
                    ShowOrderdetail = new Order() { id = -1 };
                }
                else
                {
                    selectedOrderdetail = value;
                    ShowOrderdetail = value;
                    RaisePropertyChanged("SelectedOrderdetail");
                }

            }
        }

        private Orderdetail showOrderdetail;
        public Orderdetail ShowOrderdetail
        {
            get { return showOrderdetail; }
            set
            {
                showOrderdetail = value;
                //if (value.country == null)
                //{
                //    SelectedCCountryI = -1;
                //}
                //else
                //{
                //    SelectedCCountryI = value.country.id;
                //}
                RaisePropertyChanged("ShowOrderdetail");
            }
        }



        public RelayCommand OdAddCommand
        {
            get { return new RelayCommand(OdAdd); }
        }
        private void OdAdd()
        {
            try
            {
                if (!IdChecker.IdCheck(oorderdetailList, ShowOrderdetail))
                {
                    oorderdetailService.Insert(new Orderdetail()
                    {
                        priceEach = ShowOrderdetail.priceEach,
                        productId = ShowOrderdetail.productId,
                        quantityOrdered = ShowOrderdetail.quantityOrdered
                    });                    
                }
                else
                {
                    oorderdetailService.Edit(new Orderdetail()
                    {
                        orderId = ShowOrderdetail.orderId,
                        priceEach = ShowOrderdetail.priceEach,
                        productId = ShowOrderdetail.productId,
                        quantityOrdered = ShowOrderdetail.quantityOrdered
                    });
                    
                }
            }
            catch (ArgumentException e)
            {
                MessageBox.Show("Identical object already exists in the database!", "Warning", MessageBoxButton.OK, MessageBoxImage.Exclamation);
            }
        }

        public RelayCommand OdNewCommand
        {
            get { return new RelayCommand(OdNew); }
        }
        private void OdNew()
        {
            SelectedOrderdetail = null;
        }

    }
}
