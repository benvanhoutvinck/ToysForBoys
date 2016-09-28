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
using System.Text.RegularExpressions;


namespace WPFToysForBoys.ViewModel
{
    public partial class ManagementVM : ViewModelBase
    {

        private List<Customer> customerList;
        public List<Customer> CustomerList
        {
            get { return customerList; }
            set
            {
                customerList = value;
                RaisePropertyChanged("CustomerList");
            }
        }


        private Customer selectedCustomer;
        public Customer SelectedCustomer
        {
            get { return selectedCustomer; }
            set
            {
                if (value == null)
                {
                    ShowCustomer = new Customer() { id = -1 };
                }
                else
                {
                    selectedCustomer = value;
                    ShowCustomer = value;
                    RaisePropertyChanged("SelectedCustomer");
                }

            }
        }

        private Customer showCustomer;
        public Customer ShowCustomer
        {
            get { return showCustomer; }
            set
            {
                showCustomer = value;
                if (value.country == null)
                {
                    SelectedCCountryI = -1;
                }
                else
                {
                    SelectedCCountryI = value.country.id;
                }
                RaisePropertyChanged("ShowCustomer");
            }
        }

        private int selectedCCustomerI;
        public int SelectedCCustomerI
        {
            get { return selectedCCustomerI; }
            set
            {
                selectedCCustomerI = value;
                RaisePropertyChanged("SelectedCCustomerI");
            }
        }

        public bool IsValidEmailAddress(string s)
        {
            if (string.IsNullOrEmpty(s))
                return false;
            else
            {
                var regex = new Regex(@"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*");
                return regex.IsMatch(s) && !s.EndsWith(".");
            }
        }



        public RelayCommand CAddCommand
        {
            get { return new RelayCommand(CAdd); }
        }
        private void CAdd()
        {
            try
            {
                if (SelectedCCountryI >= 1)
                    if ((ShowCustomer.postalCode == null || ShowCustomer.postalCode != string.Empty) && (ShowCustomer.streetAndNumber == null || ShowCustomer.streetAndNumber != string.Empty) && (ShowCustomer.city == null || ShowCustomer.city != string.Empty))
                        if (ShowCustomer.name != null && ShowCustomer.name != string.Empty)
                        {
                            if (ShowCustomer.email == null || ShowCustomer.email == string.Empty || IsValidEmailAddress(ShowCustomer.email))
                            {
                                if (!IdChecker.IdCheck(ccustomerList, ShowCustomer))
                                {
                                    cService.Insert(new Customer()
                                    {
                                        name = ShowCustomer.name,
                                        city = ShowCustomer.city,
                                        countryId = SelectedCCountryI,
                                        postalCode = ShowCustomer.postalCode,
                                        state = ShowCustomer.state,
                                        streetAndNumber = ShowCustomer.streetAndNumber,
                                        email = ShowCustomer.email
                                    });
                                    SelectedCCountryI = SelectedCCountryI;
                                    //ProductList.Add(ShowProduct);
                                }
                                else
                                {
                                    cService.Edit(new Customer()
                                    {
                                        id = ShowCustomer.id,
                                        name = ShowCustomer.name,
                                        city = ShowCustomer.city,
                                        countryId = SelectedCCountryI,
                                        postalCode = ShowCustomer.postalCode,
                                        state = ShowCustomer.state,
                                        streetAndNumber = ShowCustomer.streetAndNumber,
                                        email = ShowCustomer.email
                                    });
                                    SelectedCCountryI = SelectedCCountryI;
                                }
                            }
                            else
                                MessageBox.Show("Invalid email!", "Warning", MessageBoxButton.OK, MessageBoxImage.Exclamation);
                        }
                        else
                            MessageBox.Show("Invalid customer name!", "Warning", MessageBoxButton.OK, MessageBoxImage.Exclamation);
                    else
                        MessageBox.Show("Invalid Adress !", "Warning", MessageBoxButton.OK, MessageBoxImage.Exclamation);
                else
                    MessageBox.Show("No country selected for your customer", "Warning", MessageBoxButton.OK, MessageBoxImage.Exclamation);
            }
            catch (ArgumentException e)
            {
                MessageBox.Show("Identical object already exists in the database!", "Warning", MessageBoxButton.OK, MessageBoxImage.Exclamation);
            }
        }

        public RelayCommand CNewCommand
        {
            get { return new RelayCommand(CNew); }
        }
        private void CNew()
        {
            SelectedCustomer = null;
        }






    }
}
