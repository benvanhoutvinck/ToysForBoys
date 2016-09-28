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
using DataAccessLayer.Services;


namespace WPFToysForBoys.View
{
    /// <summary>
    /// Interaction logic for ShipmentStatWindow.xaml
    /// </summary>
    public partial class ShipmentStatWindow : Window
    {
        public ShipmentStatWindow()
        {
            InitializeComponent();
        }

        private void ButtonSearch_Click(object sender, RoutedEventArgs e)
        {
            var service = new ShippingService();
            try
            {
                var shipping = service.GetShippingDetails((int.Parse(TextBoxOrderId.Text)));

            }
            catch (Exception ex)
            {

                MessageBox.Show("Invalid orderID");
            }
            
        }
    }
}
