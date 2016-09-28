using GalaSoft.MvvmLight;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WPFToysForBoys.ViewModel
{
    public class ManagmentVM : ViewModelBase
    {
        private int orderIdValue;

        public int OrderIdInserted
        {
            get { return orderIdValue; }
            set { orderIdValue = value; }
        }

    }
}
