using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using DataAccessLayer;
using WPFToysForBoys;


namespace WPFToysForBoys.View
{
    /// <summary>
    /// Interaction logic for OrderdetailupdateWindow.xaml
    /// </summary>
    public partial class OrderdetailupdateWindow : Window
    {
        public OrderdetailupdateWindow()
        {
            InitializeComponent();
        }


        private void cmbProductName_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Product product = (Product)cmbProductName.SelectedItem;
            if (product != null)
            {
                tbBuyPrice.Text = product.buyPrice.ToString();
                tbInOrder.Text = product.quantityInOrder.ToString();
                tbInStock.Text = product.quantityInStock.ToString();
                //MessageBox.Show(product.buyPrice.ToString());
            }
        }
    }
}
