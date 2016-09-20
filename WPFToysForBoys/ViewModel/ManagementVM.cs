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


        private IProductService pService;
        private IProductlineService plineService;
        public ManagementVM()
        {
            pService = new ProductService();
            plineService = new ProductlineService();
            ProductList = pService.GetAll().ToList();
            ProductlineList = plineService.GetAll().ToList();
            //SelectedProduct = ProductList.First();
            PNew();
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

        private Product selectedProduct;
        public Product SelectedProduct
        {
            get { return selectedProduct; }
            set
            {
                if (value == null)
                {
                    ShowProduct = new Product() { id = -1 };
                }
                else
                {
                    selectedProduct = value;
                    ShowProduct = value;
                    RaisePropertyChanged("SelectedProduct");
                }

            }
        }

        private Product showProduct;
        public Product ShowProduct
        {
            get { return showProduct; }
            set
            {
                showProduct = value;
                if (value.productline == null)
                {
                    SelectedPProductlineI = -1;
                }
                else
                {
                    SelectedPProductlineI = value.productline.id;
                }
                RaisePropertyChanged("ShowProduct");
            }
        }



        public RelayCommand PAddCommand
        {
            get { return new RelayCommand(PAdd); }
        }
        private void PAdd()
        {
            //bool b = false;
            //foreach (Product product in ProductList)
            //{
            //    if (ShowProduct.id == product.id)
            //    {
            //        MessageBox.Show("Product ID already exists in database!", "Warning", MessageBoxButton.OK, MessageBoxImage.Exclamation);
            //        b = true;
            //        break;
            //    }
            //}
            try
            {
                if (!IdChecker.IdCheck(ProductList, ShowProduct))
                {
                    pService.Insert(new Product()
                    {
                        name = ShowProduct.name,
                        description = ShowProduct.description,
                        productlineId = SelectedPProductlineI,
                        productline = plineService.GetById(SelectedPProductlineI),
                        scale = ShowProduct.scale,
                        quantityInStock = ShowProduct.quantityInStock,
                        quantityInOrder = ShowProduct.quantityInOrder,
                        buyPrice = ShowProduct.buyPrice
                    });
                    ProductList = pService.GetAll().ToList();
                    //ProductList.Add(ShowProduct);
                }
                else
                {
                    pService.Edit(new Product()
                    {
                        name = ShowProduct.name,
                        description = ShowProduct.description,
                        productlineId = SelectedPProductlineI,
                        productline = plineService.GetById(SelectedPProductlineI),
                        scale = ShowProduct.scale,
                        quantityInStock = ShowProduct.quantityInStock,
                        quantityInOrder = ShowProduct.quantityInOrder,
                        buyPrice = ShowProduct.buyPrice
                    });
                }
            }
            catch (ArgumentException e)
            {
                MessageBox.Show("Identical object already exists in the database!", "Warning", MessageBoxButton.OK, MessageBoxImage.Exclamation);
            }
        }

        public RelayCommand PNewCommand
        {
            get { return new RelayCommand(PNew); }
        }
        private void PNew()
        {
            SelectedProduct = null;
        }



    }
}
