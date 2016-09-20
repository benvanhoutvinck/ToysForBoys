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

namespace WPFToysForBoys.ViewModel
{
    public partial class ManagementVM:ViewModelBase
    {
        

        private IProductService pService;
        public ManagementVM()
        {
            pService = new ProductServiceMock();
            ProductList = pService.GetAll().ToList();
            ButtonApplyStatus = 0;
            ButtonAddStatus = 1;
        }

        private List<Product> productList;
        public List<Product> ProductList
        {
            get { return productList; }
            set
            {
                productList = value;
                RaisePropertyChanged("ProductList");
            }
        }

        public RelayCommand<CancelEventArgs> ClosingCommand
        {
            get { return new RelayCommand<CancelEventArgs>(Closing); }
        }
        private void Closing(CancelEventArgs e)
        {
            if (MessageBox.Show("Do you want to close the application?", "Closing", MessageBoxButton.YesNo, MessageBoxImage.Question, MessageBoxResult.No) == MessageBoxResult.No)
                e.Cancel = true;
        }


        private int buttonAddStatus;
        public int ButtonAddStatus
        {
            get { return buttonAddStatus; }
            set { buttonAddStatus = value;
                RaisePropertyChanged("ButtonAddStatus");
            }
        }
        private int buttonApplyStatus;
        public int ButtonApplyStatus
        {
            get { return buttonApplyStatus; }
            set { buttonApplyStatus = value;
                RaisePropertyChanged("ButtonApplyStatus");
            }
        }

        private Product selectedProduct;
        public Product SelectedProduct
        {
            get { return selectedProduct; }
            set { selectedProduct = value;
                RaisePropertyChanged("SelectedProduct");
            }
        }

        

        public RelayCommand AddCommand
        {
            get { return new RelayCommand(Add); }
        }
        private void Add()
        {
            
        }

        public RelayCommand ModifyCommand
        {
            get { return new RelayCommand(Modify); }
        }
        private void Modify()
        {
            ButtonAddStatus = 0;
            ButtonApplyStatus = 1;
        }



    }
}
