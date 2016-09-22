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
        private List<Order> orderList;
        public List<Order> OrderList
        {
            get { return orderList; }
            set
            {
                orderList = value;
                RaisePropertyChanged("OrderList");
            }
        }


        private Order selectedOrder;
        public Order SelectedOrder
        {
            get { return selectedOrder; }
            set
            {
                if (value == null)
                {
                    ShowOrder = new Order() { id = -1 };
                }
                else
                {
                    selectedOrder = value;
                    ShowOrder = value;
                    RaisePropertyChanged("SelectedOrder");
                }

            }
        }

        private Order showOrder;
        public Order ShowOrder
        {
            get { return showOrder; }
            set
            {
                showOrder = value;
                //if (value.country == null)
                //{
                //    SelectedCCountryI = -1;
                //}
                //else
                //{
                //    SelectedCCountryI = value.country.id;
                //}
                RaisePropertyChanged("ShowOrder");
            }
        }



        public RelayCommand OAddCommand
        {
            get { return new RelayCommand(OAdd); }
        }
        private void OAdd()
        {
            try
            {
                if (!IdChecker.IdCheck(oorderList, ShowOrder))
                {
                    oService.Insert(new Order()
                    {
                        customerId = SelectedCCustomerI, //ShowOrder.customerId,
                        orderDate = ShowOrder.orderDate,
                        requiredDate = ShowOrder.requiredDate,
                        shippedDate = ShowOrder.shippedDate,
                        status = ShowOrder.status,
                        comments = ShowOrder.comments
                     });
                    SelectedCCustomerI = SelectedCCustomerI;
                    
                }
                else
                {
                    oService.Edit(new Order()
                    {
                        id = ShowCustomer.id,
                        customerId = SelectedCCustomerI, //ShowOrder.customerId,
                        orderDate = ShowOrder.orderDate,
                        requiredDate = ShowOrder.requiredDate,
                        shippedDate = ShowOrder.shippedDate,
                        status = ShowOrder.status,
                        comments = ShowOrder.comments
                    });
                    SelectedCCustomerI = SelectedCCustomerI;
                }
            }
            catch (ArgumentException e)
            {
                MessageBox.Show("Identical object already exists in the database!", "Warning", MessageBoxButton.OK, MessageBoxImage.Exclamation);
            }
        }

        public RelayCommand ONewCommand
        {
            get { return new RelayCommand(ONew); }
        }
        private void ONew()
        {
            SelectedOrder = null;
        }



    }
}
