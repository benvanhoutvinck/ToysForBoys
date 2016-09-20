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
        private List<Product> productlineList;
        public List<Product> ProductlineList
        {
            get { return productlineList; }
            set
            {
                productlineList = value;
                RaisePropertyChanged("ProductlineList");
            }
        }
    }
}
