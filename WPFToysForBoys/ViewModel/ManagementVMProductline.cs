using DataAccessLayer;
using GalaSoft.MvvmLight;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WPFToysForBoys.ViewModel
{
    public partial class ManagementVM : ViewModelBase
    {
        private List<Productline> productlineList;
        public List<Productline> ProductlineList
        {
            get { return productlineList; }
            set
            {
                productlineList = value;
                RaisePropertyChanged("ProductlineList");
            }
        }

        private List<Productline> pProductlineList;
        public List<Productline> PProductlineList
        {
            get { return pProductlineList; }
            set
            {
                pProductlineList = value;
                RaisePropertyChanged("PProductlineList");
            }
        }

        private int selectedPProductlineI;
        public int SelectedPProductlineI
        {
            get { return selectedPProductlineI; }
            set
            {
                selectedPProductlineI = value;
                RaisePropertyChanged("SelectedPProductlineI");
            }
        }

        private int selectedProductlineI;
        public int SelectedProductlineI
        {
            get { return selectedProductlineI; }
            set
            {
                selectedProductlineI = value;

                if (value != -1)
                {
                    ProductList = plineService.GetById(value, "products").products.ToList();
                }
                else
                {
                    ProductList = pService.GetAll("productline").ToList();
                }

                RaisePropertyChanged("SelectedProductlineI");
            }
        }
    }
}
