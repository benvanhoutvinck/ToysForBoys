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

        //private Productline selectedPProductline;       
        //public Productline SelectedPProductline
        //{
        //    get { return selectedPProductline; }
        //    set { selectedPProductline = value;
        //        SelectedPProductlineI = ProductlineList.IndexOf(value);
        //        RaisePropertyChanged("SelectedPProductline");
        //    }
        //}
    }
}
